package dev.twitchpatches.extension.emotes;

import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.os.Looper;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.ReplacementSpan;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Function;

public final class ComposeEmoteDraft {
    private static final Set<String> pending = new HashSet<>();
    private static final List<ComposeEmoteSpan> spans = new ArrayList<>();
    private static WeakReference<Object> chatField = new WeakReference<>(null);
    private static String chatDraft;
    private static Object layoutState;
    private static Object frameState;
    private static int version;
    private static int frame;
    private static boolean chatLayout;

    private ComposeEmoteDraft() { }

    public static void bindChatField(Object textFieldState) {
        if (chatField.get() != textFieldState) chatField = new WeakReference<>(textFieldState);
    }

    public static void beginLayout(Object textFieldState) {
        chatLayout = textFieldState == chatField.get() && Looper.getMainLooper().isCurrentThread();
        if (chatLayout) observeLayout();
    }

    public static void endLayout() { chatLayout = false; }

    // The collapsed composer shows the same draft through a plain Text, outside the field's layout.
    public static CharSequence decorate(CharSequence text) {
        if (!Looper.getMainLooper().isCurrentThread()) return text;
        if (chatLayout) chatDraft = text.length() == 0 ? null : text.toString();
        else if (!TextUtils.equals(chatDraft, text)) return text;
        else observeLayout();
        if (text.length() == 0) return text;
        stopSpans();
        spans.clear();
        pending.clear();
        DraftText draft = new DraftText(text, version);
        EmoteImages images = EmoteRuntime.images();
        if (images == null || !EmoteRuntime.inlineEnabled()) return draft;
        Function<String, Emote> emotes = EmoteDraftRuntime.draftEmotes();
        Resources resources = Resources.getSystem();
        for (EmoteTokens.Match match : EmoteTokens.find(draft, emotes)) {
            if (draft.getSpans(match.start, match.end, ReplacementSpan.class).length != 0) continue;
            Drawable drawable = images.drawable(resources, match.emote.url);
            if (drawable == null) { pending.add(match.emote.url); images.request(match.emote); continue; }
            ComposeEmoteSpan span = new ComposeEmoteSpan(drawable);
            draft.setSpan(span, match.start, match.end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            spans.add(span);
        }
        return draft;
    }

    public static boolean stale(CharSequence text) {
        return text instanceof DraftText && ((DraftText) text).version != version;
    }

    static void refresh(String image) {
        if (image != null && !pending.contains(image)) return;
        version++;
        if (layoutState != null) ComposeStateBridge.write(layoutState, version);
    }

    static void pause() { stopSpans(); }

    private static void observeLayout() {
        if (layoutState == null) layoutState = ComposeStateBridge.create(0);
        ComposeStateBridge.read(layoutState);
    }

    static void observeFrames() {
        if (frameState == null) frameState = ComposeStateBridge.create(0);
        ComposeStateBridge.read(frameState);
    }

    static void frameChanged() {
        if (frameState != null) ComposeStateBridge.write(frameState, ++frame);
    }

    private static void stopSpans() {
        for (ComposeEmoteSpan span : spans) span.stop();
    }

    private static final class DraftText extends SpannableString {
        final int version;

        DraftText(CharSequence text, int version) {
            super(text);
            this.version = version;
        }
    }
}
