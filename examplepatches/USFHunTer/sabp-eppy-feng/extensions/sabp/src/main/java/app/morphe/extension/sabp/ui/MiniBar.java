package app.morphe.extension.sabp.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.sabp.EppyBridge;
import app.morphe.extension.sabp.EppyPlayer;
import app.morphe.extension.sabp.EppyTheme;

/**
 * The mini player card: cover, book and chapter, rewind, play/pause (and forward in full-screen
 * reading), with the chapter's progress along the bottom. The caller adds tap and gestures.
 */
public final class MiniBar {
    public final FrameLayout root;
    private final EppyTheme t;
    private final ImageView cover;
    private final TextView title, sub;
    private final PlayButton play;
    private final View progress;
    private Bitmap lastCover;

    public MiniBar(Context c, EppyTheme t, EppyPlayer player, boolean forward) {
        this.t = t;
        root = new FrameLayout(c);
        float r = Ui.dp(c, 20);
        root.setBackground(Ui.ripple(t, Ui.rounded(t.cardShadow ? t.surfaceContainerLow : t.surfaceContainerHighest, r), r));
        root.setElevation(Ui.dp(c, 6));
        Ui.clip(root, r);
        LinearLayout row = Ui.row(c);
        row.setPadding(Ui.dp(c, 8), 0, Ui.dp(c, 8), 0);
        cover = Ui.cover(c, t, null, 12);
        row.addView(cover, new LinearLayout.LayoutParams(Ui.dp(c, 48), Ui.dp(c, 48)));
        LinearLayout texts = Ui.column(c);
        texts.setPadding(Ui.dp(c, 12), 0, Ui.dp(c, 8), 0);
        title = Ui.singleLine(Ui.text(c, t, "", 15, 600, t.onSurface));
        sub = Ui.singleLine(Ui.text(c, t, "", 13, 400, t.onSurfaceVariant));
        sub.setPadding(0, Ui.dp(c, 3), 0, 0);
        texts.addView(title);
        texts.addView(sub);
        row.addView(texts, Ui.lp(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        row.addView(Ui.iconButton(c, t, EppyIcon.REWIND, t.onSurface, 0, "Rewind",
                v -> player.command(EppyBridge.ACTION_REWIND_SMALL)));
        play = new PlayButton(c);
        play.apply(t);
        play.setOnClickListener(v -> {
            Ui.haptic(v, t);
            player.playPause();
        });
        LinearLayout.LayoutParams pl = new LinearLayout.LayoutParams(Ui.dp(c, 44), Ui.dp(c, 44));
        pl.leftMargin = Ui.dp(c, 4);
        row.addView(play, pl);
        if (forward) {
            row.addView(Ui.iconButton(c, t, EppyIcon.FORWARD, t.onSurface, 0, "Forward",
                    v -> player.command(EppyBridge.ACTION_FWD_SMALL)));
        }
        root.addView(row, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        progress = new View(c);
        progress.setBackgroundColor(t.primary);
        progress.setPivotX(0);
        root.addView(progress, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Ui.dp(c, 3), Gravity.BOTTOM));
        root.setClickable(true);
        root.setFocusable(true);
    }

    /** Book, chapter, cover and play state. */
    public void update(EppyPlayer player) {
        title.setText(player.bookTitle());
        String ch = player.chapterTitle();
        sub.setText(ch != null && !ch.equals(player.bookTitle()) ? ch : "");
        Bitmap c = player.cover();
        if (c != lastCover) {
            Ui.setCover(cover, t, c);
            lastCover = c;
        }
        play.setPlaying(player.isPlaying(), true);
        tick(player);
    }

    /** The chapter progress line. */
    public void tick(EppyPlayer player) {
        long[] ch = player.chapterProgressMs();
        long d = ch != null ? ch[1] : player.durationMs();
        long pos = ch != null ? ch[0] : player.positionMs();
        progress.setScaleX(d > 0 ? pos / (float) d : 0f);
    }
}
