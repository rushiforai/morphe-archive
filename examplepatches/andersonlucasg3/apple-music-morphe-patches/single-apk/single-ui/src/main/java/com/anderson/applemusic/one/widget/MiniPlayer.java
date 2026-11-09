package com.anderson.applemusic.one.widget;

import android.content.Context;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.anderson.applemusic.one.media.MediaClient;
import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Shapes;
import com.anderson.applemusic.one.theme.Tokens;

/**
 * Persistent mini player: 40 dp cover, title/artist and play/pause. The bar itself opens
 * the full-screen player; only the round button toggles playback. It stays above the
 * browse content (and above the search panel) for every screen.
 */
public final class MiniPlayer extends FrameLayout {

    public interface Listener {
        void onOpen();

        void onToggle();
    }

    private final ImageView cover;
    private final TextView title;
    private final TextView artist;
    private final CircleButton play;
    private int lastArtwork;

    public MiniPlayer(Context context, final Listener listener) {
        super(context);
        setBackground(Shapes.rounded(Tokens.SURFACE, Tokens.RADIUS_CONTROL));
        Shapes.clip(this, Tokens.RADIUS_CONTROL);
        setMinimumHeight(Tokens.dp(64));
        setPadding(Tokens.dp(10), Tokens.dp(10), Tokens.dp(10), Tokens.dp(10));

        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);

        cover = new ImageView(context);
        cover.setScaleType(ImageView.ScaleType.CENTER_CROP);
        cover.setBackgroundColor(Tokens.SURFACE_HOVER);
        cover.setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout.LayoutParams coverParams =
                new LinearLayout.LayoutParams(Tokens.dp(40), Tokens.dp(40));
        coverParams.rightMargin = Tokens.dp(12);
        row.addView(cover, coverParams);

        LinearLayout textBlock = new LinearLayout(context);
        textBlock.setOrientation(LinearLayout.VERTICAL);
        title = Inter.text(context, "", 14f, Inter.SEMIBOLD, Tokens.TEXT);
        title.setSingleLine(true);
        title.setEllipsize(TextUtils.TruncateAt.END);
        artist = Inter.text(context, "", Tokens.CAPTION, Inter.REGULAR, Tokens.TEXT_DIM);
        artist.setSingleLine(true);
        artist.setEllipsize(TextUtils.TruncateAt.END);
        textBlock.addView(title);
        textBlock.addView(artist);
        row.addView(textBlock, new LinearLayout.LayoutParams(0,
                LayoutParams.WRAP_CONTENT, 1f));

        play = new CircleButton(context, Icons.PLAY, 40f, Tokens.ACCENT, Tokens.TEXT, 16f);
        play.setContentDescription("Reproduzir");
        LinearLayout.LayoutParams playParams =
                new LinearLayout.LayoutParams(Tokens.dp(40), Tokens.dp(40));
        playParams.leftMargin = Tokens.dp(8);
        row.addView(play, playParams);
        play.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                listener.onToggle();
            }
        });

        addView(row, new FrameLayout.LayoutParams(
                LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));

        Focus.attach(this, Tokens.RADIUS_CONTROL, Tokens.SURFACE, Tokens.SURFACE_HOVER, null);
        setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                listener.onOpen();
            }
        });
    }

    public void update(MediaClient.Snapshot snapshot) {
        title.setText(snapshot.title);
        artist.setText(join(snapshot.artist, snapshot.album));
        play.setIcon(snapshot.playing ? Icons.PAUSE : Icons.PLAY);
        play.setContentDescription(snapshot.playing ? "Pausar" : "Reproduzir");
        if (snapshot.artwork != null && snapshot.artwork.hashCode() != lastArtwork) {
            lastArtwork = snapshot.artwork.hashCode();
            cover.setImageBitmap(snapshot.artwork);
        }
        setContentDescription("Tocando: " + snapshot.title);
    }

    private static String join(String first, String second) {
        if (first.length() == 0) return second;
        if (second.length() == 0 || second.equals(first)) return first;
        return first + " · " + second;
    }
}
