package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import java.util.Locale;

/** TV-friendly progress/completion popup with Hide and Cancel controls. */
public final class LocalDownloadsProgressActivity extends Activity {
    private final Handler handler = new Handler(Looper.getMainLooper());
    private TextView title, message, storage;
    private ProgressBar progress;
    private Button hide, cancel;
    private boolean hiddenByUser;
    private boolean lastActive = true;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        setFinishOnTouchOutside(false);
        createUi();
    }

    @Override protected void onResume() {
        super.onResume();
        handler.post(refresh);
    }

    @Override protected void onPause() {
        handler.removeCallbacks(refresh);
        super.onPause();
    }

    @Override protected void onDestroy() {
        handler.removeCallbacks(refresh);
        LocalDownloadsRuntime.progressDialogClosed();
        super.onDestroy();
    }

    @Override public void onBackPressed() { hideDownload(); }

    private void createUi() {
        LinearLayout outer = new LinearLayout(this);
        outer.setGravity(Gravity.CENTER);
        outer.setBackgroundColor(0x99000000);

        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(32), dp(28), dp(32), dp(24));
        card.setBackground(LocalDownloadsTvUi.shape(
                LocalDownloadsTvUi.CARD, dp(18), dp(1), Color.rgb(67, 67, 67)));
        outer.addView(card, new LinearLayout.LayoutParams(dp(620), ViewGroup.LayoutParams.WRAP_CONTENT));

        title = LocalDownloadsTvUi.text(this, 24, LocalDownloadsTvUi.TEXT_PRIMARY);
        card.addView(title);
        message = LocalDownloadsTvUi.text(this, 17, LocalDownloadsTvUi.TEXT_SECONDARY);
        LinearLayout.LayoutParams messageParams = new LinearLayout.LayoutParams(-1, -2);
        messageParams.topMargin = dp(10);
        card.addView(message, messageParams);

        storage = LocalDownloadsTvUi.text(this, 14, LocalDownloadsTvUi.TEXT_SECONDARY);
        LinearLayout.LayoutParams storageParams = new LinearLayout.LayoutParams(-1, -2);
        storageParams.topMargin = dp(8);
        card.addView(storage, storageParams);

        progress = new ProgressBar(this, null, android.R.attr.progressBarStyleHorizontal);
        progress.setMax(100);
        progress.setProgressTintList(ColorStateList.valueOf(LocalDownloadsTvUi.TEXT_PRIMARY));
        progress.setProgressBackgroundTintList(ColorStateList.valueOf(Color.rgb(74, 74, 74)));
        progress.setIndeterminateTintList(ColorStateList.valueOf(LocalDownloadsTvUi.TEXT_PRIMARY));
        LinearLayout.LayoutParams progressParams = new LinearLayout.LayoutParams(-1, dp(12));
        progressParams.topMargin = dp(22);
        card.addView(progress, progressParams);

        LinearLayout buttons = new LinearLayout(this);
        buttons.setGravity(Gravity.END);
        hide = LocalDownloadsTvUi.button(this, "Hide");
        cancel = LocalDownloadsTvUi.button(this, "Cancel");
        hide.setOnClickListener(view -> hideDownload());
        cancel.setOnClickListener(view -> {
            LocalDownloadsRuntime.cancelDownload();
            cancel.setEnabled(false);
            cancel.setText("Cancelling...");
            hide.requestFocus();
        });
        buttons.addView(hide, new LinearLayout.LayoutParams(-2, dp(56)));
        LinearLayout.LayoutParams cancelParams = new LinearLayout.LayoutParams(-2, dp(56));
        cancelParams.leftMargin = dp(12);
        buttons.addView(cancel, cancelParams);
        LinearLayout.LayoutParams buttonParams = new LinearLayout.LayoutParams(-1, -2);
        buttonParams.topMargin = dp(22);
        card.addView(buttons, buttonParams);

        setContentView(outer);
        hide.requestFocus();
    }

    private final Runnable refresh = new Runnable() {
        @Override public void run() {
            LocalDownloadsRuntime.DownloadState state = LocalDownloadsRuntime.state();
            title.setText(state.title.isEmpty() ? "Local download" : state.title);
            storage.setText(LocalDownloadsStorageStats.caption());
            boolean active = state.status == LocalDownloadsRuntime.Status.PREPARING ||
                    state.status == LocalDownloadsRuntime.Status.DOWNLOADING;
            progress.setVisibility(active ? View.VISIBLE : View.GONE);
            cancel.setVisibility(active ? View.VISIBLE : View.GONE);
            hide.setText(active ? "Hide" : "Close");
            if (lastActive && !active) hide.requestFocus();
            lastActive = active;

            if (state.status == LocalDownloadsRuntime.Status.DOWNLOADING) {
                if (state.total > 0) {
                    progress.setIndeterminate(false);
                    progress.setProgress((int) Math.min(100L, state.bytes * 100L / state.total));
                    message.setText(state.message + " - " + size(state.bytes) + " / " + size(state.total));
                } else {
                    progress.setIndeterminate(true);
                    message.setText(state.message + " - " + size(state.bytes));
                }
            } else if (state.status == LocalDownloadsRuntime.Status.PREPARING) {
                progress.setIndeterminate(true);
                message.setText(state.message);
            } else {
                message.setText(state.message);
            }
            if (hiddenByUser) return;
            handler.postDelayed(this, active ? 250L : 1000L);
        }
    };

    private void hideDownload() {
        hiddenByUser = true;
        if (LocalDownloadsRuntime.isDownloadRunning()) LocalDownloadsRuntime.hideDialog();
        else LocalDownloadsRuntime.resetFinishedState();
        finish();
    }

    private int dp(int value) { return LocalDownloadsTvUi.dp(this, value); }

    private static String size(long bytes) {
        if (bytes >= 1_073_741_824L) return String.format(Locale.US, "%.2f GB", bytes / 1_073_741_824.0);
        if (bytes >= 1_048_576L) return String.format(Locale.US, "%.1f MB", bytes / 1_048_576.0);
        if (bytes >= 1024L) return String.format(Locale.US, "%.0f KB", bytes / 1024.0);
        return bytes + " B";
    }
}
