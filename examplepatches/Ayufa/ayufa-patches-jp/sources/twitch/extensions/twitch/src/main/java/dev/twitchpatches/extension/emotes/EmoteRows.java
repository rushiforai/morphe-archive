package dev.twitchpatches.extension.emotes;

import android.graphics.drawable.Drawable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.SpannedString;
import android.text.style.ClickableSpan;
import android.text.style.ReplacementSpan;
import android.widget.TextView;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

final class EmoteRows {
    static final class Bound {
        final SpannedString original;
        final String channel;
        final Set<String> pending = new HashSet<>();
        CharSequence rendered;
        Bound(CharSequence original, String channel) {
            this.original = SpannedString.valueOf(original);
            this.channel = channel;
            this.rendered = original;
        }
    }

    static void render(TextView view, Bound bound, Map<String, Emote> catalog, EmoteImages images) {
        close(view.getText());
        bound.pending.clear();
        SpannableStringBuilder text = new SpannableStringBuilder(bound.original);
        int count = 0;
        for (EmoteTokens.Match match : EmoteTokens.find(bound.original, catalog)) {
            if (protectedRange(bound.original, match.start, match.end)) continue;
            Drawable drawable = images.drawable(view.getResources(), match.emote.url);
            if (drawable == null) { bound.pending.add(match.emote.url); images.request(match.emote); continue; }
            int start = match.start;
            int anchor = 0;
            if (match.emote.overlay) {
                while (start > 0 && EmoteTokens.separator(text.charAt(start - 1))) start--;
                ReplacementSpan[] previous = text.getSpans(Math.max(0, start - 1), start, ReplacementSpan.class);
                ReplacementSpan base = null;
                for (ReplacementSpan span : previous) if (text.getSpanEnd(span) == start) base = span;
                if (base == null || start == 0) continue;
                anchor = base.getSize(view.getPaint(), text, text.getSpanStart(base), start, null);
                if (anchor <= 0) continue;
            }
            EmoteSpan span = new EmoteSpan(view, drawable, anchor);
            text.setSpan(span, start, match.end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            text.setSpan(new EmoteClickSpan(match.emote), match.start, match.end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
            count++;
        }
        bound.rendered = count > 0 ? new SpannedString(text) : bound.original;
        view.setText(bound.rendered, TextView.BufferType.SPANNABLE);
        bound.rendered = view.getText();
        start(view.getText());
        if (count > 0) EmoteRuntime.observed(count);
    }

    static boolean protectedRange(Spanned text, int start, int end) {
        for (Object span : text.getSpans(start, end, Object.class)) {
            if ((span instanceof ReplacementSpan || span instanceof ClickableSpan) &&
                    EmoteTokens.overlaps(start, end, text.getSpanStart(span), text.getSpanEnd(span))) return true;
        }
        return false;
    }

    static void start(CharSequence text) {
        if (text instanceof Spanned) for (EmoteSpan span : ((Spanned) text).getSpans(0, text.length(), EmoteSpan.class)) span.start();
    }

    static void stop(CharSequence text) {
        if (text instanceof Spanned) for (EmoteSpan span : ((Spanned) text).getSpans(0, text.length(), EmoteSpan.class)) span.stop();
    }

    static void close(CharSequence text) {
        if (text instanceof Spanned) for (EmoteSpan span : ((Spanned) text).getSpans(0, text.length(), EmoteSpan.class)) span.close();
    }

    private EmoteRows() { }
}
