package app.morphe.extension.shared.patches;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import app.morphe.extension.shared.Logger;

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

    public static void ensureSeeded(Context context) {
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

                int expected = getExpectedModelCount();
                int modelCount = countModelsInDir(targetModelsDir);
                File groupsXml = new File(prefsDir, MDD_GROUPS_XML);
                boolean hasGroups = groupsXml.exists() && groupsXml.length() > 500;

                Logger.printInfo(() -> "PhotosModelSeeder: ensureSeeded() called. Current models count=" + modelCount + ", expected=" + expected);

                if (expected > 0 && modelCount >= expected && hasGroups) {
                    isSeeded = true;
                    ensureStoryFontsAsync(filesDir);
                    return;
                }

                // Inject manifest registry immediately so app knows all groups
                if (!hasGroups) {
                    Logger.printInfo(() -> "PhotosModelSeeder: Injecting MDD manifests into shared_prefs");
                    unlockDirectory(prefsDir);
                    injectManifests(prefsDir, pkg);
                    patchMddManifests(prefsDir, pkg);
                }

                startDynamicDownload(context, targetModelsDir, prefsDir);

            } catch (Throwable t) {
                Logger.printInfo(() -> "PhotosModelSeeder: Failed in ensureSeeded: " + t.getMessage());
            }
        }
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

                Logger.printInfo(() -> "PhotosModelSeeder: Downloading " + entries.size() + " models on-demand for group " + groupName);
                unlockDirectory(targetModelsDir);

                for (ModelEntry entry : entries) {
                    File dest = new File(targetModelsDir, entry.filename);
                    if (dest.exists() && dest.length() > 0) continue;
                    downloadFile(entry.url, dest);
                }

                lockModels(targetModelsDir);
            } catch (Throwable t) {
                Logger.printInfo(() -> "PhotosModelSeeder: downloadGroup failed for " + groupName + ": " + t.getMessage());
            }
        }, "PhotosModelGroupDownloader").start();
    }

    private static void startDynamicDownload(Context context, File targetModelsDir, File prefsDir) {
        if (isDownloading) return;
        isDownloading = true;

        new Thread(() -> {
            android.content.SharedPreferences prefs = context.getSharedPreferences("morphe_photos_seeder_prefs", Context.MODE_PRIVATE);
            long lastToastTime = prefs.getLong("last_toast_time", 0);
            long currentTime = System.currentTimeMillis();
            boolean shouldShowToast = (currentTime - lastToastTime) > (24 * 60 * 60 * 1000L);

            if (shouldShowToast) {
                Logger.printInfo(() -> "PhotosModelSeeder: Initiating dynamic CDN download of ML models...");
                showToast(context, "Google Photos: Downloading Magic Eraser & AI models...");
                prefs.edit().putLong("last_toast_time", currentTime).apply();
            } else {
                Logger.printInfo(() -> "PhotosModelSeeder: Initiating dynamic CDN download (silently)...");
            }

            try {
                if (!targetModelsDir.exists()) targetModelsDir.mkdirs();
                if (!prefsDir.exists()) prefsDir.mkdirs();

                unlockDirectory(targetModelsDir);
                unlockDirectory(prefsDir);

                Map<String, String> urlToFile = parseUrlToFileMapping();
                if (urlToFile.isEmpty()) {
                    Logger.printInfo(() -> "PhotosModelSeeder: Dynamic manifest parser returned empty map!");
                    return;
                }

                Logger.printInfo(() -> "PhotosModelSeeder: Dynamically discovered " + urlToFile.size() + " ML models to download.");

                int downloaded = 0;
                int newlyDownloaded = 0;
                for (Map.Entry<String, String> entry : urlToFile.entrySet()) {
                    String urlStr = entry.getKey();
                    String filename = entry.getValue();

                    File dest = new File(targetModelsDir, filename);
                    if (dest.exists() && dest.length() > 0) {
                        downloaded++;
                        continue;
                    }

                    if (downloadFile(urlStr, dest)) {
                        dest.setReadable(true, false);
                        dest.setWritable(true, false);
                        dest.setExecutable(true, false);
                        downloaded++;
                        newlyDownloaded++;
                    } else {
                        Logger.printInfo(() -> "PhotosModelSeeder: Failed to download " + filename + " from " + urlStr);
                    }
                }

                final int finalDownloaded = downloaded;
                final int expectedCount = urlToFile.size();
                if (finalDownloaded >= expectedCount) {
                    injectManifests(prefsDir, context.getPackageName());
                    patchMddManifests(prefsDir, context.getPackageName());

                    lockModels(targetModelsDir);
                    ensureStoryFonts(context.getFilesDir());

                    isSeeded = true;
                    if (newlyDownloaded > 0) {
                        Logger.printInfo(() -> "PhotosModelSeeder: Successfully dynamically downloaded and seeded all " + finalDownloaded + " models! Restarting app...");
                        showToast(context, "AI Models downloaded! Restarting to apply...");

                        try { Thread.sleep(2000); } catch (Exception ignored) {}

                        android.content.Intent intent = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
                        if (intent != null) {
                            intent.addFlags(android.content.Intent.FLAG_ACTIVITY_CLEAR_TOP | android.content.Intent.FLAG_ACTIVITY_NEW_TASK | android.content.Intent.FLAG_ACTIVITY_CLEAR_TASK);
                            context.startActivity(intent);
                        }
                        Runtime.getRuntime().exit(0);
                    } else {
                        Logger.printInfo(() -> "PhotosModelSeeder: All " + finalDownloaded + " models already present on disk. Ready.");
                    }
                } else {
                    Logger.printInfo(() -> "PhotosModelSeeder: Downloaded " + finalDownloaded + " of " + expectedCount + " models.");
                }

            } catch (Throwable t) {
                Logger.printInfo(() -> "PhotosModelSeeder: Dynamic download failed: " + t.getMessage());
            } finally {
                isDownloading = false;
            }
        }, "PhotosModelDownloader").start();
    }

    private static void ensureStoryFontsAsync(File filesDir) {
        new Thread(() -> ensureStoryFonts(filesDir), "PhotosFontDownloader").start();
    }

    private static void ensureStoryFonts(File filesDir) {
        try {
            File fontsDir = new File(filesDir, "fonts");
            if (!fontsDir.exists()) fontsDir.mkdirs();

            String[][] fonts = {
                {"Caveat.ttf", "https://raw.githubusercontent.com/google/fonts/main/ofl/caveat/Caveat%5Bwght%5D.ttf"},
                {"Handlee.ttf", "https://raw.githubusercontent.com/google/fonts/main/ofl/handlee/Handlee-Regular.ttf"},
                {"Oswald.ttf", "https://raw.githubusercontent.com/google/fonts/main/ofl/oswald/Oswald%5Bwght%5D.ttf"},
                {"Montserrat.ttf", "https://raw.githubusercontent.com/google/fonts/main/ofl/montserrat/Montserrat%5Bwght%5D.ttf"},
                {"PlayfairDisplay.ttf", "https://raw.githubusercontent.com/google/fonts/main/ofl/playfairdisplay/PlayfairDisplay%5Bwght%5D.ttf"}
            };

            for (String[] font : fonts) {
                File fontFile = new File(fontsDir, font[0]);
                if (!fontFile.exists() || fontFile.length() == 0) {
                    downloadFile(font[1], fontFile);
                    fontFile.setReadable(true, false);
                }
            }
        } catch (Throwable t) {
            Logger.printInfo(() -> "PhotosModelSeeder: ensureStoryFonts error: " + t.getMessage());
        }
    }

    public static class ModelEntry {
        public final String url;
        public final String filename;

        public ModelEntry(String url, String filename) {
            this.url = url;
            this.filename = filename;
        }
    }

    public static Map<String, String> parseShaToFileMapping() {
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
        return shaToFile;
    }

    public static Map<String, String> parseUrlToFileMapping() {
        Map<String, String> urlToFile = new LinkedHashMap<>();
        Map<String, List<ModelEntry>> groupMap = parseAllGroupsFromManifests();
        for (List<ModelEntry> entries : groupMap.values()) {
            for (ModelEntry entry : entries) {
                urlToFile.put(entry.url, entry.filename);
            }
        }
        return urlToFile;
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

    private static void unlockDirectory(File dir) {
        if (dir == null || !dir.exists()) return;
        File parent = dir;
        while (parent != null && parent.getAbsolutePath().contains("datadownload")) {
            parent.setExecutable(true, false);
            parent = parent.getParentFile();
        }
        dir.setWritable(true, false);
        File[] children = dir.listFiles();
        if (children != null) {
            for (File f : children) f.setWritable(true, false);
        }
    }

    private static void lockModels(File targetModelsDir) {
        if (targetModelsDir == null || !targetModelsDir.exists()) return;
        File parent = targetModelsDir;
        while (parent != null && parent.getAbsolutePath().contains("datadownload")) {
            parent.setExecutable(true, false);
            parent = parent.getParentFile();
        }
        targetModelsDir.setWritable(false, false);
        File[] files = targetModelsDir.listFiles();
        if (files != null) {
            for (File f : files) {
                f.setReadable(true, false);
                f.setWritable(false, false);
                f.setExecutable(true, false);
            }
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

    private static boolean downloadFile(String urlStr, File dest) {
        for (int i = 0; i < 3; i++) {
            try {
                File parent = dest.getParentFile();
                if (parent != null && !parent.exists()) {
                    parent.mkdirs();
                }

                URL url = new URL(urlStr);
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setConnectTimeout(15000);
                conn.setReadTimeout(60000);

                int status = conn.getResponseCode();
                if (status >= 200 && status < 300) {
                    long expectedSize = conn.getContentLength();
                    long downloadedSize = 0;
                    try (InputStream is = new BufferedInputStream(conn.getInputStream());
                         FileOutputStream fos = new FileOutputStream(dest)) {
                        byte[] buffer = new byte[16384];
                        int len;
                        while ((len = is.read(buffer)) != -1) {
                            fos.write(buffer, 0, len);
                            downloadedSize += len;
                        }
                        fos.flush();
                    }

                    if (expectedSize != -1 && downloadedSize != expectedSize) {
                        Logger.printInfo(() -> "PhotosModelSeeder: Download truncated for " + urlStr + ". Retrying...");
                        dest.delete();
                        Thread.sleep(2000);
                        continue;
                    }

                    return true;
                } else {
                    Logger.printInfo(() -> "PhotosModelSeeder: Download HTTP Error " + status + " for " + urlStr);
                }
            } catch (Exception e) {
                final int attempt = i + 1;
                Logger.printInfo(() -> "PhotosModelSeeder: Download error for " + urlStr + " (attempt " + attempt + "/3): " + e.getMessage());
                dest.delete();
                try { Thread.sleep(2000); } catch (Exception ignored) {}
            }
        }
        if (dest.exists()) dest.delete();
        return false;
    }

    private static void patchMddManifests(File manifestsDir, String newPackageName) {
        File[] xmlFiles = manifestsDir.listFiles();
        if (xmlFiles == null) return;
        String oldPackage = "com.google.android.apps.photos";
        if (oldPackage.length() != newPackageName.length()) return;

        for (File xml : xmlFiles) {
            if (!xml.getName().endsWith(".xml")) continue;
            try {
                String content = readFileToString(xml);
                boolean changed = false;
                Matcher m = Pattern.compile(">([^<]+)</string>").matcher(content);
                StringBuffer sb = new StringBuffer();
                while (m.find()) {
                    String base64 = m.group(1);
                    try {
                        byte[] decoded = Base64.decode(base64, Base64.DEFAULT);
                        String decodedStr = new String(decoded, "ISO-8859-1");
                        if (decodedStr.contains(oldPackage)) {
                            decodedStr = decodedStr.replace(oldPackage, newPackageName);
                            String newBase64 = Base64.encodeToString(decodedStr.getBytes("ISO-8859-1"), Base64.NO_WRAP);
                            m.appendReplacement(sb, ">" + newBase64 + "</string>");
                            changed = true;
                            continue;
                        }
                    } catch (Exception ignored) {}
                    m.appendReplacement(sb, ">" + base64 + "</string>");
                }
                m.appendTail(sb);

                if (changed) {
                    try (FileOutputStream fos = new FileOutputStream(xml)) {
                        fos.write(sb.toString().getBytes("UTF-8"));
                    }
                }
            } catch (Exception ignored) {}
        }
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
}
