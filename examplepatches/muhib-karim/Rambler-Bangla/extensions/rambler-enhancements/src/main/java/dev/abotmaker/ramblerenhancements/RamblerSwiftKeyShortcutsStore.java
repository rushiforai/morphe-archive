/*
 * Rambler Bangla - SwiftKey-style custom text expansion shortcuts store.
 *
 * Maps short triggers (including symbols or numbers like "!email", "@@", "addr", "ph")
 * to full phrases/emails/addresses surfaced directly on Gboard's native suggestion strip.
 */
package dev.abotmaker.ramblerenhancements;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * On-device store for SwiftKey Mode custom text-expansion shortcuts.
 */
public final class RamblerSwiftKeyShortcutsStore {
    public static final String PREF_KEY_SWIFTKEY_ENABLED = "pref_rambler_swiftkey_mode_enabled";
    public static final String PREF_KEY_SHORTCUTS_ENABLED = "pref_rambler_swiftkey_shortcuts_enabled";
    public static final String PREF_KEY_SHORTCUTS_DATA = "pref_rambler_swiftkey_shortcuts_v1";
    public static final boolean DEFAULT_SWIFTKEY_ENABLED = false;
    public static final boolean DEFAULT_SHORTCUTS_ENABLED = true;
    public static final int MAX_SHORTCUTS = 100;
    public static final int MAX_TRIGGER_LENGTH = 32;
    public static final int MAX_EXPANSION_LENGTH = 512;

    public static final class Shortcut {
        public final String trigger;
        public final String expansion;

        public Shortcut(String trigger, String expansion) {
            this.trigger = trigger;
            this.expansion = expansion;
        }
    }

    public static final class ActiveMatch {
        public final String triggerPrefix;
        public final int deleteCount;
        public final List<Shortcut> matches;

        public ActiveMatch(String triggerPrefix, int deleteCount, List<Shortcut> matches) {
            this.triggerPrefix = triggerPrefix;
            this.deleteCount = deleteCount;
            this.matches = matches;
        }
    }

    private static final Object LOCK = new Object();
    private static Map<String, Shortcut> cachedShortcuts;
    private static boolean cacheLoaded;

    private RamblerSwiftKeyShortcutsStore() {
    }

    public static boolean isActive(Context context) {
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        if (prefs == null) {
            return false;
        }
        try {
            return prefs.getBoolean(PREF_KEY_SWIFTKEY_ENABLED, DEFAULT_SWIFTKEY_ENABLED)
                    && prefs.getBoolean(PREF_KEY_SHORTCUTS_ENABLED, DEFAULT_SHORTCUTS_ENABLED);
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static List<Shortcut> readShortcuts(Context context) {
        synchronized (LOCK) {
            ensureLoadedLocked(context);
            return new ArrayList<Shortcut>(cachedShortcuts.values());
        }
    }

    public static int countShortcuts(Context context) {
        synchronized (LOCK) {
            ensureLoadedLocked(context);
            return cachedShortcuts.size();
        }
    }

    public static boolean putShortcut(Context context, String rawTrigger, String rawExpansion) {
        String trigger = sanitizeTrigger(rawTrigger);
        String expansion = sanitizeExpansion(rawExpansion);
        if (trigger == null || expansion == null) {
            return false;
        }
        String key = trigger.toLowerCase(Locale.US);
        synchronized (LOCK) {
            ensureLoadedLocked(context);
            if (!cachedShortcuts.containsKey(key) && cachedShortcuts.size() >= MAX_SHORTCUTS) {
                return false;
            }
            cachedShortcuts.put(key, new Shortcut(trigger, expansion));
            persistLocked(context);
            return true;
        }
    }

    /**
     * Parses user-entered shortcut lines in {@code trigger = expansion} or {@code trigger -> expansion}
     * format (one per line, or semicolon-separated).
     */
    public static int addFromFormattedInput(Context context, String rawInput) {
        if (rawInput == null || rawInput.trim().isEmpty()) {
            return 0;
        }
        int added = 0;
        String[] lines = rawInput.split("[\\r\\n]+");
        for (String line : lines) {
            String trimmed = line == null ? "" : line.trim();
            if (trimmed.isEmpty()) {
                continue;
            }
            String trigger = null;
            String expansion = null;
            int arrow = trimmed.indexOf("->");
            int eq = trimmed.indexOf('=');
            if (arrow > 0 && (eq < 0 || arrow < eq)) {
                trigger = trimmed.substring(0, arrow).trim();
                expansion = trimmed.substring(arrow + 2).trim();
            } else if (eq > 0) {
                trigger = trimmed.substring(0, eq).trim();
                expansion = trimmed.substring(eq + 1).trim();
            }
            if (trigger != null && expansion != null && putShortcut(context, trigger, expansion)) {
                added++;
            }
        }
        return added;
    }

    public static boolean removeShortcut(Context context, String rawTrigger) {
        if (rawTrigger == null) {
            return false;
        }
        String key = rawTrigger.trim().toLowerCase(Locale.US);
        synchronized (LOCK) {
            ensureLoadedLocked(context);
            if (cachedShortcuts.remove(key) == null) {
                return false;
            }
            persistLocked(context);
            return true;
        }
    }

    public static void clearAll(Context context) {
        synchronized (LOCK) {
            cachedShortcuts = new LinkedHashMap<String, Shortcut>();
            cacheLoaded = true;
            persistLocked(context);
        }
    }

    static void resetCacheForTesting() {
        synchronized (LOCK) {
            cachedShortcuts = null;
            cacheLoaded = false;
        }
    }

    public static ActiveMatch matchBeforeCursor(
            Context context, CharSequence textBeforeCursor, int maxResults) {
        if (context == null || !isActive(context)) {
            return null;
        }
        return matchBeforeCursor(readShortcuts(context), textBeforeCursor, maxResults);
    }

    public static ActiveMatch matchBeforeCursor(
            List<Shortcut> shortcuts, CharSequence textBeforeCursor, int maxResults) {
        if (shortcuts == null || shortcuts.isEmpty()
                || textBeforeCursor == null || textBeforeCursor.length() == 0 || maxResults <= 0) {
            return null;
        }
        int end = textBeforeCursor.length();
        int start = end;
        int minStart = Math.max(0, end - MAX_TRIGGER_LENGTH);
        while (start > minStart && !Character.isWhitespace(textBeforeCursor.charAt(start - 1))) {
            start--;
        }
        if (start >= end) {
            return null;
        }
        String token = textBeforeCursor.subSequence(start, end).toString();
        String lowerToken = token.toLowerCase(Locale.US);
        List<Shortcut> exact = new ArrayList<Shortcut>(2);
        List<Shortcut> prefix = new ArrayList<Shortcut>(4);
        for (Shortcut s : shortcuts) {
            if (s == null || s.trigger == null || s.expansion == null) {
                continue;
            }
            String lowerTrig = s.trigger.toLowerCase(Locale.US);
            if (lowerTrig.equals(lowerToken)) {
                exact.add(s);
            } else if (lowerToken.length() >= 2 && lowerTrig.startsWith(lowerToken)) {
                prefix.add(s);
            }
        }
        if (exact.isEmpty() && prefix.isEmpty()) {
            return null;
        }
        List<Shortcut> combined = new ArrayList<Shortcut>(Math.min(maxResults, exact.size() + prefix.size()));
        for (Shortcut s : exact) {
            if (combined.size() >= maxResults) {
                break;
            }
            combined.add(s);
        }
        for (Shortcut s : prefix) {
            if (combined.size() >= maxResults) {
                break;
            }
            combined.add(s);
        }
        return new ActiveMatch(token, token.length(), combined);
    }

    public static String serialize(List<Shortcut> shortcuts) {
        if (shortcuts == null || shortcuts.isEmpty()) {
            return "";
        }
        StringBuilder sb = new StringBuilder(shortcuts.size() * 32);
        for (Shortcut s : shortcuts) {
            if (s == null || s.trigger == null || s.expansion == null) {
                continue;
            }
            String escaped = s.expansion
                    .replace("\\", "\\\\")
                    .replace("\t", "\\t")
                    .replace("\n", "\\n")
                    .replace("\r", "");
            sb.append(s.trigger).append('\t').append(escaped).append('\n');
        }
        return sb.toString();
    }

    public static List<Shortcut> deserialize(String serialized) {
        if (serialized == null || serialized.trim().isEmpty()) {
            return Collections.emptyList();
        }
        List<Shortcut> out = new ArrayList<Shortcut>();
        for (String line : serialized.split("\n")) {
            if (line == null || line.isEmpty()) {
                continue;
            }
            int tab = line.indexOf('\t');
            if (tab <= 0 || tab + 1 >= line.length()) {
                continue;
            }
            String trigger = sanitizeTrigger(line.substring(0, tab));
            String rawExp = line.substring(tab + 1);
            String expansion = unescape(rawExp);
            if (trigger != null && expansion != null && !expansion.isEmpty()) {
                out.add(new Shortcut(trigger, expansion));
            }
        }
        return out;
    }

    private static String unescape(String raw) {
        StringBuilder sb = new StringBuilder(raw.length());
        for (int i = 0; i < raw.length(); i++) {
            char c = raw.charAt(i);
            if (c == '\\' && i + 1 < raw.length()) {
                char next = raw.charAt(++i);
                if (next == 'n') {
                    sb.append('\n');
                } else if (next == 't') {
                    sb.append('\t');
                } else {
                    sb.append(next);
                }
            } else {
                sb.append(c);
            }
        }
        return sanitizeExpansion(sb.toString());
    }

    static String sanitizeTrigger(String raw) {
        if (raw == null) {
            return null;
        }
        String t = raw.trim();
        if (t.isEmpty() || t.length() > MAX_TRIGGER_LENGTH) {
            return null;
        }
        for (int i = 0; i < t.length(); i++) {
            if (Character.isWhitespace(t.charAt(i))) {
                return null;
            }
        }
        return t;
    }

    static String sanitizeExpansion(String raw) {
        if (raw == null) {
            return null;
        }
        String e = raw.trim();
        if (e.isEmpty() || e.length() > MAX_EXPANSION_LENGTH) {
            return null;
        }
        return e;
    }

    private static void ensureLoadedLocked(Context context) {
        if (cacheLoaded && cachedShortcuts != null) {
            return;
        }
        cachedShortcuts = new LinkedHashMap<String, Shortcut>();
        cacheLoaded = true;
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        if (prefs != null) {
            try {
                String data = prefs.getString(PREF_KEY_SHORTCUTS_DATA, "");
                for (Shortcut s : deserialize(data)) {
                    cachedShortcuts.put(s.trigger.toLowerCase(Locale.US), s);
                }
            } catch (Throwable ignored) {
                // Fail-safe empty store.
            }
        }
    }

    private static void persistLocked(Context context) {
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        if (prefs == null) {
            return;
        }
        try {
            prefs.edit()
                    .putString(PREF_KEY_SHORTCUTS_DATA, serialize(new ArrayList<Shortcut>(cachedShortcuts.values())))
                    .apply();
        } catch (Throwable ignored) {
            // Never disrupt Gboard.
        }
    }
}
