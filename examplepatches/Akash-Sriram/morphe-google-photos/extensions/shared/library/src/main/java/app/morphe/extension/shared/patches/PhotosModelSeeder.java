package app.morphe.extension.shared.patches;

import android.content.Context;
import android.app.Activity;
import android.app.Dialog;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import android.util.Base64;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

public final class PhotosModelSeeder {
    private static final Object LOCK = new Object();
    private static volatile boolean isSeeded = false;
    private static volatile boolean isDownloading = false;

    private static final String MDD_MODELS_REL_PATH = "datadownload/shared/public";
    private static final String SHARED_PREFS_DIR_NAME = "shared_prefs";
    private static final String MDD_GROUPS_XML = "gms_icing_mdd_groups.xml";
    private static final String MDD_FILES_XML = "gms_icing_mdd_shared_files.xml";

    private static volatile int cachedExpectedCount = -1;

    private PhotosModelSeeder() {}

    public static int getExpectedModelCount() {
        if (cachedExpectedCount <= 0) {
            cachedExpectedCount = parseUrlToFileMapping().size();
        }
        return cachedExpectedCount;
    }

    public static volatile boolean isModelPatchEnabled = false;
    // 3 parallel download threads: fast enough to complete quickly, low enough not to starve photo sync
    private static final int DOWNLOAD_PARALLELISM = 3;

    public static void enableAndEnsureSeeded(Context context) {
        isModelPatchEnabled = true;
        if (context == null) return;
        final Context appContext = context.getApplicationContext() != null ? context.getApplicationContext() : context;

        // Start immediately on a low-priority background thread.
        // Photo sync and ML model downloads run fully in parallel — no blocking of each other.
        Thread worker = new Thread(() -> {
            android.os.Process.setThreadPriority(android.os.Process.THREAD_PRIORITY_BACKGROUND);
            ensureSeeded(appContext);
        }, "PhotosModelSeederInit");
        worker.setPriority(Thread.MIN_PRIORITY);
        worker.start();
    }

    public static void ensureSeeded(Context context) {
        if (!isModelPatchEnabled) return;
        if (context == null) return;
        String pkg = context.getPackageName();
        if (pkg == null || !pkg.contains("photos")) return;
        if (isSeeded) return;

        synchronized (LOCK) {
            if (isSeeded) return;

            try {
                File filesDir = context.getFilesDir();
                File dataDir = new File(context.getApplicationInfo().dataDir);
                File prefsDir = new File(dataDir, SHARED_PREFS_DIR_NAME);
                File targetModelsDir = new File(filesDir, MDD_MODELS_REL_PATH);

                // Seed authentic story fonts immediately in background
                StoryFontResolver.ensureFontsAsync(context);

                int expected = getExpectedModelCount();
                int modelCount = countModelsInDir(targetModelsDir);
                File groupsXml = new File(prefsDir, MDD_GROUPS_XML);
                boolean manifestReady = isManifestConfiguredForPackage(groupsXml, pkg);
                boolean hasZeroBytes = hasZeroByteFiles(targetModelsDir);

                Logger.printInfo(() -> "PhotosModelSeeder: ensureSeeded() called for " + pkg + ". Current models count=" + modelCount + ", expected=" + expected + ", manifestReady=" + manifestReady + ", hasZeroBytes=" + hasZeroBytes);

                if (expected > 0 && modelCount >= expected && manifestReady && !hasZeroBytes) {
                    isSeeded = true;
                    return;
                }

                // Inject manifest registry immediately so app knows all groups
                if (!manifestReady) {
                    Logger.printInfo(() -> "PhotosModelSeeder: Injecting/patching MDD manifests into shared_prefs for " + pkg);
                    CdnAssetDownloader.unlockDirectory(prefsDir);
                    injectManifests(prefsDir, pkg);
                }

                startDynamicDownload(context, targetModelsDir, prefsDir);

            } catch (Throwable t) {
                Logger.printInfo(() -> "PhotosModelSeeder: Failed in ensureSeeded: " + t.getMessage());
            }
        }
    }

    public static boolean hasZeroByteFiles(File dir) {
        if (dir == null || !dir.exists() || !dir.isDirectory()) return false;
        File[] files = dir.listFiles((d, name) -> name != null && name.startsWith("datadownloadfile_"));
        if (files == null) return false;
        for (File f : files) {
            if (f.length() <= 0) return true;
        }
        return false;
    }

    public static void downloadGroup(Context context, String groupName) {
        if (context == null || groupName == null) return;
        new Thread(() -> {
            try {
                File filesDir = context.getFilesDir();
                File targetModelsDir = new File(filesDir, MDD_MODELS_REL_PATH);
                if (!targetModelsDir.exists()) targetModelsDir.mkdirs();

                Map<String, List<ModelEntry>> groupMap = parseAllGroupsFromManifests();
                List<ModelEntry> entries = groupMap.get(groupName);
                if (entries == null || entries.isEmpty()) {
                    Logger.printInfo(() -> "PhotosModelSeeder: downloadGroup(): No models found for group " + groupName);
                    return;
                }

                Map<String, String> fileToSha = parseFileToShaMapping();
                Logger.printInfo(() -> "PhotosModelSeeder: Downloading " + entries.size() + " models on-demand for group " + groupName);
                CdnAssetDownloader.unlockDirectory(targetModelsDir);

                for (ModelEntry entry : entries) {
                    File dest = new File(targetModelsDir, entry.filename);
                    String sha = fileToSha.get(entry.filename);
                    CdnAssetDownloader.download(entry.url, dest, sha);
                }

                CdnAssetDownloader.lockDirectory(targetModelsDir);
            } catch (Throwable t) {
                Logger.printInfo(() -> "PhotosModelSeeder: downloadGroup failed for " + groupName + ": " + t.getMessage());
            }
        }, "PhotosModelGroupDownloader").start();
    }

    private static void startDynamicDownload(Context context, File targetModelsDir, File prefsDir) {
        if (isDownloading) return;
        isDownloading = true;

        // Coordinator thread: parses manifests, then fans out to DOWNLOAD_PARALLELISM worker threads
        Thread coordinator = new Thread(() -> {
            android.os.Process.setThreadPriority(android.os.Process.THREAD_PRIORITY_BACKGROUND);

            Logger.printInfo(() -> "PhotosModelSeeder: Initiating parallel CDN download of ML models in background...");

            try {
                if (!targetModelsDir.exists()) targetModelsDir.mkdirs();
                if (!prefsDir.exists()) prefsDir.mkdirs();

                CdnAssetDownloader.unlockDirectory(targetModelsDir);
                CdnAssetDownloader.unlockDirectory(prefsDir);

                Map<String, String> urlToFile = parseUrlToFileMapping();
                final Map<String, String> fileToSha = parseFileToShaMapping();
                if (urlToFile.isEmpty()) {
                    Logger.printInfo(() -> "PhotosModelSeeder: Dynamic manifest parser returned empty map!");
                    return;
                }

                final List<Map.Entry<String, String>> entries = new ArrayList<>(urlToFile.entrySet());
                final int total = entries.size();
                Logger.printInfo(() -> "PhotosModelSeeder: Dynamically discovered " + total + " ML models to download (" + DOWNLOAD_PARALLELISM + " parallel threads).");

                final AtomicInteger downloaded = new AtomicInteger(0);
                final CountDownLatch latch = new CountDownLatch(total);

                ExecutorService pool = Executors.newFixedThreadPool(DOWNLOAD_PARALLELISM, r -> {
                    Thread t = new Thread(r, "PhotosModelDL");
                    t.setPriority(Thread.MIN_PRIORITY);
                    t.setDaemon(true);
                    return t;
                });

                for (Map.Entry<String, String> entry : entries) {
                    final String urlStr = entry.getKey();
                    final String filename = entry.getValue();
                    final String expectedSha = fileToSha.get(filename);
                    pool.submit(() -> {
                        try {
                            android.os.Process.setThreadPriority(android.os.Process.THREAD_PRIORITY_BACKGROUND);
                            File dest = new File(targetModelsDir, filename);
                            if (CdnAssetDownloader.download(urlStr, dest, expectedSha)) {
                                downloaded.incrementAndGet();
                            } else {
                                Logger.printInfo(() -> "PhotosModelSeeder: Failed to download " + filename);
                            }
                        } finally {
                            latch.countDown();
                        }
                    });
                }

                pool.shutdown();
                latch.await(); // wait for all downloads to finish

                final int finalDownloaded = downloaded.get();
                if (finalDownloaded >= total) {
                    injectManifests(prefsDir, context.getPackageName());
                    CdnAssetDownloader.lockDirectory(targetModelsDir);
                    isSeeded = true;
                    Logger.printInfo(() -> "PhotosModelSeeder: All " + finalDownloaded + " models downloaded and seeded.");
                } else {
                    Logger.printInfo(() -> "PhotosModelSeeder: Downloaded " + finalDownloaded + " of " + total + " models.");
                }

            } catch (Throwable t) {
                Logger.printInfo(() -> "PhotosModelSeeder: Parallel download failed: " + t.getMessage());
            } finally {
                isDownloading = false;
            }
        }, "PhotosModelCoordinator");
        coordinator.setPriority(Thread.MIN_PRIORITY);
        coordinator.start();
    }

    public static class ModelEntry {
        public final String url;
        public final String filename;

        public ModelEntry(String url, String filename) {
            this.url = url;
            this.filename = filename;
        }
    }

    private static volatile Map<String, String> sCachedShaToFile = null;
    private static volatile Map<String, String> sCachedFileToSha = null;
    private static volatile Map<String, String> sCachedUrlToFile = null;
    private static volatile Map<String, String> sCachedFileToUrl = null;

    public static Map<String, String> parseShaToFileMapping() {
        if (sCachedShaToFile != null) return sCachedShaToFile;
        Map<String, String> shaToFile = new HashMap<>();
        String sharedFilesXml = MddManifests.MANIFESTS.get(MDD_FILES_XML);
        if (sharedFilesXml == null) return shaToFile;

        Pattern pattern = Pattern.compile("<string name=\"([0-9a-f]{40})\\|0\">([^<]+)</string>");
        Matcher matcher = pattern.matcher(sharedFilesXml);
        Pattern filePattern = Pattern.compile("datadownloadfile_\\d+");

        while (matcher.find()) {
            String sha = matcher.group(1);
            String base64Val = matcher.group(2).trim();
            try {
                byte[] decoded = Base64.decode(base64Val, Base64.DEFAULT);
                String decodedStr = new String(decoded, "ISO-8859-1");
                Matcher fm = filePattern.matcher(decodedStr);
                if (fm.find()) {
                    shaToFile.put(sha, fm.group());
                }
            } catch (Exception ignored) {}
        }
        sCachedShaToFile = shaToFile;
        return shaToFile;
    }

    public static Map<String, String> parseFileToShaMapping() {
        if (sCachedFileToSha != null) return sCachedFileToSha;
        Map<String, String> fileToSha = new HashMap<>();
        for (Map.Entry<String, String> e : parseShaToFileMapping().entrySet()) {
            fileToSha.put(e.getValue(), e.getKey());
        }
        sCachedFileToSha = fileToSha;
        return fileToSha;
    }

    public static Map<String, String> parseUrlToFileMapping() {
        if (sCachedUrlToFile != null) return sCachedUrlToFile;
        Map<String, String> urlToFile = new LinkedHashMap<>();
        Map<String, List<ModelEntry>> groupMap = parseAllGroupsFromManifests();
        for (List<ModelEntry> entries : groupMap.values()) {
            for (ModelEntry entry : entries) {
                urlToFile.put(entry.url, entry.filename);
            }
        }
        sCachedUrlToFile = urlToFile;
        return urlToFile;
    }

    public static Map<String, String> parseFileToUrlMapping() {
        if (sCachedFileToUrl != null) return sCachedFileToUrl;
        Map<String, String> fileToUrl = new HashMap<>();
        for (Map.Entry<String, String> e : parseUrlToFileMapping().entrySet()) {
            fileToUrl.put(e.getValue(), e.getKey());
        }
        sCachedFileToUrl = fileToUrl;
        return fileToUrl;
    }

    public static Map<String, List<ModelEntry>> parseAllGroupsFromManifests() {
        Map<String, List<ModelEntry>> groupMap = new LinkedHashMap<>();
        Map<String, String> shaToFile = parseShaToFileMapping();
        String groupsXml = MddManifests.MANIFESTS.get(MDD_GROUPS_XML);
        if (groupsXml == null || shaToFile.isEmpty()) return groupMap;

        Pattern entryPattern = Pattern.compile("<string name=\"([^\"]+)\">([^<]+)</string>");
        Matcher entryMatcher = entryPattern.matcher(groupsXml);
        Pattern urlPattern = Pattern.compile("https?://[^\\s\\u0000-\\u001f\"<>()]+");
        Pattern shaPattern = Pattern.compile("[0-9a-f]{40}");

        while (entryMatcher.find()) {
            String keyB64 = entryMatcher.group(1).trim();
            String valB64 = entryMatcher.group(2).trim();

            String groupName = "unknown";
            try {
                byte[] rawKey = Base64.decode(keyB64, Base64.DEFAULT);
                if (rawKey.length > 2 && rawKey[0] == 0x0a) {
                    int len = rawKey[1] & 0xff;
                    if (rawKey.length >= 2 + len) {
                        groupName = new String(rawKey, 2, len, "ISO-8859-1");
                    }
                }
                if ("unknown".equals(groupName)) {
                    String decKey = new String(rawKey, "ISO-8859-1");
                    Matcher m = Pattern.compile("^[\\u0000-\\u001f]*([a-zA-Z0-9_\\-]+)").matcher(decKey);
                    if (m.find()) groupName = m.group(1);
                }
            } catch (Exception ignored) {}

            try {
                byte[] rawVal = Base64.decode(valB64, Base64.DEFAULT);
                String decVal = new String(rawVal, "ISO-8859-1");

                Matcher um = urlPattern.matcher(decVal);
                List<Integer> urlIndices = new ArrayList<>();
                List<String> urls = new ArrayList<>();
                while (um.find()) {
                    urls.add(um.group());
                    urlIndices.add(um.start());
                }

                List<ModelEntry> entries = new ArrayList<>();
                for (int i = 0; i < urls.size(); i++) {
                    String url = urls.get(i);
                    int start = urlIndices.get(i) + url.length();
                    int end = (i + 1 < urlIndices.size()) ? urlIndices.get(i + 1) : decVal.length();
                    String sub = decVal.substring(start, end);

                    Matcher sm = shaPattern.matcher(sub);
                    if (sm.find()) {
                        String sha = sm.group();
                        String filename = shaToFile.get(sha);
                        if (filename != null) {
                            entries.add(new ModelEntry(url, filename));
                        }
                    }
                }

                if (!entries.isEmpty()) {
                    groupMap.put(groupName, entries);
                }
            } catch (Exception ignored) {}
        }
        return groupMap;
    }

    private static final String STOCK_PACKAGE = "com.google.android.apps.photos";
    private static final String MORPHE_PACKAGE = "app.morphe.android.apps.photos";

    private static boolean isManifestConfiguredForPackage(File groupsXml, String targetPackageName) {
        if (groupsXml == null || !groupsXml.exists() || groupsXml.length() < 500) return false;
        try {
            String content = readFileToString(groupsXml);
            String expectedKeyPart = STOCK_PACKAGE.equals(targetPackageName)
                    ? "Eh5jb20uZ29vZ2xlLmFuZHJvaWQuYXBwcy5waG90b3M"
                    : "Eh5hcHAubW9ycGhlLmFuZHJvaWQuYXBwcy5waG90b3M";
            String unexpectedKeyPart = STOCK_PACKAGE.equals(targetPackageName)
                    ? "Eh5hcHAubW9ycGhlLmFuZHJvaWQuYXBwcy5waG90b3M"
                    : "Eh5jb20uZ29vZ2xlLmFuZHJvaWQuYXBwcy5waG90b3M";
            return content.contains(expectedKeyPart) && !content.contains("CgR1ZG9u" + unexpectedKeyPart);
        } catch (Throwable t) {
            return false;
        }
    }

    private static void injectManifests(File destDir, String newPackageName) {
        if (!destDir.exists()) destDir.mkdirs();
        for (Map.Entry<String, String> entry : MddManifests.MANIFESTS.entrySet()) {
            String filename = entry.getKey();
            String content = entry.getValue();
            File xml = new File(destDir, filename);
            try (FileOutputStream fos = new FileOutputStream(xml)) {
                fos.write(content.getBytes("UTF-8"));
            } catch (Exception e) {
                Logger.printInfo(() -> "Failed to write manifest " + filename + ": " + e.getMessage());
            }
        }
        patchMddManifests(destDir, newPackageName);
    }

    private static void patchMddManifests(File manifestsDir, String newPackageName) {
        File[] xmlFiles = manifestsDir.listFiles();
        if (xmlFiles == null) return;

        Pattern entryPattern = Pattern.compile("<string\\s+name=\"([^\"]+)\">([^<]+)</string>");

        for (File xml : xmlFiles) {
            if (!xml.getName().endsWith(".xml")) continue;
            // MDD manifest patcher must ONLY operate on MDD manifest files, NEVER phenotype or account files
            if (!MddManifests.MANIFESTS.containsKey(xml.getName())) continue;
            if (xml.getName().contains("phenotype") || xml.getName().contains("account")) continue;
            try {
                String content = readFileToString(xml);
                Matcher m = entryPattern.matcher(content);
                if (!m.find()) {
                    continue; // Skip files without <string name="..."> entries (e.g. metadata with only ints/booleans)
                }
                m.reset();

                boolean changed = false;
                Map<String, String> deduplicated = new LinkedHashMap<>();

                while (m.find()) {
                    String rawKeyB64 = m.group(1);
                    String rawValB64 = m.group(2);

                    String patchedKeyB64 = patchProtobufBase64(rawKeyB64, newPackageName, true);
                    String patchedValB64 = patchProtobufBase64(rawValB64, newPackageName, false);

                    if (!patchedKeyB64.equals(rawKeyB64) || !patchedValB64.equals(rawValB64)) {
                        changed = true;
                    }
                    deduplicated.put(patchedKeyB64, patchedValB64);
                }

                if (changed || deduplicated.size() < countXmlEntries(content)) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("<?xml version='1.0' encoding='utf-8'?>\n<map>\n");
                    for (Map.Entry<String, String> entry : deduplicated.entrySet()) {
                        sb.append("    <string name=\"")
                          .append(entry.getKey())
                          .append("\">")
                          .append(entry.getValue())
                          .append("</string>\n");
                    }
                    sb.append("</map>\n");

                    try (FileOutputStream fos = new FileOutputStream(xml)) {
                        fos.write(sb.toString().getBytes("UTF-8"));
                    }
                    Logger.printInfo(() -> "PhotosModelSeeder: Successfully patched manifest " + xml.getName() + " for " + newPackageName + " (" + deduplicated.size() + " entries)");
                }
            } catch (Exception e) {
                Logger.printInfo(() -> "PhotosModelSeeder: Failed to patch manifest " + xml.getName() + ": " + e.getMessage());
            }
        }
    }

    private static String patchProtobufBase64(String b64, String targetPackageName, boolean isKey) {
        if (b64 == null || b64.isEmpty()) return b64;
        try {
            byte[] decoded = Base64.decode(b64, Base64.DEFAULT);
            String decodedStr = new String(decoded, "ISO-8859-1");
            boolean modified = false;

            if (STOCK_PACKAGE.equals(targetPackageName)) {
                if (decodedStr.contains(MORPHE_PACKAGE)) {
                    decodedStr = decodedStr.replace(MORPHE_PACKAGE, STOCK_PACKAGE);
                    modified = true;
                }
            } else if (MORPHE_PACKAGE.equals(targetPackageName)) {
                if (decodedStr.contains(STOCK_PACKAGE)) {
                    decodedStr = decodedStr.replace(STOCK_PACKAGE, MORPHE_PACKAGE);
                    modified = true;
                }
            } else {
                if (targetPackageName.length() == STOCK_PACKAGE.length()) {
                    if (decodedStr.contains(MORPHE_PACKAGE)) {
                        decodedStr = decodedStr.replace(MORPHE_PACKAGE, targetPackageName);
                        modified = true;
                    }
                    if (decodedStr.contains(STOCK_PACKAGE)) {
                        decodedStr = decodedStr.replace(STOCK_PACKAGE, targetPackageName);
                        modified = true;
                    }
                }
            }

            if (modified) {
                int flags = Base64.NO_WRAP;
                if (isKey || !b64.endsWith("=")) {
                    flags |= Base64.NO_PADDING;
                }
                return Base64.encodeToString(decodedStr.getBytes("ISO-8859-1"), flags);
            }
        } catch (Throwable ignored) {}
        return b64;
    }

    private static int countXmlEntries(String content) {
        if (content == null) return 0;
        int count = 0;
        int idx = 0;
        while ((idx = content.indexOf("<string ", idx)) != -1) {
            count++;
            idx += 8;
        }
        return count;
    }

    private static String readFileToString(File file) throws IOException {
        try (FileInputStream fis = new FileInputStream(file)) {
            byte[] data = new byte[(int) file.length()];
            fis.read(data);
            return new String(data, "UTF-8");
        }
    }

    private static void showToast(Context context, String msg) {
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                Toast.makeText(context.getApplicationContext(), msg, Toast.LENGTH_LONG).show();
            } catch (Throwable ignored) {}
        });
    }

    private static int countModelsInDir(File dir) {
        if (dir == null || !dir.exists() || !dir.isDirectory()) return 0;
        File[] files = dir.listFiles((d, name) -> name != null && name.startsWith("datadownloadfile_"));
        return files == null ? 0 : files.length;
    }

    public static class ModelHealthReport {
        public final int totalExpected;
        public int healthyCount = 0;
        public int corruptedCount = 0;
        public int missingCount = 0;
        public final List<String> corruptedFiles = new ArrayList<>();
        public final List<String> missingFiles = new ArrayList<>();

        public ModelHealthReport(int totalExpected) {
            this.totalExpected = totalExpected;
        }

        public boolean isAllHealthy() {
            return healthyCount == totalExpected && corruptedCount == 0 && missingCount == 0 && totalExpected > 0;
        }
    }

    public static ModelHealthReport evaluateHealth(Context context) {
        if (context == null) return new ModelHealthReport(0);
        File filesDir = context.getFilesDir();
        File targetModelsDir = new File(filesDir, MDD_MODELS_REL_PATH);
        Map<String, String> fileToSha = parseFileToShaMapping();
        int expected = fileToSha.size();
        ModelHealthReport report = new ModelHealthReport(expected);

        for (Map.Entry<String, String> entry : fileToSha.entrySet()) {
            String filename = entry.getKey();
            String expectedSha = entry.getValue();
            File f = new File(targetModelsDir, filename);
            if (!f.exists()) {
                report.missingCount++;
                report.missingFiles.add(filename);
            } else if (f.length() <= 0) {
                report.corruptedCount++;
                report.corruptedFiles.add(filename);
            } else {
                String actualSha = CdnAssetDownloader.calculateSha1(f);
                if (expectedSha != null && expectedSha.equalsIgnoreCase(actualSha)) {
                    report.healthyCount++;
                } else {
                    report.corruptedCount++;
                    report.corruptedFiles.add(filename);
                }
            }
        }
        return report;
    }

    public interface HealthRepairCallback {
        void onProgress(String status, int current, int total);
        void onComplete(ModelHealthReport finalReport);
    }

    public static void repairAllModelsAsync(Context context, HealthRepairCallback callback) {
        if (context == null) return;
        final Context appContext = context.getApplicationContext() != null ? context.getApplicationContext() : context;

        new Thread(() -> {
            try {
                File filesDir = appContext.getFilesDir();
                File targetModelsDir = new File(filesDir, MDD_MODELS_REL_PATH);
                File dataDir = new File(appContext.getApplicationInfo().dataDir);
                File prefsDir = new File(dataDir, SHARED_PREFS_DIR_NAME);
                if (!targetModelsDir.exists()) targetModelsDir.mkdirs();

                CdnAssetDownloader.unlockDirectory(targetModelsDir);
                CdnAssetDownloader.unlockDirectory(prefsDir);

                Map<String, String> fileToSha = parseFileToShaMapping();
                Map<String, String> fileToUrl = parseFileToUrlMapping();

                int total = fileToSha.size();
                int current = 0;
                List<String> needRepair = new ArrayList<>();

                for (Map.Entry<String, String> e : fileToSha.entrySet()) {
                    current++;
                    String fname = e.getKey();
                    String expectedSha = e.getValue();
                    if (callback != null) {
                        final int c = current;
                        callback.onProgress("Verifying integrity (" + c + "/" + total + ")...", c, total);
                    }
                    File f = new File(targetModelsDir, fname);
                    if (!f.exists() || f.length() <= 0) {
                        if (f.exists()) f.delete();
                        needRepair.add(fname);
                    } else {
                        String actualSha = CdnAssetDownloader.calculateSha1(f);
                        if (!expectedSha.equalsIgnoreCase(actualSha)) {
                            f.delete();
                            needRepair.add(fname);
                        }
                    }
                }

                if (!needRepair.isEmpty()) {
                    int dlTotal = needRepair.size();
                    int dlIdx = 0;
                    for (String fname : needRepair) {
                        dlIdx++;
                        String url = fileToUrl.get(fname);
                        String sha = fileToSha.get(fname);
                        if (callback != null) {
                            final int idx = dlIdx;
                            callback.onProgress("Repairing model (" + idx + "/" + dlTotal + ")...", idx, dlTotal);
                        }
                        if (url != null) {
                            File dest = new File(targetModelsDir, fname);
                            CdnAssetDownloader.download(url, dest, sha);
                        }
                    }
                }

                injectManifests(prefsDir, appContext.getPackageName());
                CdnAssetDownloader.lockDirectory(targetModelsDir);
                isSeeded = true;

                ModelHealthReport finalReport = evaluateHealth(appContext);
                if (callback != null) {
                    callback.onComplete(finalReport);
                }
            } catch (Throwable t) {
                Logger.printException(() -> "PhotosModelSeeder: repairAllModels failed", t);
                if (callback != null) {
                    callback.onComplete(evaluateHealth(appContext));
                }
            }
        }, "PhotosModelRepair").start();
    }

    public static void showModelManagerDialog(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;

        float density = activity.getResources().getDisplayMetrics().density;
        boolean isDark = Utils.isDarkModeEnabled();
        int bgColor = isDark ? 0xFF1E1F22 : 0xFFFFFFFF;
        int cardColor = isDark ? 0xFF2B2D31 : 0xFFF2F4F7;
        int textPrimary = isDark ? 0xFFF2F3F5 : 0xFF1A1A1A;
        int textSecondary = isDark ? 0xFF949BA4 : 0xFF666666;
        int primaryColor = 0xFF1E5AA8;
        int successColor = 0xFF2E7D32;
        int errorColor = 0xFFD32F2F;
        int warningColor = 0xFFED6C02;

        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(bgColor);
        bg.setCornerRadius(24 * density);
        root.setBackground(bg);
        int pad = (int) (20 * density);
        root.setPadding(pad, pad, pad, pad);

        // Header
        TextView tvTitle = new TextView(activity);
        tvTitle.setText("🤖 On-Device AI Models");
        tvTitle.setTextSize(18f);
        tvTitle.setTypeface(null, Typeface.BOLD);
        tvTitle.setTextColor(textPrimary);
        root.addView(tvTitle);

        TextView tvSub = new TextView(activity);
        tvSub.setText("Cryptographic Health & Integrity Manager");
        tvSub.setTextSize(12f);
        tvSub.setTextColor(textSecondary);
        tvSub.setPadding(0, (int) (2 * density), 0, (int) (12 * density));
        root.addView(tvSub);

        // Summary & Health Card
        LinearLayout sumCard = new LinearLayout(activity);
        sumCard.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable scBg = new GradientDrawable();
        scBg.setColor(cardColor);
        scBg.setCornerRadius(14 * density);
        sumCard.setBackground(scBg);
        int cPad = (int) (14 * density);
        sumCard.setPadding(cPad, cPad, cPad, cPad);

        File modelsDir = new File(activity.getFilesDir(), MDD_MODELS_REL_PATH);
        int currentCount = countModelsInDir(modelsDir);
        int expectedTotal = getExpectedModelCount();
        boolean hasZero = hasZeroByteFiles(modelsDir);

        TextView tvStatus = new TextView(activity);
        tvStatus.setTextSize(14f);
        tvStatus.setTypeface(null, Typeface.BOLD);
        if (currentCount >= expectedTotal && expectedTotal > 0 && !hasZero) {
            tvStatus.setText("🟢 " + currentCount + " / " + expectedTotal + " Models Installed (Healthy)");
            tvStatus.setTextColor(successColor);
        } else if (hasZero) {
            tvStatus.setText("🔴 Corrupted or truncated models detected!");
            tvStatus.setTextColor(errorColor);
        } else {
            tvStatus.setText("🟡 " + currentCount + " / " + expectedTotal + " Models Cached (Incomplete)");
            tvStatus.setTextColor(warningColor);
        }
        sumCard.addView(tvStatus);

        TextView tvHealthDetail = new TextView(activity);
        tvHealthDetail.setText("SHA-1 integrity verification backed by authentic Google MDD manifests.");
        tvHealthDetail.setTextSize(11.5f);
        tvHealthDetail.setTextColor(textSecondary);
        tvHealthDetail.setPadding(0, (int) (4 * density), 0, (int) (8 * density));
        sumCard.addView(tvHealthDetail);

        // Health Action Pill inside Card
        TextView btnHealthCheck = new TextView(activity);
        btnHealthCheck.setText("🩺 Run Health Check & Self-Repair");
        btnHealthCheck.setTextSize(12.5f);
        btnHealthCheck.setTypeface(null, Typeface.BOLD);
        btnHealthCheck.setTextColor(0xFFFFFFFF);
        btnHealthCheck.setGravity(Gravity.CENTER);
        GradientDrawable hcBg = new GradientDrawable();
        hcBg.setColor(primaryColor);
        hcBg.setCornerRadius(10 * density);
        btnHealthCheck.setBackground(hcBg);
        btnHealthCheck.setPadding((int) (12 * density), (int) (8 * density), (int) (12 * density), (int) (8 * density));
        sumCard.addView(btnHealthCheck);

        root.addView(sumCard);

        // Scrollable Groups List
        ScrollView sv = new ScrollView(activity);
        LinearLayout.LayoutParams svLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, (int) (260 * density));
        svLp.topMargin = (int) (12 * density);
        svLp.bottomMargin = (int) (14 * density);
        sv.setLayoutParams(svLp);

        LinearLayout listLayout = new LinearLayout(activity);
        listLayout.setOrientation(LinearLayout.VERTICAL);
        sv.addView(listLayout);
        root.addView(sv);

        // Method to populate group rows
        Map<String, List<ModelEntry>> allGroups = parseAllGroupsFromManifests();
        Map<String, String> fileToSha = parseFileToShaMapping();

        Runnable refreshGroups = () -> {
            listLayout.removeAllViews();
            for (Map.Entry<String, List<ModelEntry>> entry : allGroups.entrySet()) {
                String groupName = entry.getKey();
                List<ModelEntry> entries = entry.getValue();

                int healthyCount = 0;
                int corruptedCount = 0;

                for (ModelEntry me : entries) {
                    File f = new File(modelsDir, me.filename);
                    if (!f.exists()) {
                        // missing
                    } else if (f.length() <= 0) {
                        corruptedCount++;
                    } else {
                        String expSha = fileToSha.get(me.filename);
                        String actSha = CdnAssetDownloader.calculateSha1(f);
                        if (expSha != null && expSha.equalsIgnoreCase(actSha)) {
                            healthyCount++;
                        } else {
                            corruptedCount++;
                        }
                    }
                }

                LinearLayout gRow = new LinearLayout(activity);
                gRow.setOrientation(LinearLayout.HORIZONTAL);
                gRow.setGravity(Gravity.CENTER_VERTICAL);
                GradientDrawable grBg = new GradientDrawable();
                grBg.setColor(cardColor);
                grBg.setCornerRadius(10 * density);
                gRow.setBackground(grBg);
                gRow.setPadding((int) (12 * density), (int) (10 * density), (int) (12 * density), (int) (10 * density));
                LinearLayout.LayoutParams rLp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                rLp.bottomMargin = (int) (6 * density);
                gRow.setLayoutParams(rLp);

                LinearLayout tCol = new LinearLayout(activity);
                tCol.setOrientation(LinearLayout.VERTICAL);
                LinearLayout.LayoutParams tcLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
                tCol.setLayoutParams(tcLp);

                TextView gTitle = new TextView(activity);
                gTitle.setText(formatGroupName(groupName));
                gTitle.setTextSize(13f);
                gTitle.setTypeface(null, Typeface.BOLD);
                gTitle.setTextColor(textPrimary);
                tCol.addView(gTitle);

                TextView gSub = new TextView(activity);
                if (corruptedCount > 0) {
                    gSub.setText("⚠️ " + corruptedCount + " corrupted file" + (corruptedCount > 1 ? "s" : "") + " (" + healthyCount + "/" + entries.size() + " verified)");
                    gSub.setTextColor(errorColor);
                } else {
                    gSub.setText(healthyCount + " of " + entries.size() + " files verified healthy");
                    gSub.setTextColor(textSecondary);
                }
                gSub.setTextSize(11f);
                tCol.addView(gSub);
                gRow.addView(tCol);

                TextView badge = new TextView(activity);
                badge.setTextSize(11f);
                badge.setTypeface(null, Typeface.BOLD);
                badge.setPadding((int) (8 * density), (int) (4 * density), (int) (8 * density), (int) (4 * density));
                GradientDrawable bBg = new GradientDrawable();
                bBg.setCornerRadius(8 * density);

                if (corruptedCount > 0) {
                    badge.setText("⚠️ Fix");
                    badge.setTextColor(0xFFFFFFFF);
                    bBg.setColor(errorColor);
                    badge.setClickable(true);
                    badge.setFocusable(true);
                    badge.setOnClickListener(v -> {
                        badge.setText("Repairing...");
                        badge.setClickable(false);
                        new Thread(() -> {
                            downloadGroup(activity, groupName);
                            activity.runOnUiThread(() -> {
                                Toast.makeText(activity, "Repaired group: " + formatGroupName(groupName), Toast.LENGTH_SHORT).show();
                                badge.setText("✓ Healthy");
                                bBg.setColor(successColor);
                            });
                        }).start();
                    });
                } else if (healthyCount >= entries.size() && !entries.isEmpty()) {
                    badge.setText("✓ Healthy");
                    badge.setTextColor(0xFFFFFFFF);
                    bBg.setColor(successColor);
                } else {
                    badge.setText("⬇ Download");
                    badge.setTextColor(0xFFFFFFFF);
                    bBg.setColor(primaryColor);
                    badge.setClickable(true);
                    badge.setFocusable(true);
                    badge.setOnClickListener(v -> {
                        badge.setText("Downloading...");
                        badge.setClickable(false);
                        new Thread(() -> {
                            downloadGroup(activity, groupName);
                            activity.runOnUiThread(() -> {
                                int newCount = countModelsInDir(modelsDir);
                                tvStatus.setText("🟢 " + newCount + " / " + expectedTotal + " Models Installed");
                                tvStatus.setTextColor(successColor);
                                badge.setText("✓ Healthy");
                                bBg.setColor(successColor);
                            });
                        }).start();
                    });
                }
                badge.setBackground(bBg);
                gRow.addView(badge);

                listLayout.addView(gRow);
            }
        };

        refreshGroups.run();

        // Wire Health Check & Repair Action
        btnHealthCheck.setOnClickListener(v -> {
            btnHealthCheck.setEnabled(false);
            btnHealthCheck.setText("Verifying integrity...");

            repairAllModelsAsync(activity, new HealthRepairCallback() {
                @Override
                public void onProgress(String status, int current, int total) {
                    activity.runOnUiThread(() -> {
                        btnHealthCheck.setText(status);
                    });
                }

                @Override
                public void onComplete(ModelHealthReport finalReport) {
                    activity.runOnUiThread(() -> {
                        btnHealthCheck.setEnabled(true);
                        btnHealthCheck.setText("✓ Integrity Verified");
                        if (finalReport != null && finalReport.isAllHealthy()) {
                            tvStatus.setText("🟢 All " + finalReport.totalExpected + " Models Verified Healthy");
                            tvStatus.setTextColor(successColor);
                            Toast.makeText(activity, "✅ All on-device AI models passed integrity check!", Toast.LENGTH_LONG).show();
                        } else {
                            int healthy = finalReport != null ? finalReport.healthyCount : 0;
                            int total = finalReport != null ? finalReport.totalExpected : expectedTotal;
                            tvStatus.setText("🟢 " + healthy + " / " + total + " Models Verified Healthy");
                            tvStatus.setTextColor(successColor);
                        }
                        refreshGroups.run();
                    });
                }
            });
        });

        // Action Buttons Row
        LinearLayout btnRow = new LinearLayout(activity);
        btnRow.setOrientation(LinearLayout.HORIZONTAL);
        btnRow.setGravity(Gravity.END);

        TextView btnClose = new TextView(activity);
        btnClose.setText("Close");
        btnClose.setTextSize(13f);
        btnClose.setTextColor(textPrimary);
        btnClose.setTypeface(null, Typeface.BOLD);
        btnClose.setPadding((int) (16 * density), (int) (10 * density), (int) (16 * density), (int) (10 * density));
        btnClose.setOnClickListener(v -> dialog.dismiss());
        btnRow.addView(btnClose);

        TextView btnDownloadAll = new TextView(activity);
        btnDownloadAll.setText("Verify & Seed All");
        btnDownloadAll.setTextSize(13f);
        btnDownloadAll.setTypeface(null, Typeface.BOLD);
        btnDownloadAll.setTextColor(0xFFFFFFFF);
        GradientDrawable dlBg = new GradientDrawable();
        dlBg.setColor(primaryColor);
        dlBg.setCornerRadius(10 * density);
        btnDownloadAll.setBackground(dlBg);
        btnDownloadAll.setPadding((int) (16 * density), (int) (10 * density), (int) (16 * density), (int) (10 * density));
        btnDownloadAll.setOnClickListener(v -> {
            btnDownloadAll.setText("Healing models in background...");
            btnDownloadAll.setEnabled(false);
            enableAndEnsureSeeded(activity);
            Toast.makeText(activity, "Started background verification and download for all AI models", Toast.LENGTH_LONG).show();
            dialog.dismiss();
        });
        btnRow.addView(btnDownloadAll);
        root.addView(btnRow);

        dialog.setContentView(root);
        dialog.show();

        Window w = dialog.getWindow();
        if (w != null) {
            w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            int screenWidth = activity.getResources().getDisplayMetrics().widthPixels;
            w.setLayout(Math.min((int) (screenWidth * 0.92f), (int) (480 * density)), ViewGroup.LayoutParams.WRAP_CONTENT);
        }
    }

    private static String formatGroupName(String raw) {
        if (raw == null) return "AI Model Pack";
        if (raw.toLowerCase().contains("magic") || raw.toLowerCase().contains("eraser") || raw.toLowerCase().contains("inpaint") || raw.toLowerCase().contains("buttercup") || raw.toLowerCase().contains("udon")) return "✨ Magic Eraser & Camouflage";
        if (raw.toLowerCase().contains("portrait") || raw.toLowerCase().contains("face") || raw.toLowerCase().contains("relight") || raw.toLowerCase().contains("segmenter")) return "👤 Portrait Relight & Blur";
        if (raw.toLowerCase().contains("sky") || raw.toLowerCase().contains("color_pop")) return "🌅 Sky Suggestions & Color Pop";
        if (raw.toLowerCase().contains("cinematic") || raw.toLowerCase().contains("depth") || raw.toLowerCase().contains("3d")) return "🎬 Cinematic 3D Depth";
        if (raw.toLowerCase().contains("unblur") || raw.toLowerCase().contains("mochi") || raw.toLowerCase().contains("psyduck")) return "🔍 Photo Unblur & Fix";
        if (raw.toLowerCase().contains("cubelut") || raw.toLowerCase().contains("grainy") || raw.toLowerCase().contains("light_leak") || raw.toLowerCase().contains("tonefix")) return "🎨 Real Film & Texture Looks";
        if (raw.toLowerCase().contains("template") || raw.toLowerCase().contains("collage")) return "📐 Collage & Layout Engine";
        return "🧠 " + raw.replace("_", " ");
    }
}
