package dev.abotmaker.ramblerenhancements;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.text.InputType;
import android.util.Log;
import android.view.inputmethod.EditorInfo;

import com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFix;
import com.akshaykadam.pixelboard.extension.rambler.GboardRamblerScriptFixSettings;

import org.json.JSONArray;
import org.json.JSONObject;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Post-dictation productivity pipeline for Gboard Rambler:
 * <ol>
 *   <li>Hands-Free Voice Send &amp; Search Suffixes (opt-in, strictly gated on the active field's
 *       {@link EditorInfo#imeOptions} action).</li>
 *   <li>Deterministic Voice Snippets (spoken trigger &rarr; exact literal expansion).</li>
 *   <li>Post-Dictation Find &amp; Replace (plain text or regex, optional case-sensitive and
 *       per-app scope) + global/per-app Strip Trailing Period.</li>
 *   <li>Local Dictation History (on-device 50-entry ring buffer).</li>
 * </ol>
 *
 * <p>Also tracks foreground {@link EditorInfo} on {@code AgenticDictationExtension.onActivateInternal}
 * so per-app behavior overrides (Append-only, App context, Strip trailing period) update live
 * before each dictation starts.</p>
 */
public final class RamblerTextPipeline {
    private static final String TAG = "RamblerEnhancements";
    public static final String PREF_KEY_SNIPPETS_JSON = "pref_rambler_snippets_v1";
    public static final String PREF_KEY_REPLACE_RULES_JSON = "pref_rambler_replace_rules_v1";
    public static final String PREF_KEY_HISTORY_JSON = "pref_rambler_history_v1";
    public static final int MAX_HISTORY_ENTRIES = 50;
    private static final long DEDUP_HISTORY_WINDOW_MS = 2000L;
    private static final long IME_ACTION_POST_DELAY_MS = 35L;

    // Preserves abbreviations like "e.g.", "i.e.", "U.S.", "a.m.", "Mr.", "Dr.", "vs.", "etc."
    private static final Pattern DOTTED_ABBREVIATION =
            Pattern.compile("(?i)(?:^|[\\s(\\[\"'])(?:(?:[a-z]\\.){2,}|(?:mr|mrs|ms|dr|prof|jr|sr|st|vs|etc|fig|no)\\.)$");

    public static final class SnippetRule {
        public final String id;
        public final String trigger;
        public final String expansion;
        public final boolean enabled;

        public SnippetRule(String id, String trigger, String expansion, boolean enabled) {
            this.id = (id == null || id.trim().isEmpty())
                    ? "snip_" + System.currentTimeMillis()
                    : id.trim();
            this.trigger = trigger == null ? "" : trigger.trim();
            this.expansion = expansion == null ? "" : expansion;
            this.enabled = enabled;
        }
    }

    public static final class ReplaceRule {
        public final String id;
        public final String find;
        public final String replace;
        public final boolean regex;
        public final boolean caseSensitive;
        public final List<String> packages;
        public final boolean enabled;

        public ReplaceRule(
                String id,
                String find,
                String replace,
                boolean regex,
                boolean caseSensitive,
                Collection<String> packages,
                boolean enabled) {
            this.id = (id == null || id.trim().isEmpty())
                    ? "rep_" + System.currentTimeMillis()
                    : id.trim();
            this.find = find == null ? "" : find;
            this.replace = replace == null ? "" : replace;
            this.regex = regex;
            this.caseSensitive = caseSensitive;
            LinkedHashSet<String> cleaned = new LinkedHashSet<String>();
            if (packages != null) {
                for (String pkg : packages) {
                    if (pkg != null && !pkg.trim().isEmpty()) {
                        cleaned.add(pkg.trim());
                    }
                }
            }
            this.packages = Collections.unmodifiableList(new ArrayList<String>(cleaned));
            this.enabled = enabled;
        }

        public boolean appliesToPackage(String packageName) {
            if (packages.isEmpty()) {
                return true;
            }
            if (packageName == null || packageName.trim().isEmpty()) {
                return false;
            }
            return packages.contains(packageName.trim());
        }
    }

    public static final class HistoryEntry {
        public final String id;
        public final long timestampMs;
        public final String packageName;
        public final String text;

        public HistoryEntry(String id, long timestampMs, String packageName, String text) {
            this.id = (id == null || id.trim().isEmpty())
                    ? "hist_" + timestampMs
                    : id.trim();
            this.timestampMs = timestampMs;
            this.packageName = packageName == null ? "" : packageName.trim();
            this.text = text == null ? "" : text;
        }
    }

    public static final class ProcessedCommit {
        public final String text;
        public final int imeActionToTrigger; // 0 = none, IME_ACTION_SEND (4), IME_ACTION_SEARCH (3)

        public ProcessedCommit(String text, int imeActionToTrigger) {
            this.text = text == null ? "" : text;
            this.imeActionToTrigger = imeActionToTrigger;
        }
    }

    interface ActionDispatcher {
        void dispatch(Object pcn, int imeAction);
    }

    private static final Object HISTORY_LOCK = new Object();
    private static volatile EditorInfo activeEditorInfo;
    private static volatile Class<?> cachedExtClass;
    private static volatile Field cachedExtContextField;
    private static volatile Class<?> cachedPcnClass;
    private static volatile Method cachedPcnEditorInfoMethod;
    private static volatile Method cachedPcnPerformActionMethod;
    private static volatile ActionDispatcher actionDispatcherOverrideForTesting;

    private RamblerTextPipeline() {
    }

    static void clearForTesting() {
        activeEditorInfo = null;
        cachedExtClass = null;
        cachedExtContextField = null;
        cachedPcnClass = null;
        cachedPcnEditorInfoMethod = null;
        cachedPcnPerformActionMethod = null;
        actionDispatcherOverrideForTesting = null;
    }

    static void setActionDispatcherForTesting(ActionDispatcher dispatcher) {
        actionDispatcherOverrideForTesting = dispatcher;
    }

    /**
     * Hook called at entry of {@code AgenticDictationExtension.onActivateInternal(EditorInfo)}
     * (via {@code invoke-static/range {p0 .. p1}}). Tracks the active {@link EditorInfo} and
     * refreshes per-app behavior flag overrides before dictation begins.
     */
    public static void onExtensionActivate(Object agenticExtension, EditorInfo editorInfo) {
        try {
            activeEditorInfo = editorInfo;
            Context ctx = extractContext(agenticExtension);
            if (ctx == null) {
                ctx = RamblerFlagRuntime.resolveContext();
            }
            String pkg = editorInfo == null ? null : editorInfo.packageName;
            RamblerFlagRuntime.onActivePackageChanged(ctx, pkg);
            if (RamblerDynamicConfig.FEATURE_BANGLA_PHONETIC) {
                GboardRamblerScriptFix.setActiveGboardLocale(extractActiveGboardLocale(agenticExtension));
            }
        } catch (Throwable throwable) {
            logWarningSafely("onExtensionActivate hook failed", throwable);
        }
    }

    private static String extractActiveGboardLocale(Object agenticExtension) {
        if (agenticExtension == null) {
            return null;
        }
        try {
            Method method = agenticExtension.getClass().getMethod("w");
            Object tagObj = method.invoke(agenticExtension);
            if (tagObj != null) {
                String tag = tagObj.toString();
                if (tag != null && !tag.trim().isEmpty()) {
                    return tag.trim();
                }
            }
        } catch (Throwable ignored) {
            // Fall back to InputMethodSubtype detection.
        }
        return null;
    }

    /**
     * Hook called inside {@code AgenticDictationExtension}'s dictation commit method right after
     * {@code pcn.beginBatchEdit()} and before BOTH direct-append and diff-edit branches.
     * Always returns a non-null {@link String} (or the original string if unchanged/disabled).
     */
    public static String processCommitText(Object pcn, String rawText) {
        boolean productivityOn = RamblerDynamicConfig.FEATURE_PRODUCTIVITY_TOOLS;
        boolean banglaOn = RamblerDynamicConfig.FEATURE_BANGLA_PHONETIC;
        if (rawText == null || (!productivityOn && !banglaOn)) {
            return rawText;
        }
        try {
            Context ctx = RamblerFlagRuntime.resolveContext();
            EditorInfo editorInfo = resolveEditorInfo(pcn);
            String text = rawText;

            // Rambler Bangla phonetic & multilingual voice script normalization runs first
            // so downstream snippets, Find & Replace, history, and stats see Bengali Unicode.
            // Fail-closed: sensitive / password / incognito fields pass through untouched.
            if (banglaOn && !isSensitiveOrIncognitoField(editorInfo)
                    && (ctx == null ? GboardRamblerScriptFixSettings.isEnabled()
                    : GboardRamblerScriptFixSettings.isEnabled(ctx))) {
                try {
                    String converted = GboardRamblerScriptFix.processVoice(text);
                    if (converted != null) {
                        text = converted;
                    }
                } catch (Throwable banglaErr) {
                    logWarningSafely("Rambler Bangla processVoice failed; preserving text", banglaErr);
                }
            }

            if (!productivityOn || ctx == null) {
                return text;
            }
            String packageName = editorInfo != null
                    ? editorInfo.packageName
                    : RamblerFlagRuntime.getActivePackageName();

            ProcessedCommit result = transformText(ctx, text, editorInfo, packageName);

            RamblerDictationStats.onDictationCommitted(ctx, result.text);

            // Also learn any @handles / @domains dictated via Rambler voice typing
            // (fail-closed: skipped in password/incognito fields).
            if (RamblerDynamicConfig.FEATURE_AT_MENTION_SUGGESTIONS
                    && ctx != null
                    && !isSensitiveOrIncognitoField(editorInfo)
                    && RamblerAtMentionStore.isEnabled(ctx)) {
                RamblerAtMentionStore.recordTokensFromText(ctx, result.text);
            }

            if (RamblerEnhancementsSettings.readHistoryEnabled(ctx)) {
                String trimmed = result.text.trim();
                if (!trimmed.isEmpty()) {
                    recordHistory(ctx, packageName, trimmed, System.currentTimeMillis());
                }
            }

            if (result.imeActionToTrigger != 0 && pcn != null) {
                dispatchImeAction(pcn, result.imeActionToTrigger);
            }
            return result.text;
        } catch (Throwable throwable) {
            logWarningSafely("processCommitText failed; preserving stock text", throwable);
            return rawText;
        }
    }

    /** Fail-closed guard: never run Bangla script conversion in password or incognito fields. */
    public static boolean isSensitiveOrIncognitoField(EditorInfo editorInfo) {
        if (editorInfo == null) {
            return false;
        }
        if ((editorInfo.imeOptions & EditorInfo.IME_FLAG_NO_PERSONALIZED_LEARNING) != 0) {
            return true;
        }
        int inputType = editorInfo.inputType;
        int cls = inputType & InputType.TYPE_MASK_CLASS;
        int var = inputType & InputType.TYPE_MASK_VARIATION;
        if (cls == InputType.TYPE_CLASS_TEXT) {
            return var == InputType.TYPE_TEXT_VARIATION_PASSWORD
                    || var == InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD
                    || var == InputType.TYPE_TEXT_VARIATION_WEB_PASSWORD;
        }
        if (cls == InputType.TYPE_CLASS_NUMBER) {
            return var == InputType.TYPE_NUMBER_VARIATION_PASSWORD;
        }
        return false;
    }

    public static ProcessedCommit transformText(
            Context context, String rawText, EditorInfo editorInfo, String packageName) {
        if (rawText == null || context == null) {
            return new ProcessedCommit(rawText == null ? "" : rawText, 0);
        }
        String text = rawText;
        int matchedAction = 0;

        // 1. Hands-free Voice Send / Search suffix detection (strictly gated on EditorInfo action).
        int supportedAction = supportedDirectAction(editorInfo);
        if (supportedAction == EditorInfo.IME_ACTION_SEND
                && RamblerEnhancementsSettings.readVoiceSendEnabled(context)) {
            List<String> triggers = parseTriggerPhrases(
                    RamblerEnhancementsSettings.readVoiceSendTriggers(context));
            String stripped = stripMatchingSuffix(text, triggers);
            if (stripped != null) {
                text = stripped;
                matchedAction = EditorInfo.IME_ACTION_SEND;
            }
        } else if (supportedAction == EditorInfo.IME_ACTION_SEARCH
                && RamblerEnhancementsSettings.readVoiceSearchEnabled(context)) {
            List<String> triggers = parseTriggerPhrases(
                    RamblerEnhancementsSettings.readVoiceSearchTriggers(context));
            String stripped = stripMatchingSuffix(text, triggers);
            if (stripped != null) {
                text = stripped;
                matchedAction = EditorInfo.IME_ACTION_SEARCH;
            }
        }

        // 2. Deterministic Voice Snippets (longest trigger first, literal replacement).
        if (!text.isEmpty()) {
            text = applySnippets(text, readSnippets(context));
        }

        // 3. Post-dictation Find & Replace (plain or regex, global or per-app).
        if (!text.isEmpty()) {
            text = applyReplaceRules(text, packageName, readReplaceRules(context));
        }

        // 4. Optional Strip Trailing Period (per-app override > global toggle > search-bar auto-strip).
        if (!text.isEmpty() && shouldStripTrailingPeriod(context, editorInfo, packageName)) {
            text = stripTrailingPeriod(text);
        }

        // 5. Optional Auto-Search on commit strictly inside user-selected apps (Search bars &
        //    browser URI Go bars only; never fires on empty text or if a suffix already matched).
        if (matchedAction == 0
                && !text.trim().isEmpty()
                && RamblerEnhancementsSettings.readAutoSearchOnCommitEnabled(context)
                && RamblerEnhancementsSettings.isAutoSearchAppSelected(context, packageName)) {
            int searchBarAction = supportedSearchBarAction(editorInfo);
            if (searchBarAction != 0) {
                matchedAction = searchBarAction;
            }
        }

        return new ProcessedCommit(text, matchedAction);
    }

    public static boolean shouldStripTrailingPeriod(Context context, String packageName) {
        return shouldStripTrailingPeriod(context, null, packageName);
    }

    public static boolean shouldStripTrailingPeriod(
            Context context, EditorInfo editorInfo, String packageName) {
        if (context == null) {
            return false;
        }
        if (packageName != null && !packageName.trim().isEmpty()) {
            RamblerCustomInstructionRules.BehaviorOverrides overrides =
                    RamblerCustomInstructionRules.resolveBehaviorOverrides(context, packageName);
            if (overrides.stripTrailingPeriod == RamblerCustomInstructionRules.OVERRIDE_ON) {
                return true;
            }
            if (overrides.stripTrailingPeriod == RamblerCustomInstructionRules.OVERRIDE_OFF) {
                return false;
            }
        }
        if (RamblerEnhancementsSettings.readStripTrailingPeriod(context)) {
            return true;
        }
        return RamblerEnhancementsSettings.readSearchStripTrailingPeriod(context)
                && isSearchBarField(editorInfo);
    }

    /**
     * Returns {@link EditorInfo#IME_ACTION_SEARCH} for Search bars, or
     * {@link EditorInfo#IME_ACTION_GO} for single-line browser address/search Omniboxes
     * ({@link InputType#TYPE_CLASS_TEXT} + {@link InputType#TYPE_TEXT_VARIATION_URI}) when the
     * field allows enter actions (no {@link EditorInfo#IME_FLAG_NO_ENTER_ACTION}).
     * Returns {@code 0} for ordinary form inputs, password/email/numeric fields, and multi-line boxes.
     */
    public static int supportedSearchBarAction(EditorInfo editorInfo) {
        if (editorInfo == null) {
            return 0;
        }
        int opts = editorInfo.imeOptions;
        if ((opts & EditorInfo.IME_FLAG_NO_ENTER_ACTION) != 0) {
            return 0;
        }
        int action = opts & EditorInfo.IME_MASK_ACTION;
        if (action == EditorInfo.IME_ACTION_SEARCH) {
            return EditorInfo.IME_ACTION_SEARCH;
        }
        if (action == EditorInfo.IME_ACTION_GO && isBrowserUriSearchBar(editorInfo)) {
            return EditorInfo.IME_ACTION_GO;
        }
        return 0;
    }

    /**
     * Returns {@code true} when {@code editorInfo} represents a Search bar
     * ({@link EditorInfo#IME_ACTION_SEARCH}) or a single-line browser URI/Omnibox bar
     * ({@link EditorInfo#IME_ACTION_GO} + {@link InputType#TYPE_TEXT_VARIATION_URI}).
     */
    public static boolean isSearchBarField(EditorInfo editorInfo) {
        if (editorInfo == null) {
            return false;
        }
        int action = editorInfo.imeOptions & EditorInfo.IME_MASK_ACTION;
        if (action == EditorInfo.IME_ACTION_SEARCH) {
            return true;
        }
        return action == EditorInfo.IME_ACTION_GO && isBrowserUriSearchBar(editorInfo);
    }

    private static boolean isBrowserUriSearchBar(EditorInfo editorInfo) {
        int inputType = editorInfo.inputType;
        if ((inputType & InputType.TYPE_MASK_CLASS) != InputType.TYPE_CLASS_TEXT) {
            return false;
        }
        if ((inputType & InputType.TYPE_TEXT_FLAG_MULTI_LINE) != 0
                || (inputType & InputType.TYPE_TEXT_FLAG_IME_MULTI_LINE) != 0) {
            return false;
        }
        int variation = inputType & InputType.TYPE_MASK_VARIATION;
        return variation == InputType.TYPE_TEXT_VARIATION_URI;
    }

    /**
     * Returns {@link EditorInfo#IME_ACTION_SEND} or {@link EditorInfo#IME_ACTION_SEARCH} only when
     * the field explicitly supports that action and does NOT disable enter actions via
     * {@link EditorInfo#IME_FLAG_NO_ENTER_ACTION}. Returns {@code 0} otherwise.
     */
    public static int supportedDirectAction(EditorInfo editorInfo) {
        if (editorInfo == null) {
            return 0;
        }
        int opts = editorInfo.imeOptions;
        if ((opts & EditorInfo.IME_FLAG_NO_ENTER_ACTION) != 0) {
            return 0;
        }
        int action = opts & EditorInfo.IME_MASK_ACTION;
        if (action == EditorInfo.IME_ACTION_SEND || action == EditorInfo.IME_ACTION_SEARCH) {
            return action;
        }
        return 0;
    }

    public static List<String> parseTriggerPhrases(String raw) {
        if (raw == null || raw.trim().isEmpty()) {
            return Collections.emptyList();
        }
        LinkedHashSet<String> seen = new LinkedHashSet<String>();
        String[] parts = raw.split("[,\\r\\n;]+");
        for (String part : parts) {
            String normalized = part.trim().replaceAll("\\s+", " ");
            if (!normalized.isEmpty()) {
                seen.add(normalized);
            }
        }
        List<String> list = new ArrayList<String>(seen);
        Collections.sort(list, (a, b) -> Integer.compare(b.length(), a.length()));
        return list;
    }

    /**
     * If {@code text} ends with any trigger phrase (case-insensitive, with optional trailing
     * punctuation like "." or "!" and a word boundary before the trigger), returns the cleaned
     * text with the trigger and its preceding separator removed. Returns {@code null} if no
     * trigger matched.
     */
    public static String stripMatchingSuffix(String text, List<String> triggers) {
        if (text == null || text.trim().isEmpty() || triggers == null || triggers.isEmpty()) {
            return null;
        }
        for (String trigger : triggers) {
            if (trigger == null || trigger.trim().isEmpty()) {
                continue;
            }
            // Allow flexible internal whitespace inside multi-word triggers.
            String[] words = trigger.trim().split("\\s+");
            StringBuilder regex = new StringBuilder("(?i)(?:^|(?<=[\\s,;:.!?\\-\\u2014\\u3002\\uFF0C\\uFF01\\uFF1F]))");
            for (int i = 0; i < words.length; i++) {
                if (i > 0) {
                    regex.append("[\\s\\-]+");
                }
                regex.append(Pattern.quote(words[i]));
            }
            regex.append("[\\s.!?,;\\u2026\\u3002\\uFF01\\uFF1F]*$");

            Pattern pattern = Pattern.compile(regex.toString());
            Matcher matcher = pattern.matcher(text);
            if (!matcher.find()) {
                continue;
            }
            int cut = matcher.start();
            String prefix = text.substring(0, cut);
            // Strip trailing separators immediately before the spoken trigger (", hit send",
            // " - hit send", "; hit send", whitespace), while keeping sentence punctuation
            // like "Are you free? Hit send" -> "Are you free?".
            prefix = prefix.replaceAll("[\\s,;:\\-\\u2014\\uFF0C]+$", "");
            return prefix;
        }
        return null;
    }

    public static String applySnippets(String text, List<SnippetRule> rules) {
        if (text == null || text.isEmpty() || rules == null || rules.isEmpty()) {
            return text;
        }
        List<SnippetRule> active = new ArrayList<SnippetRule>();
        for (SnippetRule rule : rules) {
            if (rule != null && rule.enabled && !rule.trigger.isEmpty()) {
                active.add(rule);
            }
        }
        if (active.isEmpty()) {
            return text;
        }
        Collections.sort(active, (a, b) -> Integer.compare(b.trigger.length(), a.trigger.length()));
        String current = text;
        for (SnippetRule rule : active) {
            String trigger = rule.trigger;
            StringBuilder regex = new StringBuilder("(?iu)");
            if (Character.isLetterOrDigit(trigger.charAt(0))) {
                regex.append("(?<![\\p{L}\\p{N}_])");
            }
            String[] words = trigger.split("\\s+");
            for (int i = 0; i < words.length; i++) {
                if (i > 0) {
                    regex.append("\\s+");
                }
                regex.append(Pattern.quote(words[i]));
            }
            if (Character.isLetterOrDigit(trigger.charAt(trigger.length() - 1))) {
                regex.append("(?![\\p{L}\\p{N}_])");
            }
            try {
                Pattern pattern = Pattern.compile(regex.toString());
                current = pattern.matcher(current)
                        .replaceAll(Matcher.quoteReplacement(rule.expansion));
            } catch (Throwable ignored) {
                // Skip invalid snippet pattern safely.
            }
        }
        return current;
    }

    public static String applyReplaceRules(
            String text, String packageName, List<ReplaceRule> rules) {
        if (text == null || text.isEmpty() || rules == null || rules.isEmpty()) {
            return text;
        }
        String current = text;
        for (ReplaceRule rule : rules) {
            if (rule == null || !rule.enabled || rule.find.isEmpty()) {
                continue;
            }
            if (!rule.appliesToPackage(packageName)) {
                continue;
            }
            try {
                int flags = rule.caseSensitive ? 0 : (Pattern.CASE_INSENSITIVE | Pattern.UNICODE_CASE);
                if (rule.regex) {
                    Pattern p = Pattern.compile(rule.find, flags);
                    current = p.matcher(current).replaceAll(rule.replace);
                } else {
                    Pattern p = Pattern.compile(Pattern.quote(rule.find), flags);
                    current = p.matcher(current)
                            .replaceAll(Matcher.quoteReplacement(rule.replace));
                }
            } catch (Throwable ignored) {
                // Invalid regex or backreference must never crash Gboard.
            }
        }
        return current;
    }

    /**
     * Strips a single trailing sentence-ending ASCII period (".") while preserving ellipses
     * ("..."), abbreviations ("e.g.", "U.S.", "Dr.", "etc."), and any trailing whitespace outside
     * the sentence.
     */
    public static String stripTrailingPeriod(String text) {
        if (text == null || text.isEmpty()) {
            return text;
        }
        int end = text.length();
        while (end > 0 && Character.isWhitespace(text.charAt(end - 1))) {
            end--;
        }
        if (end <= 0 || text.charAt(end - 1) != '.') {
            return text;
        }
        // Preserve ellipses (".." or "...") and standalone "."
        if (end == 1 || text.charAt(end - 2) == '.') {
            return text;
        }
        String core = text.substring(0, end);
        if (DOTTED_ABBREVIATION.matcher(core).find()) {
            return text;
        }
        return core.substring(0, end - 1) + text.substring(end);
    }

    // ---- Snippets persistence ----

    public static List<SnippetRule> readSnippets(Context context) {
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        if (prefs == null) {
            return Collections.emptyList();
        }
        return parseSnippetsJson(prefs.getString(PREF_KEY_SNIPPETS_JSON, null));
    }

    public static boolean writeSnippets(Context context, List<SnippetRule> rules) {
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        if (prefs == null) {
            return false;
        }
        return prefs.edit()
                .putString(PREF_KEY_SNIPPETS_JSON, serializeSnippetsJson(rules))
                .commit();
    }

    public static boolean upsertSnippet(Context context, SnippetRule rule) {
        if (context == null || rule == null) {
            return false;
        }
        List<SnippetRule> list = new ArrayList<SnippetRule>(readSnippets(context));
        boolean replaced = false;
        for (int i = 0; i < list.size(); i++) {
            if (rule.id.equals(list.get(i).id)) {
                list.set(i, rule);
                replaced = true;
                break;
            }
        }
        if (!replaced) {
            list.add(rule);
        }
        return writeSnippets(context, list);
    }

    public static boolean deleteSnippet(Context context, String id) {
        if (context == null || id == null) {
            return false;
        }
        List<SnippetRule> list = new ArrayList<SnippetRule>(readSnippets(context));
        boolean removed = false;
        for (int i = list.size() - 1; i >= 0; i--) {
            if (id.equals(list.get(i).id)) {
                list.remove(i);
                removed = true;
            }
        }
        return removed && writeSnippets(context, list);
    }

    static List<SnippetRule> parseSnippetsJson(String raw) {
        if (raw == null || raw.trim().isEmpty()) {
            return Collections.emptyList();
        }
        try {
            JSONArray array = new JSONArray(raw);
            List<SnippetRule> out = new ArrayList<SnippetRule>(array.length());
            for (int i = 0; i < array.length(); i++) {
                JSONObject obj = array.optJSONObject(i);
                if (obj == null) {
                    continue;
                }
                String id = obj.optString("id", "snip_" + i);
                String trigger = obj.optString("trigger", "");
                String expansion = obj.optString("expansion", "");
                boolean enabled = obj.optBoolean("enabled", true);
                if (!trigger.trim().isEmpty()) {
                    out.add(new SnippetRule(id, trigger, expansion, enabled));
                }
            }
            return out;
        } catch (Throwable err) {
            logWarningSafely("Failed to parse snippets JSON", err);
            return Collections.emptyList();
        }
    }

    static String serializeSnippetsJson(List<SnippetRule> rules) {
        JSONArray array = new JSONArray();
        if (rules != null) {
            for (SnippetRule rule : rules) {
                if (rule == null || rule.trigger.isEmpty()) {
                    continue;
                }
                try {
                    JSONObject obj = new JSONObject();
                    obj.put("id", rule.id);
                    obj.put("trigger", rule.trigger);
                    obj.put("expansion", rule.expansion);
                    obj.put("enabled", rule.enabled);
                    array.put(obj);
                } catch (Throwable ignored) {
                    // Skip malformed entry.
                }
            }
        }
        return array.toString();
    }

    // ---- Find & Replace persistence ----

    public static List<ReplaceRule> readReplaceRules(Context context) {
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        if (prefs == null) {
            return Collections.emptyList();
        }
        return parseReplaceRulesJson(prefs.getString(PREF_KEY_REPLACE_RULES_JSON, null));
    }

    public static boolean writeReplaceRules(Context context, List<ReplaceRule> rules) {
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        if (prefs == null) {
            return false;
        }
        return prefs.edit()
                .putString(PREF_KEY_REPLACE_RULES_JSON, serializeReplaceRulesJson(rules))
                .commit();
    }

    public static boolean upsertReplaceRule(Context context, ReplaceRule rule) {
        if (context == null || rule == null) {
            return false;
        }
        List<ReplaceRule> list = new ArrayList<ReplaceRule>(readReplaceRules(context));
        boolean replaced = false;
        for (int i = 0; i < list.size(); i++) {
            if (rule.id.equals(list.get(i).id)) {
                list.set(i, rule);
                replaced = true;
                break;
            }
        }
        if (!replaced) {
            list.add(rule);
        }
        return writeReplaceRules(context, list);
    }

    public static boolean deleteReplaceRule(Context context, String id) {
        if (context == null || id == null) {
            return false;
        }
        List<ReplaceRule> list = new ArrayList<ReplaceRule>(readReplaceRules(context));
        boolean removed = false;
        for (int i = list.size() - 1; i >= 0; i--) {
            if (id.equals(list.get(i).id)) {
                list.remove(i);
                removed = true;
            }
        }
        return removed && writeReplaceRules(context, list);
    }

    static List<ReplaceRule> parseReplaceRulesJson(String raw) {
        if (raw == null || raw.trim().isEmpty()) {
            return Collections.emptyList();
        }
        try {
            JSONArray array = new JSONArray(raw);
            List<ReplaceRule> out = new ArrayList<ReplaceRule>(array.length());
            for (int i = 0; i < array.length(); i++) {
                JSONObject obj = array.optJSONObject(i);
                if (obj == null) {
                    continue;
                }
                String id = obj.optString("id", "rep_" + i);
                String find = obj.optString("find", "");
                String replace = obj.optString("replace", "");
                boolean regex = obj.optBoolean("regex", false);
                boolean caseSensitive = obj.optBoolean("caseSensitive", false);
                boolean enabled = obj.optBoolean("enabled", true);
                List<String> pkgs = new ArrayList<String>();
                JSONArray pkgArray = obj.optJSONArray("packages");
                if (pkgArray != null) {
                    for (int j = 0; j < pkgArray.length(); j++) {
                        String pkg = pkgArray.optString(j, "");
                        if (!pkg.trim().isEmpty()) {
                            pkgs.add(pkg.trim());
                        }
                    }
                }
                if (!find.isEmpty()) {
                    out.add(new ReplaceRule(id, find, replace, regex, caseSensitive, pkgs, enabled));
                }
            }
            return out;
        } catch (Throwable err) {
            logWarningSafely("Failed to parse replace rules JSON", err);
            return Collections.emptyList();
        }
    }

    static String serializeReplaceRulesJson(List<ReplaceRule> rules) {
        JSONArray array = new JSONArray();
        if (rules != null) {
            for (ReplaceRule rule : rules) {
                if (rule == null || rule.find.isEmpty()) {
                    continue;
                }
                try {
                    JSONObject obj = new JSONObject();
                    obj.put("id", rule.id);
                    obj.put("find", rule.find);
                    obj.put("replace", rule.replace);
                    obj.put("regex", rule.regex);
                    obj.put("caseSensitive", rule.caseSensitive);
                    obj.put("enabled", rule.enabled);
                    if (!rule.packages.isEmpty()) {
                        JSONArray pkgArray = new JSONArray();
                        for (String pkg : rule.packages) {
                            pkgArray.put(pkg);
                        }
                        obj.put("packages", pkgArray);
                    }
                    array.put(obj);
                } catch (Throwable ignored) {
                    // Skip malformed entry.
                }
            }
        }
        return array.toString();
    }

    // ---- Local Dictation History persistence ----

    public static List<HistoryEntry> readHistory(Context context) {
        synchronized (HISTORY_LOCK) {
            SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
            if (prefs == null) {
                return Collections.emptyList();
            }
            return parseHistoryJson(prefs.getString(PREF_KEY_HISTORY_JSON, null));
        }
    }

    public static boolean recordHistory(
            Context context, String packageName, String text, long timestampMs) {
        if (context == null || text == null || text.trim().isEmpty()) {
            return false;
        }
        String trimmed = text.trim();
        synchronized (HISTORY_LOCK) {
            SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
            if (prefs == null) {
                return false;
            }
            List<HistoryEntry> list = new ArrayList<HistoryEntry>(
                    parseHistoryJson(prefs.getString(PREF_KEY_HISTORY_JSON, null)));
            if (!list.isEmpty()) {
                HistoryEntry latest = list.get(0);
                if (trimmed.equals(latest.text)
                        && Math.abs(timestampMs - latest.timestampMs) <= DEDUP_HISTORY_WINDOW_MS) {
                    return true;
                }
            }
            String id = "hist_" + timestampMs + "_" + list.size();
            list.add(0, new HistoryEntry(id, timestampMs, packageName, trimmed));
            while (list.size() > MAX_HISTORY_ENTRIES) {
                list.remove(list.size() - 1);
            }
            return prefs.edit()
                    .putString(PREF_KEY_HISTORY_JSON, serializeHistoryJson(list))
                    .commit();
        }
    }

    public static boolean deleteHistoryEntry(Context context, String entryId) {
        if (context == null || entryId == null) {
            return false;
        }
        synchronized (HISTORY_LOCK) {
            SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
            if (prefs == null) {
                return false;
            }
            List<HistoryEntry> list = new ArrayList<HistoryEntry>(
                    parseHistoryJson(prefs.getString(PREF_KEY_HISTORY_JSON, null)));
            boolean removed = false;
            for (int i = list.size() - 1; i >= 0; i--) {
                if (entryId.equals(list.get(i).id)) {
                    list.remove(i);
                    removed = true;
                }
            }
            return removed && prefs.edit()
                    .putString(PREF_KEY_HISTORY_JSON, serializeHistoryJson(list))
                    .commit();
        }
    }

    public static boolean clearHistory(Context context) {
        if (context == null) {
            return false;
        }
        synchronized (HISTORY_LOCK) {
            SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
            return prefs != null && prefs.edit().remove(PREF_KEY_HISTORY_JSON).commit();
        }
    }

    static List<HistoryEntry> parseHistoryJson(String raw) {
        if (raw == null || raw.trim().isEmpty()) {
            return Collections.emptyList();
        }
        try {
            JSONArray array = new JSONArray(raw);
            List<HistoryEntry> out = new ArrayList<HistoryEntry>(array.length());
            for (int i = 0; i < array.length(); i++) {
                JSONObject obj = array.optJSONObject(i);
                if (obj == null) {
                    continue;
                }
                String text = obj.optString("text", "");
                if (text.trim().isEmpty()) {
                    continue;
                }
                long ts = obj.optLong("timestampMs", 0L);
                String id = obj.optString("id", "hist_" + ts + "_" + i);
                String pkg = obj.optString("packageName", "");
                out.add(new HistoryEntry(id, ts, pkg, text));
            }
            return out;
        } catch (Throwable err) {
            logWarningSafely("Failed to parse history JSON", err);
            return Collections.emptyList();
        }
    }

    static String serializeHistoryJson(List<HistoryEntry> entries) {
        JSONArray array = new JSONArray();
        if (entries != null) {
            for (HistoryEntry entry : entries) {
                if (entry == null || entry.text.isEmpty()) {
                    continue;
                }
                try {
                    JSONObject obj = new JSONObject();
                    obj.put("id", entry.id);
                    obj.put("timestampMs", entry.timestampMs);
                    obj.put("packageName", entry.packageName);
                    obj.put("text", entry.text);
                    array.put(obj);
                } catch (Throwable ignored) {
                    // Skip malformed entry.
                }
            }
        }
        return array.toString();
    }

    // ---- Reflection helpers for EditorInfo & performEditorAction ----

    private static void dispatchImeAction(Object pcn, int imeAction) {
        ActionDispatcher override = actionDispatcherOverrideForTesting;
        if (override != null) {
            override.dispatch(pcn, imeAction);
            return;
        }
        Runnable task = () -> invokePerformEditorAction(pcn, imeAction);
        try {
            new Handler(Looper.getMainLooper()).postDelayed(task, IME_ACTION_POST_DELAY_MS);
        } catch (Throwable ignored) {
            task.run();
        }
    }

    static boolean invokePerformEditorAction(Object pcn, int imeAction) {
        if (pcn == null || imeAction == 0) {
            return false;
        }
        try {
            ensurePcnMethods(pcn.getClass());
            Method perform = cachedPcnPerformActionMethod;
            if (perform == null) {
                return false;
            }
            perform.invoke(pcn, Integer.valueOf(imeAction));
            logInfoSafely("Hands-free voice action triggered: imeAction=" + imeAction);
            return true;
        } catch (Throwable err) {
            logWarningSafely("Failed to invoke performEditorAction(" + imeAction + ")", err);
            return false;
        }
    }

    private static EditorInfo resolveEditorInfo(Object pcn) {
        if (pcn != null) {
            try {
                ensurePcnMethods(pcn.getClass());
                Method getter = cachedPcnEditorInfoMethod;
                if (getter != null) {
                    Object res = getter.invoke(pcn);
                    if (res instanceof EditorInfo) {
                        activeEditorInfo = (EditorInfo) res;
                        return (EditorInfo) res;
                    }
                }
            } catch (Throwable ignored) {
                // Fall back to cached EditorInfo from onActivateInternal.
            }
        }
        return activeEditorInfo;
    }

    private static void ensurePcnMethods(Class<?> pcnClass) {
        if (cachedPcnClass == pcnClass
                && (cachedPcnEditorInfoMethod != null || cachedPcnPerformActionMethod != null)) {
            return;
        }
        Method editorGetter = null;
        String preferredGetter = RamblerDynamicConfig.PCN_GET_EDITOR_INFO_METHOD;
        if (preferredGetter != null && !preferredGetter.isEmpty()) {
            try {
                Method m = pcnClass.getMethod(preferredGetter);
                if (m.getReturnType() == EditorInfo.class) {
                    m.setAccessible(true);
                    editorGetter = m;
                }
            } catch (Throwable ignored) {
                // Scan below.
            }
        }
        if (editorGetter == null) {
            for (Method m : pcnClass.getMethods()) {
                if (!Modifier.isStatic(m.getModifiers())
                        && m.getParameterTypes().length == 0
                        && m.getReturnType() == EditorInfo.class) {
                    m.setAccessible(true);
                    editorGetter = m;
                    break;
                }
            }
        }

        Method performMethod = null;
        String preferredPerform = RamblerDynamicConfig.PCN_PERFORM_ACTION_METHOD;
        if (preferredPerform != null && !preferredPerform.isEmpty()) {
            try {
                Method m = pcnClass.getMethod(preferredPerform, int.class);
                if (m.getReturnType() == void.class) {
                    m.setAccessible(true);
                    performMethod = m;
                }
            } catch (Throwable ignored) {
                // Not found under preferred name.
            }
        }
        cachedPcnEditorInfoMethod = editorGetter;
        cachedPcnPerformActionMethod = performMethod;
        cachedPcnClass = pcnClass;
    }

    private static Context extractContext(Object ext) {
        if (ext == null) {
            return null;
        }
        try {
            Class<?> cls = ext.getClass();
            Field field = cachedExtContextField;
            if (cachedExtClass != cls || field == null) {
                field = findContextField(cls, RamblerDynamicConfig.AGENTIC_CONTEXT_FIELD);
                cachedExtContextField = field;
                cachedExtClass = cls;
            }
            if (field != null) {
                Object val = field.get(ext);
                if (val instanceof Context) {
                    return (Context) val;
                }
            }
        } catch (Throwable ignored) {
            // Fall back to Application context.
        }
        return null;
    }

    private static Field findContextField(Class<?> owner, String preferredName) {
        if (preferredName != null && !preferredName.isEmpty()) {
            Class<?> cursor = owner;
            while (cursor != null && cursor != Object.class) {
                try {
                    Field f = cursor.getDeclaredField(preferredName);
                    if (!Modifier.isStatic(f.getModifiers())
                            && Context.class.isAssignableFrom(f.getType())) {
                        f.setAccessible(true);
                        return f;
                    }
                } catch (NoSuchFieldException ignored) {
                    // Check superclass.
                }
                cursor = cursor.getSuperclass();
            }
        }
        Class<?> cursor = owner;
        while (cursor != null && cursor != Object.class) {
            for (Field f : cursor.getDeclaredFields()) {
                if (!Modifier.isStatic(f.getModifiers())
                        && Context.class.isAssignableFrom(f.getType())) {
                    f.setAccessible(true);
                    return f;
                }
            }
            cursor = cursor.getSuperclass();
        }
        return null;
    }

    public static String formatDurationLabel(int seconds) {
        if (seconds <= 0) {
            return "Gboard default";
        }
        if (seconds % 60 == 0) {
            int mins = seconds / 60;
            return mins + (mins == 1 ? " minute" : " minutes");
        }
        return seconds + " seconds";
    }

    public static String formatDurationBadge(int seconds) {
        if (seconds <= 0) {
            return "Default";
        }
        if (seconds % 60 == 0) {
            return (seconds / 60) + " min";
        }
        return seconds + "s";
    }

    private static void logInfoSafely(String message) {
        try {
            Log.i(TAG, message);
        } catch (Throwable ignored) {
            // Never propagate logging errors.
        }
    }

    private static void logWarningSafely(String message, Throwable throwable) {
        try {
            Log.w(TAG, message, throwable);
        } catch (Throwable ignored) {
            // Never propagate logging errors.
        }
    }
}
