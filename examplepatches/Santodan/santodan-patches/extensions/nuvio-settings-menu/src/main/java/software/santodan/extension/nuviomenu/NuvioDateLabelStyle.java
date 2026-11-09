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
        Object expanded = state(loader, scope + ":expanded", false);
        Object dialog = state(loader, scope + ":dialog", -1);
        subscribe(loader, scope);
        Object toggle = callback(loader, "Function0", args -> {
            set(expanded, !((Boolean) get(expanded))); return unit(loader);
        });
        Object noop = callback(loader, "Function0", args -> unit(loader));
        Object body = Class.forName(NuvioNative.COMPOSABLE_LAMBDA_NAME, false, loader).getDeclaredConstructor(int.class, Object.class, boolean.class)
            .newInstance(scope.hashCode(), callback(loader, "Function3", args -> {
                renderRows(args[1], scope, dialog); return unit(loader);
            }), true);
        method(Class.forName(NuvioNative.SETTINGS_SECTION_NAME, false, loader), "a", 11).invoke(null,
            title, "Position, label size and color, font size and color", get(expanded),
            toggle, staticValue(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b"), null, null, noop, body, composer, 0);
        int property = ((Number) get(dialog)).intValue();
        if (property == 12 || property == 14) {
            renderCustomColorDialog(composer, scope, property - 10, dialog);
            return;
        }
        if (property < 0 || property >= DateLabelStyle.KEYS.length) return;
        if (property == 2 || property == 4) {
            renderColorDialog(composer, scope, property, dialog);
            return;
        }
        String[] choices = DateLabelStyle.choices(property);
        java.util.ArrayList<Object> options = new java.util.ArrayList<>();
        Class<?> optionType = Class.forName(NuvioNative.SETTINGS_ROWS_NAME.equals(rowsOwner()) ? NuvioNative.SETTINGS_PICKER_NAME : NuvioNative.SETTINGS_PICKER_NAME, false, loader);
        java.lang.reflect.Constructor<?> option = Arrays.stream(optionType.getDeclaredConstructors())
            .filter(value -> value.getParameterCount() == 6).findFirst().orElseThrow();
        option.setAccessible(true);
        for (String value : choices) options.add(option.newInstance(value, value, null, null, null, 28));
        Object select = callback(loader, "Function1", args -> {
            int value = Arrays.asList(choices).indexOf(args[0]);
            if (value >= 0) {
                preferences(scope).edit().putInt(key(property), value).apply();
                Object revision = state(loader, scope + ":revision", 0);
                set(revision, ((Number) get(revision)).intValue() + 1);
            }
            set(dialog, -1); return unit(loader);
        });
        Object dismiss = callback(loader, "Function0", args -> { set(dialog, -1); return unit(loader); });
        method(Class.forName(rowsOwner(), false, loader), "j", 11).invoke(null,
            DateLabelStyle.TITLES[property], options, choices[choice(scope, property)],
            // R8 removes the width/height default branches; supply real dp values.
            select, dismiss, null, 420f, 320f, composer, 0, 32);
    }

    private static void renderRows(Object composer, String scope, Object dialog) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        for (int property = 0; property < DateLabelStyle.KEYS.length; property++) {
            final int selected = property;
            Object noop = callback(loader, "Function0", args -> unit(loader));
            if (property == 1 || property == 3) {
                int percent = percent(scope, property);
                Object change = callback(loader, "Function1", args -> {
                    preferences(scope).edit().putInt(percentKey(selected), ((Number) args[0]).intValue()).apply();
                    revise(loader, scope); return unit(loader);
                });
                method(Class.forName(playbackOwner(), false, loader), "j", 14).invoke(null,
                    DateLabelStyle.TITLES[property], percent, percent + "%", 50, 200, 10, change,
                    null, noop, true, staticValue(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b"), composer, 0, 128);
                continue;
            }
            Object click = callback(loader, "Function0", args -> {
                if (selected == 2 || selected == 4) set(colorDraft(loader, selected), color(scope, selected));
                set(dialog, selected); return unit(loader);
            });
            if (property == 2 || property == 4) {
                long color = color(scope, property);
                method(Class.forName(playbackOwner(), false, loader), "c", 9).invoke(null,
                    DateLabelStyle.TITLES[property], color, property == 2 && color == 0L,
                    click, noop, true, composer, 0, 0);
            } else {
                method(Class.forName(rowsOwner(), false, loader), "a", 18).invoke(null,
                    DateLabelStyle.TITLES[property], null, DateLabelStyle.choices(property)[choice(scope, property)],
                    click, null, noop, true, null, null, 0L, null, null, 0f, 0L, composer, 0, 0, 16336);
            }
        }
        Object reset = callback(loader, "Function0", args -> {
            SharedPreferences.Editor editor = preferences(scope).edit();
            for (int property = 0; property < DateLabelStyle.KEYS.length; property++) {
                editor.remove(key(property)).remove(percentKey(property)).remove(colorKey(property));
            }
            editor.apply();
            Object revision = state(loader, scope + ":revision", 0);
            set(revision, ((Number) get(revision)).intValue() + 1);
            return unit(loader);
        });
        Object noop = callback(loader, "Function0", args -> unit(loader));
        method(Class.forName(rowsOwner(), false, loader), "a", 18).invoke(null,
            "Reset date label appearance", "Restore the default style for all date labels.", null,
            reset, null, noop, true, null, null, 0L, null, null, 0f, 0L, composer, 0, 0, 16336);
    }

    /** Returns modifier, foreground Color, font TextUnit and native TextStyle. */
    public static Object[] build(ClassLoader loader, Object boxScope, Object composer, String shapeOwner, String ignored) throws Exception {
        return buildColors(loader, boxScope, composer, shapeOwner, color(PREFS, 2), color(PREFS, 4));
    }

    private static Object[] buildColors(ClassLoader loader, Object boxScope, Object composer, String shapeOwner,
            long background, long foreground) throws Exception {
        String scope = PREFS;
        subscribe(loader, scope);
        Object typography = method(composer.getClass(), "j", 1).invoke(composer, staticValue(loader, NuvioNative.TEXT_STYLE_LOCAL_NAME, "a"));
        Object textStyle = field(typography.getClass(), "o").get(typography);
        Object modifier = staticValue(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b");
        modifier = method(boxScope.getClass(), "a", 2).invoke(boxScope, modifier,
            staticValue(loader, NuvioNative.ALIGNMENTS_NAME, DateLabelStyle.alignment(choice(scope, 0))));
        Class<?> modifierType = Class.forName(NuvioNative.MODIFIER_NAME, false, loader);
        java.lang.reflect.Constructor<?> layer = Class.forName(NuvioNative.GRAPHICS_MODIFIER_NAME, false, loader).getDeclaredConstructor(float.class);
        layer.setAccessible(true);
        modifier = modifierType.getMethod("d", modifierType).invoke(modifier, layer.newInstance(10f));
        // Fixed inset from the card edge; only inner padding changes label size.
        modifier = method(Class.forName("d0.b", false, loader), "u", 2).invoke(null, modifier, 6f);
        modifier = method(Class.forName("a2.j", false, loader), "b", 2).invoke(null, modifier, staticValue(loader, shapeOwner, "a"));
        modifier = method(Class.forName("x.m", false, loader), "g", 3).invoke(null, modifier,
            background, staticValue(loader, "d2.i0", "b"));
        float scale = percent(scope, 1) / 100f;
        Object spacing = staticValue(loader, NuvioNative.NATIVE_SPACING_LOCAL_NAME, "a");
        float horizontal = field(spacing.getClass(), "e").getFloat(spacing);
        float vertical = field(spacing.getClass(), "d").getFloat(spacing);
        Object span = field(textStyle.getClass(), "a").get(textStyle);
        long nativeFont = field(span.getClass(), "b").getLong(span);
        float font = Float.intBitsToFloat((int) nativeFont) * percent(scope, 3) / 100f;
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
        return activeColorProperty(true) >= 0 && original == Integer.decode(NuvioNative.DATE_THEME_SAVE_ID)
            ? Integer.decode(NuvioNative.DATE_APPLY_ID) : original;
    }

    /** The live native model is passed on every slider/hex edit, without persisting the draft. */
    public static boolean renderEditorPreview(Object model, Object modifier, Object composer, int flags) throws Exception {
        int property = activeColorProperty(true);
        if (property < 0) return false;
        ClassLoader loader = composer.getClass().getClassLoader();
        int rgb = ((Number) method(model.getClass(), referenceName(NuvioNative.REF_DATE_CUSTOM_COLOR_GET), 0).invoke(model)).intValue();
        get(state(loader, PREFS + ":artworkRevision", 0));
        long live = (((long) rgb & 0xffffffL) << 32) | (((Number) get(colorDraft(loader, property))).longValue() & 0xff00000000000000L);
        long background = property == 2 ? live : color(PREFS, 2);
        long foreground = property == 4 ? live : color(PREFS, 4);
        Object previewCard = state(loader, PREFS + ":previewCard", false);
        boolean landscape = (Boolean) get(previewCard);
        float cardHeight = landscape ? 144f : 216f;
        if (previewMovie == null) previewMovie = randomPreviewMovie();
        String[] movie = previewMovie;
        Object panel = method(Class.forName("x.m", false, loader), "g", 3).invoke(null, modifier,
            0xff17171c00000000L, staticValue(loader, "d2.i0", "b"));
        panel = method(Class.forName("d0.b", false, loader), "u", 2).invoke(null, panel, 16f);
        column(composer, panel, 16f, () -> {
            caption(composer, "Label preview");
            Object toggle = callback(loader, "Function0", args -> {
                set(previewCard, !((Boolean) get(previewCard))); return unit(loader);
            });
            invokeReference(loader, NuvioNative.REF_SETTINGS_ROWS_D,
                landscape ? "Switch to Poster" : "Switch to Card", toggle, false, true, composer, 0, 0);
            Object card = method(Class.forName("androidx.compose.foundation.layout.b", false, loader), "q", 2)
                .invoke(null, staticValue(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b"), landscape ? 256f : 144f);
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
                    NuvioNative.WIDE_CARD_NAME, background, foreground);
                invokeReference(loader, NuvioNative.REF_DATE_TEXT, "15-Nov", style[0], style[1], style[2], null, null,
                    0L, null, 0L, 0, false, 0, 0, null, style[3], composer, 0, 0, 65520);
            });
        });
        return true;
    }

    private interface Content { void render() throws Exception; }

    private static void column(Object composer, Object modifier, float gap, Content content) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        Object spacing = invokeReference(loader, NuvioNative.REF_DATE_SPACED_BY, gap);
        Object center = Class.forName("w1.g", false, loader).getDeclaredConstructor(float.class).newInstance(0f);
        Object policy = invokeReference(loader, NuvioNative.REF_DATE_COLUMN_POLICY, spacing, center, composer, 0);
        node(composer, modifier, policy, content);
    }

    /** Same Compose node protocol used by the original swatch and preview renderers. */
    private static void node(Object composer, Object modifier, Object policy, Content content) throws Exception {
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

    private static void caption(Object composer, String text) throws Exception {
        ClassLoader loader = composer.getClass().getClassLoader();
        Object typography = method(composer.getClass(), "j", 1).invoke(composer, staticValue(loader, NuvioNative.TEXT_STYLE_LOCAL_NAME, "a"));
        invokeReference(loader, NuvioNative.REF_DATE_TEXT, text, staticValue(loader, NuvioNative.EMPTY_MODIFIER_NAME, "b"),
            0xffffffff00000000L, 0x100000000L | (Float.floatToRawIntBits(12f) & 0xffffffffL), null, null,
            0L, null, 0L, 0, false, 0, 0, null, field(typography.getClass(), "o").get(typography), composer, 0, 0, 65520);
    }

    private static Object invokeReference(ClassLoader loader, String reference, Object... args) throws Exception {
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
            set(colorDraft(loader, property), alpha | (((long) selected & 0x00ffffffL) << 32));
            set(dialog, property); return unit(loader);
        });
        Object dismiss = callback(loader, "Function0", args -> { set(dialog, property); return unit(loader); });
        method(Class.forName(referenceOwner(NuvioNative.REF_DATE_CUSTOM_COLOR_DIALOG), false, loader),
            referenceName(NuvioNative.REF_DATE_CUSTOM_COLOR_DIALOG), 6).invoke(null, initial, false, save, dismiss, composer, 0);
    }

    private static String referenceOwner(String reference) { return reference.substring(1, reference.indexOf(';')).replace('/', '.'); }
    private static String referenceName(String reference) { return reference.substring(reference.indexOf("->") + 2, reference.indexOf('(')); }
    private static String referenceField(String reference) { return reference.substring(reference.indexOf("->") + 2, reference.indexOf(':')); }

    private static String key(int property) { return "date_label_" + DateLabelStyle.KEYS[property]; }
    private static int choice(String scope, int property) throws Exception {
        return DateLabelStyle.valid(property, preferences(scope).getInt(key(property), DateLabelStyle.defaultChoice(property)));
    }
    private static void subscribe(ClassLoader loader, String scope) throws Exception { get(state(loader, scope + ":revision", 0)); }
    private static synchronized Object state(ClassLoader loader, String key, Object initial) throws Exception {
        Object state = STATES.get(key);
        if (state == null) { state = method(Class.forName(NuvioNative.COMPOSE_FACTORY_NAME, false, loader), NuvioNative.STATE_FACTORY_METHOD, 1).invoke(null, initial); STATES.put(key, state); }
        return state;
    }
    private static Object get(Object state) throws Exception { return method(state.getClass(), "getValue", 0).invoke(state); }
    private static void set(Object state, Object value) throws Exception { method(state.getClass(), "setValue", 1).invoke(state, value); }
    private static Application application() throws Exception { return (Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null); }
    private static SharedPreferences preferences(String scope) throws Exception { return application().getSharedPreferences(scope, Context.MODE_PRIVATE); }
    private static String rowsOwner() { return NuvioNative.SETTINGS_ROWS_NAME; }
    private interface Callback { Object invoke(Object[] args) throws Exception; }
    private static Object callback(ClassLoader loader, String type, Callback action) throws Exception {
        return Proxy.newProxyInstance(loader, new Class<?>[]{Class.forName("kotlin.jvm.functions." + type, false, loader)}, (proxy, method, args) -> {
            if ("invoke".equals(method.getName())) return action.invoke(args);
            if ("hashCode".equals(method.getName())) return System.identityHashCode(proxy);
            if ("equals".equals(method.getName())) return proxy == args[0];
            return "DateLabelSettingsCallback";
        });
    }
    private static Object unit(ClassLoader loader) throws Exception {
        Class<?> unit = Class.forName("kotlin.Unit", false, loader);
        try { return unit.getField("INSTANCE").get(null); } catch (NoSuchFieldException ignored) { return unit.getField("a").get(null); }
    }
    private static Object staticValue(ClassLoader loader, String owner, String name) throws Exception { return field(Class.forName(owner, false, loader), name).get(null); }
    private static Field field(Class<?> owner, String name) throws Exception { Field field = owner.getDeclaredField(name); field.setAccessible(true); return field; }
    private static Method method(Class<?> owner, String name, int count) throws Exception {
        for (Method method : owner.getDeclaredMethods()) if (method.getName().equals(name) && method.getParameterCount() == count) { method.setAccessible(true); return method; }
        throw new NoSuchMethodException(owner.getName() + '.' + name);
    }
}
