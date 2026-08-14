package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.view.Gravity;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/** Patch-owned movie detail menu reached from the native-style download action. */
public final class LocalDownloadsMovieActionActivity extends Activity {
    private boolean actionCompleted;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        setFinishOnTouchOutside(false);
        if (!LocalDownloadsRuntime.hasPendingMovieAction()) { finish(); return; }

        LocalDownloadsRuntime.DownloadedEntry entry =
                LocalDownloadsRuntime.pendingMovieActionEntry();
        LinearLayout outer = new LinearLayout(this);
        outer.setGravity(Gravity.CENTER);
        outer.setBackgroundColor(0x99000000);
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(26), dp(24), dp(26), dp(24));
        card.setBackground(LocalDownloadsTvUi.shape(
                LocalDownloadsTvUi.CARD, dp(18), dp(1), Color.rgb(67, 67, 67)));
        outer.addView(card, new LinearLayout.LayoutParams(dp(560), -2));

        TextView title = LocalDownloadsTvUi.text(this, 22, LocalDownloadsTvUi.TEXT_PRIMARY);
        title.setText(LocalDownloadsRuntime.pendingMovieActionTitle());
        card.addView(title, new LinearLayout.LayoutParams(-1, -2));

        LinearLayout actions = new LinearLayout(this);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams actionParams = new LinearLayout.LayoutParams(-1, -2);
        actionParams.topMargin = dp(20);
        card.addView(actions, actionParams);

        Button initialFocus;
        if (entry == null) {
            Button download = LocalDownloadsTvUi.button(this, "Download to storage");
            actions.addView(download, new LinearLayout.LayoutParams(-1, dp(56)));
            download.setOnClickListener(view -> {
                actionCompleted = LocalDownloadsRuntime.startPendingMovieDownload();
                finish();
            });
            initialFocus = download;
        } else {
            Button play = LocalDownloadsTvUi.button(this, "Play local file");
            Button delete = LocalDownloadsTvUi.button(this, "Delete local file");
            actions.addView(play, new LinearLayout.LayoutParams(0, dp(56), 1f));
            LinearLayout.LayoutParams deleteParams = new LinearLayout.LayoutParams(0, dp(56), 1f);
            deleteParams.leftMargin = dp(10);
            actions.addView(delete, deleteParams);
            play.setOnClickListener(view -> {
                if (!LocalDownloadsRuntime.playDownloadedEntry(entry)) return;
                actionCompleted = true;
                LocalDownloadsRuntime.cancelPendingMovieAction();
                finish();
            });
            delete.setOnClickListener(view -> {
                actionCompleted = true;
                LocalDownloadsRuntime.cancelPendingMovieAction();
                LocalDownloadsRuntime.requestDeleteEntry(entry);
                finish();
            });
            initialFocus = play;
        }

        setContentView(outer);
        initialFocus.requestFocus();
    }

    @Override public void onBackPressed() {
        LocalDownloadsRuntime.cancelPendingMovieAction();
        finish();
    }

    @Override protected void onDestroy() {
        if (isFinishing() && !actionCompleted) LocalDownloadsRuntime.cancelPendingMovieAction();
        super.onDestroy();
    }

    private int dp(int value) { return LocalDownloadsTvUi.dp(this, value); }
}
