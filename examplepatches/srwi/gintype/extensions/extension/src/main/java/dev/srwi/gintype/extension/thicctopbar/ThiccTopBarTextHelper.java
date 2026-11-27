package dev.srwi.gintype.extension.thicctopbar;

import android.content.Context;
import android.content.ContextWrapper;
import android.inputmethodservice.InputMethodService;
import android.util.Log;
import android.view.View;
import android.view.inputmethod.ExtractedText;
import android.view.inputmethod.ExtractedTextRequest;
import android.view.inputmethod.InputConnection;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * Text and cursor manipulation utilities for Thicc Top Bar.
 * Isolates word boundary detection, sentence splitting, active word resolution,
 * and text replacement via InputConnection.
 */
public final class ThiccTopBarTextHelper {
    private static final String TAG = "ThiccTopBarTextHelper";

    private ThiccTopBarTextHelper() {}

    private static void logI(String tag, String msg) {
        try {
            if (Log.isLoggable(tag, Log.DEBUG)) {
                Log.i(tag, msg);
            }
        } catch (Throwable ignored) {
        }
    }

    private static void logW(String tag, String msg) {
        try {
            Log.w(tag, msg);
        } catch (Throwable ignored) {
        }
    }

    private static void logE(String tag, String msg, Throwable t) {
        try {
            Log.e(tag, msg, t);
        } catch (Throwable ignored) {
        }
    }

    public static final class TokenParts {
        public final String prefix;
        public final String word;
        public final String suffix;
        public final String fullToken;

        public TokenParts(String prefix, String word, String suffix, String fullToken) {
            this.prefix = prefix != null ? prefix : "";
            this.word = word != null ? word : "";
            this.suffix = suffix != null ? suffix : "";
            this.fullToken = fullToken != null ? fullToken : "";
        }

        public boolean hasWord() {
            return !word.isEmpty();
        }

        @Override
        public String toString() {
            return "TokenParts{prefix='" + prefix + "', word='" + word + "', suffix='" + suffix + "', fullToken='" + fullToken + "'}";
        }
    }

    public static boolean isBoundaryCodePoint(int codePoint) {
        if (Character.isWhitespace(codePoint)) return true;
        if (Character.isLetterOrDigit(codePoint)) return false;
        int type = Character.getType(codePoint);
        if (type == Character.NON_SPACING_MARK || type == Character.COMBINING_SPACING_MARK) {
            return false;
        }
        return true;
    }

    public static boolean isBoundaryChar(char c) {
        return isBoundaryCodePoint(c);
    }

    public static boolean isBoundaryChar(CharSequence text, int index) {
        if (text == null || index < 0 || index >= text.length()) return true;
        char c = text.charAt(index);
        if (Character.isHighSurrogate(c) && index + 1 < text.length()) {
            char low = text.charAt(index + 1);
            if (Character.isLowSurrogate(low)) {
                return isBoundaryCodePoint(Character.toCodePoint(c, low));
            }
        } else if (Character.isLowSurrogate(c) && index > 0) {
            char high = text.charAt(index - 1);
            if (Character.isHighSurrogate(high)) {
                return isBoundaryCodePoint(Character.toCodePoint(high, c));
            }
        }
        if (Character.isWhitespace(c)) return true;

        // Contextual exceptions for internal connectors within words or numbers:
        if (index > 0 && index + 1 < text.length()) {
            char prev = text.charAt(index - 1);
            char next = text.charAt(index + 1);

            // 1. Decimal or thousands separator between digits: "3,14", "1.500"
            if ((c == '.' || c == ',') && Character.isDigit(prev) && Character.isDigit(next)) {
                return false;
            }

            // 2. Contraction apostrophe between letters: "geht's", "don't", "c'est", "geht’s"
            if ((c == '\'' || c == '’' || c == '`') && Character.isLetter(prev) && Character.isLetter(next)) {
                return false;
            }

            // 3. Hyphen, underscore, or slash in compound words: "E-Mail", "Wi-Fi", "Covid-19", "und/oder"
            if ((c == '-' || c == '_' || c == '/') && Character.isLetterOrDigit(prev) && Character.isLetterOrDigit(next)) {
                return false;
            }
        }

        return isBoundaryChar(c);
    }

    public static boolean isLeadingSymbol(char c) {
        return c == '(' || c == '[' || c == '{' || c == '<'
                || c == '"' || c == '\'' || c == '„' || c == '“' || c == '‘' || c == '«'
                || c == '$' || c == '€' || c == '£' || c == '¥' || c == '₹' || c == '₽' || c == '₩'
                || c == '@' || c == '#' || c == '¿' || c == '¡';
    }

    public static boolean isTrailingSymbol(char c) {
        return c == '.' || c == ',' || c == '!' || c == '?' || c == ';' || c == ':' || c == '…'
                || c == ')' || c == ']' || c == '}' || c == '>'
                || c == '"' || c == '\'' || c == '”' || c == '’' || c == '»'
                || c == '%' || c == '‰' || c == '°'
                || c == '€' || c == '$' || c == '£';
    }

    public static boolean isTrailingPunctuationOnly(String s) {
        if (s == null || s.isEmpty()) return false;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (!isTrailingSymbol(c)) {
                return false;
            }
        }
        return true;
    }

    public static TokenParts parseTokenParts(String token) {
        if (token == null || token.isEmpty()) {
            return new TokenParts("", "", "", "");
        }
        int len = token.length();
        int start = -1;
        for (int i = 0; i < len; i++) {
            if (!isBoundaryChar(token, i)) {
                start = i;
                break;
            }
        }
        if (start == -1) {
            return new TokenParts(token, "", "", token);
        }

        int end = -1;
        for (int i = len - 1; i >= start; i--) {
            if (!isBoundaryChar(token, i)) {
                end = i + 1;
                break;
            }
        }

        String prefix = token.substring(0, start);
        String word = token.substring(start, end);
        String suffix = token.substring(end);
        return new TokenParts(prefix, word, suffix, token);
    }

    public static List<TokenParts> splitChunkIntoTokenParts(String chunk) {
        List<TokenParts> list = new ArrayList<>();
        if (chunk == null || chunk.isEmpty()) return list;

        int len = chunk.length();
        int i = 0;
        while (i < len) {
            int prefixStart = i;
            while (i < len && isBoundaryChar(chunk, i)) {
                i++;
            }
            if (i < len) {
                int wordStart = i;
                while (i < len && !isBoundaryChar(chunk, i)) {
                    i++;
                }
                int wordEnd = i;
                int suffixStart = i;
                while (i < len && isBoundaryChar(chunk, i)) {
                    if (i + 1 < len && !isBoundaryChar(chunk, i + 1)) {
                        char c = chunk.charAt(i);
                        if (isLeadingSymbol(c)) {
                            break;
                        }
                    }
                    i++;
                }
                int suffixEnd = i;
                String prefix = chunk.substring(prefixStart, wordStart);
                String word = chunk.substring(wordStart, wordEnd);
                String suffix = chunk.substring(suffixStart, suffixEnd);
                list.add(new TokenParts(prefix, word, suffix, prefix + word + suffix));
            } else {
                if (prefixStart < len) {
                    String symbols = chunk.substring(prefixStart);
                    list.add(new TokenParts(symbols, "", "", symbols));
                }
            }
        }
        return list;
    }

    public static List<TokenParts> tokenizeSentence(String sentence) {
        List<TokenParts> tokens = new ArrayList<>();
        if (sentence == null || sentence.isEmpty()) {
            return tokens;
        }
        String[] chunks = sentence.split("\\s+");
        for (String chunk : chunks) {
            String tr = chunk.trim();
            if (tr.isEmpty()) continue;
            tokens.addAll(splitChunkIntoTokenParts(tr));
        }
        return tokens;
    }

    public static boolean isInputEmpty(View view) {
        InputConnection ic = getInputConnection(view);
        return isInputEmpty(ic);
    }

    public static boolean isInputEmpty(InputConnection ic) {
        if (ic == null) return true;
        try {
            CharSequence before = ic.getTextBeforeCursor(10, 0);
            if (before != null && before.length() > 0) return false;
            CharSequence sel = ic.getSelectedText(0);
            if (sel != null && sel.length() > 0) return false;
            CharSequence after = ic.getTextAfterCursor(10, 0);
            return after == null || after.length() == 0;
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean isSentenceEnded(View view) {
        InputConnection ic = getInputConnection(view);
        return isSentenceEnded(ic);
    }

    public static boolean isSentenceEnded(InputConnection ic) {
        if (ic == null) return false;
        try {
            CharSequence sel = ic.getSelectedText(0);
            if (sel != null && sel.length() > 0) return false;
            if (hasTextAfterCursorOnSameLine(ic)) return false;
            CharSequence cs = ic.getTextBeforeCursor(20, 0);
            return isSentenceEnded(cs);
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean hasTextAfterCursorOnSameLine(View view) {
        InputConnection ic = getInputConnection(view);
        return hasTextAfterCursorOnSameLine(ic);
    }

    public static boolean hasTextAfterCursorOnSameLine(InputConnection ic) {
        if (ic == null) return false;
        try {
            CharSequence csAfter = ic.getTextAfterCursor(200, 0);
            if (csAfter == null || csAfter.length() == 0) return false;
            for (int i = 0; i < csAfter.length(); i++) {
                char c = csAfter.charAt(i);
                if (c == '\n' || c == '\r') {
                    return false;
                }
                if (!Character.isWhitespace(c)) {
                    return true;
                }
            }
            return false;
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean isSentenceEnded(CharSequence cs) {
        if (cs == null || cs.length() == 0) return false;
        String s = cs.toString();
        int idx = s.length() - 1;
        while (idx >= 0 && Character.isWhitespace(s.charAt(idx)) && s.charAt(idx) != '\n' && s.charAt(idx) != '\r') {
            idx--;
        }
        if (idx < 0) return false;
        char last = s.charAt(idx);
        return (last == '\n' || last == '\r');
    }

    public static String getActiveWord(View view, List<GboardThiccTopBarRuntime.CandidateItem> items) {
        return getActiveWord(view, items, true);
    }

    public static String getActiveWord(View view, List<GboardThiccTopBarRuntime.CandidateItem> items, boolean allowTrailingSpace) {
        InputConnection ic = getInputConnection(view);
        if (ic == null) return null;
        try {
            CharSequence cs = ic.getTextBeforeCursor(100, 0);
            return getActiveWord(cs, items, allowTrailingSpace);
        } catch (Throwable ignored) {
            return null;
        }
    }

    public static String getActiveWord(CharSequence cs, List<GboardThiccTopBarRuntime.CandidateItem> items) {
        return getActiveWord(cs, items, true);
    }

    public static String getActiveWord(CharSequence cs, List<GboardThiccTopBarRuntime.CandidateItem> items, boolean allowTrailingSpace) {
        if (cs == null || cs.length() == 0) return null;
        String s = cs.toString();
        int len = s.length();
        if (len == 0) return null;

        int end = len;
        boolean hasTrailingSpace = Character.isWhitespace(s.charAt(len - 1));
        if (hasTrailingSpace) {
            if (!allowTrailingSpace) {
                return null;
            }
            // If there are multiple trailing whitespaces, user pressed multiple spaces -> no active word.
            if (len >= 2 && Character.isWhitespace(s.charAt(len - 2))) {
                return null;
            }

            // If items is non-empty and EVERY item is a next-word prediction:
            // then the word was completed and user moved on. Suppress next-word predictions per user request.
            if (items != null && !items.isEmpty() && allPredictions(items)) {
                return null;
            }

            // Otherwise (swipe typing auto-space, or word without predictions like 'toggles'):
            // the word right before the single trailing space is our active word!
            end--;
            if (end <= 0 || Character.isWhitespace(s.charAt(end - 1))) {
                return null;
            }
        }

        int start = end - 1;
        while (start >= 0 && !isBoundaryChar(s, start)) {
            start--;
        }
        if (start < end - 1) {
            String word = s.substring(start + 1, end).trim();
            if (!word.isEmpty()) {
                // During a live glide gesture for the next word (while the previously committed
                // word + optional auto-space still remains in the InputConnection), Gboard emits a single
                // non-prediction live preview recommendation (e.g. "sollten" after "dann ", or "zu"
                // after "manchmal" when committed without trailing space). Reject it so the previous
                // word isn't paired with the next word's preview and its alternatives overwritten.
                if (items != null && items.size() == 1) {
                    GboardThiccTopBarRuntime.CandidateItem only = items.get(0);
                    if (only != null && only.text != null && !only.isRaw && !only.isPrediction) {
                        String onlyText = only.text.trim();
                        if (!onlyText.equalsIgnoreCase(word)) {
                            if (hasTrailingSpace || !onlyText.regionMatches(true, 0, word, 0, word.length())) {
                                return null;
                            }
                        }
                    }
                }
                return word;
            }
        }
        return null;
    }

    /**
     * Resolves the active word at the cursor, or when the current line ends with trailing
     * punctuation (e.g. {@code "gehts?"} or {@code "gehts ?"}), resolves that last core word.
     * Trailing whitespace without punctuation still returns {@code null}.
     */
    public static String getActiveOrTrailingPunctuatedWord(View view) {
        InputConnection ic = getInputConnection(view);
        return getActiveOrTrailingPunctuatedWord(ic);
    }

    public static String getActiveOrTrailingPunctuatedWord(InputConnection ic) {
        if (ic == null) return null;
        try {
            CharSequence cs = ic.getTextBeforeCursor(200, 0);
            return getActiveOrTrailingPunctuatedWord(cs);
        } catch (Throwable ignored) {
            return null;
        }
    }

    public static String getActiveOrTrailingPunctuatedWord(CharSequence cs) {
        String active = getActiveWord(cs, Collections.emptyList(), false);
        if (active != null && !active.isEmpty()) {
            return active;
        }
        if (cs == null || cs.length() == 0) {
            return null;
        }
        String s = cs.toString();
        int lineStart = 0;
        for (int i = s.length() - 1; i >= 0; i--) {
            char c = s.charAt(i);
            if (c == '\n' || c == '\r') {
                lineStart = i + 1;
                break;
            }
        }
        String line = s.substring(lineStart).trim();
        if (line.isEmpty()) {
            return null;
        }
        char lastChar = line.charAt(line.length() - 1);
        if (!isTrailingSymbol(lastChar) && !(isBoundaryChar(line, line.length() - 1) && !Character.isWhitespace(lastChar))) {
            return null;
        }
        List<TokenParts> tokens = tokenizeValidTokens(line);
        if (tokens.isEmpty()) {
            return null;
        }
        TokenParts lastToken = tokens.get(tokens.size() - 1);
        if (lastToken.hasWord() && !lastToken.suffix.isEmpty()) {
            return lastToken.word;
        }
        return null;
    }

    public static boolean allPredictions(List<GboardThiccTopBarRuntime.CandidateItem> items) {
        if (items == null || items.isEmpty()) return false;
        for (GboardThiccTopBarRuntime.CandidateItem ci : items) {
            if (!ci.isPrediction) return false;
        }
        return true;
    }

    public static boolean isPunctuationChar(char c) {
        return isBoundaryChar(c);
    }

    public static String stripTrailingPunctuation(String word) {
        if (word == null || word.isEmpty()) return "";
        TokenParts parts = parseTokenParts(word);
        return parts.prefix + parts.word;
    }

    public static String getTrailingPunctuation(String word) {
        if (word == null || word.isEmpty()) return "";
        TokenParts parts = parseTokenParts(word);
        return parts.suffix;
    }

    public static String getCoreWord(String word) {
        if (word == null || word.isEmpty()) return "";
        TokenParts parts = parseTokenParts(word);
        return parts.hasWord() ? parts.word : word;
    }

    private static boolean isTitleCaseWord(String word) {
        if (word == null || word.isEmpty() || !Character.isUpperCase(word.charAt(0))) {
            return false;
        }
        for (int i = 1; i < word.length(); i++) {
            if (Character.isLowerCase(word.charAt(i))) {
                return true;
            }
        }
        return false;
    }

    public static void syncSentenceBufferFromText(
            View view,
            String currentWord,
            ThiccTopBarSentenceBuffer buffer,
            Map<String, List<String>> alternativesCache
    ) {
        InputConnection ic = getInputConnection(view);
        syncSentenceBufferFromText(ic, currentWord, buffer, alternativesCache);
    }

    public static void syncSentenceBufferFromText(
            InputConnection ic,
            String currentWord,
            ThiccTopBarSentenceBuffer buffer,
            Map<String, List<String>> alternativesCache
    ) {
        syncSentenceBufferWithSplit(ic, currentWord, false, buffer, alternativesCache);
    }

    public static int syncSentenceBufferWithSplit(
            View view,
            String currentWord,
            boolean isLiveGuess,
            ThiccTopBarSentenceBuffer buffer,
            Map<String, List<String>> alternativesCache
    ) {
        InputConnection ic = getInputConnection(view);
        return syncSentenceBufferWithSplit(ic, currentWord, isLiveGuess, buffer, alternativesCache);
    }

    /**
     * Synchronizes {@code buffer} with the current paragraph around the cursor, excluding any
     * active word currently being edited/replaced and returning how many buffered entries precede
     * the active column (so words after the cursor remain in-place to its right).
     */
    public static int syncSentenceBufferWithSplit(
            InputConnection ic,
            String currentWord,
            boolean isLiveGuess,
            ThiccTopBarSentenceBuffer buffer,
            Map<String, List<String>> alternativesCache
    ) {
        if (ic == null || buffer == null) return 0;
        try {
            CharSequence csBefore = ic.getTextBeforeCursor(2000, 0);
            CharSequence csSel = ic.getSelectedText(0);
            CharSequence csAfter = ic.getTextAfterCursor(2000, 0);

            String before = csBefore != null ? csBefore.toString() : "";
            String sel = csSel != null ? csSel.toString() : "";
            String after = csAfter != null ? csAfter.toString() : "";

            String fullText = before + sel + after;
            if (fullText.isEmpty()) {
                buffer.clear();
                return 0;
            }
            int cursorOffset = before.length();
            int sentStart = 0;
            for (int i = cursorOffset - 1; i >= 0; i--) {
                char c = fullText.charAt(i);
                if (c == '\n' || c == '\r') {
                    sentStart = i + 1;
                    break;
                }
            }
            int sentEnd = fullText.length();
            for (int i = cursorOffset; i < fullText.length(); i++) {
                char c = fullText.charAt(i);
                if (c == '\n' || c == '\r') {
                    sentEnd = i;
                    break;
                }
            }
            String targetText = fullText.substring(sentStart, sentEnd).trim();
            if (targetText.isEmpty()) {
                buffer.clear();
                return 0;
            }

            List<TokenParts> validTokens = tokenizeValidTokens(targetText);
            if (validTokens.isEmpty()) {
                buffer.clear();
                return 0;
            }

            String paraBeforeCursor = before.substring(Math.min(sentStart, before.length())).trim();
            List<TokenParts> beforeTokens = paraBeforeCursor.isEmpty()
                    ? Collections.emptyList()
                    : tokenizeValidTokens(paraBeforeCursor);

            boolean hasActiveWord = (currentWord != null && !currentWord.isEmpty());
            int excludeTokenIndex = -1;
            int splitInValidTokens = validTokens.size();

            if (hasActiveWord) {
                int idx = beforeTokens.size() - 1;
                if (idx >= 0 && idx < validTokens.size()) {
                    excludeTokenIndex = idx;
                    splitInValidTokens = idx;
                }
            } else if (isLiveGuess) {
                if (!sel.isEmpty()) {
                    int idx = beforeTokens.size();
                    if (idx >= 0 && idx < validTokens.size()) {
                        excludeTokenIndex = idx;
                        splitInValidTokens = idx;
                    }
                } else {
                    splitInValidTokens = Math.min(beforeTokens.size(), validTokens.size());
                }
            }

            List<TokenParts> historyTokens = new ArrayList<>(validTokens.size());
            int splitInHistory = 0;
            for (int i = 0; i < validTokens.size(); i++) {
                if (i == excludeTokenIndex) {
                    continue;
                }
                if (i < splitInValidTokens) {
                    splitInHistory++;
                }
                historyTokens.add(validTokens.get(i));
            }

            int historyWordCount = historyTokens.size();
            int windowStart = 0;
            int windowEnd = historyWordCount;

            if (historyWordCount > ThiccTopBarSentenceBuffer.MAX_WINDOW_SIZE) {
                int cursorWordIdx;
                if (hasActiveWord || isLiveGuess) {
                    cursorWordIdx = Math.max(0, Math.min(historyWordCount - 1, splitInHistory > 0 ? splitInHistory - 1 : 0));
                } else {
                    int wordsBefore = collectWordSpans(before.substring(Math.min(sentStart, before.length()))).size();
                    cursorWordIdx = Math.max(0, Math.min(historyWordCount - 1, wordsBefore - (sel.isEmpty() && wordsBefore > 0 ? 1 : 0)));
                    if (!sel.isEmpty()) {
                        cursorWordIdx = Math.max(0, Math.min(historyWordCount - 1, wordsBefore));
                    }
                }

                int maxWindowStart = historyWordCount - ThiccTopBarSentenceBuffer.MAX_WINDOW_SIZE;
                int prevStart = Math.max(0, Math.min(maxWindowStart, buffer.getWindowStartWordIndex()));
                int prevSize = buffer.getEntries().size();
                int margin = ThiccTopBarSentenceBuffer.EDGE_HYSTERESIS;
                boolean leftOk = (prevStart == 0) || (cursorWordIdx >= prevStart + margin);
                boolean rightOk = (prevStart + ThiccTopBarSentenceBuffer.MAX_WINDOW_SIZE >= historyWordCount)
                        || (cursorWordIdx <= prevStart + ThiccTopBarSentenceBuffer.MAX_WINDOW_SIZE - 1 - margin);

                if (prevSize == ThiccTopBarSentenceBuffer.MAX_WINDOW_SIZE && leftOk && rightOk) {
                    windowStart = prevStart;
                } else {
                    windowStart = Math.max(0, Math.min(maxWindowStart, cursorWordIdx - ThiccTopBarSentenceBuffer.MAX_WINDOW_SIZE / 2));
                }
                windowEnd = Math.min(historyWordCount, windowStart + ThiccTopBarSentenceBuffer.MAX_WINDOW_SIZE);
            }

            buffer.clear();
            buffer.setWindowStartWordIndex(windowStart);
            for (int i = windowStart; i < windowEnd; i++) {
                TokenParts parts = historyTokens.get(i);
                String baseWord = parts.word;
                String prefix = parts.prefix;
                String suffix = parts.suffix;

                List<String> rawAlts = null;
                boolean usedLowercaseFallback = false;
                if (alternativesCache != null) {
                    rawAlts = alternativesCache.get(baseWord);
                    if (rawAlts == null || rawAlts.isEmpty()) {
                        rawAlts = alternativesCache.get(baseWord.toLowerCase());
                        usedLowercaseFallback = (rawAlts != null && !rawAlts.isEmpty());
                    }
                }
                boolean preserveTitleCase = usedLowercaseFallback && isTitleCaseWord(baseWord);
                List<String> formattedAlts = new ArrayList<>();
                int selIdx = 0;

                if (rawAlts != null && !rawAlts.isEmpty()) {
                    for (int a = 0; a < rawAlts.size(); a++) {
                        String rawAlt = rawAlts.get(a);
                        if (preserveTitleCase && !rawAlt.isEmpty() && Character.isLowerCase(rawAlt.charAt(0))) {
                            rawAlt = Character.toUpperCase(rawAlt.charAt(0)) + rawAlt.substring(1);
                        }
                        formattedAlts.add(prefix + rawAlt + suffix);
                        if (rawAlt.equalsIgnoreCase(baseWord)) {
                            selIdx = a;
                        }
                    }
                } else {
                    formattedAlts.add(parts.fullToken);
                }

                buffer.addWord(parts.fullToken, formattedAlts, selIdx);
            }
            return Math.max(0, Math.min(windowEnd - windowStart, splitInHistory - windowStart));
        } catch (Throwable t) {
            logW(TAG, "syncSentenceBufferFromText error: " + t.getMessage());
            return buffer.getEntries().size();
        }
    }

    private static List<TokenParts> tokenizeValidTokens(String text) {
        List<TokenParts> allTokens = tokenizeSentence(text);
        List<TokenParts> validTokens = new ArrayList<>(allTokens.size());
        for (TokenParts parts : allTokens) {
            if (parts.hasWord()) {
                validTokens.add(parts);
            } else if (!validTokens.isEmpty() && isTrailingPunctuationOnly(parts.prefix)) {
                // Pure trailing punctuation mark typed after space (e.g. "Hallo .", "Hallo ,", "Hallo !")
                int lastIdx = validTokens.size() - 1;
                TokenParts prev = validTokens.get(lastIdx);
                String combinedSuffix = prev.suffix + parts.prefix;
                validTokens.set(lastIdx, new TokenParts(prev.prefix, prev.word, combinedSuffix, prev.prefix + prev.word + combinedSuffix));
            }
        }
        return validTokens;
    }

    public static boolean replaceActiveWordInTextField(View view, String newWord) {
        InputConnection ic = getInputConnection(view);
        return replaceActiveWordInTextField(ic, newWord);
    }

    public static boolean replaceActiveWordInTextField(InputConnection ic, String newWord) {
        if (ic == null || newWord == null || newWord.isEmpty()) return false;
        try {
            ic.finishComposingText();

            CharSequence csSel = ic.getSelectedText(0);
            String sel = csSel != null ? csSel.toString() : "";
            if (!sel.isEmpty()) {
                ic.commitText(newWord, 1);
                logI(TAG, "replaceActiveWordInTextField: replaced selection '" + sel + "' with '" + newWord + "'");
                return true;
            }

            CharSequence cs = ic.getTextBeforeCursor(200, 0);
            if (cs == null || cs.length() == 0) {
                ic.commitText(newWord, 1);
                return true;
            }

            String text = cs.toString();
            int end = text.length();
            while (end > 0) {
                char ch = text.charAt(end - 1);
                if (ch == '\n' || ch == '\r' || !Character.isWhitespace(ch)) {
                    break;
                }
                end--;
            }
            if (end <= 0) {
                ic.commitText(newWord, 1);
                return true;
            }

            int start = end;
            while (start > 0 && !isBoundaryChar(text, start - 1)) {
                start--;
            }

            String oldWord = text.substring(start, end);
            if (oldWord.equals(newWord)) {
                return true;
            }

            int deleteLen = text.length() - start;
            int deleteAfter = 0;
            if (end == text.length()) {
                CharSequence csAfter = ic.getTextAfterCursor(100, 0);
                if (csAfter != null && csAfter.length() > 0) {
                    String after = csAfter.toString();
                    while (deleteAfter < after.length() && !isBoundaryChar(after, deleteAfter)) {
                        deleteAfter++;
                    }
                }
            }
            if (deleteLen > 0 && deleteLen <= text.length()) {
                ic.beginBatchEdit();
                ic.deleteSurroundingText(deleteLen, deleteAfter);
                ic.commitText(newWord, 1);
                ic.endBatchEdit();
                logI(TAG, "replaceActiveWordInTextField: cleanly replaced '" + oldWord + "' with '" + newWord + "' (no space)");
                return true;
            }
        } catch (Throwable t) {
            logE(TAG, "replaceActiveWordInTextField failed", t);
        }
        return false;
    }

    public static boolean hasSelection(View view) {
        if (view == null) return false;
        InputConnection ic = getInputConnection(view);
        if (ic == null) return false;
        try {
            CharSequence sel = ic.getSelectedText(0);
            return sel != null && sel.length() > 0;
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean isCursorAtEnd(View view) {
        if (view == null) return true;
        InputConnection ic = getInputConnection(view);
        if (ic == null) return true;
        try {
            CharSequence sel = ic.getSelectedText(0);
            if (sel != null && sel.length() > 0) {
                return false;
            }
            CharSequence after = ic.getTextAfterCursor(1, 0);
            return after == null || after.length() == 0;
        } catch (Throwable ignored) {
            return true;
        }
    }

    private static int computeDocOffset(InputConnection ic, String before) {
        try {
            ExtractedText et = ic.getExtractedText(new ExtractedTextRequest(), 0);
            if (et != null && et.selectionStart >= 0 && et.selectionEnd >= 0) {
                int startOffset = Math.max(0, et.startOffset);
                int selMin = startOffset + Math.min(et.selectionStart, et.selectionEnd);
                return selMin - before.length();
            }
        } catch (Throwable ignored) {
        }
        // If getExtractedText() is unavailable and the before-cursor window is full (2000 chars),
        // we cannot determine the true absolute document offset safely; signal unknown (-1).
        if (before != null && before.length() >= 2000) {
            return -1;
        }
        return 0;
    }

    public static boolean selectHistoryWordInTextField(View view, ThiccTopBarSentenceBuffer buffer, int historyColIndex, String word) {
        InputConnection ic = getInputConnection(view);
        return selectHistoryWordInTextField(ic, buffer, historyColIndex, word);
    }

    public static boolean selectHistoryWordInTextField(InputConnection ic, ThiccTopBarSentenceBuffer buffer, int historyColIndex, String word) {
        if (ic == null || buffer == null || word == null) return false;
        try {
            ic.finishComposingText();

            CharSequence csBefore = ic.getTextBeforeCursor(2000, 0);
            CharSequence csSel = ic.getSelectedText(0);
            CharSequence csAfter = ic.getTextAfterCursor(2000, 0);

            String before = csBefore != null ? csBefore.toString() : "";
            String sel = csSel != null ? csSel.toString() : "";
            String after = csAfter != null ? csAfter.toString() : "";

            String text = before + sel + after;
            if (text.isEmpty()) return false;

            List<ThiccTopBarSentenceBuffer.WordEntry> entries = buffer.getEntries();
            int[] pos = findHistoryWordPositionInParagraph(text, before.length(), entries, historyColIndex, word);

            if (pos != null && pos[0] >= 0 && pos[1] <= text.length() && pos[0] < pos[1]) {
                int docOffset = computeDocOffset(ic, before);
                if (docOffset < 0) return false;

                int selStart = Math.max(0, docOffset + pos[0]);
                int selEnd = Math.max(0, docOffset + pos[1]);

                ic.setSelection(selStart, selEnd);
                logI(TAG, "selectHistoryWordInTextField: selected '" + word + "' at [" + selStart + ", " + selEnd + "]");
                return true;
            }
        } catch (Throwable t) {
            logE(TAG, "selectHistoryWordInTextField failed", t);
        }
        return false;
    }

    public static boolean moveCursorByWord(View view, int direction) {
        InputConnection ic = getInputConnection(view);
        return moveCursorByWord(ic, direction);
    }

    public static boolean moveCursorByWord(InputConnection ic, int direction) {
        if (ic == null || direction == 0) return false;
        try {
            ic.finishComposingText();

            CharSequence csBefore = ic.getTextBeforeCursor(2000, 0);
            CharSequence csSel = ic.getSelectedText(0);
            CharSequence csAfter = ic.getTextAfterCursor(2000, 0);

            String before = csBefore != null ? csBefore.toString() : "";
            String sel = csSel != null ? csSel.toString() : "";
            String after = csAfter != null ? csAfter.toString() : "";

            String fullText = before + sel + after;
            if (fullText.isEmpty()) return false;

            int docOffset = computeDocOffset(ic, before);
            if (docOffset < 0) return false;
            int pos = direction < 0 ? before.length() : before.length() + sel.length();
            int len = fullText.length();
            boolean hadSelection = !sel.isEmpty();

            if (direction < 0) {
                if (pos <= 0) {
                    if (hadSelection) {
                        int startOffset = Math.max(0, docOffset);
                        ic.setSelection(startOffset, startOffset);
                        return true;
                    }
                    return false;
                }
                int end = pos;
                while (end > 0 && isBoundaryChar(fullText, end - 1)) {
                    end--;
                }
                if (end <= 0) {
                    if (hadSelection) {
                        int startOffset = Math.max(0, docOffset);
                        ic.setSelection(startOffset, startOffset);
                        return true;
                    }
                    return false;
                }
                int start = end;
                while (start > 0 && !isBoundaryChar(fullText, start - 1)) {
                    start--;
                }
                while (end < len && !isBoundaryChar(fullText, end)) {
                    end++;
                }
                ic.setSelection(Math.max(0, docOffset + start), Math.max(0, docOffset + end));
                return true;
            } else {
                if (pos >= len) {
                    if (hadSelection) {
                        int endOffset = Math.max(0, docOffset + len);
                        ic.setSelection(endOffset, endOffset);
                        return true;
                    }
                    return false;
                }
                int start = pos;
                while (start < len && isBoundaryChar(fullText, start)) {
                    start++;
                }
                if (start >= len) {
                    int endOffset = Math.max(0, docOffset + len);
                    ic.setSelection(endOffset, endOffset);
                    return true;
                }
                int end = start;
                while (end < len && !isBoundaryChar(fullText, end)) {
                    end++;
                }
                while (start > 0 && !isBoundaryChar(fullText, start - 1)) {
                    start--;
                }
                ic.setSelection(Math.max(0, docOffset + start), Math.max(0, docOffset + end));
                return true;
            }
        } catch (Throwable t) {
            logE(TAG, "moveCursorByWord error", t);
            return false;
        }
    }

    /** Tracks the initial cursor/selection anchor during a double-tap-and-drag multi-word selection. */
    public static final class MultiWordSelectAnchor {
        public int anchorStart;
        public int anchorEnd;
        public int activeEnd;
        public boolean initialized;
    }

    public static MultiWordSelectAnchor captureMultiWordSelectAnchor(View view) {
        return captureMultiWordSelectAnchor(getInputConnection(view));
    }

    public static MultiWordSelectAnchor captureMultiWordSelectAnchor(InputConnection ic) {
        MultiWordSelectAnchor anchor = new MultiWordSelectAnchor();
        if (ic == null) return anchor;
        try {
            ic.finishComposingText();
            CharSequence csBefore = ic.getTextBeforeCursor(2000, 0);
            CharSequence csSel = ic.getSelectedText(0);
            String before = csBefore != null ? csBefore.toString() : "";
            String sel = csSel != null ? csSel.toString() : "";
            int docOffset = computeDocOffset(ic, before);
            if (docOffset < 0) return anchor;
            anchor.anchorStart = Math.max(0, docOffset + before.length());
            anchor.anchorEnd = anchor.anchorStart + sel.length();
            anchor.activeEnd = anchor.anchorStart;
            anchor.initialized = true;
        } catch (Throwable t) {
            logE(TAG, "captureMultiWordSelectAnchor error", t);
        }
        return anchor;
    }

    public static boolean stepMultiWordSelection(
            View view, MultiWordSelectAnchor anchor, int direction) {
        return stepMultiWordSelection(getInputConnection(view), anchor, direction);
    }

    public static boolean stepMultiWordSelection(
            InputConnection ic, MultiWordSelectAnchor anchor, int direction) {
        if (ic == null || anchor == null || direction == 0) return false;
        try {
            ic.finishComposingText();
            CharSequence csBefore = ic.getTextBeforeCursor(2000, 0);
            CharSequence csSel = ic.getSelectedText(0);
            CharSequence csAfter = ic.getTextAfterCursor(2000, 0);

            String before = csBefore != null ? csBefore.toString() : "";
            String sel = csSel != null ? csSel.toString() : "";
            String after = csAfter != null ? csAfter.toString() : "";

            String fullText = before + sel + after;
            if (fullText.isEmpty()) return false;

            int docOffset = computeDocOffset(ic, before);
            if (docOffset < 0) return false;
            int len = fullText.length();

            if (!anchor.initialized) {
                anchor.anchorStart = Math.max(0, docOffset + before.length());
                anchor.anchorEnd = anchor.anchorStart + sel.length();
                anchor.activeEnd = (direction < 0) ? anchor.anchorStart : anchor.anchorEnd;
                anchor.initialized = true;
            }

            int relAnchorStart = Math.max(0, Math.min(len, anchor.anchorStart - docOffset));
            int relAnchorEnd = Math.max(relAnchorStart, Math.min(len, anchor.anchorEnd - docOffset));
            int relActive = Math.max(0, Math.min(len, anchor.activeEnd - docOffset));

            int nextRelActive;
            if (direction < 0) {
                if (relActive > relAnchorEnd) {
                    int pos = relActive;
                    while (pos > relAnchorEnd && isBoundaryChar(fullText, pos - 1)) {
                        pos--;
                    }
                    while (pos > relAnchorEnd && !isBoundaryChar(fullText, pos - 1)) {
                        pos--;
                    }
                    while (pos > relAnchorEnd && isBoundaryChar(fullText, pos - 1)) {
                        pos--;
                    }
                    nextRelActive = pos;
                } else {
                    int pos = (relActive == relAnchorEnd && relAnchorStart < relAnchorEnd)
                            ? relAnchorStart
                            : relActive;
                    while (pos > 0 && isBoundaryChar(fullText, pos - 1)) {
                        pos--;
                    }
                    while (pos > 0 && !isBoundaryChar(fullText, pos - 1)) {
                        pos--;
                    }
                    nextRelActive = pos;
                }
            } else {
                if (relActive < relAnchorStart) {
                    int pos = relActive;
                    while (pos < relAnchorStart && isBoundaryChar(fullText, pos)) {
                        pos++;
                    }
                    while (pos < relAnchorStart && !isBoundaryChar(fullText, pos)) {
                        pos++;
                    }
                    while (pos < relAnchorStart && isBoundaryChar(fullText, pos)) {
                        pos++;
                    }
                    nextRelActive = pos;
                } else {
                    int pos = (relActive == relAnchorStart && relAnchorStart < relAnchorEnd)
                            ? relAnchorEnd
                            : relActive;
                    while (pos < len && isBoundaryChar(fullText, pos)) {
                        pos++;
                    }
                    while (pos < len && !isBoundaryChar(fullText, pos)) {
                        pos++;
                    }
                    nextRelActive = pos;
                }
            }

            anchor.activeEnd = Math.max(0, docOffset + nextRelActive);
            int selStart = Math.max(0, Math.min(anchor.anchorStart, anchor.activeEnd));
            int selEnd = Math.max(0, Math.max(anchor.anchorEnd, anchor.activeEnd));
            ic.setSelection(selStart, selEnd);
            return true;
        } catch (Throwable t) {
            logE(TAG, "stepMultiWordSelection error", t);
            return false;
        }
    }

    public static int getWordIndexAtCursor(View view, ThiccTopBarSentenceBuffer buffer) {
        InputConnection ic = getInputConnection(view);
        return getWordIndexAtCursor(ic, buffer);
    }

    public static int getWordIndexAtCursor(InputConnection ic, ThiccTopBarSentenceBuffer buffer) {
        if (ic == null || buffer == null) return -1;
        try {
            CharSequence csBefore = ic.getTextBeforeCursor(2000, 0);
            CharSequence csSel = ic.getSelectedText(0);
            CharSequence csAfter = ic.getTextAfterCursor(2000, 0);

            String before = csBefore != null ? csBefore.toString() : "";
            String sel = csSel != null ? csSel.toString() : "";
            String after = csAfter != null ? csAfter.toString() : "";

            String fullText = before + sel + after;
            if (fullText.isEmpty()) return -1;

            int cursorOffset = before.length();
            int paraStart = 0;
            for (int i = cursorOffset - 1; i >= 0; i--) {
                char c = fullText.charAt(i);
                if (c == '\n' || c == '\r') {
                    paraStart = i + 1;
                    break;
                }
            }
            int paraEnd = fullText.length();
            for (int i = cursorOffset; i < fullText.length(); i++) {
                char c = fullText.charAt(i);
                if (c == '\n' || c == '\r') {
                    paraEnd = i;
                    break;
                }
            }

            String para = fullText.substring(paraStart, paraEnd);
            int cursorInPara = cursorOffset - paraStart;
            List<int[]> wordSpans = collectWordSpans(para);
            if (wordSpans.isEmpty()) return -1;

            int spanIdx = wordSpans.size() - 1;
            for (int i = 0; i < wordSpans.size(); i++) {
                int[] span = wordSpans.get(i);
                if (cursorInPara <= span[1]) {
                    spanIdx = i;
                    break;
                }
            }

            List<ThiccTopBarSentenceBuffer.WordEntry> history = buffer.getEntries();
            int alignOffset = findHistoryAlignmentOffset(para, wordSpans, history);
            if (alignOffset < 0) {
                alignOffset = Math.max(0, wordSpans.size() - history.size());
            }
            return Math.max(0, spanIdx - alignOffset);
        } catch (Throwable t) {
            logE(TAG, "getWordIndexAtCursor error", t);
            return -1;
        }
    }

    public static void jumpToEndOfTextField(View view) {
        InputConnection ic = getInputConnection(view);
        jumpToEndOfTextField(ic);
    }

    public static void jumpToEndOfTextField(InputConnection ic) {
        if (ic == null) return;
        try {
            ic.finishComposingText();

            int textLength = -1;
            try {
                ExtractedText et = ic.getExtractedText(new ExtractedTextRequest(), 0);
                if (et != null && et.text != null) {
                    textLength = et.text.length();
                }
            } catch (Throwable ignored) {
            }

            if (textLength < 0) {
                CharSequence before = ic.getTextBeforeCursor(5000, 0);
                CharSequence sel = ic.getSelectedText(0);
                CharSequence after = ic.getTextAfterCursor(5000, 0);
                int bLen = before != null ? before.length() : 0;
                int sLen = sel != null ? sel.length() : 0;
                int aLen = after != null ? after.length() : 0;
                textLength = bLen + sLen + aLen;
            }

            if (textLength >= 0) {
                ic.setSelection(textLength, textLength);
                logI(TAG, "jumpToEndOfTextField: moved cursor to end offset " + textLength);
            }
        } catch (Throwable t) {
            logE(TAG, "jumpToEndOfTextField error", t);
        }
    }

    public static boolean replaceHistoryWord(View anchorView, ThiccTopBarSentenceBuffer buffer, int historyColIndex, String oldWord, String newWord) {
        InputConnection ic = getInputConnection(anchorView);
        return replaceHistoryWord(ic, buffer, historyColIndex, oldWord, newWord);
    }

    public static boolean replaceHistoryWord(InputConnection ic, ThiccTopBarSentenceBuffer buffer, int historyColIndex, String oldWord, String newWord) {
        if (ic == null || buffer == null || oldWord == null || newWord == null) return false;
        try {
            ic.finishComposingText();

            CharSequence csBefore = ic.getTextBeforeCursor(2000, 0);
            CharSequence csSel = ic.getSelectedText(0);
            CharSequence csAfter = ic.getTextAfterCursor(2000, 0);

            String before = csBefore != null ? csBefore.toString() : "";
            String sel = csSel != null ? csSel.toString() : "";
            String after = csAfter != null ? csAfter.toString() : "";

            String fullText = before + sel + after;
            if (fullText.isEmpty()) return false;

            List<ThiccTopBarSentenceBuffer.WordEntry> entries = buffer.getEntries();
            int[] pos = findHistoryWordPositionInParagraph(fullText, before.length(), entries, historyColIndex, oldWord);

            if (pos != null && pos[0] >= 0 && pos[1] <= fullText.length() && pos[0] < pos[1]) {
                TokenParts newParts = parseTokenParts(newWord);
                String cleanNewWord = newParts.hasWord() ? newParts.word : newWord;

                int docOffset = computeDocOffset(ic, before);
                if (docOffset < 0) return false;

                int selStart = Math.max(0, docOffset + pos[0]);
                int selEnd = Math.max(0, docOffset + pos[1]);
                int origSelStart = Math.max(0, docOffset + before.length());
                int origSelEnd = Math.max(0, docOffset + before.length() + sel.length());

                boolean wasCursorAtEnd = (after.isEmpty() && sel.isEmpty());
                boolean wasTargetSelected = (!sel.isEmpty() && before.length() == pos[0] && (before.length() + sel.length()) == pos[1]);

                ic.beginBatchEdit();
                ic.setSelection(selStart, selEnd);
                ic.commitText(cleanNewWord, 1);

                if (wasCursorAtEnd) {
                    int newDocLen = Math.max(0, docOffset + fullText.length() - (pos[1] - pos[0]) + cleanNewWord.length());
                    ic.setSelection(newDocLen, newDocLen);
                } else if (wasTargetSelected) {
                    ic.setSelection(selStart, selStart + cleanNewWord.length());
                } else {
                    int delta = cleanNewWord.length() - (pos[1] - pos[0]);
                    if (origSelStart >= selEnd) {
                        ic.setSelection(origSelStart + delta, origSelEnd + delta);
                    } else if (origSelEnd <= selStart) {
                        ic.setSelection(origSelStart, origSelEnd);
                    } else {
                        int endPos = selStart + cleanNewWord.length();
                        ic.setSelection(endPos, endPos);
                    }
                }
                ic.endBatchEdit();

                logI(TAG, "replaceHistoryWord: cleanly replaced '" + oldWord + "' with '" + cleanNewWord + "' at [" + selStart + ", " + selEnd + "]");
                return true;
            } else {
                logW(TAG, "replaceHistoryWord: could not find boundary position for '" + oldWord + "' (col=" + historyColIndex + ")");
            }
        } catch (Throwable t) {
            logE(TAG, "replaceHistoryWord failed", t);
        }
        return false;
    }

    public static int[] findHistoryWordPositionInParagraph(String text, int cursorOffset, List<ThiccTopBarSentenceBuffer.WordEntry> history, int targetColIndex, String oldWord) {
        if (text == null || text.isEmpty()) return null;
        int clampedCursor = Math.max(0, Math.min(cursorOffset, text.length()));
        int paraStart = 0;
        for (int i = clampedCursor - 1; i >= 0; i--) {
            char c = text.charAt(i);
            if (c == '\n' || c == '\r') {
                paraStart = i + 1;
                break;
            }
        }
        int paraEnd = text.length();
        for (int i = clampedCursor; i < text.length(); i++) {
            char c = text.charAt(i);
            if (c == '\n' || c == '\r') {
                paraEnd = i;
                break;
            }
        }
        if (paraStart > 0 || paraEnd < text.length()) {
            String para = text.substring(paraStart, paraEnd);
            int[] pos = findHistoryWordPosition(para, history, targetColIndex, oldWord);
            if (pos != null) {
                return new int[]{paraStart + pos[0], paraStart + pos[1]};
            }
        }
        return findHistoryWordPosition(text, history, targetColIndex, oldWord);
    }

    private static List<int[]> collectWordSpans(String text) {
        List<int[]> wordSpans = new ArrayList<>();
        if (text == null || text.isEmpty()) return wordSpans;
        int len = text.length();
        int idx = 0;
        while (idx < len) {
            while (idx < len && isBoundaryChar(text, idx)) {
                idx++;
            }
            if (idx >= len) break;
            int wStart = idx;
            while (idx < len && !isBoundaryChar(text, idx)) {
                idx++;
            }
            wordSpans.add(new int[]{wStart, idx});
        }
        return wordSpans;
    }

    private static int findHistoryAlignmentOffset(String text, List<int[]> wordSpans, List<ThiccTopBarSentenceBuffer.WordEntry> history) {
        return findHistoryAlignmentOffset(text, wordSpans, history, -1, null, null);
    }

    private static int findHistoryAlignmentOffset(
            String text,
            List<int[]> wordSpans,
            List<ThiccTopBarSentenceBuffer.WordEntry> history,
            int targetColIndex,
            String baseOldWord,
            String oldWord
    ) {
        if (history == null || history.isEmpty() || wordSpans.size() < history.size()) {
            return -1;
        }
        int hSize = history.size();
        for (int offset = wordSpans.size() - hSize; offset >= 0; offset--) {
            boolean allMatch = true;
            for (int j = 0; j < hSize; j++) {
                int[] span = wordSpans.get(offset + j);
                String tokenWord = text.substring(span[0], span[1]);
                ThiccTopBarSentenceBuffer.WordEntry entry = history.get(j);
                String entryWord = entry.getSelectedWord();
                if (entryWord == null) entryWord = entry.committedWord;
                TokenParts ep = parseTokenParts(entryWord);
                String baseEntryWord = ep.hasWord() ? ep.word : (entryWord != null ? entryWord : "");

                boolean matches = tokenWord.equalsIgnoreCase(baseEntryWord)
                        || (entryWord != null && tokenWord.equalsIgnoreCase(entryWord));
                if (!matches && j == targetColIndex && oldWord != null) {
                    matches = (baseOldWord != null && tokenWord.equalsIgnoreCase(baseOldWord))
                            || tokenWord.equalsIgnoreCase(oldWord);
                }
                if (!matches) {
                    allMatch = false;
                    break;
                }
            }
            if (allMatch) {
                return offset;
            }
        }
        return -1;
    }

    public static int[] findHistoryWordPosition(String text, List<ThiccTopBarSentenceBuffer.WordEntry> history, int targetColIndex, String oldWord) {
        if (text == null || oldWord == null || text.isEmpty() || oldWord.isEmpty()) {
            return null;
        }

        TokenParts oldParts = parseTokenParts(oldWord);
        String baseOldWord = oldParts.hasWord() ? oldParts.word : oldWord;

        List<int[]> wordSpans = collectWordSpans(text);

        // Primary strategy: align the history sequence against wordSpans from right to left
        if (history != null && !history.isEmpty() && targetColIndex >= 0 && targetColIndex < history.size()) {
            int offset = findHistoryAlignmentOffset(text, wordSpans, history, targetColIndex, baseOldWord, oldWord);
            if (offset >= 0) {
                return wordSpans.get(offset + targetColIndex);
            }
        }

        int wordsAfter = (history != null && targetColIndex >= 0 && targetColIndex < history.size())
                ? (history.size() - 1 - targetColIndex)
                : 0;

        int end = text.length();
        int wordsSkipped = 0;

        while (end > 0) {
            while (end > 0 && isBoundaryChar(text, end - 1)) {
                end--;
            }
            if (end <= 0) break;

            int start = end;
            while (start > 0 && !isBoundaryChar(text, start - 1)) {
                start--;
            }

            String currentWord = text.substring(start, end);

            if (wordsSkipped == wordsAfter) {
                if (currentWord.equalsIgnoreCase(baseOldWord) || currentWord.equalsIgnoreCase(oldWord)) {
                    return new int[]{start, end};
                }
            }
            wordsSkipped++;
            end = start;
        }

        return findLastWordBoundary(text, baseOldWord);
    }

    public static int[] findLastWordBoundary(String text, String word) {
        if (text == null || word == null || text.isEmpty() || word.isEmpty()) {
            return null;
        }
        TokenParts parts = parseTokenParts(word);
        String target = parts.hasWord() ? parts.word : word;
        int wLen = target.length();
        int tLen = text.length();

        for (int i = tLen - wLen; i >= 0; i--) {
            if (text.regionMatches(true, i, target, 0, wLen)) {
                boolean beforeOk = (i == 0) || isBoundaryChar(text, i - 1);
                boolean afterOk = (i + wLen == tLen) || isBoundaryChar(text, i + wLen);
                if (beforeOk && afterOk) {
                    return new int[]{i, i + wLen};
                }
            }
        }
        return null;
    }

    public static InputConnection getInputConnection(View view) {
        if (view == null) return null;

        // 1. Direct Context unwrapping to InputMethodService (covers Gboard LatinIME)
        Context ctx = view.getContext();
        while (ctx instanceof ContextWrapper && !(ctx instanceof InputMethodService)) {
            ctx = ((ContextWrapper) ctx).getBaseContext();
        }
        if (ctx instanceof InputMethodService ims) {
            InputConnection ic = ims.getCurrentInputConnection();
            if (ic != null) return ic;
        }

        // 2. Fallback: via Gboard Reflector
        return ThiccTopBarGboardReflector.resolveInputConnectionViaHierarchy(view);
    }
}
