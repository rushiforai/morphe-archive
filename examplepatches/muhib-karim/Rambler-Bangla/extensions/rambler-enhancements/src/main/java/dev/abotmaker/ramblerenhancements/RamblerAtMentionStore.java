/*
 * Rambler Bangla - SwiftKey-style @mention & email domain suggestion store.
 *
 * Automatically learns typed @handles (e.g. @grok, @claude) and email domains
 * (e.g. @gmail.com) on-device, ranks them by frequency + recency, and never
 * records anything from password or incognito fields.
 */
package dev.abotmaker.ramblerenhancements;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Pure-Java + SharedPreferences MRU/frequency store for SwiftKey-style {@code @}
 * suggestions on the Gboard suggestion strip.
 */
public final class RamblerAtMentionStore {
    public static final String PREF_KEY_ENABLED = "pref_rambler_at_mentions_enabled";
    public static final String PREF_KEY_ENTRIES_JSON = "pref_rambler_at_mentions_v1";
    public static final boolean DEFAULT_ENABLED = true;
    public static final int MAX_ENTRIES = 200;
    public static final int MAX_TOKEN_LENGTH = 48;

    static final List<String> DEFAULT_EMAIL_DOMAINS = Collections.unmodifiableList(Arrays.asList(
            "@gmail.com",
            "@outlook.com",
            "@yahoo.com",
            "@icloud.com",
            "@proton.me",
            "@hotmail.com"));

    public static final class Entry {
        public final String token;
        public final int count;
        public final long lastUsedMs;

        public Entry(String token, int count, long lastUsedMs) {
            this.token = token;
            this.count = Math.max(1, count);
            this.lastUsedMs = Math.max(0L, lastUsedMs);
        }

        public boolean isEmailDomain() {
            int dot = token.indexOf('.');
            return dot > 1 && dot < token.length() - 1;
        }
    }

    public static final class ActivePrefix {
        public final String prefix;
        public final int deleteCount;
        public final boolean emailDomainContext;

        public ActivePrefix(String prefix, int deleteCount, boolean emailDomainContext) {
            this.prefix = prefix;
            this.deleteCount = deleteCount;
            this.emailDomainContext = emailDomainContext;
        }
    }

    private static final Object LOCK = new Object();
    private static Map<String, Entry> cachedEntries;
    private static boolean cacheLoaded;

    private RamblerAtMentionStore() {
    }

    public static boolean isEnabled(Context context) {
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        if (prefs == null) {
            return DEFAULT_ENABLED;
        }
        try {
            return prefs.getBoolean(PREF_KEY_ENABLED, DEFAULT_ENABLED);
        } catch (Throwable ignored) {
            return DEFAULT_ENABLED;
        }
    }

    public static boolean setEnabled(Context context, boolean enabled) {
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        if (prefs == null) {
            return false;
        }
        try {
            return prefs.edit().putBoolean(PREF_KEY_ENABLED, enabled).commit();
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * Extracts the active {@code @...} token immediately preceding the cursor, if any.
     *
     * <p>Examples:
     * <ul>
     *   <li>{@code "ask @"} &rarr; {@code prefix="@", deleteCount=1, emailDomainContext=false}</li>
     *   <li>{@code "ask @gr"} &rarr; {@code prefix="@gr", deleteCount=3, emailDomainContext=false}</li>
     *   <li>{@code "muhib@g"} &rarr; {@code prefix="@g", deleteCount=2, emailDomainContext=true}</li>
     *   <li>{@code "hello world"} &rarr; {@code null}</li>
     * </ul>
     */
    public static ActivePrefix extractActivePrefix(CharSequence textBeforeCursor) {
        if (textBeforeCursor == null || textBeforeCursor.length() == 0) {
            return null;
        }
        int end = textBeforeCursor.length();
        int minStart = Math.max(0, end - MAX_TOKEN_LENGTH);
        int atIndex = -1;
        for (int i = end - 1; i >= minStart; i--) {
            char ch = textBeforeCursor.charAt(i);
            if (ch == '@') {
                atIndex = i;
                break;
            }
            if (!isTokenBodyChar(ch)) {
                return null;
            }
        }
        if (atIndex < 0) {
            return null;
        }
        // Reject leading dot right after '@' (e.g. "@.foo")
        if (atIndex + 1 < end && textBeforeCursor.charAt(atIndex + 1) == '.') {
            return null;
        }
        boolean emailDomainContext = false;
        if (atIndex > 0) {
            char beforeAt = textBeforeCursor.charAt(atIndex - 1);
            if (isEmailLocalChar(beforeAt)) {
                emailDomainContext = true;
            } else if (!isTokenBoundaryChar(beforeAt)) {
                return null;
            }
        }
        String prefix = textBeforeCursor.subSequence(atIndex, end).toString();
        return new ActivePrefix(prefix, prefix.length(), emailDomainContext);
    }

    /**
     * Extracts completed {@code @handle} and {@code @domain.tld} tokens that are followed by
     * whitespace or terminating punctuation (so partial tokens still being typed are not recorded).
     */
    public static List<String> extractCompletedTokens(CharSequence text) {
        if (text == null || text.length() < 3) {
            return Collections.emptyList();
        }
        List<String> out = new ArrayList<String>();
        int len = text.length();
        int i = 0;
        while (i < len) {
            if (text.charAt(i) != '@') {
                i++;
                continue;
            }
            boolean emailDomain = i > 0 && isEmailLocalChar(text.charAt(i - 1));
            boolean validBoundary = i == 0 || emailDomain || isTokenBoundaryChar(text.charAt(i - 1));
            if (!validBoundary) {
                i++;
                continue;
            }
            int start = i;
            int j = i + 1;
            while (j < len && isTokenBodyChar(text.charAt(j)) && (j - start) < MAX_TOKEN_LENGTH) {
                j++;
            }
            // Only learn completed tokens (must be followed by a non-body terminator char).
            if (j < len) {
                int tokenEnd = j;
                while (tokenEnd > start + 1 && isTrailingStripChar(text.charAt(tokenEnd - 1))) {
                    tokenEnd--;
                }
                String candidate = text.subSequence(start, tokenEnd).toString();
                if (isValidLearnedToken(candidate, emailDomain)) {
                    out.add(candidate);
                }
            }
            i = Math.max(j, i + 1);
        }
        return out;
    }

    /**
     * Extracts all valid {@code @handle} and {@code @domain.tld} tokens from finished text
     * (such as a committed dictation sentence, pasted text, or manual Settings input),
     * including a valid token at the very end of the text.
     */
    public static List<String> extractAllTokens(CharSequence text) {
        if (text == null || text.length() < 2) {
            return Collections.emptyList();
        }
        return extractCompletedTokens(text.toString() + " ");
    }

    /**
     * Records every valid {@code @handle} / {@code @domain} found in {@code text}.
     */
    public static int recordTokensFromText(Context context, CharSequence text) {
        List<String> tokens = extractAllTokens(text);
        int recorded = 0;
        for (String token : tokens) {
            recordToken(context, token);
            recorded++;
        }
        return recorded;
    }

    /**
     * Returns whether {@code candidate} is a valid standalone {@code @handle} (or email domain)
     * suitable for learning when a field is submitted or dismissed without a trailing space.
     */
    public static boolean isValidPendingTokenForCommit(String candidate, boolean emailDomainContext) {
        if (candidate == null) {
            return false;
        }
        String trimmed = candidate.trim();
        while (trimmed.length() > 1 && isTrailingStripChar(trimmed.charAt(trimmed.length() - 1))) {
            trimmed = trimmed.substring(0, trimmed.length() - 1);
        }
        if (emailDomainContext) {
            return isValidLearnedToken(trimmed, true);
        }
        // Require at least 2 characters after '@' (e.g. "@ai", "@grok") so accidental "@a" isn't saved.
        return trimmed.length() >= 3 && isValidLearnedToken(trimmed, false);
    }

    /**
     * Ranks personalized learned entries matching {@code active.prefix}.
     *
     * <p>Standalone {@code @} mentions NEVER backfill hardcoded email providers—only the user's
     * own learned {@code @handles} / {@code @domains} appear. Built-in email domains are only
     * offered as a secondary fallback in explicit email-domain context (e.g. {@code user@g}).</p>
     */
    public static List<String> suggest(
            List<Entry> learnedEntries, ActivePrefix active, int maxResults) {
        if (active == null || active.prefix == null || !active.prefix.startsWith("@")
                || maxResults <= 0) {
            return Collections.emptyList();
        }
        String lowerPrefix = active.prefix.toLowerCase(Locale.US);
        boolean isBareAt = lowerPrefix.length() == 1;

        List<Entry> matchedLearned = new ArrayList<Entry>();
        Map<String, Boolean> seenLower = new LinkedHashMap<String, Boolean>();
        if (learnedEntries != null) {
            for (Entry entry : learnedEntries) {
                if (entry == null || entry.token == null) {
                    continue;
                }
                String lowerToken = entry.token.toLowerCase(Locale.US);
                if (!lowerToken.startsWith(lowerPrefix)) {
                    continue;
                }
                if (!isBareAt && lowerToken.equals(lowerPrefix)) {
                    continue;
                }
                if (active.emailDomainContext && !entry.isEmailDomain()) {
                    continue;
                }
                if (seenLower.put(lowerToken, Boolean.TRUE) == null) {
                    matchedLearned.add(entry);
                }
            }
        }

        Collections.sort(matchedLearned, new Comparator<Entry>() {
            @Override
            public int compare(Entry a, Entry b) {
                if (active.emailDomainContext) {
                    boolean ad = a.isEmailDomain();
                    boolean bd = b.isEmailDomain();
                    if (ad != bd) {
                        return ad ? -1 : 1;
                    }
                } else {
                    // For standalone @mentions, prioritize @handles over @domains when counts tie
                    boolean ah = !a.isEmailDomain();
                    boolean bh = !b.isEmailDomain();
                    if (ah != bh && a.count == b.count) {
                        return ah ? -1 : 1;
                    }
                }
                int countCmp = Integer.compare(b.count, a.count);
                if (countCmp != 0) {
                    return countCmp;
                }
                int recencyCmp = Long.compare(b.lastUsedMs, a.lastUsedMs);
                if (recencyCmp != 0) {
                    return recencyCmp;
                }
                return a.token.compareToIgnoreCase(b.token);
            }
        });

        List<String> results = new ArrayList<String>(Math.min(maxResults, 12));
        for (Entry entry : matchedLearned) {
            if (results.size() >= maxResults) {
                return results;
            }
            results.add(entry.token);
        }

        // Only offer common email-domain fallback when typing an email address (e.g. "name@g"),
        // NEVER for standalone "@" mentions where suggestions must stay 100% personalized.
        if (active.emailDomainContext) {
            for (String domain : DEFAULT_EMAIL_DOMAINS) {
                if (results.size() >= maxResults) {
                    break;
                }
                String lowerDomain = domain.toLowerCase(Locale.US);
                if (!lowerDomain.startsWith(lowerPrefix)) {
                    continue;
                }
                if (!isBareAt && lowerDomain.equals(lowerPrefix)) {
                    continue;
                }
                if (seenLower.put(lowerDomain, Boolean.TRUE) == null) {
                    results.add(domain);
                }
            }
        }
        return results;
    }

    public static List<String> suggestForContext(
            Context context, ActivePrefix active, int maxResults) {
        return suggest(readEntries(context), active, maxResults);
    }

    public static List<Entry> readEntries(Context context) {
        synchronized (LOCK) {
            ensureLoadedLocked(context);
            return new ArrayList<Entry>(cachedEntries.values());
        }
    }

    public static int countLearned(Context context) {
        synchronized (LOCK) {
            ensureLoadedLocked(context);
            return cachedEntries.size();
        }
    }

    public static void recordToken(Context context, String rawToken) {
        recordToken(context, rawToken, System.currentTimeMillis());
    }

    static void recordToken(Context context, String rawToken, long nowMs) {
        if (rawToken == null) {
            return;
        }
        String token = rawToken.trim();
        if (!isValidLearnedToken(token, false) && !isValidLearnedToken(token, true)) {
            return;
        }
        String key = token.toLowerCase(Locale.US);
        synchronized (LOCK) {
            ensureLoadedLocked(context);
            Entry existing = cachedEntries.get(key);
            int nextCount = existing == null ? 1 : Math.min(existing.count + 1, 100000);
            // Keep latest casing (e.g. @Claude or @grok) while preserving frequency.
            cachedEntries.put(key, new Entry(token, nextCount, nowMs));
            trimLocked();
            persistLocked(context);
        }
    }

    public static boolean forgetToken(Context context, String rawToken) {
        if (rawToken == null) {
            return false;
        }
        String key = rawToken.trim().toLowerCase(Locale.US);
        synchronized (LOCK) {
            ensureLoadedLocked(context);
            if (cachedEntries.remove(key) == null) {
                return false;
            }
            persistLocked(context);
            return true;
        }
    }

    public static void clearAll(Context context) {
        synchronized (LOCK) {
            cachedEntries = new LinkedHashMap<String, Entry>();
            cacheLoaded = true;
            persistLocked(context);
        }
    }

    static void resetCacheForTesting() {
        synchronized (LOCK) {
            cachedEntries = null;
            cacheLoaded = false;
        }
    }

    public static String serializeEntries(List<Entry> entries) {
        if (entries == null || entries.isEmpty()) {
            return "";
        }
        StringBuilder sb = new StringBuilder(entries.size() * 24);
        for (Entry e : entries) {
            if (e == null || e.token == null) {
                continue;
            }
            sb.append(e.token)
                    .append('\t')
                    .append(e.count)
                    .append('\t')
                    .append(e.lastUsedMs)
                    .append('\n');
        }
        return sb.toString();
    }

    public static List<Entry> deserializeEntries(String serialized) {
        if (serialized == null || serialized.trim().isEmpty()) {
            return Collections.emptyList();
        }
        List<Entry> out = new ArrayList<Entry>();
        String[] lines = serialized.split("\n");
        for (String rawLine : lines) {
            String line = rawLine == null ? "" : rawLine.trim();
            if (line.isEmpty()) {
                continue;
            }
            String[] parts = line.split("\t");
            if (parts.length < 1) {
                continue;
            }
            String token = parts[0].trim();
            int count = 1;
            long ts = 0L;
            try {
                if (parts.length >= 2) {
                    count = Integer.parseInt(parts[1].trim());
                }
                if (parts.length >= 3) {
                    ts = Long.parseLong(parts[2].trim());
                }
            } catch (NumberFormatException ignored) {
                // Keep defaults.
            }
            if (isValidLearnedToken(token, false) || isValidLearnedToken(token, true)) {
                out.add(new Entry(token, count, ts));
            }
        }
        return out;
    }

    private static void ensureLoadedLocked(Context context) {
        if (cacheLoaded && cachedEntries != null) {
            return;
        }
        cachedEntries = new LinkedHashMap<String, Entry>();
        cacheLoaded = true;
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        if (prefs != null) {
            try {
                String data = prefs.getString(PREF_KEY_ENTRIES_JSON, "");
                for (Entry e : deserializeEntries(data)) {
                    cachedEntries.put(e.token.toLowerCase(Locale.US), e);
                }
            } catch (Throwable ignored) {
                // Fail-safe empty store.
            }
        }
    }

    private static void trimLocked() {
        if (cachedEntries.size() <= MAX_ENTRIES) {
            return;
        }
        List<Entry> all = new ArrayList<Entry>(cachedEntries.values());
        Collections.sort(all, new Comparator<Entry>() {
            @Override
            public int compare(Entry a, Entry b) {
                int c = Integer.compare(b.count, a.count);
                if (c != 0) {
                    return c;
                }
                return Long.compare(b.lastUsedMs, a.lastUsedMs);
            }
        });
        cachedEntries.clear();
        for (int i = 0; i < Math.min(MAX_ENTRIES, all.size()); i++) {
            Entry e = all.get(i);
            cachedEntries.put(e.token.toLowerCase(Locale.US), e);
        }
    }

    private static void persistLocked(Context context) {
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        if (prefs == null) {
            return;
        }
        try {
            String json = serializeEntries(new ArrayList<Entry>(cachedEntries.values()));
            prefs.edit().putString(PREF_KEY_ENTRIES_JSON, json).apply();
        } catch (Throwable ignored) {
            // Never disrupt Gboard.
        }
    }

    private static boolean isValidLearnedToken(String token, boolean requireDomain) {
        if (token == null || token.length() < 2 || token.length() > MAX_TOKEN_LENGTH) {
            return false;
        }
        if (token.charAt(0) != '@') {
            return false;
        }
        char first = token.charAt(1);
        if (!isAlphaNum(first) && first != '_') {
            return false;
        }
        boolean hasLetter = Character.isLetter(first);
        int dotIndex = -1;
        for (int i = 1; i < token.length(); i++) {
            char ch = token.charAt(i);
            if (!isTokenBodyChar(ch)) {
                return false;
            }
            if (Character.isLetter(ch)) {
                hasLetter = true;
            }
            if (ch == '.') {
                dotIndex = i;
            }
        }
        if (!hasLetter) {
            return false;
        }
        if (requireDomain) {
            return dotIndex > 1 && dotIndex < token.length() - 2;
        }
        return true;
    }

    private static boolean isTokenBodyChar(char ch) {
        return isAlphaNum(ch) || ch == '_' || ch == '-' || ch == '.';
    }

    private static boolean isEmailLocalChar(char ch) {
        return isAlphaNum(ch) || ch == '.' || ch == '_' || ch == '+' || ch == '-';
    }

    private static boolean isTokenBoundaryChar(char ch) {
        return Character.isWhitespace(ch)
                || ch == '(' || ch == '[' || ch == '{' || ch == '<'
                || ch == '"' || ch == '\'' || ch == ',' || ch == ';'
                || ch == ':' || ch == '/';
    }

    private static boolean isTrailingStripChar(char ch) {
        return ch == '.' || ch == '-' || ch == '_';
    }

    private static boolean isAlphaNum(char ch) {
        return (ch >= 'a' && ch <= 'z')
                || (ch >= 'A' && ch <= 'Z')
                || (ch >= '0' && ch <= '9');
    }
}
