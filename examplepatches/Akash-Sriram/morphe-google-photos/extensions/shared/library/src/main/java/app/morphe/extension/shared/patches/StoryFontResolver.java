package app.morphe.extension.shared.patches;

import android.content.Context;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Handler;
import android.view.View;
import android.widget.TextView;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

public final class StoryFontResolver {
    private static final String TAG = "StoryFontResolver";
    private static final String FONTS_SUBDIR = "fonts";

    public static final String SYSTEM_FALLBACK_ROBOTO = "file:///system/fonts/Roboto-Regular.ttf";
    public static final String SYSTEM_FALLBACK_NOTO_SERIF = "file:///system/fonts/NotoSerif-Italic.ttf";

    // Official Google Fonts Downloadable CDN URLs (from fonts.gstatic.com/s/a/directory.xml)
    private static final String[][] FONT_CATALOG = {
        // Family key, style variant ("italic", "regular", or "any"), target filename, CDN URL
        {"google sans regular", "any", "Google_Sans_Text-Regular.ttf", "https://fonts.gstatic.com/s/a/f6be6c46e5e0da69aa6783a21cffc9b7430ebf267e52c9825c1eed97837e7272.ttf"},
        {"google sans medium", "any", "Google_Sans_Text-Medium.ttf", "https://fonts.gstatic.com/s/a/c46bd11814b10b6fa2d0d9e5ceba40726f0ac5f4ec4b9c91baac653fe7983395.ttf"},
        {"google sans bold", "any", "Google_Sans_Text-Bold.ttf", "https://fonts.gstatic.com/s/a/8563195a251e954da2f7b777134ef1475b7f309b07e06ee2422886e2ff595f09.ttf"},
        {"google sans display regular", "any", "Google_Sans_Display_Regular.ttf", "https://fonts.gstatic.com/s/a/47abdc5008abb090fb80537f50f31d791281eac4aac16da34b9cd7f289ed224b.ttf"},
        {"google sans display bold", "any", "Google_Sans_Display_Bold.ttf", "https://fonts.gstatic.com/s/a/f54c0f55aab7bd5423198db56b6d62c08a6546b1550f138ef331c0cf60588908.ttf"},
        {"dm serif", "italic", "DM_Serif_Display_Italic.ttf", "https://fonts.gstatic.com/s/a/fe24375d0d73b90fae5e0a7785b66f8ddd2bcdcde9c158d3a18e2474a3247dfc.ttf"},
        {"dm serif", "regular", "DM_Serif_Display_Regular.ttf", "https://fonts.gstatic.com/s/a/fc1fbdc15a55aed5cd062b1714e00fc5273739476643f0b1f16b567f491660ba.ttf"},
        {"biorhyme", "any", "BioRhyme_Bold.ttf", "https://fonts.gstatic.com/s/a/1b4cd7dd9cf59404e36b9eec0b59f7f7fad19a0fa7fafb43a92b50b6dc5fa769.ttf"},
        {"sarina", "any", "Sarina_Regular.ttf", "https://fonts.gstatic.com/s/a/ccc4eef9941094e91bef1121c17517cb37e71c58b3e06c87cc8655ed9338178d.ttf"},
        {"press start", "any", "Press_Start_2P.ttf", "https://fonts.gstatic.com/s/a/8e9e854f71aebd3bb8342321d0cc92cabf68e27354dd7a90e806bce895da8dca.ttf"},
        {"caveat", "any", "Caveat.ttf", "https://fonts.gstatic.com/s/a/ac665d4d97c82c756445bad1caa60e33982c9a0a4f717fc973992f57d3e8ebc8.ttf"},
        {"handlee", "any", "Handlee.ttf", "https://fonts.gstatic.com/s/a/e92b00d221f9645dddf0e69149a6981b6a9520417d3a7709a9b1e705b673be86.ttf"},
        {"montserrat", "any", "Montserrat.ttf", "https://fonts.gstatic.com/s/a/e3bb63f2cd246ff159b0841c2bd55d0914291a93487340cfa27574cc8d1861dd.ttf"},
        {"oswald", "any", "Oswald.ttf", "https://fonts.gstatic.com/s/a/681ce58086b45449b1c6896b52a8177b593e845cc2b8651cab2cd7d061727d2b.ttf"},
        {"playfair", "any", "Playfair_Display.ttf", "https://fonts.gstatic.com/s/a/b2a339c2754c92469aa3e100e4f2b97e9361f529f8be3659c7a5fca455a3d53e.ttf"}
    };

    private static final Map<String, Typeface> TYPEFACE_CACHE = new ConcurrentHashMap<>();
    private static volatile boolean isBackgroundSeedingStarted = false;

    private StoryFontResolver() {}

    /**
     * Preserves device's native system fonts on home carousel memory cards.
     */
    public static void applyMemoryCardFonts(View container) {
        // No-op: Home carousel cards use the device's native system font (e.g. Roboto on POCO F1)
    }

    /**
     * Deterministically resolves font bytes for Skottie rendering based on the exact render model.
     * Intercepts Lbgsx;->q(Context, akyh, bgwe, jzi, bgwh, ConcurrentHashMap, bgqv, bgsz) -> Lccej;
     *
     * If bgqv is a Home Carousel thumbnail (Lbgrp.a == THUMB), supplies the device's native system font.
     * If bgqv is a Fullscreen Story (HIGH_RES / SCREEN_NAIL / DEFERRED), supplies authentic Google Fonts.
     * Returns null if unhandled to fall through to original logic.
     */
    public static byte[] resolveFontBytesForTarget(Context context, Object bgwh, Object bgqv) {
        if (context == null) context = Utils.getContext();
        if (context == null) context = Utils.getActivity();

        // 1. Determine if render target is THUMB (Home Carousel squircle card)
        boolean isThumb = false;
        if (bgqv != null) {
            try {
                Method bMethod = bgqv.getClass().getMethod("b");
                Object targetEnum = bMethod.invoke(bgqv);
                if (targetEnum != null && "THUMB".equals(targetEnum.toString())) {
                    isThumb = true;
                }
            } catch (Throwable t) {
                Logger.printInfo(() -> TAG + ": resolveFontBytesForTarget error reading target: " + t.getMessage());
            }
        }

        final boolean isThumbFinal = isThumb;
        File fontsDir = getFontsDir(context);
        if (context != null) {
            ensureFontsAsync(context);
        }

        // 2. Resolve authentic Google Font based on bgwh and target
        try {
            String fontName = null;
            int weight = 400;
            boolean isItalic = false;

            if (bgwh != null) {
                Field aField = bgwh.getClass().getField("a");
                fontName = (String) aField.get(bgwh);
                Field bField = bgwh.getClass().getField("b");
                weight = bField.getInt(bgwh);
                Field cField = bgwh.getClass().getField("c");
                isItalic = cField.getBoolean(bgwh);
            }

            final String fName = fontName;
            final int fWeight = weight;
            final boolean fItalic = isItalic;
            Logger.printInfo(() -> TAG + ": " + (isThumbFinal ? "Home Carousel THUMB" : "Story Skottie")
                    + " render detected -> font=" + fName + " weight=" + fWeight + " italic=" + fItalic);

            String targetFilename = null;
            if (fontName != null) {
                String lower = fontName.toLowerCase();
                if (lower.contains("google sans") || lower.contains("googlesans") || lower.contains("google-sans") || lower.contains("product sans")) {
                    if (lower.contains("display")) {
                        targetFilename = (weight >= 600) ? "Google_Sans_Display_Bold.ttf" : "Google_Sans_Display_Regular.ttf";
                    } else if (isThumbFinal || weight >= 600) {
                        targetFilename = "Google_Sans_Text-Bold.ttf";
                    } else if (weight >= 500) {
                        targetFilename = "Google_Sans_Text-Medium.ttf";
                    } else {
                        targetFilename = "Google_Sans_Text-Regular.ttf";
                    }
                } else {
                    // Check catalog
                    for (String[] entry : FONT_CATALOG) {
                        if (lower.contains(entry[0])) {
                            if ("italic".equals(entry[1]) && !isItalic) continue;
                            if ("regular".equals(entry[1]) && isItalic) continue;
                            targetFilename = entry[2];
                            break;
                        }
                    }
                    if (targetFilename == null && lower.contains("serif")) {
                        targetFilename = isItalic ? "DM_Serif_Display_Italic.ttf" : "DM_Serif_Display_Regular.ttf";
                    }
                }
            }

            if (targetFilename == null) {
                targetFilename = (isThumbFinal || weight >= 600) ? "Google_Sans_Text-Bold.ttf" : "Google_Sans_Text-Medium.ttf";
            }

            final String chosenFilename = targetFilename;

            // Check disk cache first
            File fontFile = new File(fontsDir, chosenFilename);
            if (fontFile.exists() && fontFile.length() > 1000) {
                byte[] bytes = readFileBytes(fontFile);
                if (bytes != null && bytes.length > 0) {
                    Logger.printInfo(() -> TAG + ": Supplying authentic " + fontFile.getName() + " from disk (" + bytes.length + " bytes)");
                    return bytes;
                }
            }

            // Check bundled assets
            if (context != null) {
                byte[] assetBytes = readAssetBytes(context, "fonts/" + chosenFilename);
                if (assetBytes != null && assetBytes.length > 1000) {
                    ensureBundledFont(context, fontsDir, chosenFilename);
                    Logger.printInfo(() -> TAG + ": Supplying authentic " + chosenFilename + " from assets (" + assetBytes.length + " bytes)");
                    return assetBytes;
                }
            }

            // Fallback to bundled bold or medium
            File boldFile = new File(fontsDir, "Google_Sans_Text-Bold.ttf");
            if (boldFile.exists() && boldFile.length() > 1000) {
                return readFileBytes(boldFile);
            }
            if (context != null) {
                byte[] fallbackAsset = readAssetBytes(context, "fonts/Google_Sans_Text-Bold.ttf");
                if (fallbackAsset != null && fallbackAsset.length > 1000) {
                    return fallbackAsset;
                }
            }
        } catch (Throwable t) {
            Logger.printInfo(() -> TAG + ": resolveFontBytesForTarget error: " + t.getMessage());
        }

        return null;
    }

    private static byte[] readAssetBytes(Context context, String assetPath) {
        if (context == null || assetPath == null) return null;
        try (InputStream is = context.getAssets().open(assetPath)) {
            return readStreamBytes(is);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /**
     * Intercepts AndroidX ResourcesCompat.loadFont / getFont calls for Google Sans font resources.
     * Returns an authentic Google Sans Typeface or null to proceed with original logic.
     */
    public static Typeface resolveFontResource(Context context, int resId, int style, Object fontCallback) {
        if (context == null || resId == 0) return null;
        try {
            String entryName = context.getResources().getResourceEntryName(resId);
            String typeName = context.getResources().getResourceTypeName(resId);
            if (!"font".equals(typeName)) return null;

            String lower = entryName.toLowerCase();
            String targetFilename = resolveFilenameFromQuery(lower, style);

            if (targetFilename != null) {
                Typeface tf = getOrLoadTypeface(context, targetFilename);
                if (tf != null) {
                    if (fontCallback != null) {
                        notifyFontCallback(fontCallback, tf);
                    }
                    Logger.printInfo(() -> TAG + ": resolveFontResource matched " + targetFilename + " for resId " + entryName);
                    return tf;
                }
            }
        } catch (Throwable t) {
            Logger.printInfo(() -> TAG + ": resolveFontResource error: " + t.getMessage());
        }
        return null;
    }

    /**
     * Intercepts FontsContractCompat.requestFont (Lesc;->l) for Google Sans requests from Jetpack Compose and AndroidX.
     * Satisfies the request synchronously and notifies the callback / handler with authentic Google Sans Typeface,
     * preventing GMS Fonts provider failure and fallback to system Roboto.
     */
    public static Typeface resolveFontRequest(
            Context context,
            List<?> fontRequests,
            int style,
            boolean isBlocking,
            int timeout,
            Handler handler,
            Object callback
    ) {
        if (fontRequests == null || fontRequests.isEmpty()) return null;
        try {
            for (Object req : fontRequests) {
                if (req == null) continue;
                String query = extractQuery(req);
                if (query == null) continue;
                String lower = query.toLowerCase();
                if (lower.contains("google sans") || lower.contains("googlesans") || lower.contains("google-sans")) {
                    String targetFilename = resolveFilenameFromQuery(lower, style);
                    Typeface tf = getOrLoadTypeface(context, targetFilename);
                    if (tf != null) {
                        if (callback != null) {
                            notifyCallback(callback, handler, tf);
                        }
                        Logger.printInfo(() -> TAG + ": resolveFontRequest satisfied with " + targetFilename + " for query: " + query);
                        return tf;
                    }
                }
            }
        } catch (Throwable t) {
            Logger.printInfo(() -> TAG + ": resolveFontRequest error: " + t.getMessage());
        }
        return null;
    }

    /**
     * Resolves Typeface.create(String familyName, int style).
     * Only intercepts explicit Google Sans requests; preserves native system fonts for sans-serif, Roboto, etc.
     */
    public static Typeface resolveTypeface(String familyName, int style) {
        if (familyName != null) {
            String lower = familyName.toLowerCase();

            // Explicit Google Sans / Product Sans only
            if (lower.contains("google-sans") || lower.contains("google sans") || lower.contains("googlesans") || lower.contains("product sans")) {
                String targetFilename = resolveFilenameFromQuery(lower, style);
                Typeface tf = getOrLoadTypeface(null, targetFilename);
                if (tf != null) {
                    Logger.printInfo(() -> TAG + ": resolveTypeface returned " + targetFilename + " for family: " + familyName);
                    return tf;
                }
            }
        }
        try {
            return Typeface.create(familyName, style);
        } catch (Throwable t) {
            return null;
        }
    }

    /**
     * Resolves Typeface.create(Typeface family, int style).
     * Preserves native system fonts.
     */
    public static Typeface resolveTypeface(Typeface family, int style) {
        try {
            return Typeface.create(family, style);
        } catch (Throwable t) {
            return family;
        }
    }

    public static String resolveFilenameFromQuery(String queryLower, int style) {
        if (queryLower == null) return "Google_Sans_Text-Medium.ttf";

        if (queryLower.contains("display")) {
            if (queryLower.contains("bold") || queryLower.contains("700") || queryLower.contains("800") || queryLower.contains("900") || style == 1 || style == 3) {
                return "Google_Sans_Display_Bold.ttf";
            }
            return "Google_Sans_Display_Regular.ttf";
        }

        // Bold variants -> Google_Sans_Text-Bold.ttf (Authentic thick bold weight)
        if (queryLower.contains("bold") || queryLower.contains("weight=700") || queryLower.contains("weight=800") || queryLower.contains("weight=900") || queryLower.contains(":700") || queryLower.contains(":800") || style == 1 || style == 3) {
            return "Google_Sans_Text-Bold.ttf";
        }

        // Medium variants -> Google_Sans_Text-Medium.ttf
        if (queryLower.contains("medium") || queryLower.contains("weight=500") || queryLower.contains("weight=600") || queryLower.contains(":500") || queryLower.contains(":600")) {
            return "Google_Sans_Text-Medium.ttf";
        }

        // Story headlines and titles: default to thick Text Bold
        if (queryLower.contains("google_sans") || queryLower.contains("google-sans") || queryLower.contains("googlesans")) {
            if (!queryLower.contains("regular")) {
                return "Google_Sans_Text-Bold.ttf";
            }
        }

        return "Google_Sans_Text-Regular.ttf";
    }

    private static String extractQuery(Object req) {
        if (req == null) return null;
        try {
            Field cField = req.getClass().getField("c");
            Object val = cField.get(req);
            if (val instanceof String) return (String) val;
        } catch (Throwable ignored) {}
        try {
            Field fField = req.getClass().getField("f");
            Object val = fField.get(req);
            if (val instanceof String) return (String) val;
        } catch (Throwable ignored) {}
        try {
            for (Field f : req.getClass().getDeclaredFields()) {
                if (f.getType().equals(String.class)) {
                    f.setAccessible(true);
                    String s = (String) f.get(req);
                    if (s != null && (s.contains("Google Sans") || s.contains("google-sans"))) {
                        return s;
                    }
                }
            }
        } catch (Throwable ignored) {}
        return req.toString();
    }

    private static Typeface getOrLoadTypeface(Context context, String filename) {
        Typeface cached = TYPEFACE_CACHE.get(filename);
        if (cached != null) return cached;

        File fontsDir = getFontsDir(context);
        File file = new File(fontsDir, filename);

        if (!file.exists() || file.length() < 1000) {
            ensureBundledFont(context, fontsDir, filename);
            ensureFontsAsync(context != null ? context : Utils.getContext());
            if (!file.exists() || file.length() < 1000) {
                File boldFile = new File(fontsDir, "Google_Sans_Text-Bold.ttf");
                if (boldFile.exists() && boldFile.length() > 1000) {
                    try {
                        Typeface fallbackTf = Typeface.createFromFile(boldFile);
                        if (fallbackTf != null) return fallbackTf;
                    } catch (Throwable ignored) {}
                }
                return null;
            }
        }

        try {
            Typeface tf = Typeface.createFromFile(file);
            if (tf != null) {
                TYPEFACE_CACHE.put(filename, tf);
                Logger.printInfo(() -> TAG + ": Loaded authentic Typeface for " + filename);
                return tf;
            }
        } catch (Throwable t) {
            Logger.printInfo(() -> TAG + ": Failed to create Typeface from " + file.getAbsolutePath() + ": " + t.getMessage());
        }
        return null;
    }

    private static void notifyFontCallback(Object fontCallback, Typeface typeface) {
        if (fontCallback == null || typeface == null) return;
        try {
            for (Class<?> clz = fontCallback.getClass(); clz != null && clz != Object.class; clz = clz.getSuperclass()) {
                for (Method m : clz.getDeclaredMethods()) {
                    Class<?>[] params = m.getParameterTypes();
                    if (params.length == 1 && params[0].equals(Typeface.class)) {
                        m.setAccessible(true);
                        m.invoke(fontCallback, typeface);
                        Logger.printInfo(() -> TAG + ": Successfully notified FontCallback");
                        return;
                    }
                }
            }
        } catch (Throwable t) {
            Logger.printInfo(() -> TAG + ": notifyFontCallback error: " + t.getMessage());
        }
    }

    public static void notifyCallback(Object callback, Handler handler, Typeface typeface) {
        if (callback == null || typeface == null) return;
        Runnable task = () -> {
            try {
                for (Class<?> clz = callback.getClass(); clz != null && clz != Object.class; clz = clz.getSuperclass()) {
                    for (Method m : clz.getDeclaredMethods()) {
                        Class<?>[] params = m.getParameterTypes();
                        if (params.length == 1 && params[0].equals(Typeface.class)) {
                            m.setAccessible(true);
                            m.invoke(callback, typeface);
                            Logger.printInfo(() -> TAG + ": Successfully notified callback " + callback.getClass().getSimpleName());
                            return;
                        }
                    }
                }
            } catch (Throwable t) {
                Logger.printInfo(() -> TAG + ": notifyCallback error: " + t.getMessage());
            }
        };
        if (handler != null) {
            handler.post(task);
        } else {
            task.run();
        }
    }

    /**
     * Resolves a font query string from Google Photos DEX to a valid local file Uri.
     * Guaranteed never to return null.
     */
    public static Uri resolveFontUri(String query) {
        Context context = Utils.getContext();
        if (context == null) {
            context = Utils.getActivity();
        }

        if (context == null) {
            Logger.printInfo(() -> TAG + ": No context available, falling back to system font for: " + query);
            return fallbackForQuery(query);
        }

        ensureFontsAsync(context);

        File fontsDir = getFontsDir(context);
        if (query == null || query.isEmpty()) {
            return Uri.parse(SYSTEM_FALLBACK_ROBOTO);
        }

        String lower = query.toLowerCase();
        boolean isItalic = lower.contains("italic") || lower.contains("italic=1") || lower.contains("i=1");
        boolean isSerif = lower.contains("serif");

        // 1. Google Sans / Product Sans
        if (lower.contains("google sans") || lower.contains("googlesans") || lower.contains("product sans")) {
            String gsFilename = resolveFilenameFromQuery(lower, 0);

            File gsFile = new File(fontsDir, gsFilename);
            if (!gsFile.exists() || gsFile.length() < 1000) {
                ensureBundledFont(context, fontsDir, gsFilename);
            }
            if (gsFile.exists() && gsFile.length() > 1000) {
                Logger.printInfo(() -> TAG + ": Story Skottie resolved: " + gsFilename);
                return Uri.fromFile(gsFile);
            }

            File boldFile = new File(fontsDir, "Google_Sans_Text-Bold.ttf");
            if (!boldFile.exists() || boldFile.length() < 1000) {
                ensureBundledFont(context, fontsDir, "Google_Sans_Text-Bold.ttf");
            }
            if (boldFile.exists() && boldFile.length() > 1000) {
                Logger.printInfo(() -> TAG + ": Story Skottie fallback to Google_Sans_Text-Bold.ttf");
                return Uri.fromFile(boldFile);
            }

            File medFile = new File(fontsDir, "Google_Sans_Text-Medium.ttf");
            if (!medFile.exists() || medFile.length() < 1000) {
                ensureBundledFont(context, fontsDir, "Google_Sans_Text-Medium.ttf");
            }
            if (medFile.exists() && medFile.length() > 1000) {
                return Uri.fromFile(medFile);
            }

            return Uri.parse(SYSTEM_FALLBACK_ROBOTO);
        }

        // 2. Specific matching against catalog
        for (String[] entry : FONT_CATALOG) {
            String key = entry[0];
            String style = entry[1];
            String filename = entry[2];
            String url = entry[3];

            if (lower.contains(key)) {
                if ("italic".equals(style) && !isItalic) continue;
                if ("regular".equals(style) && isItalic) continue;

                File fontFile = new File(fontsDir, filename);
                if (fontFile.exists() && fontFile.length() > 1000) {
                    Logger.printDebug(() -> TAG + ": Matched cached Google Font: " + fontFile.getAbsolutePath() + " for query: " + query);
                    return Uri.fromFile(fontFile);
                }

                // Trigger background download
                downloadFontAsync(fontFile, url);
                return isSerif ? Uri.parse(SYSTEM_FALLBACK_NOTO_SERIF) : Uri.parse(SYSTEM_FALLBACK_ROBOTO);
            }
        }

        // 3. Fallback matching for generic Serif
        if (isSerif) {
            String targetName = isItalic ? "DM_Serif_Display_Italic.ttf" : "DM_Serif_Display_Regular.ttf";
            File dmSerif = new File(fontsDir, targetName);
            if (dmSerif.exists() && dmSerif.length() > 1000) {
                return Uri.fromFile(dmSerif);
            }
            return Uri.parse(SYSTEM_FALLBACK_NOTO_SERIF);
        }

        return Uri.parse(SYSTEM_FALLBACK_ROBOTO);
    }

    /**
     * Reads font bytes from the given URI.
     */
    public static byte[] readFontBytes(Uri uri) {
        if (uri != null) {
            String scheme = uri.getScheme();
            if ("file".equalsIgnoreCase(scheme)) {
                String path = uri.getPath();
                if (path != null) {
                    File file = new File(path);
                    if (file.exists() && file.length() > 0) {
                        byte[] data = readFileBytes(file);
                        if (data != null && data.length > 0) {
                            return data;
                        }
                    }
                }
            } else if ("content".equalsIgnoreCase(scheme)) {
                Context context = Utils.getContext();
                if (context != null) {
                    try (InputStream is = context.getContentResolver().openInputStream(uri)) {
                        if (is != null) {
                            byte[] data = readStreamBytes(is);
                            if (data != null && data.length > 0) {
                                return data;
                            }
                        }
                    } catch (Throwable ignored) {}
                }
            }
        }

        // System fallback
        File fallbackFile = new File("/system/fonts/Roboto-Regular.ttf");
        byte[] fallbackBytes = readFileBytes(fallbackFile);
        return fallbackBytes != null ? fallbackBytes : new byte[0];
    }

    /**
     * Pre-seeds all story fonts in the background.
     */
    public static void ensureFontsAsync(Context context) {
        if (context == null || isBackgroundSeedingStarted) return;
        isBackgroundSeedingStarted = true;

        new Thread(() -> {
            try {
                File fontsDir = getFontsDir(context);
                if (!fontsDir.exists()) fontsDir.mkdirs();

                ensureGoogleSans(context, fontsDir);

                for (String[] entry : FONT_CATALOG) {
                    String filename = entry[2];
                    String url = entry[3];
                    File dest = new File(fontsDir, filename);
                    if (!dest.exists() || dest.length() < 1000) {
                        CdnAssetDownloader.download(url, dest);
                    }
                }
            } catch (Throwable t) {
                Logger.printInfo(() -> TAG + ": ensureFontsAsync failed: " + t.getMessage());
            }
        }, "StoryFontPreloader").start();
    }

    private static void ensureGoogleSans(Context context, File fontsDir) {
        ensureBundledFont(context, fontsDir, "Google_Sans_Text-Bold.ttf");
        ensureBundledFont(context, fontsDir, "Google_Sans_Text-Medium.ttf");
        ensureBundledFont(context, fontsDir, "Google_Sans_Text-Regular.ttf");
    }

    private static void ensureBundledFont(Context context, File fontsDir, String filename) {
        if (context == null) context = Utils.getContext();
        if (context == null) context = Utils.getActivity();
        if (context == null || filename == null) return;

        File dest = new File(fontsDir, filename);
        if (dest.exists() && dest.length() > 1000) return;

        try (InputStream is = context.getAssets().open("fonts/" + filename);
             FileOutputStream fos = new FileOutputStream(dest)) {
            byte[] buf = new byte[8192];
            int len;
            while ((len = is.read(buf)) != -1) {
                fos.write(buf, 0, len);
            }
            dest.setReadable(true, false);
            Logger.printInfo(() -> TAG + ": Extracted bundled font from assets: " + filename + " (" + dest.length() + " bytes)");
        } catch (Throwable ignored) {}
    }

    private static void downloadFontAsync(File dest, String url) {
        if (dest == null || url == null) return;
        new Thread(() -> {
            Logger.printInfo(() -> TAG + ": Downloading font on demand: " + dest.getName() + " from " + url);
            CdnAssetDownloader.download(url, dest);
        }, "FontDownloader-" + dest.getName()).start();
    }

    private static File getFontsDir(Context context) {
        if (context == null) {
            context = Utils.getContext();
            if (context == null) context = Utils.getActivity();
        }
        if (context != null) {
            File dir = new File(context.getFilesDir(), FONTS_SUBDIR);
            if (!dir.exists()) dir.mkdirs();
            return dir;
        }
        File fallbackDir = new File("/data/data/app.morphe.android.apps.photos/files/fonts");
        if (fallbackDir.exists()) return fallbackDir;
        return new File("/data/data/com.google.android.apps.photos/files/fonts");
    }

    private static Uri fallbackForQuery(String query) {
        if (query != null && query.toLowerCase().contains("serif")) {
            return Uri.parse(SYSTEM_FALLBACK_NOTO_SERIF);
        }
        return Uri.parse(SYSTEM_FALLBACK_ROBOTO);
    }

    private static byte[] readFileBytes(File file) {
        if (file == null || !file.exists() || !file.canRead()) return null;
        try (FileInputStream fis = new FileInputStream(file)) {
            return readStreamBytes(fis);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static byte[] readStreamBytes(InputStream is) {
        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            byte[] buf = new byte[8192];
            int len;
            while ((len = is.read(buf)) != -1) {
                baos.write(buf, 0, len);
            }
            return baos.toByteArray();
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static boolean copyFile(File src, File dest) {
        try (FileInputStream fis = new FileInputStream(src);
             FileOutputStream fos = new FileOutputStream(dest)) {
            byte[] buf = new byte[8192];
            int len;
            while ((len = fis.read(buf)) != -1) {
                fos.write(buf, 0, len);
            }
            dest.setReadable(true, false);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }
}
