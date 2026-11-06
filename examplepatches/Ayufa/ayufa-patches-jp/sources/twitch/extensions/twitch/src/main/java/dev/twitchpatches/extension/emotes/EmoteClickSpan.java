package dev.twitchpatches.extension.emotes;

import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.view.View;
import android.widget.TextView;

final class EmoteClickSpan extends ClickableSpan {
    private final Emote emote;

    EmoteClickSpan(Emote emote) { this.emote = emote; }

    @Override public void onClick(View view) {
        if (view instanceof TextView && view.isAttachedToWindow() && view.isShown())
            EmoteRuntime.preview((TextView) view, emote);
    }

    @Override public void updateDrawState(TextPaint paint) { }
}
