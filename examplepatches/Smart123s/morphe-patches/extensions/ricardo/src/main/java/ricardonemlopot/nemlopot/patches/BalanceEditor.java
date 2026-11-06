package ricardonemlopot.nemlopot.patches;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.Build;
import android.text.InputType;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.widget.EditText;
import android.widget.FrameLayout;
import com.badlogic.gdx.Gdx;
import java.lang.ref.WeakReference;

public final class BalanceEditor {
    private static volatile WeakReference<Activity> host = new WeakReference<>(null);
    // Accessed only on Android's UI thread. The dialog owns its editor while open.
    private static WeakReference<AlertDialog> activeDialog = new WeakReference<>(null);
    private final Activity activity;

    public static void install(Activity activity) {
        // The coin is drawn by the game's menu scene, not by an Android view.
        host = new WeakReference<>(activity);
    }

    private BalanceEditor(Activity activity) {
        this.activity = activity;
    }

    private int dp(int value) {
        return Math.round(value * activity.getResources().getDisplayMetrics().density);
    }

    private boolean isUnavailable() {
        return activity.isFinishing()
                || (Build.VERSION.SDK_INT >= 17 && activity.isDestroyed());
    }

    /** Called on the GL thread, after the game unprojects the touch into its world. */
    public static boolean onTouchDown(int pointer) {
        if (!TuningBalanceButton.hit(pointer)) return false;
        Activity activity = host.get();
        if (activity == null) return false;
        int current = BalanceStore.current();
        activity.runOnUiThread(() -> {
            BalanceEditor editor = new BalanceEditor(activity);
            if (editor.isUnavailable()) return;
            AlertDialog previous = activeDialog.get();
            if (previous != null && previous.isShowing()) return;
            editor.showDialog(current);
        });
        return true;
    }

    private void showDialog(int current) {
        EditText input = new EditText(activity);
        input.setInputType(InputType.TYPE_CLASS_NUMBER);
        input.setSingleLine(true);
        input.setImeOptions(EditorInfo.IME_ACTION_DONE);
        input.setText(Integer.toString(current));
        input.selectAll();
        FrameLayout container = new FrameLayout(activity);
        container.setPadding(dp(20), dp(8), dp(20), 0);
        container.addView(input);
        AlertDialog dialog = new AlertDialog.Builder(activity)
                .setTitle("Egyenleg beállítása")
                .setView(container)
                .setPositiveButton("Beállítás", null)
                .setNegativeButton("Mégse", null)
                .create();
        dialog.setOnShowListener(ignored -> {
            View save = dialog.getButton(AlertDialog.BUTTON_POSITIVE);
            save.setOnClickListener(view -> {
                if (!save.isEnabled()) return;
                final int value;
                try {
                    value = BalanceStore.parse(input.getText().toString());
                } catch (NumberFormatException error) {
                    input.setError("0 és 2147483647 közötti egész számot adj meg.");
                    return;
                }
                save.setEnabled(false);
                dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setEnabled(false);
                dialog.setCancelable(false);
                Gdx.app.postRunnable(() -> {
                    try {
                        BalanceStore.save(value);
                        activity.runOnUiThread(dialog::dismiss);
                    } catch (RuntimeException error) {
                        activity.runOnUiThread(() -> {
                            if (isUnavailable()) return;
                            save.setEnabled(true);
                            dialog.getButton(AlertDialog.BUTTON_NEGATIVE).setEnabled(true);
                            dialog.setCancelable(true);
                            input.setError("Az egyenleg mentése nem sikerült. Próbáld újra.");
                        });
                    }
                });
            });
            input.setOnEditorActionListener((view, action, event) -> {
                if (action != EditorInfo.IME_ACTION_DONE) return false;
                save.performClick();
                return true;
            });
            input.requestFocus();
        });
        dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_VISIBLE);
        dialog.show();
        activeDialog = new WeakReference<>(dialog);
    }
}
