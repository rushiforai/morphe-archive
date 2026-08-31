package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.view.Gravity;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/** Play/Download menu shown by holding a source in Nuvio's ordinary source picker. */
public final class LocalDownloadsSourceActionActivity extends Activity {
    private LinearLayout card;
    private boolean actionCompleted;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        LinearLayout outer = new LinearLayout(this);
        outer.setGravity(Gravity.CENTER);
        outer.setBackgroundColor(0x99000000);
        card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(26), dp(24), dp(26), dp(24));
        card.setBackground(LocalDownloadsTvUi.shape(
                LocalDownloadsTvUi.CARD, dp(18), dp(1), Color.rgb(67, 67, 67)));
        outer.addView(card, new LinearLayout.LayoutParams(dp(620), -2));
        setContentView(outer);
        showInitialActions();
    }

    private void showInitialActions() {
        card.removeAllViews();
        addTitle(LocalDownloadsRuntime.pendingSourceTitle());
        LinearLayout actions = actionRow();
        Button play = LocalDownloadsTvUi.button(this, "Play");
        Button download = LocalDownloadsTvUi.button(this, "Download");
        addButton(actions, play, false);
        addButton(actions, download, true);
        card.addView(actions, actionParams());

        play.setOnClickListener(view -> {
            if (!LocalDownloadsRuntime.playPendingSource()) return;
            actionCompleted = true;
            finish();
        });
        download.setOnClickListener(view -> {
            LocalDownloadsRuntime.SourceDuplicateKind duplicate =
                    LocalDownloadsRuntime.pendingSourceDuplicateKind();
            if (duplicate == LocalDownloadsRuntime.SourceDuplicateKind.SAME) {
                showDuplicate(true);
            } else if (duplicate == LocalDownloadsRuntime.SourceDuplicateKind.DIFFERENT) {
                showDuplicate(false);
            } else if (LocalDownloadsRuntime.downloadPendingSource(false)) {
                actionCompleted = true;
                finish();
            }
        });
        play.requestFocus();
    }

    private void showDuplicate(boolean sameSource) {
        card.removeAllViews();
        addTitle(LocalDownloadsRuntime.pendingSourceTitle());
        TextView message = LocalDownloadsTvUi.text(this, 17, LocalDownloadsTvUi.TEXT_SECONDARY);
        message.setText(sameSource
                ? "This title was already downloaded from the same source."
                : "This title was already downloaded from a different source.");
        LinearLayout.LayoutParams messageParams = new LinearLayout.LayoutParams(-1, -2);
        messageParams.topMargin = dp(12);
        card.addView(message, messageParams);

        LinearLayout actions = actionRow();
        Button back = LocalDownloadsTvUi.button(this, "Back");
        if (!sameSource) {
            Button overwrite = LocalDownloadsTvUi.button(this, "Download and overwrite");
            addButton(actions, overwrite, false);
            addButton(actions, back, true);
            overwrite.setOnClickListener(view -> {
                if (!LocalDownloadsRuntime.downloadPendingSource(true)) return;
                actionCompleted = true;
                finish();
            });
            overwrite.requestFocus();
        } else {
            addButton(actions, back, false);
            back.requestFocus();
        }
        back.setOnClickListener(view -> onBackPressed());
        card.addView(actions, actionParams());
    }

    private void addTitle(String value) {
        TextView title = LocalDownloadsTvUi.text(this, 22, LocalDownloadsTvUi.TEXT_PRIMARY);
        title.setText(value);
        card.addView(title, new LinearLayout.LayoutParams(-1, -2));
    }

    private LinearLayout actionRow() {
        LinearLayout actions = new LinearLayout(this);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        return actions;
    }

    private void addButton(LinearLayout row, Button button, boolean withMargin) {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(0, dp(56), 1f);
        if (withMargin) params.leftMargin = dp(10);
        row.addView(button, params);
    }

    private LinearLayout.LayoutParams actionParams() {
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, -2);
        params.topMargin = dp(20);
        return params;
    }

    @android.annotation.SuppressLint("GestureBackNavigation")
    @Override public void onBackPressed() {
        LocalDownloadsRuntime.cancelPendingSourceAction();
        finish();
    }

    @Override protected void onDestroy() {
        if (isFinishing() && !actionCompleted) LocalDownloadsRuntime.cancelPendingSourceAction();
        LocalDownloadsRuntime.finishSourceAction();
        super.onDestroy();
    }

    private int dp(int value) { return LocalDownloadsTvUi.dp(this, value); }
}
