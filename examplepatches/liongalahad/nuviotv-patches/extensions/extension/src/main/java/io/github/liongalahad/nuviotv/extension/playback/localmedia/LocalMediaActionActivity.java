package io.github.liongalahad.nuviotv.extension.playback.localmedia;

import android.app.Activity;
import android.graphics.Color;
import android.os.Bundle;
import android.view.Gravity;
import android.view.KeyEvent;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;

/** Native-feeling one-option menu shown as soon as a Storage item hold is recognized. */
public final class LocalMediaActionActivity extends Activity {
    private boolean confirmationOpened;
    private boolean awaitingHeldSelectRelease;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        LocalMediaRuntime.PendingDelete request = LocalMediaRuntime.pendingDelete();
        if (request == null) { finish(); return; }
        awaitingHeldSelectRelease = request.openedDuringSelectHold;

        LinearLayout outer = new LinearLayout(this);
        outer.setGravity(Gravity.CENTER);
        outer.setBackgroundColor(0x99000000);
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(26), dp(24), dp(26), dp(24));
        card.setBackground(LocalMediaTvUi.shape(
                LocalMediaTvUi.CARD, dp(18), dp(1), Color.rgb(67, 67, 67)));
        outer.addView(card, new LinearLayout.LayoutParams(dp(500), -2));

        TextView title = LocalMediaTvUi.text(this, 22, LocalMediaTvUi.TEXT_PRIMARY);
        title.setText(request.name);
        card.addView(title, new LinearLayout.LayoutParams(-1, -2));
        Button delete = LocalMediaTvUi.button(
                this, request.folder ? "Delete Folder" : "Delete File");
        LinearLayout.LayoutParams buttonParams = new LinearLayout.LayoutParams(-1, dp(56));
        buttonParams.topMargin = dp(20);
        card.addView(delete, buttonParams);
        delete.setOnClickListener(view -> {
            confirmationOpened = true;
            LocalMediaRuntime.showPendingDeleteConfirmation();
            finish();
        });
        setContentView(outer);
        delete.requestFocus();
    }

    @Override public boolean dispatchKeyEvent(KeyEvent event) {
        if (awaitingHeldSelectRelease && event != null) {
            // MainActivity may receive the original key-up after this activity becomes visible.
            // In that case the next press is a new deliberate action and should pass normally.
            if (!LocalMediaRuntime.isSelectKeyDown()) {
                awaitingHeldSelectRelease = false;
            } else if (isSelectKey(event.getKeyCode())) {
                if (event.getAction() == KeyEvent.ACTION_UP) {
                    awaitingHeldSelectRelease = false;
                    LocalMediaRuntime.finishHeldSelectCycle();
                }
                return true;
            }
        }
        return super.dispatchKeyEvent(event);
    }

    @Override public void onBackPressed() {
        LocalMediaRuntime.cancelPendingDelete();
        finish();
    }

    @Override protected void onDestroy() {
        if (isFinishing() && !confirmationOpened) LocalMediaRuntime.cancelPendingDelete();
        super.onDestroy();
    }

    private int dp(int value) { return LocalMediaTvUi.dp(this, value); }

    private static boolean isSelectKey(int keyCode) {
        return keyCode == KeyEvent.KEYCODE_DPAD_CENTER ||
                keyCode == KeyEvent.KEYCODE_ENTER || keyCode == KeyEvent.KEYCODE_NUMPAD_ENTER ||
                keyCode == KeyEvent.KEYCODE_BUTTON_A;
    }
}
