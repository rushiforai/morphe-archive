package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/** Patch-owned confirmation popup for deleting one indexed local download. */
public final class LocalDownloadsDeleteActivity extends Activity {
    private TextView title;
    private TextView message;
    private Button cancel;
    private Button delete;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        setFinishOnTouchOutside(false);
        LocalDownloadsRuntime.DownloadedEntry entry = LocalDownloadsRuntime.pendingDelete();
        if (entry == null) {
            finish();
            return;
        }
        createUi(entry);
    }

    @Override public void onBackPressed() {
        LocalDownloadsRuntime.cancelPendingDelete();
        finish();
    }

    private void createUi(LocalDownloadsRuntime.DownloadedEntry entry) {
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
        title.setText("Delete local file?");
        card.addView(title);

        message = LocalDownloadsTvUi.text(this, 17, LocalDownloadsTvUi.TEXT_SECONDARY);
        String item = entry.displayLabel();
        message.setText("Delete “" + item + "” and its downloaded subtitles from local storage?");
        LinearLayout.LayoutParams messageParams = new LinearLayout.LayoutParams(-1, -2);
        messageParams.topMargin = dp(10);
        card.addView(message, messageParams);

        LinearLayout buttons = new LinearLayout(this);
        buttons.setGravity(Gravity.END);
        cancel = LocalDownloadsTvUi.button(this, "Cancel");
        delete = LocalDownloadsTvUi.button(this, "Delete local file");
        cancel.setOnClickListener(view -> onBackPressed());
        delete.setOnClickListener(view -> performDelete());
        buttons.addView(cancel, new LinearLayout.LayoutParams(-2, dp(56)));
        LinearLayout.LayoutParams deleteParams = new LinearLayout.LayoutParams(-2, dp(56));
        deleteParams.leftMargin = dp(12);
        buttons.addView(delete, deleteParams);
        LinearLayout.LayoutParams buttonParams = new LinearLayout.LayoutParams(-1, -2);
        buttonParams.topMargin = dp(22);
        card.addView(buttons, buttonParams);

        setContentView(outer);
        cancel.requestFocus();
    }

    private void performDelete() {
        cancel.setEnabled(false);
        delete.setEnabled(false);
        delete.setText("Deleting...");
        new Thread(() -> {
            LocalDownloadsRuntime.DeleteResult result = LocalDownloadsRuntime.confirmPendingDelete();
            runOnUiThread(() -> {
                title.setText(result.complete ? "Local file deleted" : "Deletion incomplete");
                message.setText(result.message);
                delete.setVisibility(android.view.View.GONE);
                cancel.setEnabled(true);
                cancel.setText("Close");
                cancel.setOnClickListener(view -> finish());
                cancel.requestFocus();
            });
        }, "MorpheDeleteLocalDownload").start();
    }

    private int dp(int value) { return LocalDownloadsTvUi.dp(this, value); }
}
