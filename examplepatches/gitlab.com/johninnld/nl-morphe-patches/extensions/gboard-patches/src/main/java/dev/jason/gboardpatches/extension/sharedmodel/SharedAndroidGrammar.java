package dev.jason.gboardpatches.extension.sharedmodel;

import android.content.Context;
import android.inputmethodservice.InputMethodService;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.text.Spanned;
import android.text.style.SuggestionSpan;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.ExtractedText;
import android.view.inputmethod.ExtractedTextRequest;
import android.view.inputmethod.InputConnection;
import android.view.textservice.SentenceSuggestionsInfo;
import android.view.textservice.SuggestionsInfo;
import android.view.textservice.TextInfo;

import java.text.BreakIterator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/** Adapts Host proofread edits to Android's native grammar spans and replacement menu. */
public final class SharedAndroidGrammar {
    private static final long DEADLINE_MS = SharedGrammarController.REQUEST_DEADLINE_MS + 1_000L;
    private static final int MAX_SENTENCES = 16;
    private static final int MAX_DRAFT_CHARS = 1_024;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private SharedAndroidGrammar() {}

    public static boolean selected(Context context) {
        try {
            return Build.VERSION.SDK_INT >= 31 && SharedInlineSettings.grammarSelected(context);
        } catch (RuntimeException unavailable) {
            return false;
        }
    }

    public static SentenceSuggestionsInfo[] check(Context context, EditorInfo editor,
            TextInfo[] input, SentenceSuggestionsInfo[] stock) {
        if (!selected(context) || !EditorSnapshot.allowed(editor)
                || SharedGrammarController.onUiThread() || input == null
                || input.length == 0 || input.length > MAX_SENTENCES) return stock;

        SentenceSuggestionsInfo[] result = stock == null
                ? new SentenceSuggestionsInfo[input.length] : Arrays.copyOf(stock, input.length);
        long deadline = SystemClock.elapsedRealtime() + DEADLINE_MS;
        String currentDraft = readShortDraft(editor);
        for (int i = 0; i < input.length; i++) {
            TextInfo sentence = input[i];
            String text = sentence == null ? null : sentence.getText();
            long remaining = deadline - SystemClock.elapsedRealtime();
            if (text == null || text.length() < 3 || text.length() > MAX_DRAFT_CHARS
                    || remaining <= 0 || isEarlierPrefix(currentDraft, text)) continue;

            CompletableFuture<List<GrammarEdits.Edit>> request = SharedGrammarController.check(context, text);
            try {
                List<GrammarEdits.Edit> edits = request.get(remaining, TimeUnit.MILLISECONDS);
                if (!edits.isEmpty() && !isEarlierPrefix(readShortDraft(editor), text)) {
                    result[i] = merge(sentence, result[i], edits);
                }
            } catch (InterruptedException cancelled) {
                request.cancel(false);
                Thread.currentThread().interrupt();
                break;
            } catch (CancellationException | ExecutionException | TimeoutException unavailable) {
                request.cancel(false);
                break;
            }
        }
        for (int i = 0; i < result.length; i++) {
            if (result[i] == null) {
                result[i] = new SentenceSuggestionsInfo(new SuggestionsInfo[0], new int[0], new int[0]);
            }
        }
        return result;
    }

    private static String readShortDraft(EditorInfo editor) {
        CompletableFuture<String> draft = new CompletableFuture<>();
        MAIN.post(() -> {
            if (draft.isDone()) return;
            String current = null;
            try {
                InputMethodService service = GboardSharedWritingRuntime.currentService();
                EditorInfo live = service == null ? null : service.getCurrentInputEditorInfo();
                if (live != null && EditorSnapshot.allowed(live) && live.fieldId == editor.fieldId
                        && Objects.equals(live.packageName, editor.packageName)
                        && Objects.equals(live.fieldName, editor.fieldName)) {
                    InputConnection connection = service.getCurrentInputConnection();
                    if (connection != null) {
                        ExtractedTextRequest request = new ExtractedTextRequest();
                        request.hintMaxChars = MAX_DRAFT_CHARS;
                        ExtractedText extracted = connection.getExtractedText(request, 0);
                        if (extracted != null && extracted.startOffset == 0 && extracted.text != null
                                && extracted.text.length() <= MAX_DRAFT_CHARS) {
                            current = extracted.text.toString();
                        }
                    }
                }
            } catch (RuntimeException unavailable) {
                // The framework's original ranges remain usable when an editor cannot be read.
            }
            draft.complete(current);
        });
        try {
            return draft.get(400, TimeUnit.MILLISECONDS);
        } catch (InterruptedException cancelled) {
            draft.cancel(false);
            Thread.currentThread().interrupt();
        } catch (ExecutionException | TimeoutException unavailable) {
            draft.cancel(false);
        }
        return null;
    }

    static boolean isEarlierPrefix(String draft, String request) {
        if (draft == null) return false;
        int length = trailingContentEnd(request, request.length());
        if (length == 0 || length >= draft.length() || !draft.regionMatches(0, request, 0, length)) return false;
        BreakIterator sentences = BreakIterator.getSentenceInstance();
        sentences.setText(draft);
        int end = sentences.next();
        return end != BreakIterator.DONE && length < trailingContentEnd(draft, end);
    }

    private static int trailingContentEnd(String text, int end) {
        while (end > 0 && Character.isWhitespace(text.charAt(end - 1))) end--;
        return end;
    }

    static SentenceSuggestionsInfo merge(TextInfo input, SentenceSuggestionsInfo stock,
            List<GrammarEdits.Edit> edits) {
        if (edits.isEmpty()) return stock;
        List<SuggestionsInfo> suggestions = new ArrayList<>();
        List<Integer> offsets = new ArrayList<>();
        List<Integer> lengths = new ArrayList<>();
        if (stock != null) {
            for (int i = 0; i < stock.getSuggestionsCount(); i++) {
                int start = stock.getOffsetAt(i);
                int length = stock.getLengthAt(i);
                if (overlaps(edits, start, start + length)) {
                    continue;
                }
                suggestions.add(stock.getSuggestionsInfoAt(i));
                offsets.add(start);
                lengths.add(length);
            }
        }
        if (input.getCharSequence() instanceof Spanned spanned) {
            // TextView replaces an existing error span only when the boundaries match.
            // Emit native clear markers for older overlapping ranges before the new spans.
            HashSet<Long> cleared = new HashSet<>();
            for (SuggestionSpan span : spanned.getSpans(0, spanned.length(), SuggestionSpan.class)) {
                if ((span.getFlags() & (SuggestionSpan.FLAG_MISSPELLED
                        | SuggestionSpan.FLAG_GRAMMAR_ERROR)) == 0) continue;
                int start = spanned.getSpanStart(span);
                int end = spanned.getSpanEnd(span);
                if (start < 0 || end <= start || end > spanned.length() || !overlaps(edits, start, end)
                        || !cleared.add(((long) start << 32) | end)) continue;
                suggestions.add(new SuggestionsInfo(SuggestionsInfo.RESULT_ATTR_IN_THE_DICTIONARY,
                        new String[0], input.getCookie(), input.getSequence()));
                offsets.add(start);
                lengths.add(end - start);
            }
        }
        for (GrammarEdits.Edit edit : edits) {
            suggestions.add(new SuggestionsInfo(
                    SuggestionsInfo.RESULT_ATTR_LOOKS_LIKE_GRAMMAR_ERROR
                            | SuggestionsInfo.RESULT_ATTR_HAS_RECOMMENDED_SUGGESTIONS,
                    new String[]{edit.replacement}, input.getCookie(), input.getSequence()));
            offsets.add(edit.start);
            lengths.add(edit.end - edit.start);
        }
        return new SentenceSuggestionsInfo(suggestions.toArray(new SuggestionsInfo[0]),
                offsets.stream().mapToInt(Integer::intValue).toArray(),
                lengths.stream().mapToInt(Integer::intValue).toArray());
    }

    private static boolean overlaps(List<GrammarEdits.Edit> edits, int start, int end) {
        return edits.stream().anyMatch(edit -> start < edit.end && end > edit.start);
    }
}
