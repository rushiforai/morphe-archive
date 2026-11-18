package app.afterglow.extension.settings;

import android.content.SharedPreferences;

import java.lang.reflect.Field;
import java.lang.reflect.Proxy;
import java.util.Collections;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import static app.afterglow.extension.settings.ThemeRole.*;

/** Behavior tests of the real color engine with Android's preference storage replaced in memory. */
public final class ThemeEngineTest {
    private static int checks;
    private static int reads;
    private static int writes;
    private static final Map<String, Object> stored = new HashMap<>();

    public static void main(String[] args) throws Exception {
        Field prefs = AfterglowPrefs.class.getDeclaredField("prefs");
        prefs.setAccessible(true);
        prefs.set(null, memoryPreferences());
        decoding();
        foundations();
        derivedColors();
        nativeColors();
        catalog();
        transactionsAndCache();
        themeDocumentsAndLibrary();
        glowPolicy();
        seekMotion();
        System.out.println("PASS theme engine: " + checks + " checks");
    }

    private static void decoding() {
        eq("RGB", 0xFF123456, ThemeColors.decode(" #123456 "));
        eq("ARGB", 0x78123456, ThemeColors.decode("#78123456"));
        eq("transparent is defined", 0, ThemeColors.decode("#00000000"));
        eq("signed ARGB", 0xFFABCDEF, ThemeColors.decode(0xFFABCDEF));
        eq("unsigned long ARGB", 0xFFABCDEF, ThemeColors.decode(0xFFABCDEFL));
        for (Object invalid : new Object[] {null, "red", "#fff", "#12345G", "#123456789", true, new byte[] {1, 2}})
            eq("invalid color ignored: " + invalid, null, ThemeColors.decode(invalid));
        eq("white WCAG luminance", 1.0, ThemeColors.luminance(0xFFFFFFFF));
        eq("black/white contrast", 21.0, ThemeColors.contrast(0xFF000000, 0xFFFFFFFF));
        eq("readable on white", 0xFF000000, ThemeColors.blackOrWhite(0xFFFFFFFF));
        eq("readable on black", 0xFFFFFFFF, ThemeColors.blackOrWhite(0xFF000000));
    }

    private static void foundations() {
        eq("empty palette follows native", -1, ThemePalette.system().pageStyleOverride());
        for (ThemeRole role : ThemeRole.values()) eq("system has no derived " + role, null, ThemePalette.system().color(role));
        eq("accent alone follows native", -1, palette(ACCENT, 0xFFFFFFFF).pageStyleOverride());
        // 0.56 perceived brightness is light on iOS, despite a WCAG luminance below 0.5.
        eq("Rec.601 foundation", 0, palette(BACKGROUND, 0xFF909090).pageStyleOverride());
        eq("below threshold", 1, palette(BACKGROUND, 0xFF8C8C8C).pageStyleOverride());
        eq("above threshold", 0, palette(BACKGROUND, 0xFF8D8D8D).pageStyleOverride());
        ThemePalette gradient = palette(BACKGROUND, 0xFF000000, GRADIENT_START, 0xFFFFFFFF, GRADIENT_END, 0xFF333333);
        eq("gradient overrides background foundation", 0, gradient.pageStyleOverride());
        eq("gradient endpoints averaged", 1, palette(GRADIENT_START, 0xFFFFFFFF, GRADIENT_END, 0xFF000000).pageStyleOverride());
        eq("incomplete gradient does not own page", -1, palette(GRADIENT_START, 0xFFFFFFFF).pageStyleOverride());
        eq("end-only uses background", 1, palette(BACKGROUND, 0xFF000000, GRADIENT_END, 0xFFFFFFFF).pageStyleOverride());
        eq("defined transparent background owns page", 1, palette(BACKGROUND, 0).pageStyleOverride());
    }

    private static void derivedColors() {
        ThemePalette p = palette(BACKGROUND, 0xFF010203, NAVIGATION_SURFACE, 0xFF040506,
                PRIMARY_TEXT, 0xFFEEEEEE, SECONDARY_TEXT, 0x10123456, ACCENT, 0xFF11AA77,
                TAB_ICON, 0xFF8899AA, SEEK_PLAYED, 0xFF123456, SEEK_LIVE, 0xFF654321);
        eq("elevated prefers navigation", 0xFF040506, p.color(ELEVATED_SURFACE));
        eq("elevated background fallback", 0xFF010203, palette(BACKGROUND, 0xFF010203).color(ELEVATED_SURFACE));
        eq("border replaces alpha", 0x38123456, p.color(BORDER));
        eq("primary border fallback", 0x2EEEEEEE, palette(PRIMARY_TEXT, 0xFFEEEEEE).color(BORDER));
        eq("overlay backdrop", 0x9E000000, p.color(OVERLAY_BACKDROP));
        eq("dark shadow", 0x8C000000, p.color(SHADOW));
        eq("light shadow", 0x38000000, palette(BACKGROUND, 0xFFFFFFFF).color(SHADOW));
        eq("buffered legacy gray", 0x99A6A6A6, p.color(SEEK_BUFFERED));
        eq("buffered needs played override", null, palette(SEEK_LIVE, 0xFF123456).color(SEEK_BUFFERED));
        eq("live override retained", 0xFF654321, p.color(SEEK_LIVE));
        eq("scrubber derives played", 0xFF123456, p.color(SEEK_SCRUBBER));
        eq("live scrubber prefers EXPLICIT live over derived scrubber", 0xFF654321, p.color(SEEK_SCRUBBER_LIVE));
        eq("explicit scrubber first", 0xFF000011,
                palette(SEEK_PLAYED, 0xFF123456, SEEK_LIVE, 0xFF654321, SEEK_SCRUBBER, 0xFF000011).color(SEEK_SCRUBBER_LIVE));
        eq("focus accent", 0xFF11AA77, p.color(FOCUS));
        eq("focus icon fallback", 0xFF8899AA, palette(TAB_ICON, 0xFF8899AA).color(FOCUS));
        eq("derived not explicit", null, p.explicit(SEEK_SCRUBBER));
        eq("no guessed navigation color", null, palette(BACKGROUND, 0xFF123456).color(NAVIGATION_SURFACE));
        for (ThemeRole role : ThemeRole.values()) {
            eq("explicit " + role + " wins", 0x00102030, palette(role, 0x00102030).color(role));
        }
        try {
            p.explicitColors().put(ACCENT, 0);
            throw new AssertionError("mutable palette");
        } catch (UnsupportedOperationException expected) { checks++; }
    }

    private static void catalog() {
        eq("all iOS presets", 30, ThemeCatalog.PRESETS.size());
        for (ThemePalette preset : ThemeCatalog.PRESETS) {
            Map<ThemeRole, Integer> colors = new EnumMap<>(preset.explicitColors());
            ThemePalette resolved = ThemePalette.fromColors(colors);
            eq("recognize " + preset.identifier, preset.identifier, resolved.identifier);
            eq("preserve declared foundation " + preset.identifier, preset.lightFoundation, resolved.lightFoundation);
            colors.put(GLOW, 0xFF445566);
            eq("glow does not change identity " + preset.identifier, preset.identifier, ThemePalette.fromColors(colors).identifier);
            colors.put(BACKGROUND, preset.explicit(BACKGROUND) ^ 1);
            eq("edited preset becomes custom " + preset.identifier, "custom", ThemePalette.fromColors(colors).identifier);
        }
        eq("OLED literal black", 0xFF000000, ThemeCatalog.find("oled-dark").color(BACKGROUND));
        eq("no invented presets", null, ThemeCatalog.find("missing"));
    }

    private static void nativeColors() {
        eq("Android contrast background stays opaque", 0xFF102030,
                NativeThemeColors.resourceColor(palette(BACKGROUND, 0xFF102030, GRADIENT_START, 0xFF000000, GRADIENT_END, 0xFF702060), BACKGROUND));
        eq("translucent background composites on foundation", 0xFF0F0F0F,
                NativeThemeColors.resourceColor(palette(BACKGROUND, 0), BACKGROUND));
        eq("gradient transparency only at drawing boundary", 0,
                NativeThemeColors.lithoBackground(palette(BACKGROUND, 0xFF102030, GRADIENT_START, 0xFF000000, GRADIENT_END, 0xFF702060), 0xFF0F0F0F, true));
        eq("already resolved gradient backdrop is transparent", 0,
                NativeThemeColors.lithoBackground(palette(BACKGROUND, 0xFF102030, GRADIENT_START, 0xFF000000, GRADIENT_END, 0xFF702060), 0xFF102030, true));
        eq("light preset selects native light", Appearance.LIGHT, NativeThemeColors.appearance(palette(BACKGROUND, 0xFFFFFFFF), Appearance.DARK));
        eq("dark preset selects native dark", Appearance.DARK, NativeThemeColors.appearance(palette(BACKGROUND, 0xFF000000), Appearance.LIGHT));
        eq("reset follows saved appearance", Appearance.DARK, NativeThemeColors.appearance(ThemePalette.system(), Appearance.DARK));
        eq("accent-only retains appearance", Appearance.LIGHT, NativeThemeColors.appearance(palette(ACCENT, 0xFF123456), Appearance.LIGHT));
        eq("null appearance safe", null, NativeThemeColors.appearance(palette(BACKGROUND, 0), null));
        eq("unknown enum safe", OtherAppearance.SYSTEM, NativeThemeColors.appearance(palette(BACKGROUND, 0), OtherAppearance.SYSTEM));
        for (ThemeRole role : ThemeRole.values())
            eq("native system preserves " + role, null, NativeThemeColors.role(ThemePalette.system(), role));
        ThemePalette light = palette(BACKGROUND, 0xFFCCCCCC);
        ThemePalette dark = palette(BACKGROUND, 0xFF102030);
        eq("background-only light text", 0xFF0F0F0F, NativeThemeColors.role(light, PRIMARY_TEXT));
        eq("background-only dark text", 0xFFF1F1F1, NativeThemeColors.role(dark, PRIMARY_TEXT));
        eq("accent alone leaves native text", null, NativeThemeColors.role(palette(ACCENT, 0xFFFF0000), PRIMARY_TEXT));
        eq("explicit primary wins", 0xFF123456,
                NativeThemeColors.role(palette(BACKGROUND, 0xFFFFFFFF, PRIMARY_TEXT, 0xFF123456), PRIMARY_TEXT));
        eq("alpha multiplier preserves transparency", 0x40123456, NativeThemeColors.withOpacity(0x80123456, 0.5));
        eq("transparent remains transparent", 0x00123456, NativeThemeColors.withOpacity(0x00123456, 0.7));
        eq("native dark Litho", 0xFF102030, NativeThemeColors.lithoBackground(dark, 0xFF0F0F0F, true));
        eq("native light Litho", 0xFF102030, NativeThemeColors.lithoBackground(dark, 0xFFFFFFFF, false));
        eq("Litho alpha", 0xFA102030, NativeThemeColors.lithoBackground(dark, 0xFA212121, true));
        eq("selected chip foreground retained", 0xFFFFFFFF, NativeThemeColors.lithoBackground(dark, 0xFFFFFFFF, true));
        eq("light selected chip retained", 0xFF0F0F0F, NativeThemeColors.lithoBackground(light, 0xFF0F0F0F, false));
        eq("unknown Litho color retained", 0xFFAA1234, NativeThemeColors.lithoBackground(dark, 0xFFAA1234, true));
        eq("accent only keeps backgrounds", 0xFF0F0F0F,
                NativeThemeColors.lithoBackground(palette(ACCENT, 0xFFAA1234), 0xFF0F0F0F, true));
        eq("system restores original", 0xFF0F0F0F,
                NativeThemeColors.lithoBackground(ThemePalette.system(), 0xFF0F0F0F, true));
    }

    private static void glowPolicy() {
        AfterglowPrefs.resetAll();
        GlowStyle defaults = GlowStyle.current();
        eq("glow defaults off", false, defaults.enabled);
        eq("glow default scopes", true, defaults.pivot && defaults.overlay && defaults.scrubber && !defaults.seekBar);
        eq("glow default strength", 50, defaults.strength);
        eq("glow default opacity", .5f, defaults.opacity(.5f, 0));
        eq("glow default radius", 30f, defaults.radius(30, 0));
        eq("glow cache stable", defaults, GlowStyle.current());
        for (int mode=0; mode<4; mode++) {
            AfterglowPrefs.update(Map.of("theme_glowStrengthMode", mode, "theme_glowStrengthCustom", 91));
            eq("glow mode " + mode, new int[]{25,50,80,91}[mode], GlowStyle.current().strength);
        }
        AfterglowPrefs.update(Map.of("theme_glowEnabled", true, "theme_glowStrengthMode", 1,
                "theme_glowLayers", 12, "theme_glowOpacity", 50, "theme_glowRadius", 100));
        GlowStyle tuned = GlowStyle.current();
        eq("glow opacity multiplier", .25f, tuned.opacity(.5f, 0));
        eq("glow radius multiplier", 60f, tuned.radius(30, 0));
        eq("glow layer radius", 87f, tuned.radius(30, 1));
        eq("glow layer opacity", .18f, tuned.opacity(.5f, 1));
        eq("glow layers bounded", 12, tuned.layers);
        ThemeDocument draft = ThemeStore.activeDocument(); int before = writes;
        draft.glow.put("strengthMode", 3); draft.glow.put("strengthCustom", 0);
        draft.glow.put("seekBar", true); draft.colors.put(GLOW, 0xFF55AAFF);
        GlowStyle preview = GlowStyle.preview(draft);
        eq("preview strength independent", 0, preview.strength);
        eq("preview scope independent", true, preview.seekBar);
        eq("preview color independent", 0xFF55AAFF, preview.color);
        eq("zero strength no glow", 0f, preview.opacity(1, 0));
        eq("preview never writes", before, writes);
        eq("preview preserves active style", tuned, GlowStyle.current());
    }

    private static void seekMotion() {
        SeekMotion motion = new SeekMotion();
        eq("first scrubber draw native position", 10f, motion.update(10, 0, true));
        eq("seek begins from current position", 10f, motion.update(110, 100, true));
        eq("seek linear midpoint", 60f, motion.update(110, 200, true));
        eq("seek completes after 200ms", 110f, motion.update(110, 300, true));
        eq("completed seek stops invalidating", false, motion.active(300));
        motion.update(210, 400, true);
        eq("new target does not jump", 160f, motion.update(310, 500, true));
        eq("retarget linear midpoint", 235f, motion.value(600));
        eq("dragging tracks exact finger position", 40f, motion.update(40, 610, false));
        eq("disabled animation stops invalidating", false, motion.active(610));
    }

    private enum Appearance { LIGHT, DARK }
    private enum OtherAppearance { SYSTEM }

    private static void transactionsAndCache() {
        // Listener predates ThemeStore initialization: reads in callbacks must still be fresh.
        final String[] observed = {null};
        final int[] notifications = {0};
        AfterglowPrefs.Listener listener = key -> {
            observed[0] = ThemeStore.snapshot().palette.identifier;
            notifications[0]++;
        };
        AfterglowPrefs.addListener(listener);
        ThemeStore.Snapshot initial = ThemeStore.snapshot();
        int readCount = reads;
        for (int i = 0; i < 100; i++) {
            ThemeColors.color(ThemeColors.BACKGROUND);
            ThemeColors.gradientEnabled();
            ThemeColors.pageStyleOverride();
        }
        eq("drawing never recopies preferences", readCount, reads);
        AfterglowPrefs.setInt("wiFiQualityIndex", 4);
        eq("unrelated pref retains palette revision", initial, ThemeStore.snapshot());
        AfterglowPrefs.setInt("theme_fontMode", 3);
        AfterglowPrefs.setInt("theme_glowStrengthCustom", 71);
        AfterglowPrefs.setString("theme_savedThemes", "library retained");
        AfterglowPrefs.setString("theme_semanticTheme", "old identity");
        AfterglowPrefs.setInt("theme_glowColor", 0xFF0099FF);
        int writeCount = writes;
        int noticeCount = notifications[0];
        ThemeStore.applyPreset("afterglow-1");
        eq("preset one storage write", writeCount + 1, writes);
        eq("preset one notification", noticeCount + 1, notifications[0]);
        eq("listener sees complete new preset", "afterglow-1", observed[0]);
        eq("unrelated pref retained", 4, AfterglowPrefs.getInt("wiFiQualityIndex"));
        eq("typography retained", 3, AfterglowPrefs.getInt("theme_fontMode"));
        eq("glow preset applied", true, AfterglowPrefs.getBool("theme_glowEnabled"));
        eq("old glow override cleared", false, AfterglowPrefs.contains("theme_glowColor"));
        eq("old semantic record replaced", true, AfterglowPrefs.getString("theme_semanticTheme").contains("afterglow-1"));
        ThemeStore.Snapshot before = ThemeStore.snapshot();
        ThemeStore.applyPreset("afterglow-1");
        eq("same palette does not increment revision", before, ThemeStore.snapshot());
        ThemeStore.applyPreset("oled-dark");
        eq("preset change increments revision", before.revision + 1, ThemeStore.snapshot().revision);
        eq("solid preset removes gradient", false, ThemeColors.gradientEnabled());
        eq("preset disables glow", false, AfterglowPrefs.getBool("theme_glowEnabled"));
        eq("legacy read uses cached explicit color", 0xFF000000, ThemeColors.color("theme_background"));
        before = ThemeStore.snapshot();
        AfterglowPrefs.setString("theme_background", "#909090");
        eq("legacy write invalidates snapshot", before.revision + 1, ThemeStore.snapshot().revision);
        eq("legacy custom foundation", 0, ThemeColors.pageStyleOverride());
        AfterglowPrefs.replaceAll(Map.of("theme_background", "#112233", "backgroundPlayback", true));
        eq("import invalidates palette", 0xFF112233, ThemeColors.color("theme_background"));
        AfterglowPrefs.setString("theme_background", "malformed");
        eq("bad import returns native", "system", ThemeStore.snapshot().palette.identifier);

        AfterglowPrefs.setInt("theme_fontMode", 3);
        AfterglowPrefs.setInt("theme_glowStrengthCustom", 71);
        AfterglowPrefs.setString("theme_savedThemes", "library retained");
        ThemeStore.applyPreset("afterglow-1");
        AfterglowPrefs.setInt("theme_glowColor", 0xFF00AA33);
        ThemeStore.resetToSystem();
        eq("reset system", "system", ThemeStore.snapshot().palette.identifier);
        for (ThemeRole role : ThemeRole.values()) if (role.legacyKey != null)
            eq("reset removes " + role, false, AfterglowPrefs.contains(role.legacyKey));
        eq("reset removes glow switch", false, AfterglowPrefs.contains("theme_glowEnabled"));
        eq("reset keeps typography", 3, AfterglowPrefs.getInt("theme_fontMode"));
        eq("reset keeps glow tuning", 71, AfterglowPrefs.getInt("theme_glowStrengthCustom"));
        eq("reset keeps saved library", "library retained", AfterglowPrefs.getString("theme_savedThemes"));
        eq("reset keeps playback", true, AfterglowPrefs.getBool("backgroundPlayback"));
        before = ThemeStore.snapshot();
        writeCount = writes;
        try { ThemeStore.applyPreset("no-such-theme"); throw new AssertionError("accepted unknown preset"); }
        catch (IllegalArgumentException expected) { checks++; }
        eq("invalid preset does not write", writeCount, writes);
        eq("invalid preset retains palette", before, ThemeStore.snapshot());
        try { AfterglowPrefs.update(Map.of("theme_background", 12, "bad", new Object()));
            throw new AssertionError("accepted invalid preference"); }
        catch (IllegalArgumentException expected) { checks++; }
        eq("invalid transaction does not write", writeCount, writes);
        AfterglowPrefs.resetAll();
        eq("whole prefs reset invalidates", "system", ThemeStore.snapshot().palette.identifier);
        AfterglowPrefs.removeListener(listener);
    }

    private static ThemePalette palette(Object... pairs) {
        Map<ThemeRole, Integer> colors = new EnumMap<>(ThemeRole.class);
        for (int i = 0; i < pairs.length; i += 2) colors.put((ThemeRole) pairs[i], (Integer) pairs[i + 1]);
        return ThemePalette.fromColors(colors);
    }

    private static void themeDocumentsAndLibrary() {
        AfterglowPrefs.resetAll();
        eq("rainbow defaults on in store", true, ThemeStore.seekBarRainbowEnabled());
        AfterglowPrefs.setBool("seekBarGradient", false);
        eq("explicit rainbow false wins", false, ThemeStore.seekBarRainbowEnabled());
        AfterglowPrefs.remove("seekBarGradient");
        for (ThemePalette preset : ThemeCatalog.PRESETS) {
            ThemeDocument source = ThemeDocument.fromPalette(preset);
            ThemeDocument decoded = ThemeDocument.parse(source.json());
            eq("portable preset colors " + preset.identifier, source.colors, decoded.colors);
            eq("portable preset identity " + preset.identifier, source.identifier, decoded.identifier);
        }
        ThemeDocument draft = ThemeDocument.fromPalette(ThemeCatalog.find("midnight-blue"));
        draft.identifier = ThemeDocument.freshIdentifier();
        draft.name = "  Corey's   Theme  ";
        draft.colors.put(BORDER, 0x60123456);
        draft.colors.put(SEEK_BUFFERED, 0x80556677);
        draft.colors.put(BACKGROUND, 0xFF112233);
        draft.lightFoundation = true;
        int writeCount = writes;
        ThemeDocument saved = ThemeStore.save(draft, true);
        eq("save and activate one transaction", writeCount + 1, writes);
        eq("normalized theme name", "Corey's Theme", saved.name);
        eq("custom identity retained", draft.identifier, ThemeStore.snapshot().palette.identifier);
        eq("explicit foundation retained", true, ThemeStore.snapshot().palette.lightFoundation);
        eq("nonlegacy border retained", 0x60123456, ThemeStore.snapshot().palette.explicit(BORDER));
        eq("library round trip", saved.json(), ThemeStore.savedTheme(saved.identifier).json());
        ThemeStore.Snapshot before = ThemeStore.snapshot();
        ThemeDocument duplicate = ThemeStore.duplicate(saved);
        eq("duplicate leaves active snapshot alone", before, ThemeStore.snapshot());
        eq("duplicate unique identity", false, duplicate.identifier.equals(saved.identifier));
        eq("duplicate unique name", "Corey's Theme Copy", duplicate.name);
        ThemeStore.rename(duplicate.identifier, saved.name);
        eq("name collisions numbered", "Corey's Theme 2", ThemeStore.savedTheme(duplicate.identifier).name);
        eq("rename inactive does not activate", saved.identifier, ThemeStore.snapshot().palette.identifier);
        ThemeStore.rename(saved.identifier, "Renamed");
        eq("rename active updates identity", "Renamed", ThemeStore.snapshot().palette.name);
        AfterglowPrefs.setInt("theme_glowColor", 0xFF123456);
        eq("independent glow keeps identity", saved.identifier, ThemeStore.snapshot().palette.identifier);
        AfterglowPrefs.setInt("theme_background", 0xFF010203);
        eq("legacy edit drops stale identity", "custom", ThemeStore.snapshot().palette.identifier);
        eq("legacy edit drops stale foundation", false, ThemeStore.snapshot().palette.lightFoundation);
        eq("legacy edit retains semantic overrides", 0x60123456, ThemeStore.snapshot().palette.color(BORDER));
        ThemeStore.activate(ThemeStore.savedTheme(saved.identifier));
        Map<String, Object> corruptRecord = new HashMap<>((Map<String, Object>) ThemeJson.parse(AfterglowPrefs.getString("theme_semanticTheme")));
        corruptRecord.put("legacySnapshot", Map.of("theme_background", "invalid"));
        AfterglowPrefs.setString("theme_semanticTheme", ThemeJson.write(corruptRecord));
        eq("corrupt identity snapshot drops identity", "custom", ThemeStore.snapshot().palette.identifier);
        eq("corrupt identity snapshot retains valid roles", 0x60123456, ThemeStore.snapshot().palette.color(BORDER));
        ThemeStore.activate(ThemeStore.savedTheme(saved.identifier));
        ThemeStore.delete(saved.identifier);
        eq("delete active keeps look", 0xFF112233, ThemeStore.snapshot().palette.color(BACKGROUND));
        eq("delete active drops identity", "custom", ThemeStore.snapshot().palette.identifier);
        eq("delete removes library entry", null, ThemeStore.savedTheme(saved.identifier));
        ThemeStore.resetToSystem();
        eq("reset retains library", 1, ThemeStore.savedThemes().size());
        eq("reset removes semantic extras", null, ThemeStore.snapshot().palette.color(BORDER));
        ThemeDocument exported = ThemeStore.activeDocument();
        exported.identifier = ThemeDocument.freshIdentifier(); exported.name = "Scalars";
        exported.colors.put(BACKGROUND, 0xFF112244);
        exported.glow.put("enabled", true); exported.glow.put("strengthMode", 3); exported.glow.put("strengthCustom", 73);
        exported.typography.put("fontMode", 2);
        exported.seekBarRainbow = false;
        ThemeStore.importTheme(ThemeDocument.parse(exported.json()));
        eq("import creates new custom identifier", false, exported.identifier.equals(ThemeStore.snapshot().palette.identifier));
        eq("import glow", true, AfterglowPrefs.getBool("theme_glowEnabled"));
        eq("import glow tuning", 73, AfterglowPrefs.getInt("theme_glowStrengthCustom"));
        eq("import typography", 2, AfterglowPrefs.getInt("theme_fontMode"));
        eq("import rainbow", false, AfterglowPrefs.getBool("seekBarGradient"));
        int libraryCount = ThemeStore.savedThemes().size();
        ThemeStore.importTheme(ThemeDocument.fromPalette(ThemeCatalog.find("warm-sand")));
        eq("import built-in does not add library entry", libraryCount, ThemeStore.savedThemes().size());
        eq("import built-in identity", "warm-sand", ThemeStore.snapshot().palette.identifier);
        int count = writes;
        ThemeDocument incomplete = saved.copy(); incomplete.colors.put(GRADIENT_START, 0xFF112233);
        rejects("incomplete gradient rejected", () -> ThemeStore.save(incomplete, true));
        eq("invalid gradient makes no writes", count, writes);
        rejects("built-in save rejected", () -> ThemeStore.save(ThemeDocument.fromPalette(ThemeCatalog.find("warm-sand")), true));
        rejects("empty rename rejected", () -> ThemeStore.rename(duplicate.identifier, "  "));
        for (String bad : new String[]{"", "{}", "{\"format\":\"YTAfterglowTheme\",\"version\":2}",
                "[]", "true", "{\"a\":1,\"a\":2}", "[1,]", "01", "1e999", "1.", "{\"a\":NaN}", "\"\\u+000\""})
            rejects("invalid theme JSON " + bad, () -> ThemeDocument.parse(bad));
        Map<String, Object> schema = new HashMap<>(saved.toMap()); schema.put("unknown", true);
        rejects("unknown field rejected", () -> ThemeDocument.fromMap(schema));
        schema.remove("unknown"); schema.put("colors", Map.of("background", java.util.List.of(2, 0, 0)));
        rejects("out-of-range component rejected", () -> ThemeDocument.fromMap(schema));
        eq("escaped JSON roundtrip", "\"quote\"\\path\n\t中文", ThemeJson.parse(ThemeJson.write("\"quote\"\\path\n\t中文")));
        eq("malformed library does not crash", 0, corruptLibrary());
        AfterglowPrefs.resetAll();
    }

    private static int corruptLibrary() {
        AfterglowPrefs.setString("theme_savedThemes", "corrupt");
        return ThemeStore.savedThemes().size();
    }
    private static void rejects(String message, Runnable work) {
        try { work.run(); throw new AssertionError(message); }
        catch (IllegalArgumentException expected) { checks++; }
    }

    private static void eq(String message, Object expected, Object actual) {
        checks++;
        if (!Objects.equals(expected, actual)) throw new AssertionError(message + ": expected " + expected + ", got " + actual);
    }

    private static SharedPreferences memoryPreferences() {
        return (SharedPreferences) Proxy.newProxyInstance(ThemeEngineTest.class.getClassLoader(),
                new Class<?>[] {SharedPreferences.class}, (proxy, method, args) -> {
                    String name = method.getName();
                    if (name.equals("getAll")) { reads++; return new HashMap<>(stored); }
                    if (name.equals("contains")) return stored.containsKey(args[0]);
                    if (name.startsWith("get")) return stored.getOrDefault(args[0], args[1]);
                    if (name.equals("edit")) return editor();
                    return null;
                });
    }

    private static SharedPreferences.Editor editor() {
        Map<String, Object> pending = new HashMap<>();
        boolean[] clear = {false};
        return (SharedPreferences.Editor) Proxy.newProxyInstance(ThemeEngineTest.class.getClassLoader(),
                new Class<?>[] {SharedPreferences.Editor.class}, (proxy, method, args) -> {
                    String name = method.getName();
                    if (name.startsWith("put")) pending.put((String) args[0], args[1]);
                    else if (name.equals("remove")) pending.put((String) args[0], null);
                    else if (name.equals("clear")) clear[0] = true;
                    else if (name.equals("apply") || name.equals("commit")) {
                        if (clear[0]) stored.clear();
                        for (Map.Entry<String, Object> entry : pending.entrySet()) {
                            if (entry.getValue() == null) stored.remove(entry.getKey());
                            else stored.put(entry.getKey(), entry.getValue());
                        }
                        writes++;
                        return name.equals("commit") ? true : null;
                    }
                    return proxy;
                });
    }
}
