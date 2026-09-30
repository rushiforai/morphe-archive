/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 *
 * Part of the Twitter Bookmarker overlay: see morphe/README.md.
 */

package app.morphe.extension.twitter.patches.bookmarker;

import android.app.AlertDialog;
import android.content.Context;
import android.text.InputType;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import app.morphe.extension.shared.Utils;

/**
 * The backend address and token, edited in place.
 *
 * <p>Opened by the first tap (when nothing is configured yet) and by a long
 * press afterwards, so there is no hidden menu to find: a tap that cannot save
 * is the one that asks where to save.
 *
 * <p>"Test connection" is a separate button because the two failures worth
 * telling apart — an address that does not answer and a token that is refused —
 * are invisible from the save flow until a save fails.
 */
public final class BookmarkerSettingsDialog {

    private static final String HINT_URL = "http://192.168.1.13:43121 or a tunnel URL";
    private static final String HINT_TOKEN = "leave empty when the backend needs none";

    private static AlertDialog current;

    private BookmarkerSettingsDialog() {}

    /**
     * @param onSaved run after a successful save, on the main thread; may be null.
     */
    public static void show(Context context, Runnable onSaved) {
        if (context == null) return;

        // Recycled views can deliver the same tap twice; a second dialog on top
        // of the first is one dialog too many.
        if (current != null && current.isShowing()) {
            current.dismiss();
        }

        LinearLayout layout = new LinearLayout(context);
        layout.setOrientation(LinearLayout.VERTICAL);
        int padding = dp(context, 20);
        layout.setPadding(padding, dp(context, 8), padding, 0);

        TextView urlLabel = new TextView(context);
        urlLabel.setText("Backend URL");
        layout.addView(urlLabel);

        EditText urlInput = new EditText(context);
        urlInput.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        urlInput.setSingleLine(true);
        urlInput.setHint(HINT_URL);
        urlInput.setText(BookmarkerPrefs.backendUrl());
        layout.addView(urlInput);

        TextView tokenLabel = new TextView(context);
        tokenLabel.setText("Token (optional)");
        layout.addView(tokenLabel);

        EditText tokenInput = new EditText(context);
        tokenInput.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
        tokenInput.setSingleLine(true);
        tokenInput.setHint(HINT_TOKEN);
        tokenInput.setText(BookmarkerPrefs.backendToken());
        layout.addView(tokenInput);

        AlertDialog dialog = new AlertDialog.Builder(context)
                .setTitle("Twitter Bookmarker")
                .setView(layout)
                .setPositiveButton("Save", null)
                .setNeutralButton("Test", null)
                .setNegativeButton("Cancel", null)
                .create();

        // Set after show(), otherwise the buttons close the dialog before the
        // fields have been read and a wrong address would look like a save.
        dialog.setOnShowListener(ignored -> {
            Button save = dialog.getButton(AlertDialog.BUTTON_POSITIVE);
            save.setOnClickListener(v -> {
                BookmarkerPrefs.save(
                        urlInput.getText().toString(),
                        tokenInput.getText().toString());
                // The cache holds answers from the backend that was configured
                // until now; this one line makes the marks and the picker belong to
                // the address that was just saved.
                BookmarkerCache.refreshNow();
                Utils.showToastShort("Twitter Bookmarker: settings saved");
                dialog.dismiss();
                if (onSaved != null) onSaved.run();
            });

            Button test = dialog.getButton(AlertDialog.BUTTON_NEUTRAL);
            test.setOnClickListener(v -> testConnection(
                    urlInput.getText().toString(),
                    tokenInput.getText().toString(),
                    save));
        });

        current = dialog;
        dialog.show();
    }

    /**
     * Probes in the background and reports on the main thread. The Save button is
     * disabled while it runs so the result cannot be overtaken by a dismissal.
     */
    private static void testConnection(String url, String token, View saveButton) {
        saveButton.setEnabled(false);
        Utils.runOnBackgroundThread(() -> {
            BookmarkerApi.Result result = BookmarkerApi.testConnection(url, token);
            Utils.runOnMainThread(() -> {
                saveButton.setEnabled(true);
                Utils.showToastLong("Twitter Bookmarker: " + result.message);
            });
        });
    }

    private static int dp(Context context, int value) {
        return (int) (value * context.getResources().getDisplayMetrics().density);
    }
}
