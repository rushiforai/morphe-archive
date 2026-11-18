package app.afterglow.extension.ui;

import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.text.InputFilter;
import android.text.InputType;
import android.widget.EditText;
import android.widget.LinearLayout;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Shared small UI actions; persistent writes run away from native rendering. */
abstract class DestinationScreen extends SettingsScreen {
    interface Task { void run() throws Exception; }
    interface TextAction { void accept(String text) throws Exception; }
    private static final ExecutorService WRITES = Executors.newSingleThreadExecutor();
    final AfterglowActivity activity;
    DestinationScreen(AfterglowActivity activity) { this.activity = activity; }
    final void row(LinearLayout content, String title, String description, String detail, Runnable action) {
        content.addView(activity.views().detailRow(title, description, detail, true, action == null ? null : v -> action.run()));
    }
    final void run(Task action) {
        WRITES.execute(() -> {
            String failure = null;
            try { action.run(); } catch (Exception error) { failure = error.getMessage() == null ? "The action couldn't be completed." : error.getMessage(); }
            String message = failure;
            activity.runOnUiThread(() -> {
                if (activity.isFinishing() || activity.isDestroyed()) return;
                if (message != null) activity.alert(title(), message);
                activity.refresh();
            });
        });
    }
    final void confirm(String title, String message, String action, Task task) {
        new AlertDialog.Builder(activity).setTitle(title).setMessage(message).setNegativeButton("Cancel", null)
                .setPositiveButton(action, (dialog, which) -> run(task)).show();
    }
    final void input(String title, String value, int maximum, boolean multiline, TextAction action) {
        EditText input = new EditText(activity); input.setText(value == null ? "" : value);
        input.setInputType(InputType.TYPE_CLASS_TEXT | (multiline ? InputType.TYPE_TEXT_FLAG_MULTI_LINE : 0));
        input.setFilters(new InputFilter[]{new InputFilter.LengthFilter(maximum)});
        int padding = activity.views().dp(20); LinearLayout holder = new LinearLayout(activity);
        holder.setPadding(padding, padding / 2, padding, 0); holder.addView(input, new LinearLayout.LayoutParams(-1, -2));
        AlertDialog dialog = new AlertDialog.Builder(activity).setTitle(title).setView(holder)
                .setNegativeButton("Cancel", null).setPositiveButton("Save", null).create();
        dialog.setOnShowListener(ignored -> dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            String text = input.getText().toString();
            dialog.dismiss(); run(() -> action.accept(text));
        })); dialog.show();
    }
    final void copy(String label, String value) {
        ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard == null) { activity.alert(title(), "The clipboard is unavailable."); return; }
        clipboard.setPrimaryClip(ClipData.newPlainText(label, value));
        android.widget.Toast.makeText(activity, "Copied", android.widget.Toast.LENGTH_SHORT).show();
    }
}
