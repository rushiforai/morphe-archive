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
    public static final int MAX_ENTRIES = 250;
    public static final int MAX_TOKEN_LENGTH = 64;

    static final List<String> DEFAULT_EMAIL_DOMAINS = Collections.unmodifiableList(Arrays.asList(
            "@gmail.com",
            "@outlook.com",
            "@yahoo.com",
            "@icloud.com",
            "@proton.me",
            "@hotmail.com"));

    public enum PrefixKind {
        AT_MENTION,
        EMAIL_DOMAIN,
        DIGIT_PREFIX,
        EMAIL_LOCAL_PREFIX
    }

    public static final class Entry {
        public final String token;
        public final int count;
        public final long lastUsedMs;

        public Entry(String token, int count, long lastUsedMs) {
            this.token = token;
            this.count = Math.max(1, count);
            this.lastUsedMs = Math.max(0L, lastUsedMs);
        }

        public boolean isAtToken() {
            return token != null && token.startsWith("@");
        }

        public boolean isEmailDomain() {
            if (!isAtToken()) {
                return false;
            }
            int dot = token.indexOf('.');
            return dot > 1 && dot < token.length() - 1;
        }

        public boolean isFullEmail() {
            if (token == null || token.length() < 6 || token.startsWith("@")) {
                return false;
            }
            int at = token.indexOf('@');
            if (at <= 0 || at >= token.length() - 4) {
                return false;
            }
            int dot = token.indexOf('.', at + 2);
            return dot > at + 1 && dot < token.length() - 1;
        }

        public boolean startsWithDigit() {
            return token != null && !token.isEmpty() && isDigit(token.charAt(0));
        }
    }

    public static final class ActivePrefix {
        public final String prefix;
        public final int deleteCount;
        public final boolean emailDomainContext;
        public final PrefixKind kind;

        public ActivePrefix(String prefix, int deleteCount, boolean emailDomainContext) {
            this(prefix, deleteCount, emailDomainContext,
                    emailDomainContext ? PrefixKind.EMAIL_DOMAIN : PrefixKind.AT_MENTION);
        }

        public ActivePrefix(
                String prefix, int deleteCount, boolean emailDomainContext, PrefixKind kind) {
            this.prefix = prefix;
            this.deleteCount = deleteCount;
            this.emailDomainContext = emailDomainContext;
            this.kind = kind;
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
     * Extracts the active personalized prefix immediately preceding the cursor:
     * <ul>
     *   <li>{@code @...} standalone mention ({@code "ask @gr"} &rarr; {@code AT_MENTION})</li>
     *   <li>{@code user@...} email domain ({@code "muhib@g"} &rarr; {@code EMAIL_DOMAIN})</li>
     *   <li>Digit-starting prefix from the very 1st digit ({@code "1"}, {@code "11"},
     *       {@code "11muh"} &rarr; {@code DIGIT_PREFIX}) so typing {@code 1} immediately
     *       suggests learned entries like {@code 11muhib.karim@gmail.com}</li>
     *   <li>Letter-starting email-local prefix containing {@code .}/{@code _}/{@code +}
     *       ({@code "muhib.k"} &rarr; {@code EMAIL_LOCAL_PREFIX}) without interfering with
     *       normal prose word suggestions</li>
     * </ul>
     */
    public static ActivePrefix extractActivePrefix(CharSequence textBeforeCursor) {
        if (textBeforeCursor == null || textBeforeCursor.length() == 0) {
            return null;
        }
        int end = textBeforeCursor.length();
        int minStart = Math.max(0, end - MAX_TOKEN_LENGTH);

        // 1. Check @mention or email-domain context first (highest specificity).
        int atIndex = -1;
        boolean allBodyAfterAt = true;
        for (int i = end - 1; i >= minStart; i--) {
            char ch = textBeforeCursor.charAt(i);
            if (ch == '@') {
                atIndex = i;
                break;
            }
            if (!isTokenBodyChar(ch)) {
                allBodyAfterAt = false;
                break;
            }
        }
        if (atIndex >= 0 && allBodyAfterAt) {
            if (!(atIndex + 1 < end && textBeforeCursor.charAt(atIndex + 1) == '.')) {
                boolean emailDomainContext = false;
                boolean validAtBoundary = true;
                if (atIndex > 0) {
                    char beforeAt = textBeforeCursor.charAt(atIndex - 1);
                    if (isEmailLocalChar(beforeAt)) {
                        emailDomainContext = true;
                    } else if (!isTokenBoundaryChar(beforeAt)) {
                        validAtBoundary = false;
                    }
                }
                if (validAtBoundary) {
                    String prefix = textBeforeCursor.subSequence(atIndex, end).toString();
                    return new ActivePrefix(
                            prefix,
                            prefix.length(),
                            emailDomainContext,
                            emailDomainContext ? PrefixKind.EMAIL_DOMAIN : PrefixKind.AT_MENTION);
                }
            }
        }

        // 2. Check active non-boundary token for digit-prefix ("1", "11", "11m") or
        //    email-local prefix ("muhib.k").
        int start = end;
        while (start > minStart && isEmailLocalChar(textBeforeCursor.charAt(start - 1))) {
            start--;
        }
        if (start >= end) {
            return null;
        }
        if (start > 0 && !isTokenBoundaryChar(textBeforeCursor.charAt(start - 1))) {
            return null;
        }
        String token = textBeforeCursor.subSequence(start, end).toString();
        char first = token.charAt(0);
        if (isDigit(first)) {
            return new ActivePrefix(token, token.length(), false, PrefixKind.DIGIT_PREFIX);
        }
        if (isAsciiLetter(first) && token.length() >= 3
                && (token.indexOf('.') > 0 || token.indexOf('_') > 0 || token.indexOf('+') > 0)) {
            return new ActivePrefix(token, token.length(), false, PrefixKind.EMAIL_LOCAL_PREFIX);
        }
        return null;
    }

    /**
     * Extracts completed {@code @handle}, {@code @domain.tld}, full email addresses
     * (e.g. {@code 11muhib.karim@gmail.com}), and digit-starting alphanumeric IDs
     * (e.g. {@code 11muhib}) that are followed by whitespace or terminating punctuation.
     * Bare numbers, OTPs, and number+unit pairs ({@code 10mb}, {@code 5pm}, {@code 2nd})
     * are strictly ignored.
     */
    public static List<String> extractCompletedTokens(CharSequence text) {
        if (text == null || text.length() < 3) {
            return Collections.emptyList();
        }
        List<String> out = new ArrayList<String>();
        int len = text.length();
        int i = 0;
        while (i < len) {
            char ch = text.charAt(i);
            boolean atBoundary = i == 0 || isTokenBoundaryChar(text.charAt(i - 1));
            if (ch == '@' && (atBoundary || isEmailLocalChar(text.charAt(i - 1)))) {
                boolean emailDomain = i > 0 && isEmailLocalChar(text.charAt(i - 1));
                int start = i;
                int j = i + 1;
                while (j < len && isTokenBodyChar(text.charAt(j)) && (j - start) < MAX_TOKEN_LENGTH) {
                    j++;
                }
                if (j < len) {
                    int tokenEnd = trimTrailingStrip(text, start + 1, j);
                    String candidate = text.subSequence(start, tokenEnd).toString();
                    if (isValidAtToken(candidate, emailDomain)) {
                        out.add(candidate);
                    }
                }
                i = Math.max(j, i + 1);
                continue;
            }
            if (atBoundary && (isAlphaNum(ch))) {
                int start = i;
                int j = i;
                int atPos = -1;
                while (j < len && (j - start) < MAX_TOKEN_LENGTH) {
                    char c = text.charAt(j);
                    if (c == '@' && atPos < 0 && j > start) {
                        atPos = j;
                        j++;
                    } else if (atPos >= 0 ? isTokenBodyChar(c) : isEmailLocalChar(c)) {
                        j++;
                    } else {
                        break;
                    }
                }
                // Only learn completed tokens (followed by a terminator char).
                if (j < len) {
                    int tokenEnd = trimTrailingStrip(text, start + 1, j);
                    String candidate = text.subSequence(start, tokenEnd).toString();
                    if (atPos > start && atPos < tokenEnd - 2) {
                        if (isValidFullEmail(candidate)) {
                            out.add(candidate);
                        }
                        String domainPart = text.subSequence(atPos, tokenEnd).toString();
                        if (isValidAtToken(domainPart, true)) {
                            out.add(domainPart);
                        }
                    } else if (isDigit(ch) && isValidAutoLearnedDigitId(candidate)) {
                        out.add(candidate);
                    }
                }
                i = Math.max(j, i + 1);
                continue;
            }
            i++;
        }
        return out;
    }

    /**
     * Extracts all valid {@code @handle}, {@code @domain.tld}, full email addresses,
     * and digit-starting alphanumeric IDs from finished text (or manual Settings input),
     * including a valid token at the very end of the text.
     */
    public static List<String> extractAllTokens(CharSequence text) {
        if (text == null || text.length() < 2) {
            return Collections.emptyList();
        }
        List<String> out = new ArrayList<String>(extractCompletedTokens(text.toString() + " "));
        // Also support explicit manual numeric entries (e.g. phone number / ID) added via Settings.
        String[] parts = text.toString().trim().split("[\\s,;]+");
        for (String p : parts) {
            String trimmed = p.trim();
            if (isValidManualNumericToken(trimmed) && !out.contains(trimmed)) {
                out.add(trimmed);
            }
        }
        return out;
    }

    /**
     * Records every valid entry found in {@code text}.
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
     * Returns whether {@code candidate} is a valid pending token suitable for learning
     * when a field is submitted or dismissed without a trailing space.
     */
    public static boolean isValidPendingTokenForCommit(String candidate, boolean emailDomainContext) {
        if (candidate == null) {
            return false;
        }
        String trimmed = candidate.trim();
        while (trimmed.length() > 1 && isTrailingStripChar(trimmed.charAt(trimmed.length() - 1))) {
            trimmed = trimmed.substring(0, trimmed.length() - 1);
        }
        if (trimmed.startsWith("@")) {
            if (emailDomainContext) {
                return isValidAtToken(trimmed, true);
            }
            return trimmed.length() >= 3 && isValidAtToken(trimmed, false);
        }
        return isValidFullEmail(trimmed) || isValidAutoLearnedDigitId(trimmed);
    }

    /**
     * Ranks personalized learned entries matching {@code active.prefix}.
     *
     * <p>Standalone {@code @} mentions and digit prefixes NEVER backfill canned suggestions—only
     * the user's own learned/saved entries appear. Built-in email domains are only offered as a
     * secondary fallback in explicit email-domain context (e.g. {@code user@g}).</p>
     */
    public static List<String> suggest(
            List<Entry> learnedEntries, ActivePrefix active, int maxResults) {
        if (active == null || active.prefix == null || active.prefix.isEmpty() || maxResults <= 0) {
            return Collections.emptyList();
        }
        String lowerPrefix = active.prefix.toLowerCase(Locale.US);
        boolean isBareAt = active.kind == PrefixKind.AT_MENTION && lowerPrefix.length() == 1;

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
                if (active.kind == PrefixKind.EMAIL_DOMAIN && !entry.isEmailDomain()) {
                    continue;
                }
                if (active.kind == PrefixKind.AT_MENTION && !entry.isAtToken()) {
                    continue;
                }
                if (active.kind == PrefixKind.DIGIT_PREFIX && !entry.startsWithDigit()) {
                    continue;
                }
                if (active.kind == PrefixKind.EMAIL_LOCAL_PREFIX && !entry.isFullEmail()) {
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
                if (active.kind == PrefixKind.EMAIL_DOMAIN) {
                    boolean ad = a.isEmailDomain();
                    boolean bd = b.isEmailDomain();
                    if (ad != bd) {
                        return ad ? -1 : 1;
                    }
                } else if (active.kind == PrefixKind.DIGIT_PREFIX) {
                    // Prioritize full emails (e.g. 11muhib.karim@gmail.com) when counts tie
                    boolean ae = a.isFullEmail();
                    boolean be = b.isFullEmail();
                    if (ae != be && a.count == b.count) {
                        return ae ? -1 : 1;
                    }
                } else if (active.kind == PrefixKind.AT_MENTION) {
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
        // NEVER for standalone "@" mentions or digit prefixes where suggestions stay 100% personal.
        if (active.kind == PrefixKind.EMAIL_DOMAIN) {
            for (String domain : DEFAULT_EMAIL_DOMAINS) {
                if (results.size() >= maxResults) {
                    break;
                }
                String lowerDomain = domain.toLowerCase(Locale.US);
                if (!lowerDomain.startsWith(lowerPrefix)) {
                    continue;
                }
                if (lowerDomain.equals(lowerPrefix)) {
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

    private static int trimTrailingStrip(CharSequence text, int minEnd, int end) {
        int tokenEnd = end;
        while (tokenEnd > minEnd && isTrailingStripChar(text.charAt(tokenEnd - 1))) {
            tokenEnd--;
        }
        return tokenEnd;
    }

    private static boolean isValidLearnedToken(String token, boolean requireDomain) {
        if (token == null || token.length() < 2 || token.length() > MAX_TOKEN_LENGTH) {
            return false;
        }
        if (token.charAt(0) == '@') {
            return isValidAtToken(token, requireDomain);
        }
        if (requireDomain) {
            return false;
        }
        return isValidFullEmail(token)
                || isValidAutoLearnedDigitId(token)
                || isValidManualNumericToken(token);
    }

    private static boolean isValidAtToken(String token, boolean requireDomain) {
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
        boolean hasLetter = isAsciiLetter(first);
        int dotIndex = -1;
        for (int i = 1; i < token.length(); i++) {
            char ch = token.charAt(i);
            if (!isTokenBodyChar(ch)) {
                return false;
            }
            if (isAsciiLetter(ch)) {
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

    static boolean isValidFullEmail(String token) {
        if (token == null || token.length() < 6 || token.length() > MAX_TOKEN_LENGTH) {
            return false;
        }
        int at = token.indexOf('@');
        if (at <= 0 || at != token.lastIndexOf('@') || at >= token.length() - 4) {
            return false;
        }
        if (!isAlphaNum(token.charAt(0)) || !isAlphaNum(token.charAt(at - 1))) {
            return false;
        }
        boolean hasLetter = false;
        for (int i = 0; i < at; i++) {
            char ch = token.charAt(i);
            if (!isEmailLocalChar(ch)) {
                return false;
            }
            if (isAsciiLetter(ch)) {
                hasLetter = true;
            }
        }
        String domain = token.substring(at);
        return isValidAtToken(domain, true) && (hasLetter || at >= 2);
    }

    /**
     * Digit-starting alphanumeric IDs/usernames (e.g. {@code 11muhib}, {@code 24x7support}).
     * Rejects bare numbers, OTPs, and common measurement/ordinal suffixes ({@code 10mb},
     * {@code 5pm}, {@code 2nd}, {@code 100px}) so everyday numbers never clutter suggestions.
     */
    static boolean isValidAutoLearnedDigitId(String token) {
        if (token == null || token.length() < 4 || token.length() > MAX_TOKEN_LENGTH) {
            return false;
        }
        if (!isDigit(token.charAt(0))) {
            return false;
        }
        int letterCount = 0;
        int firstLetterIdx = -1;
        for (int i = 0; i < token.length(); i++) {
            char ch = token.charAt(i);
            if (!isEmailLocalChar(ch)) {
                return false;
            }
            if (isAsciiLetter(ch)) {
                letterCount++;
                if (firstLetterIdx < 0) {
                    firstLetterIdx = i;
                }
            }
        }
        if (letterCount < 2) {
            return false;
        }
        if (firstLetterIdx > 0) {
            String suffix = token.substring(firstLetterIdx).toLowerCase(Locale.US);
            if (isCommonNumericUnitSuffix(suffix)) {
                return false;
            }
        }
        return true;
    }

    /** Explicit manual phone/ID numeric tokens added via Settings (never auto-learned). */
    private static boolean isValidManualNumericToken(String token) {
        if (token == null || token.length() < 7 || token.length() > 20) {
            return false;
        }
        if (!isDigit(token.charAt(0)) && token.charAt(0) != '+') {
            return false;
        }
        int digits = 0;
        for (int i = 0; i < token.length(); i++) {
            char ch = token.charAt(i);
            if (isDigit(ch)) {
                digits++;
            } else if (i == 0 && ch == '+') {
                // Allow leading country code '+'.
            } else if (ch != '-' && ch != '.') {
                return false;
            }
        }
        return digits >= 7 && digits <= 15;
    }

    private static boolean isCommonNumericUnitSuffix(String s) {
        switch (s) {
            case "st":
            case "nd":
            case "rd":
            case "th":
            case "am":
            case "pm":
            case "px":
            case "dp":
            case "sp":
            case "kb":
            case "mb":
            case "gb":
            case "tb":
            case "kg":
            case "gm":
            case "mg":
            case "cm":
            case "mm":
            case "km":
            case "ml":
            case "hr":
            case "hrs":
            case "min":
            case "mins":
            case "sec":
            case "secs":
            case "fps":
            case "hz":
            case "khz":
            case "mhz":
            case "ghz":
            case "ms":
            case "mah":
            case "tk":
            case "bdt":
            case "usd":
            case "eur":
            case "gbp":
                return true;
            default:
                return false;
        }
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

    private static boolean isDigit(char ch) {
        return ch >= '0' && ch <= '9';
    }

    private static boolean isAsciiLetter(char ch) {
        return (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z');
    }

    private static boolean isAlphaNum(char ch) {
        return isAsciiLetter(ch) || isDigit(ch);
    }
}
