/*
* Copyright 2026 De-Vanced
* [https://github.com/RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced)
*/

package app.morphe.extension.facebook;

import android.app.Application;
import android.content.Context;
import android.util.Log;

import java.lang.reflect.Modifier;

import org.luckypray.dexkit.DexKitBridge;
import org.luckypray.dexkit.query.FindClass;
import org.luckypray.dexkit.query.FindMethod;
import org.luckypray.dexkit.query.matchers.ClassMatcher;
import org.luckypray.dexkit.query.matchers.MethodMatcher;
import org.luckypray.dexkit.result.ClassData;
import org.luckypray.dexkit.result.MethodData;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import top.canyie.pine.Pine;
import top.canyie.pine.PineConfig;
import top.canyie.pine.callback.MethodHook;

/**
 * In-process dynamic ad blocker for Facebook v573.
 *
 * Strategy: Since Redex stripped __redex_internal_original_name fields in v573,
 * we use DexKit to search for:
 *   1) Classes whose names contain ad-related substrings (AdBucket, AdInsertion, FeedAd, etc.)
 *   2) Classes using ad-related string constants (sponsor, Sponsored, ads_)
 *   3) The AudienceNetwork ad SDK service resolver
 *
 * We scan BOTH the base APK and the extracted Superpack secondary DEX.
 */
public final class AdBlockerScanner {
    private static final String TAG = "MorpheDynamicHook";

    // Class name substrings that indicate ad-serving logic
    private static final String[] AD_CLASS_PATTERNS = {
        "AdBucket", "AdInsertion", "FeedAd", "SponsoredStory",
        "AdsInsertion", "FetchMoreAds", "NativeAd", "AdDataSource",
        "AdBucketDataSource"
    };

    // Strings used in method bodies that indicate ad-serving code
    private static final String[] AD_METHOD_STRINGS = {
        "sponsored", "Sponsored", "ads_manager", "ad_placement",
        "is_ad", "sponsoredData"
    };

    private static boolean sCanHook = false; // Only true on real ARM devices

    private AdBlockerScanner() { }

    public static void runScan(Application app) {
        try {
            PineConfig.debug = true;
            java.io.File extractedFile = new java.io.File(app.getFilesDir(), "extracted_store-0.jar");

            if (!extractedFile.exists() || extractedFile.length() == 0) {
                Log.i(TAG, "Extracted JAR not found. Sleeping 15s to let Facebook AppInitScheduler finish...");
                Thread.sleep(15000);
                Log.i(TAG, "Self-extracting Superpack store-0.dex.spo now...");
                extractSuperpack(app);
            } else {
                Log.i(TAG, "Extracted JAR found on disk (" + extractedFile.length() + " bytes). Skipping extraction!");
            }

            // Detect architecture Ã¢â‚¬â€ Pine ART hooking only works on real ARM devices,
            // NOT on x86_64 emulators with ARM translation (causes SIGSEGV).
            String[] abis = android.os.Build.SUPPORTED_ABIS;
            boolean isRealArm = false;
            StringBuilder abiStr = new StringBuilder();
            for (String abi : abis) {
                if (abiStr.length() > 0) abiStr.append(", ");
                abiStr.append(abi);
                if (abi.equals("arm64-v8a") || abi.equals("armeabi-v7a")) isRealArm = true;
            }
            // x86_64 emulators with ARM translation list x86_64 first
            if (abis.length > 0 && (abis[0].contains("x86") || abis[0].contains("x86_64"))) {
                isRealArm = false;
            }
            sCanHook = isRealArm;
            Log.i(TAG, "ABIs: [" + abiStr + "] | Pine hooking " + (sCanHook ? "ENABLED" : "DISABLED (scan-only mode)"));

            // Load native libs
            try {
                System.loadLibrary("dexkit");
                Log.i(TAG, "DexKit native lib loaded.");
                if (sCanHook) {
                    System.loadLibrary("pine");
                    Log.i(TAG, "Pine native lib loaded.");
                }
            } catch (UnsatisfiedLinkError e) {
                Log.e(TAG, "Failed to load native libs: ", e);
                if (e.getMessage() != null && e.getMessage().contains("dexkit")) return;
                // Pine load failure is ok in scan-only mode
                sCanHook = false;
            }

            // 1. Scan Base APK (contains primary feed/ad classes)
            String baseDexPath = app.getApplicationInfo().sourceDir;
            ClassLoader baseLoader = app.getClassLoader();
            Log.i(TAG, "=== Scanning Base APK: " + baseDexPath + " ===");
            scanAndHook(baseDexPath, baseLoader);

            // 2. Scan Superpack extracted DEX (contains secondary ad logic)
            if (extractedFile.exists() && extractedFile.length() > 0) {
                extractedFile.setReadOnly();
                String extDexPath = extractedFile.getAbsolutePath();
                ClassLoader extLoader = new dalvik.system.PathClassLoader(extDexPath, app.getClassLoader());
                Log.i(TAG, "=== Scanning Superpack DEX: " + extDexPath + " ===");
                scanAndHook(extDexPath, extLoader);
            }

            Log.i(TAG, "All scans complete.");
        } catch (Throwable t) {
            Log.e(TAG, "Dynamic Hooking failed: ", t);
        }
    }

    private static void scanAndHook(String dexPath, ClassLoader loader) {
        int totalHooked = 0;
        try (DexKitBridge bridge = DexKitBridge.create(dexPath)) {
            if (bridge == null) {
                Log.e(TAG, "DexKitBridge.create returned null for: " + dexPath);
                return;
            }

            // Strategy 1: Find classes by name pattern
            for (String pattern : AD_CLASS_PATTERNS) {
                try {
                    List<ClassData> found = bridge.findClass(
                        FindClass.create().matcher(ClassMatcher.create().className(pattern))
                    );
                    if (!found.isEmpty()) {
                        Log.i(TAG, "Pattern '" + pattern + "' matched " + found.size() + " classes");
                        for (ClassData cd : found) {
                            totalHooked += hookAdClass(bridge, cd, loader);
                        }
                    }
                } catch (Throwable e) {
                    Log.w(TAG, "Pattern search failed for: " + pattern, e);
                }
            }

            // Strategy 2: Find classes using ad-related strings in method bodies
            for (String str : AD_METHOD_STRINGS) {
                try {
                    List<ClassData> found = bridge.findClass(
                        FindClass.create().matcher(ClassMatcher.create().usingStrings(str))
                    );
                    if (!found.isEmpty()) {
                        Log.i(TAG, "String '" + str + "' matched " + found.size() + " classes");
                        for (ClassData cd : found) {
                            totalHooked += hookAdClass(bridge, cd, loader);
                        }
                    }
                } catch (Throwable e) {
                    Log.w(TAG, "String search failed for: " + str, e);
                }
            }

            // Strategy 3: Find the AudienceNetwork service resolver (hook run() only, not all methods)
            try {
                List<ClassData> audienceNet = bridge.findClass(
                    FindClass.create().matcher(ClassMatcher.create().usingStrings("AdsRegistry"))
                );
                if (!audienceNet.isEmpty()) {
                    Log.i(TAG, "Found AudienceNetwork resolver: " + audienceNet.size() + " classes");
                    for (ClassData cd : audienceNet) {
                        totalHooked += hookAdClass(bridge, cd, loader);
                    }
                }
            } catch (Throwable e) {
                Log.w(TAG, "AudienceNetwork search failed", e);
            }

            Log.i(TAG, "Scan complete for " + dexPath + ". Total methods hooked: " + totalHooked);
        } catch (Throwable t) {
            Log.e(TAG, "Scan failed on " + dexPath, t);
        }
    }

    /**
     * Hook all safe (non-native, non-abstract) methods in an ad class.
     * v573's ad classes don't use run() pattern, so we hook all hookable methods.
     */
    private static int hookAdClass(DexKitBridge bridge, ClassData cd, ClassLoader loader) {
        int count = 0;
        String className = cd.getName();
        // CRITICAL: Skip our own extension classes to prevent self-hooking SIGSEGV
        String dotName = className.replace('/', '.');
        if (dotName.startsWith("app.morphe.extension.")) {
            Log.d(TAG, "Skipping own class: " + dotName);
            return 0;
        }
        try {
            Class<?> clazz = Class.forName(dotName, false, loader);
            Log.i(TAG, "Inspecting class: " + clazz.getName() + " (" + clazz.getDeclaredMethods().length + " methods)");
            for (Method m : clazz.getDeclaredMethods()) {
                int mods = m.getModifiers();
                // Skip native/abstract to prevent SIGSEGV
                if (Modifier.isNative(mods) || Modifier.isAbstract(mods)) continue;
                try {
                    final String methodName = m.getName();
                    final String fullName = clazz.getName() + "." + methodName;
                    if (sCanHook) {
                        Pine.hook(m, new MethodHook() {
                            @Override
                            public void beforeCall(Pine.CallFrame f) {
                                Log.i(TAG, "BLOCKED " + fullName + "()");
                                f.setResult(null);
                            }
                        });
                        Log.d(TAG, "Hooked: " + fullName);
                    } else {
                        Log.i(TAG, "[SCAN-ONLY] Would hook: " + fullName);
                    }
                    count++;
                } catch (Throwable e) {
                    // Individual method hook failure is ok
                }
            }
            if (count > 0) Log.i(TAG, "Hooked " + count + " methods in " + clazz.getName());
        } catch (ClassNotFoundException e) {
            Log.w(TAG, "Class not loadable: " + className);
        } catch (Throwable e) {
            Log.w(TAG, "hookAdClass failed for " + className, e);
        }
        return count;
    }

    private static void extractSuperpack(Context app) {
        try {
            Log.i(TAG, "Starting self-extraction of store-0.dex.spo via direct native calls...");

            // Step 1: Copy asset to temp file
            java.io.File tempSpo = new java.io.File(app.getCacheDir(), "temp_store-0.dex.spo");
            Log.i(TAG, "Copying asset to temp file: " + tempSpo.getAbsolutePath());
            try (java.io.InputStream assetIs = app.getAssets().open("secondary-program-dex-jars/store-0.dex.spo");
                 java.io.FileOutputStream tempOs = new java.io.FileOutputStream(tempSpo)) {
                byte[] buf = new byte[65536];
                int r;
                while ((r = assetIs.read(buf)) != -1) tempOs.write(buf, 0, r);
            }
            Log.i(TAG, "Temp .spo file: " + tempSpo.length() + " bytes");

            // Step 2: Load superpack-jni via SoLoader
            Class<?> soLoaderClass = Class.forName("com.facebook.soloader.SoLoader");
            Method loadLibrary = soLoaderClass.getMethod("loadLibrary", String.class);
            loadLibrary.invoke(null, "superpack-jni");
            Log.i(TAG, "superpack-jni loaded via SoLoader.");

            // Step 3: SuperpackArchive.readNative
            Class<?> archiveClass = Class.forName("com.facebook.superpack.SuperpackArchive");
            Method readNative = archiveClass.getDeclaredMethod("readNative", String.class, String.class, Long.TYPE);
            readNative.setAccessible(true);
            long archivePtr = (Long) readNative.invoke(null, tempSpo.getAbsolutePath(), "spo", 0L);
            Log.i(TAG, "Archive pointer: " + archivePtr);

            // Step 4: SuperpackArchive.nextNative
            Method nextNative = archiveClass.getDeclaredMethod("nextNative", Long.TYPE);
            nextNative.setAccessible(true);
            long filePtr = (Long) nextNative.invoke(null, archivePtr);
            Log.i(TAG, "File pointer: " + filePtr);

            // Step 5: SuperpackFile.getLengthNative
            Class<?> fileClass = Class.forName("com.facebook.superpack.SuperpackFile");
            Method getLengthNative = fileClass.getDeclaredMethod("getLengthNative", Long.TYPE);
            getLengthNative.setAccessible(true);
            int decompressedLength = (Integer) getLengthNative.invoke(null, filePtr);
            Log.i(TAG, "Decompressed length: " + decompressedLength + " bytes");

            // Step 6: SuperpackFile.getNameNative
            Method getNameNative = fileClass.getDeclaredMethod("getNameNative", Long.TYPE);
            getNameNative.setAccessible(true);
            String fileName = (String) getNameNative.invoke(null, filePtr);
            Log.i(TAG, "Superpack file name: " + fileName);

            // Step 7: SuperpackFile.readBytesNative
            Method readBytesNative = fileClass.getDeclaredMethod("readBytesNative",
                    Long.TYPE, Integer.TYPE, Integer.TYPE, byte[].class, Integer.TYPE);
            readBytesNative.setAccessible(true);

            java.io.File outFile = new java.io.File(app.getFilesDir(), "extracted_store-0.jar");
            try (java.io.FileOutputStream fos = new java.io.FileOutputStream(outFile)) {
                int offset = 0;
                byte[] chunk = new byte[1048576];
                while (offset < decompressedLength) {
                    int toRead = Math.min(chunk.length, decompressedLength - offset);
                    readBytesNative.invoke(null, filePtr, offset, toRead, chunk, 0);
                    fos.write(chunk, 0, toRead);
                    offset += toRead;
                }
            }

            //noinspection ResultOfMethodCallIgnored
            tempSpo.delete();
            outFile.setReadOnly();

            Log.i(TAG, "SUCCESS! Extracted " + outFile.length() + " bytes to " + outFile.getAbsolutePath());
        } catch (Throwable t) {
            Log.e(TAG, "Superpack extraction failed: ", t);
        }
    }
}
