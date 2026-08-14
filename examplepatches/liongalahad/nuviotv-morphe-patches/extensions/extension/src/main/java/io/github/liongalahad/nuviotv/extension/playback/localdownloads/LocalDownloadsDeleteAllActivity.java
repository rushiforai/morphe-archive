package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/** Confirmation that deletes only files present in the Local Downloads index. */
public final class LocalDownloadsDeleteAllActivity extends Activity {
    private TextView title;
    private TextView message;
    private Button cancel;
    private Button delete;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        setFinishOnTouchOutside(false);
        createUi();
    }

    private void createUi() {
        LinearLayout outer = new LinearLayout(this);
        outer.setGravity(Gravity.CENTER);
        outer.setBackgroundColor(0x99000000);
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(32), dp(28), dp(32), dp(24));
        card.setBackground(LocalDownloadsTvUi.shape(
                LocalDownloadsTvUi.CARD, dp(18), dp(1), Color.rgb(67, 67, 67)));
        outer.addView(card, new LinearLayout.LayoutParams(dp(620), -2));

        title = LocalDownloadsTvUi.text(this, 24, LocalDownloadsTvUi.TEXT_PRIMARY);
        title.setText("Delete all downloads?");
        card.addView(title);
        message = LocalDownloadsTvUi.text(this, 17, LocalDownloadsTvUi.TEXT_SECONDARY);
        message.setText("Delete every video and subtitle recorded by Nuvio Local Downloads? Manually copied files will not be touched.");
        LinearLayout.LayoutParams messageParams = new LinearLayout.LayoutParams(-1, -2);
        messageParams.topMargin = dp(10);
        card.addView(message, messageParams);

        LinearLayout buttons = new LinearLayout(this);
        buttons.setGravity(Gravity.END);
        cancel = LocalDownloadsTvUi.button(this, "Cancel");
        delete = LocalDownloadsTvUi.button(this, "Delete all downloads");
        cancel.setOnClickListener(view -> finish());
        delete.setOnClickListener(view -> performDelete());
        buttons.addView(cancel, new LinearLayout.LayoutParams(-2, dp(56)));
        LinearLayout.LayoutParams deleteParams = new LinearLayout.LayoutParams(-2, dp(56));
        deleteParams.leftMargin = dp(12);
        buttons.addView(delete, deleteParams);
        LinearLayout.LayoutParams buttonsParams = new LinearLayout.LayoutParams(-1, -2);
        buttonsParams.topMargin = dp(22);
        card.addView(buttons, buttonsParams);
        setContentView(outer);
        cancel.requestFocus();
    }

    private void performDelete() {
        cancel.setEnabled(false);
        delete.setEnabled(false);
        delete.setText("Deleting...");
        new Thread(() -> {
            LocalDownloadsRuntime.DeleteAllResult result =
                    LocalDownloadsRuntime.deleteAllIndexedDownloads(this);
            runOnUiThread(() -> {
                title.setText(result.failures == 0 ? "Downloads deleted" : "Deletion incomplete");
                message.setText(result.message);
                delete.setVisibility(View.GONE);
                cancel.setEnabled(true);
                cancel.setText("Close");
                cancel.requestFocus();
            });
        }, "MorpheDeleteAllDownloads").start();
    }

    private int dp(int value) { return LocalDownloadsTvUi.dp(this, value); }
}
