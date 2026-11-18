package app.saketh.extension.controls;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.graphics.Typeface;
import android.net.Uri;
import android.view.Gravity;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import app.saketh.extension.fonts.FontHooks;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicBoolean;

final class FontControls {
    private static final AtomicBoolean IMPORTING = new AtomicBoolean();
    private final Activity activity;
    private final ControlsUi ui;
    private final TextView[] status = new TextView[2], preview = new TextView[2];
    private final Button[] reset = new Button[2];

    FontControls(Activity activity, ControlsUi ui) { this.activity = activity; this.ui = ui; }

    void add(LinearLayout parent, boolean reader) {
        int slot = reader ? 1 : 0;
        String scope = reader ? "Reader font" : "UI font";
        LinearLayout card = ui.card(parent);
        card.setPadding(ui.dp(16), ui.dp(16), ui.dp(16), ui.dp(16));
        LinearLayout header = new LinearLayout(activity);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.addView(ui.text(scope, 17, ui.text, true), new LinearLayout.LayoutParams(0, -2, 1));
        status[slot] = ui.text("Original", 12, ui.accent, true);
        status[slot].setPadding(ui.dp(9), ui.dp(5), ui.dp(9), ui.dp(5));
        status[slot].setBackground(ui.shape(ui.accentSurface, ui.accentSurface, 6));
        header.addView(status[slot]);
        card.addView(header);
        TextView detail = ui.text(reader ? "Chapter text only. Separate from the app interface."
                : "Menus, library and native app screens.", 13, ui.muted, false);
        detail.setPadding(0, ui.dp(8), 0, 0);
        card.addView(detail);
        preview[slot] = ui.text("Aa · The quick brown fox\n0123456789", 22, ui.text, false);
        preview[slot].setPadding(0, ui.dp(18), 0, ui.dp(18));
        preview[slot].setContentDescription(scope + " preview");
        card.addView(preview[slot]);
        LinearLayout actions = new LinearLayout(activity);
        Button pick = ui.button("Import font", true);
        pick.setContentDescription("Import " + (reader ? "reader" : "UI") + " font");
        pick.setOnClickListener(view -> pick(reader));
        actions.addView(pick, new LinearLayout.LayoutParams(0, -2, 1));
        reset[slot] = ui.button("Reset", false);
        reset[slot].setContentDescription("Reset " + (reader ? "reader" : "UI") + " font");
        reset[slot].setOnClickListener(view -> reset(reader));
        LinearLayout.LayoutParams resetParams = new LinearLayout.LayoutParams(-2, -2);
        resetParams.setMarginStart(ui.dp(8));
        actions.addView(reset[slot], resetParams);
        card.addView(actions);
    }

    void refresh() {
        for (int slot = 0; slot < 2; slot++) {
            if (status[slot] == null) continue;
            boolean reader = slot == 1;
            boolean custom = FontHooks.hasCustom(activity, reader);
            status[slot].setText(custom ? "Custom" : "Original");
            status[slot].setContentDescription((reader ? "Reader font: " : "UI font: ") + (custom ? "Custom" : "Original"));
            preview[slot].setTypeface(reader ? FontHooks.readerTypeface(activity, Typeface.SERIF)
                    : FontHooks.uiTypeface(activity, Typeface.DEFAULT));
            reset[slot].setEnabled(custom);
            reset[slot].setAlpha(custom ? 1f : 0.45f);
        }
    }

    private void pick(boolean reader) {
        if (IMPORTING.get()) { toast("A font import is already running."); return; }
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
                .setType("*/*").addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
        try {
            activity.startActivityForResult(intent, reader ? 711 : 710);
        } catch (android.content.ActivityNotFoundException unavailable) {
            toast("No document picker is available on this device.");
        }
    }

    private void reset(boolean reader) {
        if (IMPORTING.get()) { toast("Wait for the font import to finish."); return; }
        try {
            FontHooks.reset(activity, reader);
            refresh();
            toast("Original font restored. Reopen app screens to apply it.");
        } catch (IOException failure) {
            toast("Could not reset this font. Your choice was kept.");
        }
    }

    void result(int request, int result, Intent data) {
        if ((request != 710 && request != 711) || result != Activity.RESULT_OK || data == null || data.getData() == null) return;
        if (!IMPORTING.compareAndSet(false, true)) { toast("A font import is already running."); return; }
        Uri uri = data.getData();
        android.content.Context app = activity.getApplicationContext();
        toast("Importing font…");
        new Thread(() -> {
            boolean succeeded = false;
            try {
                FontHooks.importFont(app, uri, request == 711);
                succeeded = true;
            } catch (IOException failure) {
                // The prior font remains intact. Provider paths are not shown or logged.
            } finally {
                IMPORTING.set(false);
            }
            final boolean imported = succeeded;
            activity.runOnUiThread(() -> {
                if (activity.isFinishing() || activity.isDestroyed()) return;
                refresh();
                if (imported) toast("Font imported. Reopen app screens to apply it.");
                else new AlertDialog.Builder(activity).setTitle("Font not imported")
                        .setMessage("Choose a readable .ttf or .otf font, up to 16 MiB. Your previous font was kept.")
                        .setPositiveButton(android.R.string.ok, null).show();
            });
        }, "WebNovel-font-import").start();
    }

    private void toast(String text) { Toast.makeText(activity, text, Toast.LENGTH_LONG).show(); }
}
