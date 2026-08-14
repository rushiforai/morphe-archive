package io.github.liongalahad.nuviotv.extension.playback.localmedia;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/** TV-friendly confirmation popup for Storage file and folder deletion. */
public final class LocalMediaDeleteActivity extends Activity {
    private TextView title;
    private TextView message;
    private Button cancel;
    private Button delete;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        setFinishOnTouchOutside(false);
        LocalMediaRuntime.PendingDelete request = LocalMediaRuntime.pendingDelete();
        if (request == null) {
            finish();
            return;
        }
        createUi(request);
    }

    @Override public void onBackPressed() {
        LocalMediaRuntime.cancelPendingDelete();
        finish();
    }

    private void createUi(LocalMediaRuntime.PendingDelete request) {
        LinearLayout outer = new LinearLayout(this);
        outer.setGravity(Gravity.CENTER);
        outer.setBackgroundColor(0x99000000);
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(32), dp(28), dp(32), dp(24));
        card.setBackground(LocalMediaTvUi.shape(
                LocalMediaTvUi.CARD, dp(18), dp(1), Color.rgb(67, 67, 67)));
        outer.addView(card, new LinearLayout.LayoutParams(dp(620), ViewGroup.LayoutParams.WRAP_CONTENT));

        title = LocalMediaTvUi.text(this, 24, LocalMediaTvUi.TEXT_PRIMARY);
        title.setText(request.folder ? "Delete folder?" : "Delete file?");
        card.addView(title);
        message = LocalMediaTvUi.text(this, 17, LocalMediaTvUi.TEXT_SECONDARY);
        message.setText(request.folder
                ? "Delete “" + request.name + "” and all files inside it from local storage?"
                : "Delete “" + request.name + "” and its associated subtitles from local storage?");
        LinearLayout.LayoutParams messageParams = new LinearLayout.LayoutParams(-1, -2);
        messageParams.topMargin = dp(10);
        card.addView(message, messageParams);

        LinearLayout buttons = new LinearLayout(this);
        buttons.setGravity(Gravity.END);
        cancel = LocalMediaTvUi.button(this, "Cancel");
        delete = LocalMediaTvUi.button(this, request.folder ? "Delete Folder" : "Delete File");
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
            LocalMediaRuntime.DeleteResult result = LocalMediaRuntime.confirmPendingDelete();
            runOnUiThread(() -> {
                title.setText(result.complete ? "Deleted" : "Deletion incomplete");
                message.setText(result.message);
                delete.setVisibility(android.view.View.GONE);
                cancel.setEnabled(true);
                cancel.setText("Close");
                cancel.setOnClickListener(view -> finish());
                cancel.requestFocus();
            });
        }, "MorpheDeleteStorageItem").start();
    }

    private int dp(int value) { return LocalMediaTvUi.dp(this, value); }
}
