package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/** Native-feeling Play/Delete menu for an indexed download. */
public final class LocalDownloadsEntryActionActivity extends Activity {
    private boolean actionCompleted;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        LocalDownloadsRuntime.DownloadedEntry entry = LocalDownloadsRuntime.pendingDelete();
        if (entry == null) { finish(); return; }

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
        title.setText(entry.displayLabel());
        card.addView(title, new LinearLayout.LayoutParams(-1, -2));
        if (!entry.episodeTitle.isEmpty()) {
            TextView episodeTitle = LocalDownloadsTvUi.text(
                    this, 15, LocalDownloadsTvUi.TEXT_SECONDARY);
            episodeTitle.setText(entry.episodeTitle);
            LinearLayout.LayoutParams episodeParams = new LinearLayout.LayoutParams(-1, -2);
            episodeParams.topMargin = dp(6);
            card.addView(episodeTitle, episodeParams);
        }

        LinearLayout actions = new LinearLayout(this);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        Button play = LocalDownloadsTvUi.button(this, "Play local file");
        Button delete = LocalDownloadsTvUi.button(this, "Delete local file");
        actions.addView(play, new LinearLayout.LayoutParams(0, dp(56), 1f));
        LinearLayout.LayoutParams deleteParams = new LinearLayout.LayoutParams(0, dp(56), 1f);
        deleteParams.leftMargin = dp(10);
        actions.addView(delete, deleteParams);
        LinearLayout.LayoutParams actionParams = new LinearLayout.LayoutParams(-1, -2);
        actionParams.topMargin = dp(20);
        card.addView(actions, actionParams);

        play.setOnClickListener(view -> {
            if (!LocalDownloadsRuntime.playDownloadedEntry(entry)) return;
            actionCompleted = true;
            LocalDownloadsRuntime.cancelPendingDelete();
            finish();
        });
        delete.setOnClickListener(view -> {
            actionCompleted = true;
            LocalDownloadsRuntime.requestDeleteEntry(entry);
            finish();
        });
        setContentView(outer);
        play.requestFocus();
    }

    @android.annotation.SuppressLint("GestureBackNavigation")
    @Override public void onBackPressed() {
        LocalDownloadsRuntime.cancelPendingDelete();
        finish();
    }

    @Override protected void onDestroy() {
        if (isFinishing() && !actionCompleted) LocalDownloadsRuntime.cancelPendingDelete();
        LocalDownloadsRuntime.finishEntryAction();
        super.onDestroy();
    }

    private int dp(int value) { return LocalDownloadsTvUi.dp(this, value); }
}
