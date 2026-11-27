package dev.srwi.gintype.extension.customholdpopups;

import android.content.Context;
import android.content.SharedPreferences;
import dev.srwi.gintype.extension.flagsettings.GboardBooleanFlagSettings;
import dev.srwi.gintype.extension.settings.GboardPatchesSettings;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Persistent settings and global language-independent custom hold popup rule store.
 */
public final class GboardCustomHoldPopupsSettings {

    public static final String PREF_KEY_ENABLED = "pref_custom_hold_popups_enabled";
    public static final String PREF_KEY_LOCK_KEYS = "pref_custom_hold_popups_lock_keys";
    public static final String PREF_KEY_HOLD_DURATION_MS =
            "pref_custom_hold_popups_hold_duration_ms";
    public static final String PREF_KEY_BINDINGS_JSON =
            "pref_custom_hold_popups_bindings_json";

    public static final boolean DEFAULT_ENABLED = true;
    public static final boolean DEFAULT_LOCK_KEYS = false;

    public static final int MIN_HOLD_DURATION_MS = 1000;
    public static final int MAX_HOLD_DURATION_MS = 4000;
    public static final int DEFAULT_HOLD_DURATION_MS = 2000;
    public static final int HOLD_DURATION_STEP_MS = 100;

    public static final String PENCIL_SYMBOL = "\u270E";

    /**
     * Represents a single customized hold popup entry (either a modified default symbol or a
     * user-added symbol) for a normalized base key.
     */
    public static final class CustomEntry {
        public final String baseKey;
        public final boolean userAdded;
        public final String originalSymbol; // non-empty for modified defaults; empty for userAdded
        public final int addedIndex;        // >= 0 for userAdded; -1 for modified defaults
        public final String replacementSymbol;

        public CustomEntry(
                String baseKey,
                boolean userAdded,
                String originalSymbol,
                int addedIndex,
                String replacementSymbol) {
            this.baseKey = normalizeBaseKey(baseKey);
            this.userAdded = userAdded;
            this.originalSymbol = originalSymbol == null ? "" : originalSymbol;
            this.addedIndex = addedIndex;
            this.replacementSymbol = replacementSymbol == null ? "" : replacementSymbol;
        }
    }

    /**
     * Per-key rule set containing modified default symbol replacements and user-added symbols.
     */
    public static final class KeyHoldRules {
        public final String baseKey;
        public final Map<String, String> modifiedDefaults;
        public final List<String> addedSymbols;

        public KeyHoldRules(
                String baseKey,
                Map<String, String> modifiedDefaults,
                List<String> addedSymbols) {
            this.baseKey = normalizeBaseKey(baseKey);
            this.modifiedDefaults = modifiedDefaults == null
                    ? Collections.emptyMap()
                    : Collections.unmodifiableMap(new LinkedHashMap<String, String>(modifiedDefaults));
            this.addedSymbols = addedSymbols == null
                    ? Collections.emptyList()
                    : Collections.unmodifiableList(new ArrayList<String>(addedSymbols));
        }

        public boolean isEmpty() {
            return modifiedDefaults.isEmpty() && addedSymbols.isEmpty();
        }
    }

    private GboardCustomHoldPopupsSettings() {
    }

    public static String normalizeBaseKey(String rawKey) {
        if (rawKey == null) {
            return "";
        }
        String trimmed = rawKey.trim();
        if (trimmed.isEmpty()) {
            return "";
        }
        return trimmed.toLowerCase(Locale.ROOT);
    }

    public static String normalizeDefaultKey(String rawSymbol) {
        if (rawSymbol == null) {
            return "";
        }
        String trimmed = rawSymbol.trim();
        if (trimmed.isEmpty()) {
            return "";
        }
        return trimmed.toLowerCase(Locale.ROOT);
    }

    public static boolean isShiftedKeyLabel(String rawKeyLabel, String normalizedBaseKey) {
        if (rawKeyLabel == null || normalizedBaseKey == null) {
            return false;
        }
        String trimmed = rawKeyLabel.trim();
        if (trimmed.isEmpty() || trimmed.equals(normalizedBaseKey)) {
            return false;
        }
        for (int i = 0; i < trimmed.length(); i++) {
            char ch = trimmed.charAt(i);
            if (Character.isLetter(ch) && Character.isUpperCase(ch)) {
                return true;
            }
        }
        return false;
    }

    public static String applyShiftCaseIfSingleLetter(String symbol, boolean shifted) {
        if (symbol == null || !shifted) {
            return symbol;
        }
        if (symbol.length() == 1 && Character.isLetter(symbol.charAt(0))) {
            return symbol.toUpperCase(Locale.ROOT);
        }
        return symbol;
    }

    public static SharedPreferences resolvePreferences(Context context) {
        if (context == null) return null;
        return GboardPatchesSettings.preferencesOrNull(context);
    }

    public static void ensureDefaults(SharedPreferences preferences) {
        GboardBooleanFlagSettings.ensureDefault(
                preferences, PREF_KEY_ENABLED, DEFAULT_ENABLED);
        GboardBooleanFlagSettings.ensureDefault(
                preferences, PREF_KEY_LOCK_KEYS, DEFAULT_LOCK_KEYS);
        if (preferences == null) return;
        SharedPreferences.Editor editor = null;
        if (!preferences.contains(PREF_KEY_HOLD_DURATION_MS)) {
            editor = preferences.edit();
            editor.putInt(PREF_KEY_HOLD_DURATION_MS, DEFAULT_HOLD_DURATION_MS);
        }
        if (!preferences.contains(PREF_KEY_BINDINGS_JSON)) {
            if (editor == null) editor = preferences.edit();
            editor.putString(PREF_KEY_BINDINGS_JSON, "{}");
        }
        if (editor != null) {
            editor.commit();
        }
    }

    public static boolean readEnabled(Context context) {
        try {
            return readEnabled(resolvePreferences(context));
        } catch (Throwable ignored) {
            return DEFAULT_ENABLED;
        }
    }

    public static boolean readEnabled(SharedPreferences preferences) {
        return GboardBooleanFlagSettings.readEnabled(
                preferences, PREF_KEY_ENABLED, DEFAULT_ENABLED);
    }

    public static boolean writeEnabled(SharedPreferences preferences, boolean enabled) {
        boolean ok = GboardBooleanFlagSettings.writeEnabled(
                preferences, PREF_KEY_ENABLED, enabled);
        GboardCustomHoldPopupsRuntime.invalidateAndRefreshActiveKeyboards();
        return ok;
    }

    public static boolean readLockKeys(Context context) {
        try {
            return readLockKeys(resolvePreferences(context));
        } catch (Throwable ignored) {
            return DEFAULT_LOCK_KEYS;
        }
    }

    public static boolean readLockKeys(SharedPreferences preferences) {
        return GboardBooleanFlagSettings.readEnabled(
                preferences, PREF_KEY_LOCK_KEYS, DEFAULT_LOCK_KEYS);
    }

    public static boolean writeLockKeys(SharedPreferences preferences, boolean lockKeys) {
        boolean ok = GboardBooleanFlagSettings.writeEnabled(
                preferences, PREF_KEY_LOCK_KEYS, lockKeys);
        GboardCustomHoldPopupsRuntime.invalidateAndRefreshActiveKeyboards();
        return ok;
    }

    public static int readHoldDurationMs(Context context) {
        try {
            return readHoldDurationMs(resolvePreferences(context));
        } catch (Throwable ignored) {
            return DEFAULT_HOLD_DURATION_MS;
        }
    }

    public static int readHoldDurationMs(SharedPreferences preferences) {
        if (preferences == null) return DEFAULT_HOLD_DURATION_MS;
        try {
            return clamp(
                    preferences.getInt(PREF_KEY_HOLD_DURATION_MS, DEFAULT_HOLD_DURATION_MS),
                    MIN_HOLD_DURATION_MS,
                    MAX_HOLD_DURATION_MS);
        } catch (ClassCastException ignored) {
            return DEFAULT_HOLD_DURATION_MS;
        }
    }

    public static boolean writeHoldDurationMs(SharedPreferences preferences, int durationMs) {
        if (preferences == null) return false;
        int clamped = clamp(durationMs, MIN_HOLD_DURATION_MS, MAX_HOLD_DURATION_MS);
        boolean ok = preferences.edit().putInt(PREF_KEY_HOLD_DURATION_MS, clamped).commit();
        GboardCustomHoldPopupsRuntime.invalidateCachedSettings();
        return ok;
    }

    public static Map<String, KeyHoldRules> readAllRules(Context context) {
        return readAllRules(resolvePreferences(context));
    }

    public static Map<String, KeyHoldRules> readAllRules(SharedPreferences preferences) {
        if (preferences == null) {
            return Collections.emptyMap();
        }
        String rawJson;
        try {
            rawJson = preferences.getString(PREF_KEY_BINDINGS_JSON, "{}");
        } catch (ClassCastException ignored) {
            rawJson = "{}";
        }
        return parseRulesJson(rawJson);
    }

    public static KeyHoldRules readKeyRules(SharedPreferences preferences, String baseKey) {
        String normalized = normalizeBaseKey(baseKey);
        if (normalized.isEmpty()) {
            return new KeyHoldRules("", Collections.emptyMap(), Collections.emptyList());
        }
        Map<String, KeyHoldRules> all = readAllRules(preferences);
        KeyHoldRules existing = all.get(normalized);
        return existing != null
                ? existing
                : new KeyHoldRules(normalized, Collections.emptyMap(), Collections.emptyList());
    }

    public static List<CustomEntry> listAllCustomEntries(SharedPreferences preferences) {
        Map<String, KeyHoldRules> all = readAllRules(preferences);
        if (all.isEmpty()) {
            return Collections.emptyList();
        }
        List<String> sortedKeys = new ArrayList<String>(all.keySet());
        Collections.sort(sortedKeys);
        List<CustomEntry> entries = new ArrayList<CustomEntry>();
        for (String baseKey : sortedKeys) {
            KeyHoldRules rules = all.get(baseKey);
            if (rules == null) continue;
            for (Map.Entry<String, String> mod : rules.modifiedDefaults.entrySet()) {
                String orig = mod.getKey();
                String repl = mod.getValue();
                if (orig != null && !orig.isEmpty() && repl != null && !repl.isEmpty()) {
                    entries.add(new CustomEntry(baseKey, false, orig, -1, repl));
                }
            }
            for (int i = 0; i < rules.addedSymbols.size(); i++) {
                String added = rules.addedSymbols.get(i);
                if (added != null && !added.isEmpty()) {
                    entries.add(new CustomEntry(baseKey, true, "", i, added));
                }
            }
        }
        return entries;
    }

    public static boolean addCustomSymbol(
            SharedPreferences preferences,
            String baseKey,
            String newSymbol) {
        if (preferences == null) return false;
        String normalizedKey = normalizeBaseKey(baseKey);
        String sanitizedSymbol = sanitizeSymbol(newSymbol);
        if (normalizedKey.isEmpty() || sanitizedSymbol.isEmpty()) {
            return false;
        }
        Map<String, KeyHoldRules> all = new LinkedHashMap<String, KeyHoldRules>(
                readAllRules(preferences));
        KeyHoldRules current = all.get(normalizedKey);
        Map<String, String> modMap = current != null
                ? new LinkedHashMap<String, String>(current.modifiedDefaults)
                : new LinkedHashMap<String, String>();
        List<String> addedList = current != null
                ? new ArrayList<String>(current.addedSymbols)
                : new ArrayList<String>();
        addedList.add(sanitizedSymbol);
        all.put(normalizedKey, new KeyHoldRules(normalizedKey, modMap, addedList));
        return persistRules(preferences, all);
    }

    public static boolean updateAddedSymbol(
            SharedPreferences preferences,
            String baseKey,
            int addedIndex,
            String newSymbol) {
        return updateAddedSymbol(preferences, baseKey, addedIndex, null, newSymbol);
    }

    public static boolean updateAddedSymbol(
            SharedPreferences preferences,
            String baseKey,
            int addedIndex,
            String expectedOldSymbol,
            String newSymbol) {
        if (preferences == null) return false;
        String normalizedKey = normalizeBaseKey(baseKey);
        String sanitizedSymbol = sanitizeSymbol(newSymbol);
        if (normalizedKey.isEmpty() || sanitizedSymbol.isEmpty()) {
            return false;
        }
        Map<String, KeyHoldRules> all = new LinkedHashMap<String, KeyHoldRules>(
                readAllRules(preferences));
        KeyHoldRules current = all.get(normalizedKey);
        if (current == null || current.addedSymbols.isEmpty()) {
            return false;
        }
        int targetIndex = resolveAddedSymbolIndex(
                current.addedSymbols, addedIndex, expectedOldSymbol);
        if (targetIndex < 0) {
            return false;
        }
        Map<String, String> modMap = new LinkedHashMap<String, String>(current.modifiedDefaults);
        List<String> addedList = new ArrayList<String>(current.addedSymbols);
        addedList.set(targetIndex, sanitizedSymbol);
        all.put(normalizedKey, new KeyHoldRules(normalizedKey, modMap, addedList));
        return persistRules(preferences, all);
    }

    public static boolean deleteAddedSymbol(
            SharedPreferences preferences,
            String baseKey,
            int addedIndex) {
        return deleteAddedSymbol(preferences, baseKey, addedIndex, null);
    }

    public static boolean deleteAddedSymbol(
            SharedPreferences preferences,
            String baseKey,
            int addedIndex,
            String expectedOldSymbol) {
        if (preferences == null) return false;
        String normalizedKey = normalizeBaseKey(baseKey);
        if (normalizedKey.isEmpty()) return false;
        Map<String, KeyHoldRules> all = new LinkedHashMap<String, KeyHoldRules>(
                readAllRules(preferences));
        KeyHoldRules current = all.get(normalizedKey);
        if (current == null || current.addedSymbols.isEmpty()) {
            return false;
        }
        int targetIndex = resolveAddedSymbolIndex(
                current.addedSymbols, addedIndex, expectedOldSymbol);
        if (targetIndex < 0) {
            return false;
        }
        Map<String, String> modMap = new LinkedHashMap<String, String>(current.modifiedDefaults);
        List<String> addedList = new ArrayList<String>(current.addedSymbols);
        addedList.remove(targetIndex);
        KeyHoldRules updated = new KeyHoldRules(normalizedKey, modMap, addedList);
        if (updated.isEmpty()) {
            all.remove(normalizedKey);
        } else {
            all.put(normalizedKey, updated);
        }
        return persistRules(preferences, all);
    }

    private static int resolveAddedSymbolIndex(
            List<String> addedSymbols,
            int addedIndex,
            String expectedOldSymbol) {
        boolean hasExpected = expectedOldSymbol != null && !expectedOldSymbol.isEmpty();
        if (addedIndex >= 0 && addedIndex < addedSymbols.size()) {
            if (!hasExpected || expectedOldSymbol.equals(addedSymbols.get(addedIndex))) {
                return addedIndex;
            }
        }
        if (hasExpected) {
            return addedSymbols.indexOf(expectedOldSymbol);
        }
        return -1;
    }

    public static boolean setModifiedDefaultSymbol(
            SharedPreferences preferences,
            String baseKey,
            String originalDefaultSymbol,
            String replacementSymbol) {
        if (preferences == null) return false;
        String normalizedKey = normalizeBaseKey(baseKey);
        String normalizedOrig = normalizeDefaultKey(originalDefaultSymbol);
        String sanitizedReplacement = sanitizeSymbol(replacementSymbol);
        if (normalizedKey.isEmpty() || normalizedOrig.isEmpty() || sanitizedReplacement.isEmpty()) {
            return false;
        }
        if (sanitizedReplacement.equals(normalizedOrig)) {
            return resetModifiedDefaultSymbol(preferences, normalizedKey, normalizedOrig);
        }
        Map<String, KeyHoldRules> all = new LinkedHashMap<String, KeyHoldRules>(
                readAllRules(preferences));
        KeyHoldRules current = all.get(normalizedKey);
        Map<String, String> modMap = current != null
                ? new LinkedHashMap<String, String>(current.modifiedDefaults)
                : new LinkedHashMap<String, String>();
        List<String> addedList = current != null
                ? new ArrayList<String>(current.addedSymbols)
                : new ArrayList<String>();
        modMap.put(normalizedOrig, sanitizedReplacement);
        all.put(normalizedKey, new KeyHoldRules(normalizedKey, modMap, addedList));
        return persistRules(preferences, all);
    }

    public static boolean resetModifiedDefaultSymbol(
            SharedPreferences preferences,
            String baseKey,
            String originalDefaultSymbol) {
        if (preferences == null) return false;
        String normalizedKey = normalizeBaseKey(baseKey);
        String normalizedOrig = normalizeDefaultKey(originalDefaultSymbol);
        if (normalizedKey.isEmpty() || normalizedOrig.isEmpty()) return false;
        Map<String, KeyHoldRules> all = new LinkedHashMap<String, KeyHoldRules>(
                readAllRules(preferences));
        KeyHoldRules current = all.get(normalizedKey);
        if (current == null || !current.modifiedDefaults.containsKey(normalizedOrig)) {
            return true;
        }
        Map<String, String> modMap = new LinkedHashMap<String, String>(current.modifiedDefaults);
        modMap.remove(normalizedOrig);
        List<String> addedList = new ArrayList<String>(current.addedSymbols);
        KeyHoldRules updated = new KeyHoldRules(normalizedKey, modMap, addedList);
        if (updated.isEmpty()) {
            all.remove(normalizedKey);
        } else {
            all.put(normalizedKey, updated);
        }
        return persistRules(preferences, all);
    }

    public static boolean resetAllCustomBindings(SharedPreferences preferences) {
        if (preferences == null) return false;
        boolean ok = preferences.edit()
                .putString(PREF_KEY_BINDINGS_JSON, "{}")
                .commit();
        GboardCustomHoldPopupsRuntime.invalidateAndRefreshActiveKeyboards();
        return ok;
    }

    public static String sanitizeSymbol(String raw) {
        if (raw == null) return "";
        String cleaned = raw.replace("\r", "").replace("\n", "");
        if (cleaned.trim().isEmpty()) {
            return "";
        }
        if (PENCIL_SYMBOL.equals(cleaned.trim())) {
            return "";
        }
        return cleaned;
    }

    static Map<String, KeyHoldRules> parseRulesJson(String raw) {
        if (raw == null || raw.trim().isEmpty()) {
            return Collections.emptyMap();
        }
        String trimmed = raw.trim();
        if ("{}".equals(trimmed)) {
            return Collections.emptyMap();
        }
        Map<String, KeyHoldRules> result = new LinkedHashMap<String, KeyHoldRules>();
        try {
            String[] lines = raw.split("\n");
            for (String line : lines) {
                if (line == null || line.isEmpty()) continue;
                String[] parts = line.split("\t", -1);
                if (parts.length < 3) continue;
                String kind = parts[0];
                String normalizedKey = normalizeBaseKey(unescapeField(parts[1]));
                if (normalizedKey.isEmpty()) continue;

                KeyHoldRules existing = result.get(normalizedKey);
                Map<String, String> modMap = existing != null
                        ? new LinkedHashMap<String, String>(existing.modifiedDefaults)
                        : new LinkedHashMap<String, String>();
                List<String> addList = existing != null
                        ? new ArrayList<String>(existing.addedSymbols)
                        : new ArrayList<String>();

                if ("M".equals(kind) && parts.length >= 4) {
                    String normOrig = normalizeDefaultKey(unescapeField(parts[2]));
                    String repl = sanitizeSymbol(unescapeField(parts[3]));
                    if (!normOrig.isEmpty() && !repl.isEmpty() && !repl.equals(normOrig)) {
                        modMap.put(normOrig, repl);
                    }
                } else if ("A".equals(kind)) {
                    String added = sanitizeSymbol(unescapeField(parts[2]));
                    if (!added.isEmpty()) {
                        addList.add(added);
                    }
                }
                KeyHoldRules updated = new KeyHoldRules(normalizedKey, modMap, addList);
                if (!updated.isEmpty()) {
                    result.put(normalizedKey, updated);
                }
            }
        } catch (Throwable ignored) {
        }
        return result;
    }

    static String serializeRulesJson(Map<String, KeyHoldRules> rulesMap) {
        if (rulesMap == null || rulesMap.isEmpty()) {
            return "{}";
        }
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<String, KeyHoldRules> entry : rulesMap.entrySet()) {
            String normalizedKey = normalizeBaseKey(entry.getKey());
            KeyHoldRules rules = entry.getValue();
            if (normalizedKey.isEmpty() || rules == null || rules.isEmpty()) {
                continue;
            }
            String escapedKey = escapeField(normalizedKey);
            for (Map.Entry<String, String> mod : rules.modifiedDefaults.entrySet()) {
                String normOrig = normalizeDefaultKey(mod.getKey());
                String repl = sanitizeSymbol(mod.getValue());
                if (!normOrig.isEmpty() && !repl.isEmpty() && !repl.equals(normOrig)) {
                    if (sb.length() > 0) sb.append('\n');
                    sb.append("M\t")
                            .append(escapedKey)
                            .append('\t')
                            .append(escapeField(normOrig))
                            .append('\t')
                            .append(escapeField(repl));
                }
            }
            for (String added : rules.addedSymbols) {
                String sanitized = sanitizeSymbol(added);
                if (!sanitized.isEmpty()) {
                    if (sb.length() > 0) sb.append('\n');
                    sb.append("A\t")
                            .append(escapedKey)
                            .append('\t')
                            .append(escapeField(sanitized));
                }
            }
        }
        return sb.length() == 0 ? "{}" : sb.toString();
    }

    private static String escapeField(String value) {
        if (value == null) return "";
        StringBuilder sb = new StringBuilder(value.length());
        for (int i = 0; i < value.length(); i++) {
            char ch = value.charAt(i);
            if (ch == '\\') {
                sb.append("\\\\");
            } else if (ch == '\t') {
                sb.append("\\t");
            } else if (ch == '\n') {
                sb.append("\\n");
            } else if (ch == '\r') {
                sb.append("\\r");
            } else {
                sb.append(ch);
            }
        }
        return sb.toString();
    }

    private static String unescapeField(String escaped) {
        if (escaped == null || escaped.indexOf('\\') < 0) {
            return escaped == null ? "" : escaped;
        }
        StringBuilder sb = new StringBuilder(escaped.length());
        for (int i = 0; i < escaped.length(); i++) {
            char ch = escaped.charAt(i);
            if (ch == '\\' && i + 1 < escaped.length()) {
                char next = escaped.charAt(++i);
                if (next == 't') sb.append('\t');
                else if (next == 'n') sb.append('\n');
                else if (next == 'r') sb.append('\r');
                else sb.append(next);
            } else {
                sb.append(ch);
            }
        }
        return sb.toString();
    }

    private static boolean persistRules(
            SharedPreferences preferences,
            Map<String, KeyHoldRules> rulesMap) {
        if (preferences == null) return false;
        String json = serializeRulesJson(rulesMap);
        boolean ok = preferences.edit()
                .putString(PREF_KEY_BINDINGS_JSON, json)
                .commit();
        GboardCustomHoldPopupsRuntime.invalidateAndRefreshActiveKeyboards();
        return ok;
    }

    public static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }
}
