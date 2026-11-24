package software.santodan.extension.nuviomenu;

import software.santodan.nuvio.NuvioNative;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Arrays;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/** Native TV settings and reflection-only Compose rendering shared by every date-label patch. */
public final class NuvioDateLabelStyle {
    private static final String PREFS = "santodan_nuvio_date_label_style";
    public static final long CUSTOM_SWATCH = 0xffb75aff00000000L;
    private static final ThreadLocal<Long> RENDERING_SWATCH = new ThreadLocal<>();
    private static final java.util.List<String[]> PREVIEW_MOVIES = new java.util.ArrayList<>();
    private static volatile String[] previewMovie;
    private static volatile Object nativeOpacity;
    private static final Map<String, Object> STATES = new ConcurrentHashMap<>();
    private NuvioDateLabelStyle() {}

    public static void renderSettings(Object composer, String ignored, String title) throws Exception {
        String scope = PREFS;
        ClassLoader loader = composer.getClass().getClassLoader();
        Object dialog = state(loader, scope + ":dialog", -1);
        subscribe(loader, scope);
        Object open = callback(loader, "Function0", args -> {
            for (int property : new int[]{2, 4}) {
                set(colorDraft(loader, property), color(scope, property));
                set(sizeDraft(loader, property), percent(scope, property - 1));
            }
            set(state(loader, scope + ":positionDraft", choice(scope, 0)), choice(scope, 0));
            set(state(loader, scope + ":positionDialog", false), false);
            previewMovie = randomPreviewMovie();
            Object revision = state(loader, scope + ":editorRevision", 0);
            set(revision, ((Number) get(revision)).intValue() + 1);
            set(dialog, 12);
            return unit(loader);
        });
        Object noop = callback(loader, "Function0", args -> unit(loader));
        invokeReference(loader, NuvioNative.REF_SETTINGS_ROWS_A,
            title, "Edit label and text color, opacity, size and position", null,
            open, null, noop, true, null, null, 0L, null, null, 0f, 0L, composer, 0, 0, 16336);
        int property = ((Number) get(dialog)).intValue();
        if (property != 12 && property != 14) return;
        // Recreate native remembered RGB state when changing the selected target or resetting.
        int revision = ((Number) get(state(loader, scope + ":editorRevision", 0))).intValue();
        method(composer.getClass(), "d0", 1).invoke(composer, 0x53444500 + property + revision * 31);
        try { renderCustomColorDialog(composer, scope, property - 10, dialog); }
        finally { method(composer.getClass(), "p", 1).invoke(composer, false); }
        if ((Boolean) get(state(loader, scope + ":positionDialog", false))) renderPositionDialog(composer);
    }

    private static void renderPositionDialog(Object composer) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        Object position = state(loader, PREFS + ":positionDraft", choice(PREFS, 0));
        Object visible = state(loader, PREFS + ":positionDialog", false);
        java.util.ArrayList<Object> options = new java.util.ArrayList<>();
        java.lang.reflect.Constructor<?> option = Arrays.stream(Class.forName(NuvioNative.SETTINGS_PICKER_NAME, false, loader)
            .getDeclaredConstructors()).filter(value -> value.getParameterCount() == 6).findFirst().orElseThrow();
        option.setAccessible(true);
        for (String value : DateLabelStyle.POSITIONS) options.add(option.newInstance(value, value, null, null, null, 28));
        Object select = callback(loader, "Function1", args -> {
            int value = Arrays.asList(DateLabelStyle.POSITIONS).indexOf(args[0]);
            if (value >= 0) set(position, value);
            set(visible, false); return unit(loader);
        });
        Object dismiss = callback(loader, "Function0", args -> { set(visible, false); return unit(loader); });
        invokeReference(loader, NuvioNative.REF_SETTINGS_ROWS_J,
            "Label position", options, DateLabelStyle.POSITIONS[((Number) get(position)).intValue()],
            select, dismiss, null, 420f, 320f, composer, 0, 32);
    }

    static Map<String,Object> legacyDateOverrides() throws Exception {
        Map<String,Object> values=new java.util.LinkedHashMap<>();
        boolean configured=((Map<String,?>)method(Class.forName("android.content.SharedPreferences"),"getAll",0).invoke(preferences(PREFS))).keySet().stream().anyMatch(k->k.startsWith("date_label_"));
        if(configured) {
            values.put("background_color",color(PREFS,2));values.put("foreground_color",color(PREFS,4));
            values.put("size_percent",percent(PREFS,1));values.put("font_size_percent",percent(PREFS,3));values.put("position",choice(PREFS,0));
        }
        return values;
    }
    static void resetLegacyDate() throws Exception {
        android.content.SharedPreferences.Editor editor=preferences(PREFS).edit();
        for(String key:((Map<String,?>)method(Class.forName("android.content.SharedPreferences"),"getAll",0).invoke(preferences(PREFS))).keySet())if(key.startsWith("date_label_"))editor.remove(key);
        editor.apply();revise(NuvioDateLabelStyle.class.getClassLoader(),PREFS);
    }
    /** Returns modifier, foreground Color, font TextUnit and native TextStyle. */
    public static Object[] build(ClassLoader loader, Object boxScope, Object composer, String shapeOwner, String ignored) throws Exception {
        return buildColors(loader, boxScope, composer, shapeOwner, color(PREFS, 2), color(PREFS, 4));
    }

    private static Object[] buildColors(ClassLoader loader, Object boxScope, Object composer, String shapeOwner,
            long background, long foreground) throws Exception {
        return buildColors(loader, boxScope, composer, shapeOwner, background, foreground, percent(PREFS, 1), percent(PREFS, 3), choice(PREFS, 0));
    }

    static Object[] buildColors(ClassLoader loader, Object boxScope, Object composer, String shapeOwner,
            long background, long foreground, int labelSize, int fontSizePercent, int position) throws Exception {
        String scope = PREFS;
        subscribe(loader, scope);
        Object typography = method(composer.getClass(), "j", 1).invoke(composer, staticValue(loader, NuvioNative.TEXT_STYLE_LOCAL_NAME, "a"));
        Object textStyle = field(typography.getClass(), "o").get(typography);
        Object modifier = staticValue(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b");
        modifier = method(boxScope.getClass(), "a", 2).invoke(boxScope, modifier,
            staticValue(loader, NuvioNative.ALIGNMENTS_NAME, DateLabelStyle.alignment(position)));
        Class<?> modifierType = Class.forName(NuvioNative.MODIFIER_NAME, false, loader);
        java.lang.reflect.Constructor<?> layer = Class.forName(NuvioNative.GRAPHICS_MODIFIER_NAME, false, loader).getDeclaredConstructor(float.class);
        layer.setAccessible(true);
        modifier = modifierType.getMethod("d", modifierType).invoke(modifier, layer.newInstance(10f));
        // Fixed inset from the card edge; only inner padding changes label size.
        modifier = method(Class.forName("d0.b", false, loader), "u", 2).invoke(null, modifier, 6f);
        modifier = method(Class.forName("a2.j", false, loader), "b", 2).invoke(null, modifier, staticValue(loader, shapeOwner, "a"));
        modifier = method(Class.forName("x.m", false, loader), "g", 3).invoke(null, modifier,
            background, staticValue(loader, "d2.i0", "b"));
        float scale = labelSize / 100f;
        Object spacing = staticValue(loader, NuvioNative.NATIVE_SPACING_LOCAL_NAME, "a");
        float horizontal = field(spacing.getClass(), "e").getFloat(spacing);
        float vertical = field(spacing.getClass(), "d").getFloat(spacing);
        Object span = field(textStyle.getClass(), "a").get(textStyle);
        long nativeFont = field(span.getClass(), "b").getLong(span);
        float font = Float.intBitsToFloat((int) nativeFont) * fontSizePercent / 100f;
        long fontSize = (nativeFont & 0xffffffff00000000L) | (Float.floatToRawIntBits(font) & 0xffffffffL);
        modifier = method(Class.forName("d0.b", false, loader), "v", 3).invoke(null, modifier,
            horizontal * scale, vertical * scale);
        return new Object[]{modifier, foreground, fontSize, textStyle};
    }

    private static String playbackOwner() { return NuvioNative.SETTINGS_STYLE_NAME; }
    private static String percentKey(int property) { return "date_label_" + DateLabelStyle.KEYS[property] + "_percent"; }
    private static String colorKey(int property) { return "date_label_" + DateLabelStyle.KEYS[property] + "_color"; }
    private static int percent(String scope, int property) throws Exception {
        int value = preferences(scope).getInt(percentKey(property), 100);
        return value >= 50 && value <= 200 && value % 10 == 0 ? value : 100;
    }
    private static long color(String scope, int property) throws Exception {
        return preferences(scope).getLong(colorKey(property), DateLabelStyle.color(property, choice(scope, property)));
    }
    private static void revise(ClassLoader loader, String scope) throws Exception {
        Object revision = state(loader, scope + ":revision", 0);
        set(revision, ((Number) get(revision)).intValue() + 1);
    }
    private static void renderColorDialog(Object composer, String scope, int property, Object dialog) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        int[] palette = {0xffffffff, 0xffd9d9d9, 0xffffff00, 0xff00ffff, 0xff00ff00,
            0xffff00ff, 0xffff6b6b, 0xffffa500, 0xff90ee90};
        java.lang.reflect.Constructor<?> box = Class.forName(NuvioNative.COLOR_NAME, false, loader).getDeclaredConstructor(long.class);
        box.setAccessible(true);
        java.util.ArrayList<Object> colors = new java.util.ArrayList<>();
        if (property == 2) colors.add(box.newInstance(0L));
        for (int value : palette) colors.add(box.newInstance(((long) value) << 32));
        // Replace exactly the first original swatch. All other native controls stay intact.
        colors.set(0, box.newInstance(CUSTOM_SWATCH));
        long draft = ((Number) get(colorDraft(loader, property))).longValue();
        boolean preset = false;
        for (Object swatch : colors)
            if ((field(swatch.getClass(), "a").getLong(swatch) & 0x00ffffff00000000L) == (draft & 0x00ffffff00000000L)) preset = true;
        long selected = preset ? draft : (CUSTOM_SWATCH & 0x00ffffff00000000L) | (draft & 0xff00000000000000L);
        Object select = callback(loader, "Function1", args -> {
            long packed = field(args[0].getClass(), "a").getLong(args[0]);
            if ((packed & 0x00ffffff00000000L) == (CUSTOM_SWATCH & 0x00ffffff00000000L))
                packed = (packed & 0xff00000000000000L) | (((Number) get(colorDraft(loader, property))).longValue() & 0x00ffffff00000000L);
            preferences(scope).edit().putLong(colorKey(property), packed).apply();
            revise(loader, scope); set(dialog, -1); return unit(loader);
        });
        Object dismiss = callback(loader, "Function0", args -> { set(dialog, -1); return unit(loader); });
        method(Class.forName(playbackOwner(), false, loader), "b", 9).invoke(null,
            DateLabelStyle.TITLES[property], colors, selected, property == 2,
            select, dismiss, composer, 0, 0);
    }

    private static Object colorDraft(ClassLoader loader, int property) throws Exception {
        return state(loader, PREFS + ":colorDraft:" + property, color(PREFS, property));
    }

    /** Called only by the native swatch hook; other palettes and swatches keep their callback. */
    public static Object colorSwatchClick(long packed, boolean selected, boolean transparent, Object original) throws Exception {
        if (RENDERING_SWATCH.get() != null) return original;
        Object dialog = STATES.get(PREFS + ":dialog");
        if (packed != CUSTOM_SWATCH || dialog == null) return original;
        int property = ((Number) get(dialog)).intValue();
        if (property != 2 && property != 4) return original;
        ClassLoader loader = original.getClass().getClassLoader();
        return callback(loader, "Function0", args -> {
            if (nativeOpacity != null) {
                int percent = Math.max(0, Math.min(100, ((Number) get(nativeOpacity)).intValue()));
                long draft = ((Number) get(colorDraft(loader, property))).longValue();
                long alpha = ((long) Math.round(percent * 255f / 100f)) << 56;
                set(colorDraft(loader, property), (draft & 0x00ffffff00000000L) | alpha);
            }
            previewMovie = randomPreviewMovie();
            set(dialog, property + 10); return unit(loader);
        });
    }

    /** Retain the native picker's current, unsaved opacity while opening its custom editor. */
    public static void bindColorOpacity(Object opacity) throws Exception {
        if (activeColorProperty(false) >= 0) nativeOpacity = opacity;
    }

    /** Capture public artwork already loaded by the app; never fetch catalogs from composition. */
    public static void rememberPreviewMovie(Object meta) {
        synchronized (PREVIEW_MOVIES) {
            if (PREVIEW_MOVIES.size() >= 24) return;
            try {
                Object type = method(meta.getClass(), referenceName(NuvioNative.REF_DATE_PREVIEW_META_CONTENT), 0).invoke(meta);
                if (!(type instanceof Enum) || !"MOVIE".equals(((Enum<?>) type).name())) return;
                String id = metaString(meta, NuvioNative.REF_DATE_PREVIEW_META_ID);
                for (String[] movie : PREVIEW_MOVIES) if (movie[0].equals(id)) return;
                String poster = metaString(meta, NuvioNative.REF_DATE_PREVIEW_META_POSTER);
                String landscape = metaString(meta, NuvioNative.REF_DATE_PREVIEW_META_LANDSCAPEPOSTER);
                if (!artwork(landscape)) landscape = metaString(meta, NuvioNative.REF_DATE_PREVIEW_META_BACKGROUND);
                if (!artwork(landscape)) landscape = poster;
                if (id == null || id.trim().isEmpty() || !artwork(poster) || !artwork(landscape)) return;
                PREVIEW_MOVIES.add(new String[]{id, metaString(meta, NuvioNative.REF_DATE_PREVIEW_META_NAME), poster, landscape});
                if (PREVIEW_MOVIES.size() == 1) {
                    Object revision = STATES.get(PREFS + ":artworkRevision");
                    if (revision != null) set(revision, ((Number) get(revision)).intValue() + 1);
                }
            } catch (Exception ignored) {
                // Artwork sampling must never affect native catalog construction.
            }
        }
    }

    private static boolean artwork(String value) { return value != null && !value.trim().isEmpty() && !value.startsWith("placeholder:"); }
    private static String metaString(Object meta, String reference) throws Exception {
        return (String) method(meta.getClass(), referenceName(reference), 0).invoke(meta);
    }
    private static String[] randomPreviewMovie() {
        synchronized (PREVIEW_MOVIES) {
            return PREVIEW_MOVIES.isEmpty() ? null : PREVIEW_MOVIES.get(java.util.concurrent.ThreadLocalRandom.current().nextInt(PREVIEW_MOVIES.size()));
        }
    }

    public static String colorSwatchLabel(long packed, String original) throws Exception {
        if (activeColorProperty(false) < 0) return original;
        Long rendering = RENDERING_SWATCH.get();
        if (packed == CUSTOM_SWATCH || (rendering != null && rendering == CUSTOM_SWATCH)) return "Custom";
        switch ((int) (packed >>> 32) & 0x00ffffff) {
            case 0xffffff: return "White";
            case 0xd9d9d9: return "Light gray";
            case 0xffff00: return "Yellow";
            case 0x00ffff: return "Cyan";
            case 0x00ff00: return "Green";
            case 0xff00ff: return "Magenta";
            case 0xff6b6b: return "Coral";
            case 0xffa500: return "Orange";
            case 0x90ee90: return "Light green";
            default: return original;
        }
    }

    private static int activeColorProperty(boolean editor) throws Exception {
        Object dialog = STATES.get(PREFS + ":dialog");
        if (dialog == null) return -1;
        int property = ((Number) get(dialog)).intValue() - (editor ? 10 : 0);
        return property == 2 || property == 4 ? property : -1;
    }

    /** Keep the native focusable circle; add a non-focusable caption below it. */
    public static boolean renderLabeledSwatch(long packed, boolean selected, boolean transparent, Object original,
            Object modifier, Object composer, int flags) throws Exception {
        int property = activeColorProperty(false);
        if (property < 0 || RENDERING_SWATCH.get() != null) return false;
        ClassLoader loader = composer.getClass().getClassLoader();
        long displayed = packed == CUSTOM_SWATCH ? ((Number) get(colorDraft(loader, property))).longValue() : packed;
        Object click = colorSwatchClick(packed, selected, transparent, original);
        Object width = method(Class.forName("androidx.compose.foundation.layout.b", false, loader), "q", 2)
            .invoke(null, staticValue(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b"), 88f);
        column(composer, width, 4f, () -> {
            RENDERING_SWATCH.set(packed);
            try {
                method(Class.forName(referenceOwner(NuvioNative.REF_DATE_COLOR_SWATCH), false, loader),
                    referenceName(NuvioNative.REF_DATE_COLOR_SWATCH), 7).invoke(null,
                        displayed, selected, (displayed >>> 56) == 0, click, modifier, composer, 0);
            } finally { RENDERING_SWATCH.remove(); }
            caption(composer, colorSwatchLabel(packed, "Color"));
        });
        return true;
    }

    public static int editorSaveResource(int original) throws Exception {
        return (activeColorProperty(true) >= 0 || labelEditor("active")) && original == Integer.decode(NuvioNative.DATE_THEME_SAVE_ID)
            ? Integer.decode(NuvioNative.DATE_APPLY_ID) : original;
    }

    /** The live native model is passed on every slider/hex edit, without persisting the draft. */
    public static boolean renderEditorPreview(Object model, Object modifier, Object composer, int flags) throws Exception {
        if (labelEditor("renderEditorPreview", model, modifier, composer, flags)) return true;
        int property = activeColorProperty(true);
        if (property < 0) return false;
        ClassLoader loader = composer.getClass().getClassLoader();
        int rgb = ((Number) method(model.getClass(), referenceName(NuvioNative.REF_DATE_CUSTOM_COLOR_GET), 0).invoke(model)).intValue();
        long live = (((long) rgb & 0xffffffL) << 32) | (((Number) get(colorDraft(loader, property))).longValue() & 0xff00000000000000L);
        long background = property == 2 ? live : ((Number) get(colorDraft(loader, 2))).longValue();
        long foreground = property == 4 ? live : ((Number) get(colorDraft(loader, 4))).longValue();
        return renderSamplePreview(modifier, composer, background, foreground,
            ((Number)get(sizeDraft(loader,2))).intValue(), ((Number)get(sizeDraft(loader,4))).intValue(),
            ((Number)get(state(loader,PREFS+":positionDraft",choice(PREFS,0)))).intValue(), "15-Nov");
    }

    static void newPreviewSample() { previewMovie = randomPreviewMovie(); }

    static boolean renderSamplePreview(Object modifier,Object composer,long background,long foreground,
            int labelSize,int fontSize,int position,String text) throws Exception {
        return renderSamplePreviewSized(modifier,composer,background,foreground,labelSize,fontSize,position,text,Float.POSITIVE_INFINITY,Float.POSITIVE_INFINITY);
    }

    static boolean renderSamplePreviewSized(Object modifier,Object composer,long background,long foreground,
            int labelSize,int fontSize,int position,String text,float availableWidth,float availableHeight) throws Exception {
        ClassLoader loader=composer.getClass().getClassLoader();
        get(state(loader, PREFS + ":artworkRevision", 0));
        Object previewCard = state(loader, PREFS + ":previewCard", false);
        boolean landscape = (Boolean) get(previewCard);
        float nativeWidth=landscape?256f:144f,nativeHeight=landscape?144f:216f;
        float scale=Float.isInfinite(availableWidth)||Float.isInfinite(availableHeight)?1f:Math.max(0.25f,Math.min((availableWidth-32f)/nativeWidth,(availableHeight-100f)/nativeHeight));
        float cardHeight=nativeHeight*scale,cardWidth=nativeWidth*scale;
        if (previewMovie == null) previewMovie = randomPreviewMovie();
        String[] movie = previewMovie;
        Object panel = method(Class.forName("x.m", false, loader), "g", 3).invoke(null, modifier,
            0xff17171c00000000L, staticValue(loader, "d2.i0", "b"));
        panel = method(Class.forName("d0.b", false, loader), "u", 2).invoke(null, panel, 16f);
        column(composer, panel, 10f, () -> {
            caption(composer, "Label preview");
            Object toggle = callback(loader, "Function0", args -> {
                set(previewCard, !((Boolean) get(previewCard))); return unit(loader);
            });
            invokeReference(loader, NuvioNative.REF_SETTINGS_ROWS_D,
                landscape ? "Switch to Poster" : "Switch to Card", toggle, false, true, composer, 0, 0);
            Object card = method(Class.forName("androidx.compose.foundation.layout.b", false, loader), "q", 2)
                .invoke(null, staticValue(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b"), cardWidth);
            card = invokeReference(loader, NuvioNative.REF_DATE_PREVIEW_HEIGHT, card, cardHeight);
            card = method(Class.forName("a2.j", false, loader), "b", 2).invoke(null, card,
                staticValue(loader, NuvioNative.WIDE_CARD_NAME, "a"));
            Object policy = invokeReference(loader, NuvioNative.REF_DATE_BOX_POLICY, staticValue(loader, "w1.b", "e"), false);
            node(composer, card, policy, () -> {
                if (movie != null) {
                    Object fill = method(Class.forName("androidx.compose.foundation.layout.b", false, loader), "d", 2)
                        .invoke(null, staticValue(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b"), 1f);
                    Object crop = field(Class.forName(referenceOwner(NuvioNative.REF_DATE_PREVIEW_CROP), false, loader),
                        referenceField(NuvioNative.REF_DATE_PREVIEW_CROP)).get(null);
                    invokeReference(loader, NuvioNative.REF_DATE_PREVIEW_IMAGE, movie[landscape ? 3 : 2], movie[1], fill,
                        staticValue(loader, "w1.b", "e"), crop, 1f, composer, 0, 0);
                }
                Object[] style = buildColors(loader, staticValue(loader, "d0.v", "a"), composer,
                    NuvioNative.WIDE_CARD_NAME, background, foreground,
                    labelSize, fontSize, position);
                invokeReference(loader, NuvioNative.REF_DATE_TEXT, text, style[0], style[1], style[2], null, null,
                    0L, null, 0L, 0, false, 0, 0, null, style[3], composer, 0, 0, 65520);
            });
        });
        return true;
    }

    /** First child of the editor window, above its native color-picker/preview body. */
    public static void renderEditorTargetRow(Object model, Object composer) throws Exception {
        if (labelEditor("renderEditorTargetRow", model, composer)) return;
        int property = activeColorProperty(true);
        if (property < 0) return;
        ClassLoader loader = composer.getClass().getClassLoader();
        int rgb = ((Number) method(model.getClass(), referenceName(NuvioNative.REF_DATE_CUSTOM_COLOR_GET), 0).invoke(model)).intValue();
        Object modifier = staticValue(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b");
        Object spacing = invokeReference(loader, NuvioNative.REF_DATE_SPACED_BY, 12f);
        Object alignment = field(Class.forName(referenceOwner(NuvioNative.REF_DATE_ROW_ALIGNMENT), false, loader),
            referenceField(NuvioNative.REF_DATE_ROW_ALIGNMENT)).get(null);
        Object policy = invokeReference(loader, NuvioNative.REF_DATE_ROW_POLICY, spacing, alignment, composer, 0);
        node(composer, modifier, policy, () -> {
            for (int target : new int[]{4, 2}) {
                Object selectTarget = callback(loader, "Function0", args -> {
                    if (target != property) {
                        long alpha = ((Number) get(colorDraft(loader, property))).longValue() & 0xff00000000000000L;
                        set(colorDraft(loader, property), alpha | ((long) (rgb & 0xffffff) << 32));
                        set(STATES.get(PREFS + ":dialog"), target + 10);
                    }
                    return unit(loader);
                });
                invokeReference(loader, NuvioNative.REF_SETTINGS_ROWS_D,
                    target == 2 ? "Label" : "Text", selectTarget, false, true, composer, 0, 0);
            }
        });
        caption(composer, property == 2 ? "Editing: Label" : "Editing: Text");
    }

    /** Appended to the native color-picker column; never rendered inside the preview. */
    public static void renderEditorControls(Object model, Object composer) throws Exception {
        if (labelEditor("renderEditorControls", model, composer)) return;
        int property = activeColorProperty(true);
        if (property < 0) return;
        ClassLoader loader = composer.getClass().getClassLoader();
        Object modifier = staticValue(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b");
        modifier = invokeReference(loader, NuvioNative.REF_DATE_PREVIEW_HEIGHT, modifier, 200f);
        Object scroll = invokeReference(loader, NuvioNative.REF_DATE_SCROLL_STATE, composer);
        modifier = invokeReference(loader, NuvioNative.REF_DATE_SCROLL, modifier, scroll, true);
        column(composer, modifier, 10f, () -> {
            renderDraftControls(composer, property);
            Object positionClick = callback(loader, "Function0", args -> {
                set(state(loader, PREFS + ":positionDialog", false), true); return unit(loader);
            });
            invokeReference(loader, NuvioNative.REF_SETTINGS_ROWS_D, "Label position", positionClick, false, true, composer, 0, 0);
            Object reset = callback(loader, "Function0", args -> {
                for (int target : new int[]{2, 4}) {
                    set(colorDraft(loader, target), DateLabelStyle.color(target, DateLabelStyle.defaultChoice(target)));
                    set(sizeDraft(loader, target), 100);
                }
                set(state(loader, PREFS + ":positionDraft", choice(PREFS, 0)), DateLabelStyle.defaultChoice(0));
                Object revision = state(loader, PREFS + ":editorRevision", 0);
                set(revision, ((Number) get(revision)).intValue() + 1);
                return unit(loader);
            });
            invokeReference(loader, NuvioNative.REF_SETTINGS_ROWS_D, "Reset appearance", reset, false, true, composer, 0, 0);
        });
    }

    interface Content { void render() throws Exception; }

    static void column(Object composer, Object modifier, float gap, Content content) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        Object spacing = invokeReference(loader, NuvioNative.REF_DATE_SPACED_BY, gap);
        Object center = Class.forName("w1.g", false, loader).getDeclaredConstructor(float.class).newInstance(0f);
        Object policy = invokeReference(loader, NuvioNative.REF_DATE_COLUMN_POLICY, spacing, center, composer, 0);
        node(composer, modifier, policy, content);
    }

    /** Same Compose node protocol used by the original swatch and preview renderers. */
    static void node(Object composer, Object modifier, Object policy, Content content) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        method(composer.getClass(), "d0", 1).invoke(composer, 0x53444c43);
        try {
            long hash = field(composer.getClass(), "T").getLong(composer);
            Object locals = method(composer.getClass(), "l", 0).invoke(composer);
            Object materialized = invokeReference(loader, NuvioNative.REF_DATE_MATERIALIZE, composer, modifier);
            method(composer.getClass(), "h0", 0).invoke(composer);
            if (field(composer.getClass(), "S").getBoolean(composer))
                method(composer.getClass(), "k", 1).invoke(composer, staticValue(loader, "w2.i", "b"));
            else method(composer.getClass(), "r0", 0).invoke(composer);
            try {
                invokeReference(loader, NuvioNative.REF_DATE_NODE_UPDATE, composer, policy, staticValue(loader, "w2.i", "f"));
                invokeReference(loader, NuvioNative.REF_DATE_NODE_UPDATE, composer, locals, staticValue(loader, "w2.i", "e"));
                invokeReference(loader, NuvioNative.REF_DATE_NODE_UPDATE, composer, Long.hashCode(hash), staticValue(loader, "w2.i", "g"));
                invokeReference(loader, NuvioNative.REF_DATE_NODE_INIT, composer, staticValue(loader, "w2.i", "h"));
                invokeReference(loader, NuvioNative.REF_DATE_NODE_UPDATE, composer, materialized, staticValue(loader, "w2.i", "d"));
                content.render();
            } finally { method(composer.getClass(), "p", 1).invoke(composer, true); }
        } finally { method(composer.getClass(), "p", 1).invoke(composer, false); }
    }

    static void caption(Object composer, String text) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        Object typography = method(composer.getClass(), "j", 1).invoke(composer, staticValue(loader, NuvioNative.TEXT_STYLE_LOCAL_NAME, "a"));
        invokeReference(loader, NuvioNative.REF_DATE_TEXT, text, staticValue(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b"),
            0xffffffff00000000L, 0x100000000L | (Float.floatToRawIntBits(12f) & 0xffffffffL), null, null,
            0L, null, 0L, 0, false, 0, 0, null, field(typography.getClass(), "o").get(typography), composer, 0, 0, 65520);
    }

    static Object invokeReference(ClassLoader loader, String reference, Object... args) throws Exception {
        return method(Class.forName(referenceOwner(reference), false, loader), referenceName(reference), args.length).invoke(null, args);
    }

    private static void renderCustomColorDialog(Object composer, String scope, int property, Object dialog) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        Class<?> model = Class.forName(referenceOwner(NuvioNative.REF_DATE_CUSTOM_COLOR_INIT), false, loader);
        int rgb = (int) (((Number) get(colorDraft(loader, property))).longValue() >>> 32) & 0x00ffffff;
        Object initial = model.getDeclaredConstructor(int.class, int.class, int.class).newInstance(rgb, rgb, rgb);
        Object save = callback(loader, "Function1", args -> {
            int selected = ((Number) method(model, referenceName(NuvioNative.REF_DATE_CUSTOM_COLOR_GET), 0).invoke(args[0])).intValue();
            long alpha = ((Number) get(colorDraft(loader, property))).longValue() & 0xff00000000000000L;
            long packed = alpha | (((long) selected & 0x00ffffffL) << 32);
            set(colorDraft(loader, property), packed);
            SharedPreferences.Editor editor = preferences(scope).edit();
            for (int target : new int[]{2, 4}) {
                editor.putLong(colorKey(target), ((Number) get(colorDraft(loader, target))).longValue());
                editor.putInt(percentKey(target - 1), ((Number) get(sizeDraft(loader, target))).intValue());
            }
            editor.putInt(key(0), ((Number) get(state(loader, scope + ":positionDraft", choice(scope, 0)))).intValue()).apply();
            revise(loader, scope);
            set(dialog, -1); return unit(loader);
        });
        Object dismiss = callback(loader, "Function0", args -> { set(dialog, -1); return unit(loader); });
        method(Class.forName(referenceOwner(NuvioNative.REF_DATE_CUSTOM_COLOR_DIALOG), false, loader),
            referenceName(NuvioNative.REF_DATE_CUSTOM_COLOR_DIALOG), 6).invoke(null, initial, false, save, dismiss, composer, 0);
    }

    private static Object sizeDraft(ClassLoader loader, int property) throws Exception {
        return state(loader, PREFS + ":sizeDraft:" + property, percent(PREFS, property - 1));
    }

    private static void renderDraftControls(Object composer, int property) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        long packed = ((Number) get(colorDraft(loader, property))).longValue();
        int opacity = Math.round((packed >>> 56) * 100f / 255f);
        Object alphaChange = callback(loader, "Function1", args -> {
            int value = Math.max(0, Math.min(100, ((Number) args[0]).intValue()));
            long draft = ((Number) get(colorDraft(loader, property))).longValue();
            set(colorDraft(loader, property), (draft & 0x00ffffff00000000L) | ((long) Math.round(value * 255f / 100f) << 56));
            return unit(loader);
        });
        Object sizeChange = callback(loader, "Function1", args -> {
            int value = ((Number) args[0]).intValue();
            if (value >= 50 && value <= 200 && value % 10 == 0) set(sizeDraft(loader, property), value);
            return unit(loader);
        });
        Object noop = callback(loader, "Function0", args -> unit(loader));
        Object modifier = staticValue(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b");
        invokeReference(loader, NuvioNative.REF_DATE_PERCENT_ROW,
            property == 2 ? "Label opacity" : "Font opacity", opacity, opacity + "%", 0, 100, 1, alphaChange,
            null, noop, true, modifier, composer, 0, 128);
        int size = ((Number) get(sizeDraft(loader, property))).intValue();
        invokeReference(loader, NuvioNative.REF_DATE_PERCENT_ROW,
            DateLabelStyle.TITLES[property - 1], size, size + "%", 50, 200, 10, sizeChange,
            null, noop, true, modifier, composer, 0, 128);
    }

    static String referenceOwner(String reference) { return reference.substring(1, reference.indexOf(';')).replace('/', '.'); }
    static String referenceName(String reference) { return reference.substring(reference.indexOf("->") + 2, reference.indexOf('(')); }
    static String referenceField(String reference) { return reference.substring(reference.indexOf("->") + 2, reference.indexOf(':')); }

    private static volatile Method labelEditorDispatch;
    private static boolean labelEditor(String name,Object... args) throws Exception {
        try {
            Method dispatch=labelEditorDispatch;
            if(dispatch==null) {
                Class<?> editor=Class.forName("software.santodan.extension.nuviomenu.NuvioLabelsEditor",false,NuvioDateLabelStyle.class.getClassLoader());
                dispatch=editor.getMethod("dispatch",String.class,Object[].class);labelEditorDispatch=dispatch;
            }
            return Boolean.TRUE.equals(dispatch.invoke(null,name,args));
        } catch(ClassNotFoundException absent) { return false; }
        catch(java.lang.reflect.InvocationTargetException failure) {
            Throwable cause=failure.getCause();if(cause instanceof Exception)throw (Exception)cause;
            throw new RuntimeException(cause);
        }
    }

    private static String key(int property) { return "date_label_" + DateLabelStyle.KEYS[property]; }
    private static int choice(String scope, int property) throws Exception {
        return DateLabelStyle.valid(property, preferences(scope).getInt(key(property), DateLabelStyle.defaultChoice(property)));
    }
    private static void subscribe(ClassLoader loader, String scope) throws Exception { get(state(loader, scope + ":revision", 0)); }
    static synchronized Object state(ClassLoader loader, String key, Object initial) throws Exception {
        Object state = STATES.get(key);
        if (state == null) { state = method(Class.forName(NuvioNative.COMPOSE_FACTORY_NAME, false, loader), NuvioNative.STATE_FACTORY_METHOD, 1).invoke(null, initial); STATES.put(key, state); }
        return state;
    }
    static Object get(Object state) throws Exception { return method(state.getClass(), "getValue", 0).invoke(state); }
    static void set(Object state, Object value) throws Exception { method(state.getClass(), "setValue", 1).invoke(state, value); }
    private static Application application() throws Exception { return (Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null); }
    private static SharedPreferences preferences(String scope) throws Exception { return application().getSharedPreferences(scope, Context.MODE_PRIVATE); }
    private static String rowsOwner() { return NuvioNative.SETTINGS_ROWS_NAME; }
    interface Callback { Object invoke(Object[] args) throws Exception; }
    static Object callback(ClassLoader loader, String type, Callback action) throws Exception {
        return Proxy.newProxyInstance(loader, new Class<?>[]{Class.forName("kotlin.jvm.functions." + type, false, loader)}, (proxy, method, args) -> {
            if ("invoke".equals(method.getName())) return action.invoke(args);
            if ("hashCode".equals(method.getName())) return System.identityHashCode(proxy);
            if ("equals".equals(method.getName())) return proxy == args[0];
            return "DateLabelSettingsCallback";
        });
    }
    static Object unit(ClassLoader loader) throws Exception {
        Class<?> unit = Class.forName("kotlin.Unit", false, loader);
        try { return unit.getField("INSTANCE").get(null); } catch (NoSuchFieldException ignored) { return unit.getField("a").get(null); }
    }
    static Object staticValue(ClassLoader loader, String owner, String name) throws Exception { return field(Class.forName(owner, false, loader), name).get(null); }
    static Field field(Class<?> owner, String name) throws Exception { Field field = owner.getDeclaredField(name); field.setAccessible(true); return field; }
    static Method method(Class<?> owner, String name, int count) throws Exception {
        for (Method method : owner.getDeclaredMethods()) if (method.getName().equals(name) && method.getParameterCount() == count) { method.setAccessible(true); return method; }
        throw new NoSuchMethodException(owner.getName() + '.' + name);
    }
}
