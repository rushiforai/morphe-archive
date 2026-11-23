package app.voidhack.extension.applemusic.font;

import android.app.Activity;
import android.content.Context;
import android.graphics.Typeface;
import android.graphics.fonts.Font;
import android.graphics.fonts.FontFamily;
import android.graphics.fonts.FontStyle;
import android.graphics.fonts.FontVariationAxis;
import android.os.Build;
import android.util.Log;
import android.widget.TextView;

import java.io.File;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

public final class FontController {
    private static final String TAG = "AppleMusicFont";

    private static final String[] LYRICS_VIEW_ID_NAMES = {
            "song_lyrics_line",
            "song_lyrics_word",
            "song_lyrics_bg_word",
            "lyrics_translation_line",
            "pronunciation_word",
            "pronunciation_bg_word",
            "mixed_rtl_ltr_lyrics",
            "mixed_rtl_ltr_pronunciation",
            "dst_song_lyrics_line",
            "writers_credits_line",
            "no_lyrics_available_message",
            "lyrics_error_text"
    };

    private static final ThreadLocal<Boolean> IN_LYRICS_VIEW = new ThreadLocal<>();
    private static final Map<String, Typeface> TYPEFACE_CACHE = new ConcurrentHashMap<>();
    private static final Map<FontPrefs.FontSlot, FontInspector.FontInfo> SLOT_INFO_CACHE = new ConcurrentHashMap<>();

    private static volatile long cachedVersion = -1L;
    private static volatile Set<Integer> lyricsViewIds;
    private static volatile WeakReference<Activity> settingsOwner = new WeakReference<>(null);

    private FontController() {}

    static void invalidateCache() {
        TYPEFACE_CACHE.clear();
        SLOT_INFO_CACHE.clear();
        cachedVersion = -1L;
    }

    static FontInspector.FontInfo getSlotInfo(Context ctx, FontPrefs.FontSlot slot) {
        if (ctx == null || slot == null) return FontInspector.FontInfo.invalid();
        syncCacheVersion(ctx);
        FontInspector.FontInfo cached = SLOT_INFO_CACHE.get(slot);
        if (cached != null) return cached;
        File f = FontPrefs.slotFile(ctx, slot);
        FontInspector.FontInfo info = f.isFile() ? FontInspector.inspect(f) : FontInspector.FontInfo.invalid();
        SLOT_INFO_CACHE.put(slot, info);
        return info;
    }

    // -------------------------------------------------------------------------
    // Hook 1: TextView apply scope tracking (m1.q)
    // -------------------------------------------------------------------------

    public static void enterTextView(TextView view) {
        if (view == null) {
            IN_LYRICS_VIEW.set(Boolean.FALSE);
            return;
        }
        IN_LYRICS_VIEW.set(isLyricsTextView(view) ? Boolean.TRUE : Boolean.FALSE);
    }

    public static void exitTextView() {
        IN_LYRICS_VIEW.remove();
    }

    private static boolean isLyricsTextView(TextView view) {
        int id = view.getId();
        if (id == -1 || id == 0) return false;
        Set<Integer> ids = lyricsViewIds;
        if (ids == null) {
            ids = resolveLyricsViewIds(view.getContext());
            lyricsViewIds = ids;
        }
        return ids.contains(id);
    }

    private static Set<Integer> resolveLyricsViewIds(Context ctx) {
        Set<Integer> set = new HashSet<>();
        if (ctx == null) return set;
        for (String name : LYRICS_VIEW_ID_NAMES) {
            int resId = FontStrings.id(ctx, "id", name);
            if (resId != 0) set.add(resId);
        }
        return set;
    }

    // -------------------------------------------------------------------------
    // Hook 2: Typeface replacement (m1.B)
    // -------------------------------------------------------------------------

    public static Typeface resolveTypeface(Context ctx, Typeface nativeTypeface) {
        if (ctx == null) return nativeTypeface;
        if (!FontPrefs.isEnabled(ctx)) return nativeTypeface;

        boolean isLyrics = Boolean.TRUE.equals(IN_LYRICS_VIEW.get());
        if (!appliesToScope(ctx, isLyrics)) {
            return nativeTypeface;
        }

        int requestedWeight = 400;
        boolean italic = false;
        if (nativeTypeface != null) {
            if (Build.VERSION.SDK_INT >= 28) {
                int w = nativeTypeface.getWeight();
                if (w > 0) requestedWeight = w;
            }
            italic = nativeTypeface.isItalic();
        }

        Typeface custom = buildCachedTypeface(ctx, requestedWeight, italic, isLyrics);
        return custom != null ? custom : nativeTypeface;
    }

    /**
     * Builds a preview Typeface for the Settings screen using current preferences
     * (even when the master enable toggle is still off).
     */
    static Typeface resolvePreviewTypeface(Context ctx, int weight, boolean isLyrics) {
        if (ctx == null) return Typeface.DEFAULT;
        if (!appliesToScope(ctx, isLyrics)) {
            return loadDefaultSfPro(ctx, weight);
        }
        Typeface custom = buildCachedTypeface(ctx, weight, false, isLyrics);
        return custom != null ? custom : loadDefaultSfPro(ctx, weight);
    }

    private static Typeface loadDefaultSfPro(Context ctx, int weight) {
        int resId = FontStrings.id(ctx, "font", weight >= 600 ? "semibold" : "regular");
        if (resId != 0) {
            try {
                return ctx.getResources().getFont(resId);
            } catch (RuntimeException ignored) {
            }
        }
        return weight >= 600 ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT;
    }

    // -------------------------------------------------------------------------
    // Hook 3: Letter spacing adjustment (m1.A)
    // -------------------------------------------------------------------------

    public static float adjustLetterSpacing(Context ctx, float nativeSpacing) {
        if (ctx == null || !FontPrefs.isEnabled(ctx)) return nativeSpacing;
        boolean isLyrics = Boolean.TRUE.equals(IN_LYRICS_VIEW.get());
        if (!appliesToScope(ctx, isLyrics)) return nativeSpacing;
        if (!FontPrefs.isDisableSfTracking(ctx)) return nativeSpacing;
        if (FontPrefs.isKeepSfProLatin(ctx)) return nativeSpacing;
        if (FontPrefs.getSource(ctx) == FontPrefs.FontSource.CUSTOM_FILE && !hasAnyUsableFile(ctx, isLyrics)) {
            return nativeSpacing;
        }
        return 0.0f;
    }

    private static boolean appliesToScope(Context ctx, boolean isLyrics) {
        FontPrefs.FontScope scope = FontPrefs.getScope(ctx);
        if (scope == FontPrefs.FontScope.LYRICS_ONLY) return isLyrics;
        if (scope == FontPrefs.FontScope.UI_ONLY) return !isLyrics;
        return true;
    }

    private static boolean hasAnyUsableFile(Context ctx, boolean isLyrics) {
        if (isLyrics && (FontPrefs.hasSlotFile(ctx, FontPrefs.FontSlot.LYRICS_REGULAR)
                || FontPrefs.hasSlotFile(ctx, FontPrefs.FontSlot.LYRICS_BOLD))) {
            return true;
        }
        return FontPrefs.hasSlotFile(ctx, FontPrefs.FontSlot.MAIN_REGULAR)
                || FontPrefs.hasSlotFile(ctx, FontPrefs.FontSlot.MAIN_BOLD);
    }

    private static void syncCacheVersion(Context ctx) {
        long ver = FontPrefs.getConfigVersion(ctx);
        if (ver != cachedVersion) {
            TYPEFACE_CACHE.clear();
            SLOT_INFO_CACHE.clear();
            cachedVersion = ver;
        }
    }

    private static Typeface buildCachedTypeface(Context ctx, int requestedWeight, boolean italic, boolean isLyrics) {
        syncCacheVersion(ctx);
        int weight = FontInspector.effectiveWeight(requestedWeight, FontPrefs.getWeightOffset(ctx));
        String key = (isLyrics ? "L:" : "U:") + weight + ":" + (italic ? "I" : "N");
        Typeface cached = TYPEFACE_CACHE.get(key);
        if (cached != null) return cached;

        Typeface built = buildTypefaceUncached(ctx, weight, italic, isLyrics);
        if (built != null) {
            TYPEFACE_CACHE.put(key, built);
        }
        return built;
    }

    private static Typeface buildTypefaceUncached(Context ctx, int weight, boolean italic, boolean isLyrics) {
        FontPrefs.FontSource source = FontPrefs.getSource(ctx);
        boolean keepSfLatin = FontPrefs.isKeepSfProLatin(ctx);

        if (source != FontPrefs.FontSource.CUSTOM_FILE) {
            return buildSystemTypeface(ctx, source, weight, italic, keepSfLatin);
        }

        // Resolve Regular + Bold slots (prefer dedicated lyrics slots when in lyrics scope).
        FontPrefs.FontSlot regSlot = FontPrefs.FontSlot.MAIN_REGULAR;
        FontPrefs.FontSlot boldSlot = FontPrefs.FontSlot.MAIN_BOLD;
        if (isLyrics && FontPrefs.hasSlotFile(ctx, FontPrefs.FontSlot.LYRICS_REGULAR)) {
            regSlot = FontPrefs.FontSlot.LYRICS_REGULAR;
            boldSlot = FontPrefs.hasSlotFile(ctx, FontPrefs.FontSlot.LYRICS_BOLD)
                    ? FontPrefs.FontSlot.LYRICS_BOLD
                    : FontPrefs.FontSlot.MAIN_BOLD;
        } else if (isLyrics && FontPrefs.hasSlotFile(ctx, FontPrefs.FontSlot.LYRICS_BOLD)) {
            boldSlot = FontPrefs.FontSlot.LYRICS_BOLD;
        }

        boolean hasReg = FontPrefs.hasSlotFile(ctx, regSlot);
        boolean hasBold = FontPrefs.hasSlotFile(ctx, boldSlot);
        if (!hasReg && !hasBold) {
            return null;
        }

        if (Build.VERSION.SDK_INT >= 29) {
            Typeface tf = buildApi29CustomTypeface(ctx, regSlot, boldSlot, hasReg, hasBold, weight, italic, keepSfLatin);
            if (tf != null) return tf;
        }

        // Legacy fallback (< API 29)
        try {
            File target = (FontInspector.shouldUseBoldSlot(weight, hasBold) || !hasReg)
                    ? FontPrefs.slotFile(ctx, boldSlot)
                    : FontPrefs.slotFile(ctx, regSlot);
            Typeface base = Typeface.createFromFile(target);
            if (Build.VERSION.SDK_INT >= 28) {
                return Typeface.create(base, weight, italic);
            }
            int style = (weight >= 600 ? Typeface.BOLD : Typeface.NORMAL) | (italic ? Typeface.ITALIC : 0);
            return Typeface.create(base, style);
        } catch (RuntimeException e) {
            Log.w(TAG, "Failed creating legacy custom Typeface", e);
            return null;
        }
    }

    private static Typeface buildSystemTypeface(
            Context ctx,
            FontPrefs.FontSource source,
            int weight,
            boolean italic,
            boolean keepSfLatin) {
        String familyName;
        Typeface fallbackBase;
        switch (source) {
            case SYSTEM_SERIF:
                familyName = "serif";
                fallbackBase = Typeface.SERIF;
                break;
            case SYSTEM_MONOSPACE:
                familyName = "monospace";
                fallbackBase = Typeface.MONOSPACE;
                break;
            case SYSTEM_SANS:
            default:
                familyName = "sans-serif";
                fallbackBase = Typeface.SANS_SERIF;
                break;
        }

        if (keepSfLatin && Build.VERSION.SDK_INT >= 29) {
            FontFamily sfFamily = buildSfProFamily(ctx, weight);
            if (sfFamily != null) {
                try {
                    return new Typeface.CustomFallbackBuilder(sfFamily)
                            .setSystemFallback(familyName)
                            .setStyle(new FontStyle(weight, italic ? FontStyle.FONT_SLANT_ITALIC : FontStyle.FONT_SLANT_UPRIGHT))
                            .build();
                } catch (RuntimeException e) {
                    Log.w(TAG, "Failed building SF Pro + system fallback Typeface", e);
                }
            }
        }

        if (Build.VERSION.SDK_INT >= 28) {
            return Typeface.create(fallbackBase, weight, italic);
        }
        int style = (weight >= 600 ? Typeface.BOLD : Typeface.NORMAL) | (italic ? Typeface.ITALIC : 0);
        return Typeface.create(fallbackBase, style);
    }

    private static Typeface buildApi29CustomTypeface(
            Context ctx,
            FontPrefs.FontSlot regSlot,
            FontPrefs.FontSlot boldSlot,
            boolean hasReg,
            boolean hasBold,
            int weight,
            boolean italic,
            boolean keepSfLatin) {
        try {
            FontFamily customFamily = buildCustomFontFamily(ctx, regSlot, boldSlot, hasReg, hasBold, weight);
            if (customFamily == null) return null;

            FontFamily sfFamily = buildSfProFamily(ctx, weight);
            int slant = italic ? FontStyle.FONT_SLANT_ITALIC : FontStyle.FONT_SLANT_UPRIGHT;
            FontStyle style = new FontStyle(weight, slant);

            Typeface.CustomFallbackBuilder builder;
            if (keepSfLatin && sfFamily != null) {
                // SF Pro handles Latin/digits; custom font handles Japanese/CJK and other scripts.
                builder = new Typeface.CustomFallbackBuilder(sfFamily);
                builder.addCustomFallback(customFamily);
            } else {
                // Custom font handles everything; SF Pro acts as symbol/glyph safety fallback.
                builder = new Typeface.CustomFallbackBuilder(customFamily);
                if (sfFamily != null) {
                    builder.addCustomFallback(sfFamily);
                }
            }
            builder.setSystemFallback("sans-serif");
            return builder.setStyle(style).build();
        } catch (Throwable t) {
            Log.w(TAG, "Failed building API 29+ custom Typeface", t);
            return null;
        }
    }

    private static FontFamily buildCustomFontFamily(
            Context ctx,
            FontPrefs.FontSlot regSlot,
            FontPrefs.FontSlot boldSlot,
            boolean hasReg,
            boolean hasBold,
            int targetWeight) throws IOException {
        List<Font> fonts = new ArrayList<>();

        if (hasReg) {
            File regFile = FontPrefs.slotFile(ctx, regSlot);
            FontInspector.FontInfo info = getSlotInfo(ctx, regSlot);
            appendFontsFromFile(fonts, regFile, info, targetWeight, 400);
        }
        if (hasBold) {
            File boldFile = FontPrefs.slotFile(ctx, boldSlot);
            FontInspector.FontInfo info = getSlotInfo(ctx, boldSlot);
            appendFontsFromFile(fonts, boldFile, info, targetWeight, 700);
        }

        if (fonts.isEmpty()) return null;
        FontFamily.Builder familyBuilder = new FontFamily.Builder(fonts.get(0));
        for (int i = 1; i < fonts.size(); i++) {
            try {
                familyBuilder.addFont(fonts.get(i));
            } catch (IllegalArgumentException ignored) {
                // Ignore duplicate (weight, slant) entries inside a FontFamily.
            }
        }
        return familyBuilder.build();
    }

    private static void appendFontsFromFile(
            List<Font> out,
            File file,
            FontInspector.FontInfo info,
            int targetWeight,
            int fallbackWeight) throws IOException {
        if (info != null && info.valid && info.isCollection && info.faces.size() > 1) {
            // Multi-face .ttc collection (e.g., Hiragino Sans): add all unique upright faces.
            Set<Integer> seenWeights = new HashSet<>();
            for (FontInspector.FaceInfo face : info.faces) {
                if (face.italic) continue;
                int w = FontInspector.clamp(face.weight, 100, 900);
                if (!seenWeights.add(w)) continue;
                Font.Builder fb = new Font.Builder(file)
                        .setTtcIndex(face.ttcIndex)
                        .setWeight(w)
                        .setSlant(FontStyle.FONT_SLANT_UPRIGHT);
                if (face.hasWghtAxis) {
                    int vw = FontInspector.clampVariableWeight(targetWeight, face);
                    fb.setFontVariationSettings(new FontVariationAxis[]{new FontVariationAxis("wght", vw)});
                    fb.setWeight(vw);
                }
                out.add(fb.build());
            }
            if (!out.isEmpty()) return;
        }

        FontInspector.FaceInfo primary = info != null ? info.primaryFace() : null;
        Font.Builder fb = new Font.Builder(file);
        if (primary != null && primary.ttcIndex > 0) {
            fb.setTtcIndex(primary.ttcIndex);
        }
        if (primary != null && primary.hasWghtAxis) {
            int vw = FontInspector.clampVariableWeight(targetWeight, primary);
            fb.setFontVariationSettings(new FontVariationAxis[]{new FontVariationAxis("wght", vw)});
            fb.setWeight(vw);
        } else {
            int staticWeight = (primary != null && primary.weight > 0) ? primary.weight : fallbackWeight;
            // If user explicitly picked a file for Bold slot whose OS/2 weight is 400, still register it as 700.
            if (fallbackWeight >= 700 && staticWeight < 600) {
                staticWeight = 700;
            }
            fb.setWeight(FontInspector.clamp(staticWeight, 100, 900));
        }
        fb.setSlant(FontStyle.FONT_SLANT_UPRIGHT);
        out.add(fb.build());
    }

    private static FontFamily buildSfProFamily(Context ctx, int weight) {
        int sfResId = FontStrings.id(ctx, "font", "sf_pro_android_ui");
        if (sfResId == 0) return null;
        try {
            Font sfFont = new Font.Builder(ctx.getResources(), sfResId)
                    .setWeight(weight)
                    .setSlant(FontStyle.FONT_SLANT_UPRIGHT)
                    .setFontVariationSettings(new FontVariationAxis[]{new FontVariationAxis("wght", weight)})
                    .build();
            return new FontFamily.Builder(sfFont).build();
        } catch (IOException | RuntimeException e) {
            return null;
        }
    }

    // -------------------------------------------------------------------------
    // Hook 4: Apple Music Settings integration
    // -------------------------------------------------------------------------

    public static void attachSettings(Object fragment) {
        if (fragment == null) return;
        try {
            Method m = fragment.getClass().getMethod("getActivity");
            Object act = m.invoke(fragment);
            if (act instanceof Activity) {
                settingsOwner = new WeakReference<>((Activity) act);
            }
        } catch (Throwable ignored) {
        }
    }

    public static List<?> withSettings(List<?> items) {
        Activity act = settingsOwner.get();
        if (act == null || act.isFinishing()) return items;
        try {
            final WeakReference<Activity> ref = settingsOwner;
            Object category = createSettingsCategory(
                    FontStrings.text(act, "settings_category"),
                    FontStrings.text(act, "settings_entry"),
                    () -> {
                        Activity current = ref.get();
                        if (current != null && !current.isFinishing()) {
                            FontUi.openSettings(current);
                        }
                    }
            );
            List<Object> result = new ArrayList<>(items);
            result.add(Math.min(1, result.size()), category);
            return result;
        } catch (Throwable t) {
            Log.w(TAG, "Could not add Custom Font settings category", t);
            return items;
        }
    }

    private static Object createSettingsCategory(String categoryTitle, String entryTitle, Runnable onClick)
            throws ReflectiveOperationException {
        Class<?> actionClass = Class.forName("com.apple.android.music.settings2.model.b$b$b");
        Class<?> categoryClass = Class.forName("com.apple.android.music.settings2.model.b$a");

        Constructor<?> actionCtor = null;
        Class<?> function0Interface = null;
        for (Constructor<?> ctor : actionClass.getDeclaredConstructors()) {
            Class<?>[] params = ctor.getParameterTypes();
            if (params.length == 7
                    && params[0] == String.class
                    && params[2] == boolean.class
                    && params[5].isInterface()
                    && params[6] == int.class) {
                actionCtor = ctor;
                function0Interface = params[5];
                break;
            }
        }
        if (actionCtor == null || function0Interface == null) {
            throw new NoSuchMethodException("Could not locate settings2 action constructor");
        }
        actionCtor.setAccessible(true);

        Object unitInstance = getKotlinUnitInstance();
        Object callback = Proxy.newProxyInstance(
                function0Interface.getClassLoader(),
                new Class<?>[]{function0Interface},
                (proxy, method, args) -> {
                    if (method.getDeclaringClass() == Object.class) {
                        if ("toString".equals(method.getName())) return "CustomFontSettingsAction";
                        if ("hashCode".equals(method.getName())) return System.identityHashCode(proxy);
                        if ("equals".equals(method.getName())) return proxy == (args != null && args.length > 0 ? args[0] : null);
                    }
                    onClick.run();
                    return unitInstance;
                }
        );

        Object actionItem = actionCtor.newInstance(entryTitle, null, false, null, null, callback, 382);

        Constructor<?> categoryCtor = null;
        for (Constructor<?> ctor : categoryClass.getDeclaredConstructors()) {
            Class<?>[] params = ctor.getParameterTypes();
            if (params.length == 4
                    && params[0] == String.class
                    && List.class.isAssignableFrom(params[1])
                    && params[3] == int.class) {
                categoryCtor = ctor;
                break;
            }
        }
        if (categoryCtor == null) {
            throw new NoSuchMethodException("Could not locate settings2 category constructor");
        }
        categoryCtor.setAccessible(true);
        return categoryCtor.newInstance(categoryTitle, Collections.singletonList(actionItem), null, 58);
    }

    private static Object getKotlinUnitInstance() throws ReflectiveOperationException {
        Class<?> unitClass = Class.forName("kotlin.Unit");
        for (Field f : unitClass.getDeclaredFields()) {
            if (Modifier.isStatic(f.getModifiers()) && f.getType() == unitClass) {
                f.setAccessible(true);
                Object val = f.get(null);
                if (val != null) return val;
            }
        }
        throw new NoSuchFieldException("kotlin.Unit singleton not found");
    }
}
