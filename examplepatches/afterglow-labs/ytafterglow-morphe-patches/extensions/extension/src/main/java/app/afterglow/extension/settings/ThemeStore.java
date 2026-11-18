package app.afterglow.extension.settings;

import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;
import java.util.LinkedHashMap;
import java.util.EnumMap;
import java.util.Locale;
import java.util.Objects;

/**
 * Shared color store for Afterglow views and YouTube adapters. One immutable
 * snapshot per color revision; drawing never copies SharedPreferences or resolves presets.
 * Custom-library changes and activation are atomic preference transactions.
 */
public final class ThemeStore {
    public static final class Snapshot {
        public final long revision;
        public final ThemePalette palette;
        private Snapshot(long revision, ThemePalette palette) {
            this.revision = revision;
            this.palette = palette;
        }
    }

    private static volatile Snapshot current;
    private static volatile long preferencesRevision = -1;

    private ThemeStore() {}

    public static Snapshot snapshot() {
        long revision = AfterglowPrefs.revision();
        if (preferencesRevision == revision) {
            Snapshot snapshot = current;
            if (snapshot != null) return snapshot;
        }
        synchronized (ThemeStore.class) {
            // Do not cache startup defaults before Android has supplied an application context.
            if (!AfterglowPrefs.available()) return new Snapshot(0, ThemePalette.system());
            revision = AfterglowPrefs.revision();
            if (current == null || preferencesRevision != revision) {
                Map<String, ?> values;
                do {
                    revision = AfterglowPrefs.revision();
                    values = AfterglowPrefs.snapshot();
                } while (revision != AfterglowPrefs.revision());
                ThemePalette palette = resolve(values);
                if (current == null || !current.palette.equals(palette)) {
                    current = new Snapshot(current == null ? 1 : current.revision + 1, palette);
                }
                preferencesRevision = revision;
            }
            return current;
        }
    }

    /** Apply a shipped preset in one preference transaction, preserving unrelated settings. */
    public static void applyPreset(String identifier) {
        if ("system".equals(identifier)) {
            resetToSystem();
            return;
        }
        ThemePalette preset = ThemeCatalog.find(identifier);
        if (preset == null) throw new IllegalArgumentException("Unknown Afterglow theme: " + identifier);
        activate(ThemeDocument.fromPalette(preset));
    }

    public static ThemeDocument activeDocument() {
        ThemeDocument document = ThemeDocument.fromPalette(snapshot().palette);
        Map<String, ?> preferences = AfterglowPrefs.snapshot();
        document.glowEnabled = AfterglowPrefs.getBool("theme_glowEnabled");
        document.seekBarRainbow = seekBarRainbowEnabled();
        document.typography = new LinkedHashMap<>();
        for (String key : ThemeDocument.TYPOGRAPHY) document.typography.put(key, AfterglowPrefs.getInt("theme_" + key));
        document.glow = new LinkedHashMap<>();
        for (String key : ThemeDocument.GLOW_FLAGS) document.glow.put(key, AfterglowPrefs.getBool(glowKey(key)));
        document.glow.put("strengthMode", bounded(preferences, "theme_glowStrengthMode",
                bounded(preferences, "theme_glowStrength", 1, 0, 2), 0, 3));
        document.glow.put("strengthCustom", bounded(preferences, "theme_glowStrengthCustom", 50, 0, 100));
        document.glow.put("opacity", bounded(preferences, "theme_glowOpacity", 100, 0, 100));
        document.glow.put("radius", bounded(preferences, "theme_glowRadius", 50, 0, 100));
        document.glow.put("layers", bounded(preferences, "theme_glowLayers", 1, 1, 12));
        return document;
    }

    /** The iOS theme store defaults rainbow on when the legacy key is absent. */
    public static boolean seekBarRainbowEnabled() {
        return !AfterglowPrefs.contains("seekBarGradient") || AfterglowPrefs.getBool("seekBarGradient");
    }

    static int bounded(Map<String, ?> prefs, String key, int fallback, int min, int max) {
        Object value = prefs.get(key);
        return value instanceof Number ? Math.max(min, Math.min(max, ((Number) value).intValue())) : fallback;
    }

    public static String glowKey(String name) {
        return "theme_glow" + Character.toUpperCase(name.charAt(0)) + name.substring(1);
    }

    public static synchronized void activate(ThemeDocument document) {
        AfterglowPrefs.update(activation(document));
    }

    private static Map<String, Object> activation(ThemeDocument document) {
        // Round-trip validation also rejects invalid public scalar-map mutations before writing.
        document = document.copy();
        Map<String, Object> changes = clearedColors();
        Map<String, Object> record = new LinkedHashMap<>();
        Map<String, Object> extras = new LinkedHashMap<>();
        Map<String, Object> legacy = new LinkedHashMap<>();
        for (Map.Entry<ThemeRole, Integer> entry : document.colors.entrySet()) {
            ThemeRole role = entry.getKey();
            if (role.legacyKey == null) extras.put(role.semanticName, ThemeDocument.components(entry.getValue()));
            else {
                changes.put(role.legacyKey, entry.getValue());
                legacy.put(role.legacyKey, ThemeDocument.components(entry.getValue()));
            }
        }
        record.put("version", 1);
        record.put("identifier", document.identifier);
        record.put("name", document.name);
        if (document.summary != null) record.put("summary", document.summary);
        if (document.lightFoundation != null) record.put("lightFoundation", document.lightFoundation);
        record.put("colors", extras);
        record.put("legacySnapshot", legacy);
        Map<String, Object> scalars = new LinkedHashMap<>();
        if (document.glowEnabled != null) changes.put("theme_glowEnabled", document.glowEnabled);
        if (document.seekBarRainbow != null) {
            changes.put("seekBarGradient", document.seekBarRainbow);
            scalars.put("seekBarRainbow", document.seekBarRainbow);
        }
        if (document.typography != null) {
            for (Map.Entry<String, Object> entry : document.typography.entrySet()) changes.put("theme_" + entry.getKey(), entry.getValue());
            scalars.put("typography", document.typography);
        }
        if (document.glow != null) {
            for (Map.Entry<String, Object> entry : document.glow.entrySet()) changes.put(glowKey(entry.getKey()), entry.getValue());
            changes.put("theme_glowStrength", document.glow.get("strengthMode"));
            scalars.put("glow", document.glow);
        }
        record.put("scalars", scalars);
        changes.put("theme_semanticTheme", ThemeJson.write(record));
        return changes;
    }

    /** Non-legacy overrides survive direct legacy edits; stale identity/foundation do not. */
    static ThemePalette resolve(Map<String, ?> preferences) {
        ThemePalette legacy = ThemePalette.fromPreferences(preferences);
        Object raw = preferences.get("theme_semanticTheme");
        if (!(raw instanceof String)) return legacy;
        try {
            Map<?, ?> record = ThemeDocument.map(ThemeJson.parse((String) raw), "record");
            ThemeDocument.integer(record, "version", 1, 1);
            EnumMap<ThemeRole, Integer> colors = new EnumMap<>(ThemeRole.class);
            colors.putAll(legacy.explicitColors());
            Object extras = record.get("colors");
            if (extras instanceof Map) for (ThemeRole role : ThemeRole.values()) {
                if (role.legacyKey == null && ((Map<?, ?>) extras).containsKey(role.semanticName)) {
                    try { colors.put(role, ThemeDocument.color(((Map<?, ?>) extras).get(role.semanticName))); }
                    catch (IllegalArgumentException ignored) { /* one corrupt role does not erase the others */ }
                }
            }
            ThemePalette derived = ThemePalette.fromColors(colors);
            if (derived.builtIn || colors.isEmpty()) return derived;
            Object old = record.get("legacySnapshot");
            boolean matches = old instanceof Map;
            if (matches) for (ThemeRole role : ThemeRole.values()) {
                if (role.legacyKey == null || role == ThemeRole.GLOW) continue;
                Object stored = ((Map<?, ?>) old).get(role.legacyKey);
                Integer color;
                try { color = stored == null ? null : ThemeDocument.color(stored); }
                catch (IllegalArgumentException ignored) { matches = false; break; }
                if (!Objects.equals(color, legacy.explicit(role))) { matches = false; break; }
            }
            String id = record.get("identifier") instanceof String ? (String) record.get("identifier") : "custom";
            String name = record.get("name") instanceof String ? (String) record.get("name") : "Custom";
            boolean identity = matches && !id.isEmpty() && !name.isEmpty() && !id.equals("system") && ThemeCatalog.find(id) == null;
            return new ThemePalette(identity ? id : "custom", identity ? name : "Custom",
                    identity && record.get("summary") instanceof String ? (String) record.get("summary") : null,
                    false, matches && record.get("lightFoundation") instanceof Boolean
                    ? (Boolean) record.get("lightFoundation") : derived.lightFoundation,
                    preferences.get("theme_glowEnabled") instanceof Boolean ? (Boolean) preferences.get("theme_glowEnabled") : null, colors);
        } catch (IllegalArgumentException ignored) { return legacy; }
    }

    public static List<ThemeDocument> savedThemes() {
        List<ThemeDocument> result = new ArrayList<>();
        String raw = AfterglowPrefs.getString("theme_savedThemes");
        if (raw == null) return result;
        try {
            Object decoded = ThemeJson.parse(raw);
            if (decoded instanceof List) for (Object item : (List<?>) decoded) {
                try {
                    ThemeDocument document = ThemeDocument.fromMap(item);
                    if (editable(document.identifier)) result.add(document);
                } catch (IllegalArgumentException ignored) { /* retain valid library entries */ }
            }
        } catch (IllegalArgumentException ignored) { /* malformed external preferences */ }
        return result;
    }

    public static ThemeDocument savedTheme(String identifier) {
        for (ThemeDocument document : savedThemes()) if (document.identifier.equals(identifier)) return document;
        return null;
    }

    private static boolean editable(String id) {
        return id != null && !id.isEmpty() && !id.equals("system") && !id.equals("custom") && ThemeCatalog.find(id) == null;
    }

    public static synchronized ThemeDocument duplicate(ThemeDocument source) {
        ThemeDocument copy = source.copy();
        copy.identifier = ThemeDocument.freshIdentifier();
        copy.name = source.name + " Copy";
        return save(copy, false);
    }

    public static synchronized ThemeDocument save(ThemeDocument draft, boolean activate) {
        if (!editable(draft.identifier)) throw new IllegalArgumentException("Built-in presets cannot be edited; duplicate the preset first.");
        ThemeDocument document = draft.copy();
        List<ThemeDocument> themes = savedThemes();
        document.name = uniqueName(document.name, document.identifier, themes);
        int index = -1;
        for (int i = 0; i < themes.size(); i++) if (themes.get(i).identifier.equals(document.identifier)) index = i;
        if (index < 0) themes.add(document); else themes.set(index, document);
        Map<String, Object> changes = activate ? activation(document) : new HashMap<>();
        changes.put("theme_savedThemes", libraryJson(themes));
        AfterglowPrefs.update(changes);
        return document;
    }

    public static synchronized void rename(String identifier, String name) {
        ThemeDocument document = savedTheme(identifier);
        if (document == null) throw new IllegalArgumentException("That saved theme no longer exists.");
        document.name = name;
        save(document, snapshot().palette.identifier.equals(identifier));
    }

    public static synchronized void delete(String identifier) {
        List<ThemeDocument> themes = savedThemes();
        if (!editable(identifier) || !themes.removeIf(theme -> theme.identifier.equals(identifier)))
            throw new IllegalArgumentException("That saved theme cannot be deleted.");
        Map<String, Object> changes = new HashMap<>();
        if (snapshot().palette.identifier.equals(identifier)) {
            ThemeDocument active = activeDocument();
            active.identifier = "custom"; active.name = "Custom";
            changes.putAll(activation(active));
        }
        changes.put("theme_savedThemes", libraryJson(themes));
        AfterglowPrefs.update(changes);
    }

    public static synchronized void importTheme(ThemeDocument imported) {
        ThemeDocument document = imported.copy();
        if (ThemeCatalog.match(document.colors) != null) { activate(document); return; }
        document.identifier = ThemeDocument.freshIdentifier();
        save(document, true);
    }

    private static String libraryJson(List<ThemeDocument> themes) {
        List<Object> records = new ArrayList<>();
        for (ThemeDocument theme : themes) records.add(theme.toMap());
        return ThemeJson.write(records);
    }

    private static String uniqueName(String proposed, String id, List<ThemeDocument> themes) {
        java.util.Set<String> names = new java.util.HashSet<>();
        for (ThemeDocument theme : themes) if (!theme.identifier.equals(id)) names.add(theme.name.toLowerCase(Locale.ROOT));
        for (ThemePalette theme : ThemeCatalog.PRESETS) names.add(theme.name.toLowerCase(Locale.ROOT));
        String base = ThemeDocument.normalizedName(proposed);
        if (base.isEmpty()) throw new IllegalArgumentException("The theme needs a name.");
        String name = base;
        for (int index = 2; names.contains(name.toLowerCase(Locale.ROOT)); index++) {
            String suffix = " " + index;
            name = base.substring(0, Math.min(base.length(), 64 - suffix.length())) + suffix;
        }
        return name;
    }

    /** iOS resetToSystemTheme: remove colors, enabled glow and identity; keep saved themes and typography. */
    public static void resetToSystem() {
        Map<String, Object> changes = clearedColors();
        changes.put("theme_glowEnabled", null);
        AfterglowPrefs.update(changes);
    }

    private static Map<String, Object> clearedColors() {
        Map<String, Object> changes = new HashMap<>();
        for (ThemeRole role : ThemeRole.values()) if (role.legacyKey != null) changes.put(role.legacyKey, null);
        changes.put("theme_semanticTheme", null);
        return changes;
    }
}
