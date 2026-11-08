package com.anderson.applemusic.one.widget;

import android.content.Context;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Tokens;

/**
 * Track line of a collection (album/playlist) and of the player's queue: the running
 * number in a fixed column, title/subtitle and, when this is the track playing now, an
 * accent play glyph instead of the number plus an accent title.
 */
public final class TrackRow extends LinearLayout {

    private final TextView number;
    private final IconView playing;
    private final TextView title;
    private final TextView subtitle;

    public TrackRow(Context context, int position, String title, String subtitle) {
        super(context);
        setOrientation(HORIZONTAL);
        setGravity(Gravity.CENTER_VERTICAL);
        setPadding(Tokens.dp(10), Tokens.dp(6), Tokens.dp(14), Tokens.dp(6));
        setMinimumHeight(Tokens.dp(60));

        number = Inter.text(context, String.valueOf(position), Tokens.CAPTION, Inter.MEDIUM,
                Tokens.TEXT_DIM);
        number.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams numberParams =
                new LinearLayout.LayoutParams(Tokens.dp(30), LayoutParams.WRAP_CONTENT);
        numberParams.rightMargin = Tokens.dp(12);
        addView(number, numberParams);

        playing = new IconView(context, Icons.PLAY, Tokens.ACCENT);
        playing.setVisibility(View.GONE);
        LinearLayout.LayoutParams playingParams =
                new LinearLayout.LayoutParams(Tokens.dp(14), Tokens.dp(14));
        playingParams.leftMargin = Tokens.dp(8);
        playingParams.rightMargin = Tokens.dp(20);
        playingParams.gravity = Gravity.CENTER_VERTICAL;
        addView(playing, playingParams);

        LinearLayout textBlock = new LinearLayout(context);
        textBlock.setOrientation(VERTICAL);
        this.title = Inter.text(context, title, Tokens.CARD, Inter.SEMIBOLD, Tokens.TEXT);
        this.title.setMaxLines(1);
        this.title.setEllipsize(TextUtils.TruncateAt.END);
        textBlock.addView(this.title);
        this.subtitle = Inter.text(context, subtitle, Tokens.CAPTION, Inter.REGULAR,
                Tokens.TEXT_DIM);
        this.subtitle.setMaxLines(1);
        this.subtitle.setEllipsize(TextUtils.TruncateAt.END);
        LinearLayout.LayoutParams subtitleParams = new LinearLayout.LayoutParams(
                LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
        subtitleParams.topMargin = Tokens.dp(2);
        textBlock.addView(this.subtitle, subtitleParams);
        addView(textBlock, new LinearLayout.LayoutParams(0, LayoutParams.WRAP_CONTENT, 1f));

        Focus.attach(this, Tokens.RADIUS_CONTROL, 0x00000000, Tokens.SURFACE_HOVER, null);
        setLayoutParams(new LinearLayout.LayoutParams(
                LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT));
    }

    /** Marks the track the session is playing: accent glyph and title, number hidden. */
    public void setPlaying(boolean isPlaying) {
        playing.setVisibility(isPlaying ? View.VISIBLE : View.GONE);
        number.setVisibility(isPlaying ? View.GONE : View.VISIBLE);
        title.setTextColor(isPlaying ? Tokens.ACCENT : Tokens.TEXT);
    }

    public void setSubtitle(String text) {
        subtitle.setText(text == null ? "" : text);
        subtitle.setVisibility(text == null || text.length() == 0 ? View.GONE : View.VISIBLE);
    }

    /** Marks the track a detail screen was opened for, without pretending it is playing. */
    public void setEmphasis(boolean emphasized) {
        if (emphasized) title.setTextColor(Tokens.ACCENT);
    }
}
