import acr.browser.lightning.utils.AdBlock;
import android.content.Context;
import com.aspsine.multithreaddownload.util.AdblockerListSource;
import com.aspsine.multithreaddownload.util.AdblockerSettingsInfo;
import idm.internet.download.manager.userscript.Resource;
import idm.internet.download.manager.userscript.UserScript;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.security.MessageDigest;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicReference;
import java.util.regex.Pattern;
import java.util.zip.CRC32;
import java.util.zip.Deflater;
import java.util.zip.GZIPOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import org.json.JSONObject;

/**
 * Weekly CI builder for 1DM 20.0 (30257) Cloud Pre-Built AdBlocker & Userscript packs (schema v2).
 *
 * Executes 1DM 20.0's exact compiled AdBlocker parser (i.j12, binary header version 20, with full
 * assets/adblocker/js_resources.txt scriptlet & redirect catalog) and Userscript serializer
 * (i.yg7 + UserScript.toExportString(), usVersion = 2) on headless JDK 21, verifies round-trip
 * loading before emitting artifacts, and writes:
 *   1. onedm-v20-adblock-pack.zip (abnfp.bin, abnhp.bin, abcfp.bin, sources_meta.json,
 *      plus STORED sources/UUID1..UUID34.zip for complete Hosts & filters UI/DB hydration)
 *   2. bypass-shortlinks-1dm.1dmus.gz (mobile-adapted, offline-self-contained .1dmus)
 *   3. manifest.json (schema 2 SHA-256 digests + build metadata for atomic client auto-sync)
 */
public final class OnedmCacheBuilder {

    private static final String BYPASS_SCRIPT_URL =
        "https://codeberg.org/gongchandang49/bypass-all-shortlinks-debloated/raw/branch/main/Bypass_All_Shortlinks.user.js";
    private static final String MONKEY_CONFIG_URL =
        "https://codeberg.org/gongchandang49/bypass-all-shortlinks-debloated/raw/branch/main/MonkeyConfig-Mod.js";
    private static final int BUILTIN_MANUAL_FILTER_COUNT = 90;

    private static final class FilterSpec {
        final String uuid;
        final int order;
        final String name;
        final String url;
        final boolean trusted;

        FilterSpec(String uuid, int order, String name, String url, boolean trusted) {
            this.uuid = uuid;
            this.order = order;
            this.name = name;
            this.url = url;
            this.trusted = trusted;
        }
    }

    private static final class AdblockBuild {
        final File zipFile;
        final int totalActiveFilters;

        AdblockBuild(File zipFile, int totalActiveFilters) {
            this.zipFile = zipFile;
            this.totalActiveFilters = totalActiveFilters;
        }
    }

    /**
     * Exact 28 default-enabled filter rows from 1DM 20.0 (30257) i.hv6 (lines 340..620),
     * including the exact 15 trusted = true flags from hv6's trusted-source table so
     * +js / $urlskip / $redirect rules compile identically to an on-device build.
     */
    private static final List<FilterSpec> DEFAULT_ENABLED_FILTERS = Arrays.asList(
        new FilterSpec("UUID1", 1, "1DM filters", "https://www.apps2sd.info/idm/filters.txt", true),
        new FilterSpec("UUID2", 2, "EasyList", "https://easylist.to/easylist/easylist.txt", false),
        new FilterSpec("UUID3", 3, "uBlock filters", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt", true),
        new FilterSpec("UUID4", 4, "AdGuard Base filter", "https://filters.adtidy.org/extension/ublock/filters/2_without_easylist.txt", true),
        new FilterSpec("UUID5", 5, "EasyPrivacy", "https://easylist.to/easylist/easyprivacy.txt", false),
        new FilterSpec("UUID6", 6, "Peter Lowe's Ad and tracking server list", "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext", false),
        new FilterSpec("UUID7", 7, "AakList (Anti-Adblock Killer)", "https://raw.githubusercontent.com/reek/anti-adblock-killer/master/anti-adblock-killer-filters.txt", false),
        new FilterSpec("UUID8", 8, "Adblock Warning Removal List", "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt", false),
        new FilterSpec("UUID9", 9, "uBlock filters - Unbreak", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/unbreak.txt", true),
        new FilterSpec("UUID10", 10, "AdGuard Mobile Ads filter", "https://filters.adtidy.org/extension/ublock/filters/11.txt", true),
        new FilterSpec("UUID13", 13, "uBlock filters - Resource abuse", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt", true),
        new FilterSpec("UUID15", 15, "AdGuard Annoyances", "https://filters.adtidy.org/extension/ublock/filters/14.txt", true),
        new FilterSpec("UUID16", 16, "Fanboy's Annoyance List", "https://secure.fanboy.co.nz/fanboy-annoyance.txt", false),
        new FilterSpec("UUID17", 17, "uBlock filters - Annoyances", "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances-others.txt", true),
        new FilterSpec("UUID20", 20, "Fanboy's Indian filter", "https://secure.fanboy.co.nz/fanboy-indian.txt", false),
        new FilterSpec("UUID21", 21, "AdGuard Turkish filter", "https://filters.adtidy.org/windows/filters/13.txt?id=13", true),
        new FilterSpec("UUID22", 22, "ABPindo Indonesian filter", "https://raw.githubusercontent.com/ABPindo/indonesianadblockrules/master/subscriptions/abpindo.txt", false),
        new FilterSpec("UUID23", 23, "AdGuard Russian filter", "https://filters.adtidy.org/windows/filters/1.txt?id=1", true),
        new FilterSpec("UUID24", 24, "AdGuard Spanish/Portuguese filter", "https://filters.adtidy.org/extension/ublock/filters/9.txt", true),
        new FilterSpec("UUID25", 25, "EasyList German filter", "https://easylist-downloads.adblockplus.org/easylistgermany.txt", false),
        new FilterSpec("UUID26", 26, "OISD Abp Full", "https://abp.oisd.nl", false),
        new FilterSpec("UUID27", 27, "FFAdblock (Anti-Adblock Killer)", "https://raw.githubusercontent.com/bogachenko/fuckfuckadblock/master/fuckfuckadblock.txt", false),
        new FilterSpec("UUID28", 28, "uBlock filters - Quick fixes", "https://ublockorigin.github.io/uAssets/filters/quick-fixes.txt", true),
        new FilterSpec("UUID29", 29, "AdGuard Tracking Protection", "https://filters.adtidy.org/extension/ublock/filters/3.txt", true),
        new FilterSpec("UUID30", 30, "AdGuard URL Tracking Protection", "https://filters.adtidy.org/extension/ublock/filters/17.txt", true),
        new FilterSpec("UUID31", 31, "Actually Legitimate URL Shortener Tool", "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt", false),
        new FilterSpec("UUID32", 32, "HaGeZi Pro DNS/Browser Blocklist", "https://raw.githubusercontent.com/hagezi/dns-blocklists/main/adblock/pro.txt", false),
        new FilterSpec("UUID34", 34, "AdGuard Popup Overlays", "https://filters.adtidy.org/extension/ublock/filters/19.txt", true)
    );

    public static void main(String[] args) throws Throwable {
        if (args.length < 2) {
            throw new IllegalArgumentException("Usage: OnedmCacheBuilder <workDir> <outDir>");
        }
        File workDir = new File(args[0]);
        File outDir = new File(args[1]);
        workDir.mkdirs();
        outDir.mkdirs();

        Context ctx = new Context(new File(workDir, "ctx"));
        configureOneDmGlobals(ctx);

        // Verify 1DM's embedded adblocker/js_resources.txt asset is accessible so +js & $redirect rules compile
        try (InputStream jsRes = ctx.getAssets().open("adblocker/js_resources.txt")) {
            if (jsRes.read() == -1) {
                throw new IllegalStateException("Empty assets/adblocker/js_resources.txt!");
            }
        }

        long buildEpochMs = System.currentTimeMillis();
        System.out.println("[1/3] Downloading & compiling 28 default 1DM 20.0 AdBlocker lists...");
        AdblockBuild adblockBuild = buildAndVerifyAdblockPack(ctx, new File(workDir, "lists"), outDir, buildEpochMs);
        File adblockPack = adblockBuild.zipFile;

        System.out.println("[2/3] Building & verifying mobile-adapted Bypass All Shortlinks .1dmus...");
        UserscriptBuild usBuild = buildAndVerifyUserscriptPack(ctx, outDir);

        System.out.println("[3/3] Writing manifest.json (schema 2)...");
        String adblockSha = sha256Hex(Files.readAllBytes(adblockPack.toPath()));
        String usSha = sha256Hex(Files.readAllBytes(usBuild.gzFile.toPath()));
        String builtAt = Instant.ofEpochMilli(buildEpochMs).toString();

        String manifestJson = "{\n"
            + "  \"schema\": 2,\n"
            + "  \"appVersionCode\": 30257,\n"
            + "  \"adblockFormatVersion\": 20,\n"
            + "  \"builtAt\": \"" + builtAt + "\",\n"
            + "  \"builtAtEpochMs\": " + buildEpochMs + ",\n"
            + "  \"totalActiveFilters\": " + adblockBuild.totalActiveFilters + ",\n"
            + "  \"adblockAsset\": \"" + adblockPack.getName() + "\",\n"
            + "  \"adblockSha256\": \"" + adblockSha + "\",\n"
            + "  \"adblockSize\": " + adblockPack.length() + ",\n"
            + "  \"userscriptAsset\": \"" + usBuild.gzFile.getName() + "\",\n"
            + "  \"userscriptVersion\": \"" + escapeJson(usBuild.version) + "\",\n"
            + "  \"userscriptSha256\": \"" + usSha + "\",\n"
            + "  \"userscriptSize\": " + usBuild.gzFile.length() + "\n"
            + "}\n";
        File manifestFile = new File(outDir, "manifest.json");
        Files.write(manifestFile.toPath(), manifestJson.getBytes(StandardCharsets.UTF_8));

        System.out.println("Done! Artifacts written to " + outDir.getAbsolutePath() + ":");
        System.out.println("  - " + adblockPack.getName() + " (" + adblockPack.length() + " B, filters=" + adblockBuild.totalActiveFilters + ", sha256=" + adblockSha + ")");
        System.out.println("  - " + usBuild.gzFile.getName() + " (" + usBuild.gzFile.length() + " B, v=" + usBuild.version + ", sha256=" + usSha + ")");
        System.out.println("  - manifest.json");
    }

    private static void configureOneDmGlobals(Context ctx) throws Throwable {
        Class<?> oj7Class = Class.forName("i.oj7");
        Class<?> w53Class = Class.forName("i.w53");

        Field ctxField = oj7Class.getDeclaredField("\u06e6\u06d8\u06e2");
        ctxField.setAccessible(true);
        ctxField.set(null, ctx);

        Field webviewMajorField = oj7Class.getDeclaredField("\u06e6\u06df\u06e1");
        webviewMajorField.setAccessible(true);
        webviewMajorField.set(null, Integer.valueOf(124));

        Field unsafeField = sun.misc.Unsafe.class.getDeclaredField("theUnsafe");
        unsafeField.setAccessible(true);
        sun.misc.Unsafe unsafe = (sun.misc.Unsafe) unsafeField.get(null);
        Object w53Instance = unsafe.allocateInstance(w53Class);

        AdblockerSettingsInfo settings = new AdblockerSettingsInfo();
        settings.setEnableAutoUpdate(true);
        settings.setSaveRawFilterLines(false);
        settings.setUseHostEntriesToBlockWebsites(true);
        settings.setUseCosmeticFilters(true);
        settings.setUseGenericCosmeticFilters(true);
        settings.setCacheIFrameUrls(true);

        MethodHandles.Lookup lookup = MethodHandles.lookup();
        lookup.findSetter(w53Class, "\u06e6\u06eb\u06e0", AdblockerSettingsInfo.class)
            .invoke(w53Instance, settings);

        Field closedField = w53Class.getDeclaredField("\u06e6\u06d9\u06e2");
        closedField.setAccessible(true);
        closedField.set(w53Instance, new java.util.concurrent.atomic.AtomicBoolean(false));

        lookup.findStaticSetter(oj7Class, "\u06e6\u06d7\u06e0", w53Class)
            .invoke(w53Instance);
    }

    private static AdblockBuild buildAndVerifyAdblockPack(
        Context ctx,
        File listsDir,
        File outDir,
        long buildEpochMs
    ) throws Throwable {
        listsDir.mkdirs();
        Set<String> coreUuids = new LinkedHashSet<>(Arrays.asList("UUID2", "UUID3", "UUID4", "UUID5", "UUID9", "UUID10", "UUID26", "UUID32"));
        ExecutorService pool = Executors.newFixedThreadPool(8, r -> {
            Thread t = new Thread(r, "onedm-list-dl");
            t.setDaemon(true);
            return t;
        });

        ArrayList<AdblockerListSource> sources = new ArrayList<>();
        int downloadedLists = 0;
        int skippedMinor = 0;
        try {
            List<Future<AdblockerListSource>> futures = new ArrayList<>();
            for (FilterSpec spec : DEFAULT_ENABLED_FILTERS) {
                futures.add(pool.submit((Callable<AdblockerListSource>) () -> {
                    AdblockerListSource src = new AdblockerListSource(spec.uuid, spec.order)
                        .setName(spec.name)
                        .setSourceUrl(spec.url)
                        .setSourceType(2)
                        .setEnabled(true)
                        .setTrusted(spec.trusted);

                    try {
                        byte[] rawTxt = fetchBytesWithRetry(spec.url, 3);
                        if (rawTxt.length < 32) {
                            throw new IllegalStateException("Empty/truncated filter list for " + spec.name);
                        }
                        File zipFile = new File(listsDir, spec.uuid + ".zip");
                        try (ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zipFile))) {
                            zos.setLevel(Deflater.BEST_COMPRESSION);
                            // Match 1DM x73.m2844 entry naming ("s_<uuid>.txt") + ZipEntry comment = raw .txt byte length
                            ZipEntry ze = new ZipEntry("s_" + spec.uuid + ".txt");
                            ze.setTime(0L);
                            ze.setComment(String.valueOf(rawTxt.length));
                            zos.putNextEntry(ze);
                            zos.write(rawTxt);
                            zos.closeEntry();
                        }
                        src.setLocalPath(zipFile.getAbsolutePath());
                        src.setLocalFileExists(true);
                        src.setLocalSize(zipFile.length());
                        src.setSourceSize(rawTxt.length);
                        src.setLocalLastUpdated(buildEpochMs);
                    } catch (Exception e) {
                        if ("UUID1".equals(spec.uuid)) {
                            System.err.println("  [WARN] UUID1 online fetch failed; falling back to embedded 1DM asset.");
                            return src;
                        }
                        if (coreUuids.contains(spec.uuid)) {
                            throw e;
                        }
                        System.err.println("  [WARN] Minor list " + spec.uuid + " (" + spec.name + ") unreachable: " + e.getMessage());
                        return null;
                    }
                    return src;
                }));
            }

            for (Future<AdblockerListSource> fut : futures) {
                AdblockerListSource src = fut.get();
                if (src == null) {
                    skippedMinor++;
                    continue;
                }
                sources.add(src);
                if (src.isLocalFileExists()) downloadedLists++;
            }
        } finally {
            pool.shutdownNow();
        }
        if (skippedMinor > 3 || downloadedLists < 25) {
            throw new IllegalStateException("Too many upstream lists failed (" + skippedMinor + " skipped); aborting cache publish.");
        }
        System.out.println("  Downloaded " + downloadedLists + " upstream lists (total active lists = " + sources.size() + ").");

        Class<?> j12Class = Class.forName("i.j12");
        Class<?> g53Class = Class.forName("i.g53");
        Class<?> jn4Class = Class.forName("i.jn4");

        MethodHandles.Lookup lookup = MethodHandles.lookup();
        MethodHandle j12Ctor = lookup.findConstructor(j12Class, MethodType.methodType(void.class, AdBlock.Delegate.class));
        Object compiler = j12Ctor.invoke((AdBlock.Delegate) null);
        Object cancelToken = lookup.findConstructor(jn4Class, MethodType.methodType(void.class)).invoke();

        MethodHandle compileMethod = lookup.findVirtual(
            j12Class,
            "\u06e6\u06d7\u06e8",
            MethodType.methodType(void.class, Context.class, ArrayList.class, g53Class)
        );
        long t0 = System.currentTimeMillis();
        compileMethod.invoke(compiler, ctx, sources, cancelToken);
        long elapsedMs = System.currentTimeMillis() - t0;

        File filesDir = ctx.getFilesDir();
        File nfp = new File(filesDir, "abnfp.bin");
        File nhp = new File(filesDir, "abnhp.bin");
        File cfp = new File(filesDir, "abcfp.bin");

        for (File bin : Arrays.asList(nfp, nhp, cfp)) {
            if (!bin.isFile() || bin.length() < 64) {
                throw new IllegalStateException("Compiled binary missing or empty: " + bin);
            }
            byte[] hdr = new byte[4];
            try (FileInputStream fis = new FileInputStream(bin)) {
                if (fis.read(hdr) != 4) throw new IllegalStateException("Short header: " + bin);
            }
            int ver = ByteBuffer.wrap(hdr).getInt();
            if (ver != 20) {
                throw new IllegalStateException("Unexpected binary format version " + ver + " in " + bin.getName());
            }
        }

        // Verify with 1DM's own validator & fresh engine reload!
        MethodHandle validateMethod = lookup.findStatic(
            j12Class, "\u06e6\u06d7\u06e0", MethodType.methodType(boolean.class, Context.class)
        );
        boolean valid = (boolean) validateMethod.invoke(ctx);
        if (!valid) {
            throw new IllegalStateException("1DM j12 validator rejected compiled ab*.bin files!");
        }

        Object verifyEngine = j12Ctor.invoke((AdBlock.Delegate) null);
        MethodHandle loadMethod = lookup.findStatic(
            j12Class, "\u06e6\u06d6\u06e5", MethodType.methodType(void.class, Context.class, j12Class, boolean.class)
        );
        loadMethod.invoke(ctx, verifyEngine, true);
        java.util.concurrent.atomic.AtomicBoolean loadedFlag = (java.util.concurrent.atomic.AtomicBoolean)
            lookup.findGetter(j12Class, "\u06e6\u06d6\u06e8", java.util.concurrent.atomic.AtomicBoolean.class).invoke(verifyEngine);
        if (loadedFlag == null || !loadedFlag.get()) {
            throw new IllegalStateException("Fresh j12 engine did not mark loaded=true after reload!");
        }

        int listRulesTotal = 0;
        JSONObject sourcesMetaObj = new JSONObject();
        for (AdblockerListSource src : sources) {
            int count = src.getTotalFilterCount();
            listRulesTotal += count;
            JSONObject item = new JSONObject();
            item.put("count", count);
            item.put("localSize", src.getLocalSize());
            item.put("sourceSize", src.getSourceSize());
            sourcesMetaObj.put(src.getUuid(), item);
        }
        int totalActiveFilters = listRulesTotal + BUILTIN_MANUAL_FILTER_COUNT;
        if (totalActiveFilters < 1_000_000) {
            throw new IllegalStateException("Compiled filter count unexpectedly low (" + totalActiveFilters + "); aborting!");
        }

        JSONObject metaRoot = new JSONObject();
        metaRoot.put("schema", 2);
        metaRoot.put("builtAtEpochMs", buildEpochMs);
        metaRoot.put("totalActiveFilters", totalActiveFilters);
        metaRoot.put("sources", sourcesMetaObj);
        byte[] metaBytes = metaRoot.toString(2).getBytes(StandardCharsets.UTF_8);

        System.out.printf(
            "  Compiled & verified in %.2fs: totalActiveFilters=%,d, abnfp.bin=%,d B, abnhp.bin=%,d B, abcfp.bin=%,d B%n",
            elapsedMs / 1000.0, totalActiveFilters, nfp.length(), nhp.length(), cfp.length()
        );

        File zipOut = new File(outDir, "onedm-v20-adblock-pack.zip");
        try (ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zipOut))) {
            zos.setLevel(Deflater.BEST_COMPRESSION);
            for (File bin : Arrays.asList(nfp, nhp, cfp)) {
                ZipEntry ze = new ZipEntry(bin.getName());
                ze.setMethod(ZipEntry.DEFLATED);
                ze.setTime(0L);
                zos.putNextEntry(ze);
                Files.copy(bin.toPath(), zos);
                zos.closeEntry();
            }

            ZipEntry metaEntry = new ZipEntry("sources_meta.json");
            metaEntry.setMethod(ZipEntry.DEFLATED);
            metaEntry.setTime(0L);
            zos.putNextEntry(metaEntry);
            zos.write(metaBytes);
            zos.closeEntry();

            // Embed already-DEFLATED per-UUID .zip archives using ZipEntry.STORED (zero double-compression,
            // zero decompression CPU on device — direct stream copy into .adblocker_1dm/<uuid>.zip).
            for (AdblockerListSource src : sources) {
                String lp = src.getLocalPath(false);
                if (lp == null || lp.isEmpty()) continue;
                File srcZip = new File(lp);
                if (!srcZip.isFile()) continue;
                byte[] zipBytes = Files.readAllBytes(srcZip.toPath());
                CRC32 crc = new CRC32();
                crc.update(zipBytes);
                ZipEntry stored = new ZipEntry("sources/" + src.getUuid() + ".zip");
                stored.setMethod(ZipEntry.STORED);
                stored.setSize(zipBytes.length);
                stored.setCompressedSize(zipBytes.length);
                stored.setCrc(crc.getValue());
                stored.setTime(0L);
                zos.putNextEntry(stored);
                zos.write(zipBytes);
                zos.closeEntry();
            }
        }
        return new AdblockBuild(zipOut, totalActiveFilters);
    }

    private static final class UserscriptBuild {
        final File gzFile;
        final String version;
        UserscriptBuild(File gzFile, String version) {
            this.gzFile = gzFile;
            this.version = version;
        }
    }

    private static UserscriptBuild buildAndVerifyUserscriptPack(Context ctx, File outDir) throws Throwable {
        String rawScript = new String(fetchBytesWithRetry(BYPASS_SCRIPT_URL, 3), StandardCharsets.UTF_8);
        String rawMonkeyCfg = new String(fetchBytesWithRetry(MONKEY_CONFIG_URL, 3), StandardCharsets.UTF_8);

        // Mobile-adapt MonkeyConfig-Mod.js: responsive width, 18px touch checkboxes, no infinite GPU label marquee,
        // and strip nested @require headers that 1DM does not recursively parse.
        String adaptedMonkeyCfg = rawMonkeyCfg
            .replaceAll("(?m)^\\s*//\\s*@require\\b.*$", "// [1DM-adapted: nested @require stripped]")
            .replace("\"600px\"", "\"min(94vw, 600px)\"")
            .replace("'11px'", "'18px'")
            .replace("width: 11px !important; height: 11px !important;", "width: 18px !important; height: 18px !important;")
            .replace(
                ".__MonkeyConfig_container label { animation: scroll-text 10s linear infinite; }",
                ".__MonkeyConfig_container label { white-space: normal !important; overflow-x: visible !important; }"
            );

        String monkeyDataUri = "data:text/javascript;base64,"
            + Base64.getEncoder().encodeToString(adaptedMonkeyCfg.getBytes(StandardCharsets.UTF_8));

        // Mobile-adapt Bypass_All_Shortlinks.user.js header for 1DM 20.0:
        // 1. Mark GM_registerMenuCommand optional; pre-declare @connect hosts + window.close grant
        // 2. Embed adapted MonkeyConfig-Mod.js via data: URI during yg7 parse so hashes + methodsUsed populate offline
        // 3. Omit @downloadURL / @updateURL so stock kh7 raw .user.js updater never overwrites mobile adaptations
        StringBuilder adapted = new StringBuilder(rawScript.length() + 512);
        boolean inHeader = false;
        boolean addedConnect = false;
        for (String line : rawScript.split("\r?\n", -1)) {
            String trimmed = line.trim();
            if (trimmed.equals("// ==UserScript==")) {
                inHeader = true;
                adapted.append(line).append('\n');
                continue;
            }
            if (inHeader && trimmed.equals("// ==/UserScript==")) {
                if (!addedConnect) {
                    adapted.append("// @grant      window.close\n");
                    adapted.append("// @connect    self\n");
                    adapted.append("// @connect    shrinkforearn.in\n");
                    adapted.append("// @connect    flickr.com\n");
                    adapted.append("// @connect    www.flickr.com\n");
                    addedConnect = true;
                }
                inHeader = false;
                adapted.append(line).append('\n');
                continue;
            }
            if (inHeader) {
                if (trimmed.startsWith("// @grant") && trimmed.contains("GM_registerMenuCommand")) {
                    adapted.append("// @grant      GM_registerMenuCommand optional\n");
                    continue;
                }
                if (trimmed.startsWith("// @require") && trimmed.contains("MonkeyConfig-Mod.js")) {
                    adapted.append("// @require    ").append(monkeyDataUri).append('\n');
                    continue;
                }
                if (trimmed.startsWith("// @downloadURL") || trimmed.startsWith("// @updateURL")) {
                    continue;
                }
            }
            adapted.append(line).append('\n');
        }

        Class<?> yg7Class = Class.forName("i.yg7");
        Class<?> jn4Class = Class.forName("i.jn4");
        Class<?> g53Class = Class.forName("i.g53");
        Class<?> d77Class = Class.forName("i.d77");
        MethodHandles.Lookup lookup = MethodHandles.lookup();
        Object cancelToken = lookup.findConstructor(jn4Class, MethodType.methodType(void.class)).invoke();
        AtomicReference<Throwable> errRef = new AtomicReference<>();

        MethodHandle parseMethod = lookup.findStatic(
            yg7Class,
            "\u06e6\u06d6\u06d7",
            MethodType.methodType(
                UserScript.class,
                Context.class,
                String.class,
                String.class,
                g53Class,
                AtomicReference.class,
                UserScript.class,
                d77Class
            )
        );

        UserScript script = (UserScript) parseMethod.invoke(
            ctx, adapted.toString(), "", cancelToken, errRef, null, null
        );
        if (script == null || errRef.get() != null) {
            throw new IllegalStateException("yg7 failed to parse adapted userscript: " + errRef.get());
        }

        // Restore canonical MonkeyConfig-Mod.js URL on both @require metadata and bundled Resource
        List<String> reqs = new ArrayList<>();
        reqs.add(MONKEY_CONFIG_URL);
        script.setRequires(reqs);
        if (script.getTempResourceList() == null || script.getTempResourceList().isEmpty()) {
            throw new IllegalStateException("Bundled MonkeyConfig-Mod.js missing from tempResourceList!");
        }
        for (Resource res : script.getTempResourceList()) {
            if ("require".equals(res.getType())) {
                res.setUrl(MONKEY_CONFIG_URL);
                res.setOrder(0);
            }
        }

        Set<String> allowed = new LinkedHashSet<>(Arrays.asList(
            "self", "shrinkforearn.in", "flickr.com", "www.flickr.com"
        ));
        if (script.getConnectUrls() != null) {
            allowed.addAll(script.getConnectUrls());
        }
        script.setAllowedHosts(new ArrayList<>(allowed));
        script.setUpdateUrl("");
        script.setDownloadUrl("");
        script.setEnabled(true);

        String exported1dmus = script.toExportString();
        UserScript roundTrip = UserScript.from(exported1dmus);
        if (roundTrip == null || roundTrip.getTempResourceList() == null || roundTrip.getTempResourceList().isEmpty()) {
            throw new IllegalStateException("UserScript.from() round-trip verification failed!");
        }
        if (roundTrip.getWarnings(false) != null && !roundTrip.getWarnings(false).isEmpty()) {
            throw new IllegalStateException("Adapted userscript emitted parse warnings: " + roundTrip.getWarnings(false));
        }

        // Validate every regex @include / @exclude pattern compiles cleanly on java.util.regex.Pattern
        int regexCount = 0;
        List<String> allPatterns = new ArrayList<>();
        if (roundTrip.getIncludes() != null) allPatterns.addAll(roundTrip.getIncludes());
        if (roundTrip.getExcludes() != null) allPatterns.addAll(roundTrip.getExcludes());
        for (String pat : allPatterns) {
            if (pat != null && pat.length() > 2 && pat.startsWith("/") && pat.endsWith("/")) {
                Pattern.compile(pat.substring(1, pat.length() - 1), Pattern.CASE_INSENSITIVE);
                regexCount++;
            }
        }

        File outGz = new File(outDir, "bypass-shortlinks-1dm.1dmus.gz");
        try (FileOutputStream fos = new FileOutputStream(outGz);
             GZIPOutputStream gzos = new GZIPOutputStream(fos) {{ def.setLevel(Deflater.BEST_COMPRESSION); }}) {
            gzos.write(exported1dmus.getBytes(StandardCharsets.UTF_8));
        }

        System.out.printf(
            "  Verified .1dmus round-trip: id=%s, v=%s, grants=%d, regexes=%d, resources=%d, gz=%,d B%n",
            roundTrip.getScriptId(),
            roundTrip.getVersion(),
            roundTrip.getGrants() != null ? roundTrip.getGrants().size() : 0,
            regexCount,
            roundTrip.getTempResourceList().size(),
            outGz.length()
        );
        return new UserscriptBuild(outGz, roundTrip.getVersion());
    }

    private static byte[] fetchBytesWithRetry(String urlStr, int attempts) throws Exception {
        Exception lastErr = null;
        for (int attempt = 1; attempt <= attempts; attempt++) {
            try {
                String current = urlStr;
                for (int hop = 0; hop < 5; hop++) {
                    HttpURLConnection conn = (HttpURLConnection) new URL(current).openConnection();
                    conn.setInstanceFollowRedirects(false);
                    conn.setConnectTimeout(20_000);
                    conn.setReadTimeout(60_000);
                    conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 Chrome/124.0.0.0 Mobile Safari/537.36");
                    int code = conn.getResponseCode();
                    if (code == 301 || code == 302 || code == 303 || code == 307 || code == 308) {
                        String loc = conn.getHeaderField("Location");
                        conn.disconnect();
                        if (loc == null) throw new IllegalStateException("Redirect with no Location from " + current);
                        current = new URL(new URL(current), loc).toString();
                        continue;
                    }
                    if (code != 200) {
                        conn.disconnect();
                        throw new IllegalStateException("HTTP " + code + " for " + current);
                    }
                    try (InputStream is = conn.getInputStream();
                         ByteArrayOutputStream bos = new ByteArrayOutputStream()) {
                        byte[] buf = new byte[16384];
                        int n;
                        while ((n = is.read(buf)) != -1) {
                            bos.write(buf, 0, n);
                        }
                        return bos.toByteArray();
                    } finally {
                        conn.disconnect();
                    }
                }
                throw new IllegalStateException("Too many redirects for " + urlStr);
            } catch (Exception e) {
                lastErr = e;
                if (attempt < attempts) {
                    Thread.sleep(1500L * attempt);
                }
            }
        }
        throw lastErr;
    }

    private static String sha256Hex(byte[] data) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] digest = md.digest(data);
        StringBuilder sb = new StringBuilder(digest.length * 2);
        for (byte b : digest) {
            sb.append(String.format("%02x", b & 0xff));
        }
        return sb.toString();
    }

    private static String escapeJson(String s) {
        return s == null ? "" : s.replace("\\", "\\\\").replace("\"", "\\\"");
    }
}
