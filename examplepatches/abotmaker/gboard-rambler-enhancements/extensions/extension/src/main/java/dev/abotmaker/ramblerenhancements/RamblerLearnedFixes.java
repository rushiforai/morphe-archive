package dev.abotmaker.ramblerenhancements;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * Automatic "Learn From My Fixes" engine for Gboard Rambler.
 *
 * <p>Ported and adapted from Hex by Anomaly ({@code DictationEdits.kt} and
 * {@code DictationFixes.kt}, MIT License). Classifies manual user edits and quick
 * delete-and-redictate corrections into plausible 1–3 word replacement pairs, promotes pairs
 * seen at least twice with zero contradictions and a single unambiguous meaning, tracks
 * contradictions on untouched dictations to auto-retire false rules, and applies active fixes
 * deterministically with whole-word boundary checks and smart case preservation.</p>
 */
public final class RamblerLearnedFixes {
    private static final String TAG = "RamblerEnhancements";
    public static final String PREF_KEY_LEARNED_FIXES_JSON = "pref_rambler_learned_fixes_v1";
    public static final String PREF_KEY_LEARNED_FIXES_DISABLED_JSON =
            "pref_rambler_learned_fixes_disabled_v1";

    public static final int MAX_WORDS = 400;
    public static final int MAX_PAIR_WORDS = 3;
    public static final int MAX_RECORDS = 1000;
    public static final int MINIMUM_COUNT = 2;
    private static final int MAX_DIFF_CELLS = 250_000;
    private static final String JOINERS = "-_/\\@#&+=~*.";
    private static final Set<String> I_FORMS = Collections.unmodifiableSet(
            new HashSet<String>(Arrays.asList("i", "i'm", "i'll", "i've", "i'd")));

    public static final class Word {
        public final String text;
        public final int start;
        public final int end;

        public Word(String text, int start, int end) {
            this.text = text;
            this.start = start;
            this.end = end;
        }
    }

    public static final class WordHunk {
        public final int oldStart;
        public final int oldEnd; // exclusive
        public final int newStart;
        public final int newEnd; // exclusive

        public WordHunk(int oldStart, int oldEnd, int newStart, int newEnd) {
            this.oldStart = oldStart;
            this.oldEnd = oldEnd;
            this.newStart = newStart;
            this.newEnd = newEnd;
        }

        public int oldCount() {
            return Math.max(0, oldEnd - oldStart);
        }

        public int newCount() {
            return Math.max(0, newEnd - newStart);
        }

        public boolean isOldEmpty() {
            return oldEnd <= oldStart;
        }

        public boolean isNewEmpty() {
            return newEnd <= newStart;
        }
    }

    public enum Outcome {
        KEPT,
        EDITED,
        REWRITTEN,
        UNDONE,
        DELETED,
        REDICTATED
    }

    public static final class EditPair {
        public final String heard;
        public final String inserted;
        public final String meant;

        public EditPair(String heard, String inserted, String meant) {
            this.heard = heard == null ? "" : heard;
            this.inserted = inserted == null ? "" : inserted;
            this.meant = meant == null ? "" : meant;
        }
    }

    public static final class DictationEdit {
        public final Outcome outcome;
        public final List<EditPair> pairs;
        public final int wordCount;
        public final int changedWords;
        public final List<List<String>> keptHeard;

        public DictationEdit(
                Outcome outcome,
                List<EditPair> pairs,
                int wordCount,
                int changedWords,
                List<List<String>> keptHeard) {
            this.outcome = outcome;
            this.pairs = pairs == null
                    ? Collections.<EditPair>emptyList()
                    : Collections.unmodifiableList(new ArrayList<EditPair>(pairs));
            this.wordCount = wordCount;
            this.changedWords = changedWords;
            this.keptHeard = keptHeard == null
                    ? Collections.<List<String>>emptyList()
                    : Collections.unmodifiableList(new ArrayList<List<String>>(keptHeard));
        }
    }

    public static final class FixRecord {
        public final String heard;
        public final String meant;
        public final int count;
        public final int contradictions;
        public final long lastAtMs;

        public FixRecord(String heard, String meant, int count, int contradictions, long lastAtMs) {
            this.heard = heard == null ? "" : heard.trim();
            this.meant = meant == null ? "" : meant.trim();
            this.count = Math.max(1, count);
            this.contradictions = Math.max(0, contradictions);
            this.lastAtMs = Math.max(0L, lastAtMs);
        }

        public String id() {
            return fixId(heard, meant);
        }
    }

    public static final class RecordOutcome {
        public final List<FixRecord> mergedRecords;
        public final List<FixRecord> newlyLearned;

        public RecordOutcome(List<FixRecord> mergedRecords, List<FixRecord> newlyLearned) {
            this.mergedRecords = Collections.unmodifiableList(mergedRecords);
            this.newlyLearned = Collections.unmodifiableList(newlyLearned);
        }
    }

    private static final Object STORE_LOCK = new Object();

    private RamblerLearnedFixes() {
    }

    // ---- Tokenization & normalization (Hex DictationText) ----

    public static List<Word> tokenizeWords(String text) {
        List<Word> words = new ArrayList<Word>();
        if (text == null || text.isEmpty()) {
            return words;
        }
        int wordStart = -1;
        int len = text.length();
        for (int i = 0; i < len; i++) {
            char c = text.charAt(i);
            boolean join = (c == '\'' || c == '\u2019');
            boolean isWordChar = Character.isLetterOrDigit(c)
                    || (join && wordStart >= 0 && i + 1 < len && Character.isLetter(text.charAt(i + 1)))
                    || (isCombiningMark(c) && wordStart >= 0);
            if (isWordChar) {
                if (wordStart < 0) {
                    wordStart = i;
                }
            } else if (wordStart >= 0) {
                words.add(new Word(text.substring(wordStart, i), wordStart, i));
                wordStart = -1;
            }
        }
        if (wordStart >= 0) {
            words.add(new Word(text.substring(wordStart), wordStart, len));
        }
        return words;
    }

    public static String wordKey(String word) {
        if (word == null) {
            return "";
        }
        return word.toLowerCase(Locale.ROOT).replace('\u2019', '\'');
    }

    public static String phraseKey(String phrase) {
        List<Word> words = tokenizeWords(phrase);
        if (words.isEmpty()) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < words.size(); i++) {
            if (i > 0) {
                sb.append(' ');
            }
            sb.append(wordKey(words.get(i).text));
        }
        return sb.toString();
    }

    public static String lettersOnly(String text) {
        if (text == null || text.isEmpty()) {
            return "";
        }
        String lower = text.toLowerCase(Locale.ROOT);
        StringBuilder sb = new StringBuilder(lower.length());
        for (int i = 0; i < lower.length(); i++) {
            char c = lower.charAt(i);
            if (Character.isLetterOrDigit(c)) {
                sb.append(c);
            }
        }
        return sb.toString();
    }

    public static boolean isCombiningMark(char c) {
        int type = Character.getType(c);
        return type == Character.NON_SPACING_MARK
                || type == Character.COMBINING_SPACING_MARK
                || type == Character.ENCLOSING_MARK;
    }

    public static int levenshteinDistance(String a, String b) {
        if (a == null || a.isEmpty()) {
            return b == null ? 0 : b.length();
        }
        if (b == null || b.isEmpty()) {
            return a.length();
        }
        int m = b.length();
        int[] prev = new int[m + 1];
        for (int j = 0; j <= m; j++) {
            prev[j] = j;
        }
        for (int i = 1; i <= a.length(); i++) {
            int[] row = new int[m + 1];
            row[0] = i;
            char ca = a.charAt(i - 1);
            for (int j = 1; j <= m; j++) {
                int cost = (ca == b.charAt(j - 1)) ? 0 : 1;
                int del = prev[j] + 1;
                int ins = row[j - 1] + 1;
                int sub = prev[j - 1] + cost;
                row[j] = Math.min(Math.min(del, ins), sub);
            }
            prev = row;
        }
        return prev[m];
    }

    public static String fixId(String heard, String meant) {
        return phraseKey(heard) + " \u2192 " + phraseKey(meant);
    }

    // ---- Word LCS diff (Hex DictationWordDiff) ----

    public static List<WordHunk> wordDiffHunks(List<String> oldWords, List<String> newWords) {
        int oldSize = oldWords.size();
        int newSize = newWords.size();
        int prefix = 0;
        while (prefix < oldSize && prefix < newSize
                && oldWords.get(prefix).equals(newWords.get(prefix))) {
            prefix++;
        }
        int suffix = 0;
        while (suffix < oldSize - prefix && suffix < newSize - prefix
                && oldWords.get(oldSize - 1 - suffix).equals(newWords.get(newSize - 1 - suffix))) {
            suffix++;
        }
        List<String> a = oldWords.subList(prefix, oldSize - suffix);
        List<String> b = newWords.subList(prefix, newSize - suffix);
        if (a.isEmpty() && b.isEmpty()) {
            return Collections.emptyList();
        }
        int n = a.size();
        int m = b.size();
        if (n == 0 || m == 0 || (long) n * (long) m > MAX_DIFF_CELLS) {
            return Collections.singletonList(
                    new WordHunk(prefix, prefix + n, prefix, prefix + m));
        }

        int[][] table = new int[n + 1][m + 1];
        for (int i = n - 1; i >= 0; i--) {
            String ai = a.get(i);
            for (int j = m - 1; j >= 0; j--) {
                if (ai.equals(b.get(j))) {
                    table[i][j] = table[i + 1][j + 1] + 1;
                } else {
                    table[i][j] = Math.max(table[i + 1][j], table[i][j + 1]);
                }
            }
        }

        List<WordHunk> hunks = new ArrayList<WordHunk>();
        int i = 0;
        int j = 0;
        int openI = -1;
        int openJ = -1;
        while (i < n || j < m) {
            if (i < n && j < m && a.get(i).equals(b.get(j))) {
                if (openI >= 0) {
                    hunks.add(new WordHunk(prefix + openI, prefix + i, prefix + openJ, prefix + j));
                    openI = -1;
                }
                i++;
                j++;
            } else {
                if (openI < 0) {
                    openI = i;
                    openJ = j;
                }
                if (j >= m || (i < n && table[i + 1][j] >= table[i][j + 1])) {
                    i++;
                } else {
                    j++;
                }
            }
        }
        if (openI >= 0) {
            hunks.add(new WordHunk(prefix + openI, prefix + n, prefix + openJ, prefix + m));
        }
        return hunks;
    }

    // ---- Edit & Redictation classifier (Hex DictationEdits) ----

    public static DictationEdit classifyEdit(
            String heard, String inserted, String finalText, boolean undone) {
        List<Word> ins = tokenizeWords(inserted);
        if (ins.isEmpty() || ins.size() > MAX_WORDS) {
            return null;
        }
        List<String> insertedWords = textsOf(ins);
        List<Word> finalWordObjs = tokenizeWords(finalText);
        if (finalWordObjs.isEmpty()) {
            return new DictationEdit(
                    undone ? Outcome.UNDONE : Outcome.DELETED,
                    Collections.<EditPair>emptyList(),
                    ins.size(),
                    ins.size(),
                    Collections.<List<String>>emptyList());
        }
        if (finalWordObjs.size() > MAX_WORDS * 2) {
            return null;
        }
        List<String> finalWords = textsOf(finalWordObjs);
        List<WordHunk> all = wordDiffHunks(insertedWords, finalWords);

        // Words typed before or after the dictation are new writing, not a fix of it.
        List<WordHunk> hunks = new ArrayList<WordHunk>(all.size());
        for (WordHunk h : all) {
            boolean edgeInsertion = h.isOldEmpty() && !h.isNewEmpty()
                    && (h.oldStart == 0 || h.oldStart == insertedWords.size());
            if (!edgeInsertion) {
                hunks.add(h);
            }
        }

        List<String> heardWords = (heard != null && !heard.isEmpty())
                ? textsOf(tokenizeWords(heard))
                : Collections.<String>emptyList();
        if (heardWords.isEmpty()) {
            heardWords = insertedWords;
        }

        HeardAlignment alignment = new HeardAlignment(heardWords, insertedWords);
        if (hunks.isEmpty()) {
            return new DictationEdit(
                    Outcome.KEPT,
                    Collections.<EditPair>emptyList(),
                    ins.size(),
                    0,
                    alignment.keptRuns(hunks, ins.size()));
        }

        int changed = 0;
        for (WordHunk h : hunks) {
            changed += Math.max(h.oldCount(), h.newCount());
        }
        if (changed > Math.max(1, ins.size() / 2)) {
            return new DictationEdit(
                    Outcome.REWRITTEN,
                    Collections.<EditPair>emptyList(),
                    ins.size(),
                    changed,
                    Collections.<List<String>>emptyList());
        }

        boolean startsSentence = !insertedWords.isEmpty()
                && !insertedWords.get(0).isEmpty()
                && Character.isUpperCase(insertedWords.get(0).charAt(0));
        List<EditPair> pairs = new ArrayList<EditPair>();
        for (WordHunk hunk : hunks) {
            if (hunk.isOldEmpty() || hunk.isNewEmpty()
                    || hunk.oldCount() > MAX_PAIR_WORDS
                    || hunk.newCount() > MAX_PAIR_WORDS) {
                continue;
            }
            String insertedText = joinSlice(insertedWords, hunk.oldStart, hunk.oldEnd);
            String meantText = joinSlice(finalWords, hunk.newStart, hunk.newEnd);
            String heardText = alignment.heardFor(hunk.oldStart, hunk.oldEnd);
            if (heardText == null) {
                heardText = insertedText;
            }
            if (tokenizeWords(heardText).size() > MAX_PAIR_WORDS
                    || tokenizeWords(meantText).size() > MAX_PAIR_WORDS) {
                continue;
            }
            if (!isPlausibleFix(insertedText, meantText) && !isPlausibleFix(heardText, meantText)) {
                continue;
            }
            boolean atSentenceStart = (hunk.newStart == 0)
                    ? startsSentence
                    : startsSentence(finalWordObjs.get(hunk.newStart), finalText);
            meantText = normalizeSentenceCapital(meantText, atSentenceStart);
            if (meantText.equals(insertedText)) {
                continue;
            }
            pairs.add(new EditPair(heardText, insertedText, meantText));
        }

        return new DictationEdit(
                Outcome.EDITED,
                pairs,
                ins.size(),
                changed,
                alignment.keptRuns(hunks, ins.size()));
    }

    public static DictationEdit classifyRedictation(
            String previousHeard, String previousInserted, String nextInserted) {
        List<Word> oldObjs = tokenizeWords(previousInserted);
        if (oldObjs.isEmpty() || oldObjs.size() > MAX_WORDS) {
            return null;
        }
        List<String> oldWords = textsOf(oldObjs);
        List<Word> nextObjs = tokenizeWords(nextInserted);
        if (nextObjs.isEmpty() || nextObjs.size() > MAX_WORDS * 2) {
            return new DictationEdit(
                    Outcome.REDICTATED,
                    Collections.<EditPair>emptyList(),
                    oldObjs.size(),
                    oldObjs.size(),
                    Collections.<List<String>>emptyList());
        }
        List<String> nextWords = textsOf(nextObjs);
        List<WordHunk> hunks = wordDiffHunks(keysOf(oldWords), keysOf(nextWords));
        int changed = 0;
        for (WordHunk h : hunks) {
            changed += Math.max(h.oldCount(), h.newCount());
        }
        if (changed > Math.max(1, oldObjs.size() / 2)) {
            return new DictationEdit(
                    Outcome.REDICTATED,
                    Collections.<EditPair>emptyList(),
                    oldObjs.size(),
                    changed,
                    Collections.<List<String>>emptyList());
        }

        List<String> heardWords = (previousHeard != null && !previousHeard.isEmpty())
                ? textsOf(tokenizeWords(previousHeard))
                : Collections.<String>emptyList();
        if (heardWords.isEmpty()) {
            heardWords = oldWords;
        }
        HeardAlignment alignment = new HeardAlignment(heardWords, oldWords);
        boolean startsSentence = !nextWords.isEmpty()
                && !nextWords.get(0).isEmpty()
                && Character.isUpperCase(nextWords.get(0).charAt(0));
        List<EditPair> pairs = new ArrayList<EditPair>();
        for (WordHunk hunk : hunks) {
            if (hunk.isOldEmpty() || hunk.isNewEmpty()
                    || hunk.oldCount() > MAX_PAIR_WORDS
                    || hunk.newCount() > MAX_PAIR_WORDS) {
                continue;
            }
            String insertedText = joinSlice(oldWords, hunk.oldStart, hunk.oldEnd);
            String heardText = alignment.heardFor(hunk.oldStart, hunk.oldEnd);
            if (heardText == null) {
                heardText = insertedText;
            }
            String meantText = joinSlice(nextWords, hunk.newStart, hunk.newEnd);
            if (tokenizeWords(heardText).size() > MAX_PAIR_WORDS
                    || tokenizeWords(meantText).size() > MAX_PAIR_WORDS) {
                continue;
            }
            if (!isPlausibleFix(insertedText, meantText) && !isPlausibleFix(heardText, meantText)) {
                continue;
            }
            boolean atSentenceStart = (hunk.newStart == 0)
                    ? startsSentence
                    : startsSentence(nextObjs.get(hunk.newStart), nextInserted);
            meantText = normalizeSentenceCapital(meantText, atSentenceStart);
            if (meantText.equals(insertedText)) {
                continue;
            }
            pairs.add(new EditPair(heardText, insertedText, meantText));
        }

        return new DictationEdit(
                Outcome.REDICTATED,
                pairs,
                oldObjs.size(),
                changed,
                Collections.<List<String>>emptyList());
    }

    public static boolean isPlausibleFix(String heard, String meant) {
        String a = lettersOnly(heard);
        String b = lettersOnly(meant);
        if (a.isEmpty() || b.isEmpty()) {
            return false;
        }
        if (a.equals(b)) {
            return true;
        }
        int limit = Math.max(2, Math.max(a.length(), b.length()) / 2);
        return levenshteinDistance(a, b) <= limit;
    }

    // ---- Merging, contradiction tracking, learning & applying (Hex DictationFixes) ----

    public static List<FixRecord> merge(
            List<FixRecord> records,
            DictationEdit edit,
            long nowMs,
            Set<String> disabledIds) {
        List<FixRecord> out = new ArrayList<FixRecord>(
                records == null ? Collections.<FixRecord>emptyList() : records);
        if (edit == null) {
            return out;
        }
        Set<String> disabled = disabledIds == null ? Collections.<String>emptySet() : disabledIds;

        for (EditPair pair : edit.pairs) {
            String heardKey = phraseKey(pair.heard);
            String meantKey = phraseKey(pair.meant);
            String trimmedMeant = pair.meant.trim();
            if (heardKey.isEmpty() || meantKey.isEmpty() || trimmedMeant.isEmpty()) {
                continue;
            }
            if (trimmedMeant.equals(pair.heard)) {
                continue;
            }
            // A pure case change is not a fix unless the replacement carries intentional capitals.
            if (heardKey.equals(meantKey) && !hasUpperCase(trimmedMeant)) {
                continue;
            }
            if (tokenizeWords(heardKey).size() > MAX_PAIR_WORDS
                    || tokenizeWords(meantKey).size() > MAX_PAIR_WORDS) {
                continue;
            }
            int existingIdx = -1;
            for (int i = 0; i < out.size(); i++) {
                FixRecord r = out.get(i);
                if (phraseKey(r.heard).equals(heardKey) && phraseKey(r.meant).equals(meantKey)) {
                    existingIdx = i;
                    break;
                }
            }
            if (existingIdx >= 0) {
                FixRecord old = out.get(existingIdx);
                out.set(existingIdx, new FixRecord(
                        old.heard, trimmedMeant, old.count + 1, old.contradictions, nowMs));
            } else {
                out.add(new FixRecord(heardKey, trimmedMeant, 1, 0, nowMs));
            }
        }

        for (int i = 0; i < out.size(); i++) {
            FixRecord fix = out.get(i);
            if (disabled.contains(fix.id())) {
                continue;
            }
            if (contradicts(edit, fix)) {
                out.set(i, new FixRecord(
                        fix.heard, fix.meant, fix.count, fix.contradictions + 1, fix.lastAtMs));
            }
        }

        if (out.size() > MAX_RECORDS) {
            List<Integer> indices = new ArrayList<Integer>(out.size());
            for (int i = 0; i < out.size(); i++) {
                indices.add(Integer.valueOf(i));
            }
            Collections.sort(indices, new Comparator<Integer>() {
                @Override
                public int compare(Integer a, Integer b) {
                    FixRecord ra = out.get(a.intValue());
                    FixRecord rb = out.get(b.intValue());
                    int cmp = Integer.compare(ra.count, rb.count);
                    if (cmp != 0) {
                        return cmp;
                    }
                    return Long.compare(ra.lastAtMs, rb.lastAtMs);
                }
            });
            int dropCount = out.size() - MAX_RECORDS;
            List<Integer> toDrop = new ArrayList<Integer>(indices.subList(0, dropCount));
            Collections.sort(toDrop, Collections.reverseOrder());
            for (Integer idx : toDrop) {
                out.remove(idx.intValue());
            }
        }

        return out;
    }

    /**
     * Returns fixes seen at least {@value #MINIMUM_COUNT} times, with zero contradictions,
     * and only one unambiguous meaning for those heard words.
     */
    public static List<FixRecord> learned(List<FixRecord> records) {
        if (records == null || records.isEmpty()) {
            return Collections.emptyList();
        }
        Map<String, Group> groups = new LinkedHashMap<String, Group>();
        for (FixRecord record : records) {
            String heardKey = phraseKey(record.heard);
            String meantKey = phraseKey(record.meant);
            if (heardKey.isEmpty() || meantKey.isEmpty()) {
                continue;
            }
            if (tokenizeWords(heardKey).size() > MAX_PAIR_WORDS
                    || tokenizeWords(meantKey).size() > MAX_PAIR_WORDS) {
                continue;
            }
            String groupKey = heardKey + " \u2192 " + meantKey;
            Group group = groups.get(groupKey);
            if (group == null) {
                group = new Group(heardKey, record.meant);
                groups.put(groupKey, group);
            }
            group.count += record.count;
            group.contradictions += record.contradictions;
            group.lastAtMs = Math.max(group.lastAtMs, record.lastAtMs);
            if (hasUpperCase(record.meant)) {
                group.meant = record.meant;
            }
        }
        Map<String, Integer> meaningsPerHeard = new HashMap<String, Integer>();
        for (Group g : groups.values()) {
            Integer prev = meaningsPerHeard.get(g.heard);
            meaningsPerHeard.put(g.heard, Integer.valueOf(prev == null ? 1 : prev.intValue() + 1));
        }
        List<FixRecord> result = new ArrayList<FixRecord>();
        for (Group g : groups.values()) {
            Integer meaningCount = meaningsPerHeard.get(g.heard);
            if (g.count >= MINIMUM_COUNT
                    && g.contradictions == 0
                    && meaningCount != null
                    && meaningCount.intValue() == 1) {
                result.add(new FixRecord(g.heard, g.meant, g.count, 0, g.lastAtMs));
            }
        }
        return result;
    }

    /**
     * Returns pending records that are currently below the learning threshold (count == 1,
     * zero contradictions, unique meaning) so users can inspect or promote/dismiss them.
     */
    public static List<FixRecord> tracking(List<FixRecord> records) {
        if (records == null || records.isEmpty()) {
            return Collections.emptyList();
        }
        List<FixRecord> result = new ArrayList<FixRecord>();
        for (FixRecord r : records) {
            if (r.count > 0 && r.count < MINIMUM_COUNT && r.contradictions == 0) {
                result.add(r);
            }
        }
        Collections.sort(result, new Comparator<FixRecord>() {
            @Override
            public int compare(FixRecord a, FixRecord b) {
                return Long.compare(b.lastAtMs, a.lastAtMs);
            }
        });
        return result;
    }

    public static List<FixRecord> active(List<FixRecord> learnedFixes, Set<String> disabledIds) {
        if (learnedFixes == null || learnedFixes.isEmpty()) {
            return Collections.emptyList();
        }
        if (disabledIds == null || disabledIds.isEmpty()) {
            return new ArrayList<FixRecord>(learnedFixes);
        }
        List<FixRecord> out = new ArrayList<FixRecord>(learnedFixes.size());
        for (FixRecord fix : learnedFixes) {
            if (!disabledIds.contains(fix.id())) {
                out.add(fix);
            }
        }
        return out;
    }

    /**
     * Applies learned fixes with whole-word boundary checks, longest-phrase-first matching,
     * and case preservation. Any heard phrase already covered by an active manual Find &amp;
     * Replace rule is skipped so manual rules always take precedence.
     */
    public static String apply(
            List<FixRecord> fixes,
            String text,
            Set<String> manualFindKeys) {
        if (fixes == null || fixes.isEmpty() || text == null || text.isEmpty()) {
            return text == null ? "" : text;
        }
        Map<List<String>, String> table = new HashMap<List<String>, String>();
        int longest = 0;
        for (FixRecord fix : fixes) {
            String pKey = phraseKey(fix.heard);
            if (manualFindKeys != null && manualFindKeys.contains(pKey)) {
                continue;
            }
            List<Word> heardWords = tokenizeWords(fix.heard);
            String meant = fix.meant == null ? "" : fix.meant.trim();
            if (heardWords.isEmpty()
                    || heardWords.size() > MAX_PAIR_WORDS
                    || tokenizeWords(meant).size() > MAX_PAIR_WORDS
                    || meant.isEmpty()) {
                continue;
            }
            List<String> keys = new ArrayList<String>(heardWords.size());
            for (Word w : heardWords) {
                keys.add(wordKey(w.text));
            }
            if (!table.containsKey(keys)) {
                table.put(keys, meant);
                if (keys.size() > longest) {
                    longest = keys.size();
                }
            }
        }
        if (table.isEmpty()) {
            return text;
        }
        List<Word> words = tokenizeWords(text);
        StringBuilder out = new StringBuilder(text.length());
        int copied = 0;
        int index = 0;
        while (index < words.size()) {
            int matched = 0;
            int maxWindow = Math.min(longest, words.size() - index);
            for (int count = maxWindow; count >= 1; count--) {
                List<Word> window = words.subList(index, index + count);
                if (!joinedBySpaces(window, text)) {
                    continue;
                }
                List<String> keys = new ArrayList<String>(count);
                for (Word w : window) {
                    keys.add(wordKey(w.text));
                }
                String meant = table.get(keys);
                if (meant == null) {
                    continue;
                }
                int start = window.get(0).start;
                int end = window.get(count - 1).end;
                if (!isWordBounded(start, end, text)) {
                    continue;
                }
                out.append(text, copied, start);
                out.append(matchCase(meant, text.substring(start, end)));
                copied = end;
                matched = count;
                break;
            }
            index += Math.max(1, matched);
        }
        out.append(text, copied, text.length());
        return out.toString();
    }

    public static String apply(List<FixRecord> fixes, String text) {
        return apply(fixes, text, null);
    }

    // ---- Persistence (SharedPreferences JSON) ----

    public static List<FixRecord> readRecords(Context context) {
        if (context == null) {
            return Collections.emptyList();
        }
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        if (prefs == null) {
            return Collections.emptyList();
        }
        synchronized (STORE_LOCK) {
            return parseRecordsJson(prefs.getString(PREF_KEY_LEARNED_FIXES_JSON, ""));
        }
    }

    public static boolean writeRecords(Context context, List<FixRecord> records) {
        if (context == null) {
            return false;
        }
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        if (prefs == null) {
            return false;
        }
        synchronized (STORE_LOCK) {
            return prefs.edit()
                    .putString(PREF_KEY_LEARNED_FIXES_JSON, serializeRecordsJson(records))
                    .commit();
        }
    }

    public static Set<String> readDisabledIds(Context context) {
        if (context == null) {
            return Collections.emptySet();
        }
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        if (prefs == null) {
            return Collections.emptySet();
        }
        synchronized (STORE_LOCK) {
            return parseDisabledIdsJson(prefs.getString(PREF_KEY_LEARNED_FIXES_DISABLED_JSON, ""));
        }
    }

    public static boolean writeDisabledIds(Context context, Set<String> disabledIds) {
        if (context == null) {
            return false;
        }
        SharedPreferences prefs = RamblerEnhancementsSettings.preferencesOrNull(context);
        if (prefs == null) {
            return false;
        }
        synchronized (STORE_LOCK) {
            return prefs.edit()
                    .putString(
                            PREF_KEY_LEARNED_FIXES_DISABLED_JSON,
                            serializeDisabledIdsJson(disabledIds))
                    .commit();
        }
    }

    public static List<FixRecord> readActiveFixes(Context context) {
        synchronized (STORE_LOCK) {
            List<FixRecord> records = readRecords(context);
            Set<String> disabled = readDisabledIds(context);
            return active(learned(records), disabled);
        }
    }

    /**
     * Folds a settled {@link DictationEdit} into persisted records and reports any fixes that
     * crossed the promotion threshold and became newly active during this update.
     */
    public static RecordOutcome recordEdit(Context context, DictationEdit edit, long nowMs) {
        if (context == null || edit == null) {
            return new RecordOutcome(
                    Collections.<FixRecord>emptyList(), Collections.<FixRecord>emptyList());
        }
        synchronized (STORE_LOCK) {
            List<FixRecord> before = readRecords(context);
            Set<String> disabled = readDisabledIds(context);
            Set<String> beforeActiveIds = new HashSet<String>();
            for (FixRecord f : active(learned(before), disabled)) {
                beforeActiveIds.add(f.id());
            }

            List<FixRecord> merged = merge(before, edit, nowMs, disabled);
            writeRecords(context, merged);

            List<FixRecord> newlyLearned = new ArrayList<FixRecord>();
            for (FixRecord f : active(learned(merged), disabled)) {
                if (!beforeActiveIds.contains(f.id())) {
                    newlyLearned.add(f);
                }
            }
            return new RecordOutcome(merged, newlyLearned);
        }
    }

    public static boolean setFixDisabled(Context context, String fixId, boolean disabledFlag) {
        if (context == null || fixId == null || fixId.trim().isEmpty()) {
            return false;
        }
        synchronized (STORE_LOCK) {
            LinkedHashSet<String> ids = new LinkedHashSet<String>(readDisabledIds(context));
            if (disabledFlag) {
                ids.add(fixId);
            } else {
                ids.remove(fixId);
            }
            return writeDisabledIds(context, ids);
        }
    }

    /**
     * Immediately promotes a pending (count &lt; 2) record to active learned status.
     */
    public static boolean promoteRecordNow(Context context, String fixId, long nowMs) {
        if (context == null || fixId == null || fixId.trim().isEmpty()) {
            return false;
        }
        synchronized (STORE_LOCK) {
            List<FixRecord> records = new ArrayList<FixRecord>(readRecords(context));
            boolean changed = false;
            for (int i = 0; i < records.size(); i++) {
                FixRecord r = records.get(i);
                if (fixId.equals(r.id())) {
                    records.set(i, new FixRecord(
                            r.heard,
                            r.meant,
                            Math.max(r.count, MINIMUM_COUNT),
                            0,
                            nowMs));
                    changed = true;
                }
            }
            if (changed) {
                writeRecords(context, records);
                setFixDisabled(context, fixId, false);
            }
            return changed;
        }
    }

    public static boolean deleteRecord(Context context, String fixId) {
        if (context == null || fixId == null || fixId.trim().isEmpty()) {
            return false;
        }
        synchronized (STORE_LOCK) {
            List<FixRecord> records = new ArrayList<FixRecord>(readRecords(context));
            boolean removed = false;
            for (int i = records.size() - 1; i >= 0; i--) {
                if (fixId.equals(records.get(i).id())) {
                    records.remove(i);
                    removed = true;
                }
            }
            if (removed) {
                writeRecords(context, records);
                LinkedHashSet<String> ids = new LinkedHashSet<String>(readDisabledIds(context));
                if (ids.remove(fixId)) {
                    writeDisabledIds(context, ids);
                }
            }
            return removed;
        }
    }

    public static boolean clearAll(Context context) {
        if (context == null) {
            return false;
        }
        synchronized (STORE_LOCK) {
            boolean a = writeRecords(context, Collections.<FixRecord>emptyList());
            boolean b = writeDisabledIds(context, Collections.<String>emptySet());
            return a && b;
        }
    }

    public static String serializeRecordsJson(List<FixRecord> records) {
        JSONArray array = new JSONArray();
        if (records != null) {
            for (FixRecord r : records) {
                if (r == null || r.heard.isEmpty() || r.meant.isEmpty()) {
                    continue;
                }
                try {
                    JSONObject obj = new JSONObject();
                    obj.put("heard", r.heard);
                    obj.put("meant", r.meant);
                    obj.put("count", r.count);
                    obj.put("contradictions", r.contradictions);
                    obj.put("lastAtMs", r.lastAtMs);
                    array.put(obj);
                } catch (Throwable ignored) {
                    // Skip malformed entry.
                }
            }
        }
        return array.toString();
    }

    public static List<FixRecord> parseRecordsJson(String raw) {
        List<FixRecord> out = new ArrayList<FixRecord>();
        if (raw == null || raw.trim().isEmpty()) {
            return out;
        }
        try {
            JSONArray array = new JSONArray(raw);
            for (int i = 0; i < array.length(); i++) {
                JSONObject obj = array.optJSONObject(i);
                if (obj == null) {
                    continue;
                }
                String heard = obj.optString("heard", "").trim();
                String meant = obj.optString("meant", "").trim();
                int count = obj.optInt("count", 0);
                int contradictions = obj.optInt("contradictions", 0);
                long lastAt = obj.optLong("lastAtMs", 0L);
                if (!heard.isEmpty() && !meant.isEmpty() && count >= 1 && contradictions >= 0) {
                    out.add(new FixRecord(heard, meant, count, contradictions, lastAt));
                }
            }
        } catch (Throwable err) {
            Log.w(TAG, "Failed to parse learned fixes JSON", err);
        }
        return out;
    }

    public static String serializeDisabledIdsJson(Set<String> disabledIds) {
        JSONArray array = new JSONArray();
        if (disabledIds != null) {
            for (String id : disabledIds) {
                if (id != null && !id.trim().isEmpty()) {
                    array.put(id.trim());
                }
            }
        }
        return array.toString();
    }

    public static Set<String> parseDisabledIdsJson(String raw) {
        LinkedHashSet<String> out = new LinkedHashSet<String>();
        if (raw == null || raw.trim().isEmpty()) {
            return out;
        }
        try {
            JSONArray array = new JSONArray(raw);
            for (int i = 0; i < array.length(); i++) {
                String id = array.optString(i, "").trim();
                if (!id.isEmpty()) {
                    out.add(id);
                }
            }
        } catch (Throwable err) {
            Log.w(TAG, "Failed to parse disabled learned fix IDs JSON", err);
        }
        return out;
    }

    // ---- Internal helpers ----

    private static final class Group {
        final String heard;
        String meant;
        int count;
        int contradictions;
        long lastAtMs;

        Group(String heard, String meant) {
            this.heard = heard;
            this.meant = meant;
        }
    }

    private static final class HeardAlignment {
        private final List<String> heard;
        private final int[] sourceStart;
        private final int[] sourceEnd; // exclusive, -1 if unmapped
        private final boolean[] same;

        HeardAlignment(List<String> heard, List<String> inserted) {
            this.heard = heard;
            int insSize = inserted.size();
            this.sourceStart = new int[insSize];
            this.sourceEnd = new int[insSize];
            this.same = new boolean[insSize];
            Arrays.fill(sourceStart, -1);
            Arrays.fill(sourceEnd, -1);

            List<WordHunk> hunks = wordDiffHunks(keysOf(heard), keysOf(inserted));
            int h = 0;
            int i = 0;
            for (WordHunk hunk : hunks) {
                while (i < hunk.newStart && h < hunk.oldStart) {
                    sourceStart[i] = h;
                    sourceEnd[i] = h + 1;
                    same[i] = true;
                    h++;
                    i++;
                }
                if (!hunk.isOldEmpty()) {
                    for (int k = hunk.newStart; k < hunk.newEnd && k < insSize; k++) {
                        sourceStart[k] = hunk.oldStart;
                        sourceEnd[k] = hunk.oldEnd;
                    }
                }
                h = hunk.oldEnd;
                i = hunk.newEnd;
            }
            while (i < insSize && h < heard.size()) {
                sourceStart[i] = h;
                sourceEnd[i] = h + 1;
                same[i] = true;
                h++;
                i++;
            }
        }

        String heardFor(int start, int end) {
            if (end <= start) {
                return null;
            }
            int lower = Integer.MAX_VALUE;
            int upper = Integer.MIN_VALUE;
            for (int idx = start; idx < end; idx++) {
                if (idx < 0 || idx >= sourceStart.length || sourceStart[idx] < 0) {
                    return null;
                }
                lower = Math.min(lower, sourceStart[idx]);
                upper = Math.max(upper, sourceEnd[idx]);
            }
            if (lower < 0 || upper > heard.size() || upper <= lower) {
                return null;
            }
            return joinSlice(heard, lower, upper);
        }

        List<List<String>> keptRuns(List<WordHunk> hunks, int insertedCount) {
            boolean[] touched = new boolean[insertedCount];
            for (WordHunk h : hunks) {
                for (int idx = h.oldStart; idx < h.oldEnd; idx++) {
                    if (idx >= 0 && idx < insertedCount) {
                        touched[idx] = true;
                    }
                }
            }
            List<List<String>> runs = new ArrayList<List<String>>();
            List<String> run = new ArrayList<String>();
            for (int idx = 0; idx < insertedCount; idx++) {
                if (!touched[idx] && same[idx] && sourceStart[idx] >= 0
                        && sourceStart[idx] < heard.size()) {
                    run.add(wordKey(heard.get(sourceStart[idx])));
                } else if (!run.isEmpty()) {
                    runs.add(run);
                    run = new ArrayList<String>();
                }
            }
            if (!run.isEmpty()) {
                runs.add(run);
            }
            return runs;
        }
    }

    private static boolean contradicts(DictationEdit edit, FixRecord fix) {
        String heardKey = phraseKey(fix.heard);
        String meantKey = phraseKey(fix.meant);
        List<String> heardRun = Arrays.asList(heardKey.split(" "));
        if (!heardKey.equals(meantKey)) {
            for (List<String> keptRun : edit.keptHeard) {
                if (containsRun(keptRun, heardRun)) {
                    return true;
                }
            }
        }
        String fixMeantLetters = lettersOnly(fix.meant);
        for (EditPair pair : edit.pairs) {
            String pairHeard = phraseKey(pair.heard);
            String pairInserted = phraseKey(pair.inserted);
            String pairMeant = phraseKey(pair.meant);
            String pairMeantLetters = lettersOnly(pair.meant);
            boolean extended = pairMeantLetters.length() > fixMeantLetters.length()
                    && pairMeantLetters.startsWith(fixMeantLetters);
            boolean changedFix = pairHeard.equals(heardKey)
                    && pairInserted.equals(meantKey)
                    && !pair.meant.equals(fix.meant)
                    && !extended;
            boolean reversed = pairMeant.equals(heardKey)
                    && !pairMeant.equals(meantKey)
                    && (pairInserted.equals(meantKey) || pairHeard.equals(meantKey));
            if (changedFix || reversed) {
                return true;
            }
        }
        return false;
    }

    private static boolean containsRun(List<String> run, List<String> phrase) {
        if (phrase.isEmpty() || phrase.size() > run.size()) {
            return false;
        }
        int limit = run.size() - phrase.size();
        for (int start = 0; start <= limit; start++) {
            boolean match = true;
            for (int k = 0; k < phrase.size(); k++) {
                if (!run.get(start + k).equals(phrase.get(k))) {
                    match = false;
                    break;
                }
            }
            if (match) {
                return true;
            }
        }
        return false;
    }

    private static boolean startsSentence(Word word, String text) {
        int i = word.start;
        while (i > 0) {
            i--;
            char c = text.charAt(i);
            if (c == '\n' || c == '\r') {
                return true;
            }
            if (Character.isWhitespace(c)
                    || "\"\u201C\u201D'\u2018\u2019([".indexOf(c) >= 0) {
                continue;
            }
            return ".!?\u2026".indexOf(c) >= 0;
        }
        return true;
    }

    private static String normalizeSentenceCapital(String meant, boolean sentenceStart) {
        if (meant == null || meant.isEmpty() || !sentenceStart) {
            return meant == null ? "" : meant;
        }
        char first = meant.charAt(0);
        if (!Character.isUpperCase(first)) {
            return meant;
        }
        for (int i = 1; i < meant.length(); i++) {
            if (Character.isUpperCase(meant.charAt(i))) {
                return meant;
            }
        }
        List<Word> words = tokenizeWords(meant);
        String firstWord = words.isEmpty() ? "" : wordKey(words.get(0).text);
        if (I_FORMS.contains(firstWord)) {
            return meant;
        }
        return Character.toLowerCase(first) + meant.substring(1);
    }

    private static boolean joinedBySpaces(List<Word> window, String text) {
        for (int i = 1; i < window.size(); i++) {
            int gapStart = window.get(i - 1).end;
            int gapEnd = window.get(i).start;
            if (gapEnd <= gapStart) {
                return false;
            }
            for (int p = gapStart; p < gapEnd; p++) {
                char c = text.charAt(p);
                if (c != ' ' && c != '\t') {
                    return false;
                }
            }
        }
        return true;
    }

    private static boolean isWordBounded(int start, int end, String text) {
        if (start > 0) {
            char prev = text.charAt(start - 1);
            if (JOINERS.indexOf(prev) >= 0 || isCombiningMark(prev)) {
                return false;
            }
        }
        if (end >= text.length()) {
            return true;
        }
        char next = text.charAt(end);
        if (JOINERS.indexOf(next) < 0 && !isCombiningMark(next)) {
            return true;
        }
        if (next != '.') {
            return false;
        }
        if (end + 1 >= text.length()) {
            return true;
        }
        char following = text.charAt(end + 1);
        return Character.isWhitespace(following)
                || following == '.'
                || "\"\u201D\u2019')]".indexOf(following) >= 0;
    }

    private static String matchCase(String meant, String like) {
        StringBuilder letters = new StringBuilder();
        for (int i = 0; i < like.length(); i++) {
            char c = like.charAt(i);
            if (Character.isLetter(c)) {
                letters.append(c);
            }
        }
        String letterStr = letters.toString();
        if (letterStr.length() >= 2
                && letterStr.equals(letterStr.toUpperCase(Locale.ROOT))
                && !letterStr.equals(letterStr.toLowerCase(Locale.ROOT))) {
            return meant.toUpperCase(Locale.ROOT);
        }
        if (hasUpperCase(meant)) {
            return meant;
        }
        for (int i = 0; i < like.length(); i++) {
            char c = like.charAt(i);
            if (Character.isLetter(c)) {
                if (Character.isUpperCase(c) && !meant.isEmpty()) {
                    return Character.toUpperCase(meant.charAt(0)) + meant.substring(1);
                }
                return meant;
            }
        }
        return meant;
    }

    private static boolean hasUpperCase(String s) {
        if (s == null) {
            return false;
        }
        for (int i = 0; i < s.length(); i++) {
            if (Character.isUpperCase(s.charAt(i))) {
                return true;
            }
        }
        return false;
    }

    private static List<String> textsOf(List<Word> words) {
        List<String> out = new ArrayList<String>(words.size());
        for (Word w : words) {
            out.add(w.text);
        }
        return out;
    }

    private static List<String> keysOf(List<String> words) {
        List<String> out = new ArrayList<String>(words.size());
        for (String w : words) {
            out.add(wordKey(w));
        }
        return out;
    }

    private static String joinSlice(List<String> words, int start, int end) {
        StringBuilder sb = new StringBuilder();
        for (int i = start; i < end; i++) {
            if (i > start) {
                sb.append(' ');
            }
            sb.append(words.get(i));
        }
        return sb.toString();
    }
}
