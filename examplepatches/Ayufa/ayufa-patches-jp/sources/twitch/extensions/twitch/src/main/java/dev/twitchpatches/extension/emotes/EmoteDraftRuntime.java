package dev.twitchpatches.extension.emotes;

import android.graphics.drawable.Drawable;
import android.os.Looper;
import android.text.Editable;
import android.text.Spanned;
import android.text.TextWatcher;
import android.text.style.ReplacementSpan;
import android.view.View;
import android.view.inputmethod.BaseInputConnection;
import android.widget.AutoCompleteTextView;
import android.widget.EditText;
import android.widget.MultiAutoCompleteTextView;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.function.Function;

public final class EmoteDraftRuntime {
    private static final int MAX_SUGGESTIONS = 20;
    private static final WeakHashMap<EditText, Draft> inputs = new WeakHashMap<>();

    private EmoteDraftRuntime() { }

    public static boolean protectCaret(EditText view, boolean protect, Map<?, ?> images) {
        if (!protect) return false;
        Editable text = view.getText();
        int end = view.getSelectionEnd();
        if (end < 3 || end != view.getSelectionStart() || text.charAt(end - 1) != ':') return true;
        int start = end - 1;
        while (start > 0 && !EmoteTokens.separator(text.charAt(start - 1))) start--;
        return text.charAt(start) != ':' || !images.containsKey(text.subSequence(start, end).toString());
    }

    public static void bind(EditText view) {
        if (view == null || inputs.containsKey(view) || Looper.myLooper() != Looper.getMainLooper()) return;
        Draft draft = new Draft(view);
        inputs.put(view, draft);
        view.addTextChangedListener(draft);
        view.addOnAttachStateChangeListener(draft);
        draft.render();
    }

    public static void tokenizer(MultiAutoCompleteTextView view, MultiAutoCompleteTextView.Tokenizer tokenizer) {
        view.setTokenizer(tokenizer);
        bind(view);
    }

    public static List<?> augment(List<?> nativeMatches, String query) {
        EmoteCatalog catalog = EmoteRuntime.catalog();
        if (!EmoteRuntime.enabled() || catalog == null || query == null) return nativeMatches;
        String channel = EmoteRuntime.currentChannel();
        catalog.ensure(channel);
        List<Object> merged = new ArrayList<>(nativeMatches);
        Set<String> names = new HashSet<>();
        for (Object value : nativeMatches) names.add(EmoteInputBridge.code(value).trim());
        for (Emote emote : EmoteDraftTokens.suggestions(query.startsWith(":") ? query : ":" + query, catalog.snapshot(channel))) {
            if (!names.contains(emote.code))
                merged.add(EmoteInputBridge.model(EmotePickerRuntime.PREFIX + emote.url, emote.code, emote.animated));
        }
        return EmoteDraftTokens.ranked(query, merged, EmoteInputBridge::code, MAX_SUGGESTIONS);
    }

    static Function<String, Emote> draftEmotes() {
        EmoteCatalog catalog = EmoteRuntime.catalog();
        String channel = EmoteRuntime.currentChannel();
        Map<String, Emote> external = catalog != null && EmoteRuntime.enabled() ? catalog.snapshot(channel) : Collections.emptyMap();
        return token -> {
            Emote twitch = TwitchEmotes.find(token);
            return twitch != null ? twitch : external.get(token);
        };
    }

    static void refresh(String image) {
        if (!EmoteRuntime.foreground()) return;
        ComposeEmoteDraft.refresh(image);
        for (Draft draft : new ArrayList<>(inputs.values())) {
            if (image == null || draft.pending.contains(image)) draft.render();
            EditText view = draft.owner.get();
            if (image == null && view instanceof AutoCompleteTextView && view.hasFocus())
                ((AutoCompleteTextView) view).refreshAutoCompleteResults();
        }
    }

    static void pause() {
        ComposeEmoteDraft.pause();
        for (Draft draft : new ArrayList<>(inputs.values())) for (EmoteSpan span : draft.spans) span.stop();
    }

    private static final class Draft implements TextWatcher, View.OnAttachStateChangeListener {
        private final WeakReference<EditText> owner;
        private boolean editing;
        private final List<EmoteSpan> spans = new ArrayList<>();
        private final Set<String> pending = new HashSet<>();
        private final Runnable update = this::render;

        Draft(EditText owner) { this.owner = new WeakReference<>(owner); }

        void render() {
            EditText view = owner.get();
            if (view == null || editing || !EmoteRuntime.foreground()) return;
            Editable text = view.getText();
            editing = true;
            try {
                for (EmoteSpan span : spans) { text.removeSpan(span); span.close(); }
                spans.clear();
                pending.clear();
                if (!view.isAttachedToWindow() || !view.isShown() || BaseInputConnection.getComposingSpanStart(text) >= 0) return;
                EmoteCatalog catalog = EmoteRuntime.catalog();
                if (catalog != null && EmoteRuntime.enabled()) {
                    String channel = EmoteRuntime.currentChannel();
                    catalog.ensure(channel);
                    unwrapColonTokens(view, text, catalog.snapshot(channel));
                }
                if (EmoteRuntime.inlineEnabled()) renderImages(view, text);
                view.invalidate();
            } finally { editing = false; }
        }

        private void unwrapColonTokens(EditText view, Editable text, Map<String, Emote> entries) {
            String plain = text.toString(), next = EmoteDraftTokens.normalize(plain, entries);
            if (plain.equals(next)) return;
            int start = view.getSelectionStart(), end = view.getSelectionEnd();
            int first = 0;
            while (first < plain.length() && first < next.length() && plain.charAt(first) == next.charAt(first)) first++;
            int suffix = 0;
            while (suffix < plain.length() - first && suffix < next.length() - first &&
                    plain.charAt(plain.length() - suffix - 1) == next.charAt(next.length() - suffix - 1)) suffix++;
            text.replace(first, plain.length() - suffix, next.substring(first, next.length() - suffix));
            view.setSelection(EmoteDraftTokens.selection(plain, start, entries), EmoteDraftTokens.selection(plain, end, entries));
        }

        private void renderImages(EditText view, Editable text) {
            EmoteImages images = EmoteRuntime.images();
            if (images == null) return;
            for (EmoteTokens.Match match : EmoteTokens.find(text, draftEmotes())) {
                if (text.getSpans(match.start, match.end, ReplacementSpan.class).length != 0) continue;
                Drawable drawable = images.drawable(view.getResources(), match.emote.url);
                if (drawable == null) { pending.add(match.emote.url); images.request(match.emote); continue; }
                EmoteSpan span = new EmoteSpan(view, drawable, 0);
                text.setSpan(span, match.start, match.end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                spans.add(span);
                span.start();
            }
        }

        @Override public void afterTextChanged(Editable text) {
            EditText view = owner.get();
            if (view != null && !editing) { view.removeCallbacks(update); view.post(update); }
        }
        @Override public void beforeTextChanged(CharSequence text, int start, int count, int after) { }
        @Override public void onTextChanged(CharSequence text, int start, int before, int count) { }
        @Override public void onViewAttachedToWindow(View view) { render(); }
        @Override public void onViewDetachedFromWindow(View view) { view.removeCallbacks(update); for (EmoteSpan span : spans) span.stop(); }
    }
}
