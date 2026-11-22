package app.template.extension.settings;

import android.content.Intent;
import android.net.Uri;
import android.text.InputType;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import app.template.extension.ui.ThemedDialogPanel;
import app.template.extension.watch.ExternalRatings;

/** Setup and source choices share the film dialogs' active surface and accent. */
final class ExternalRatingsUi {
    private ExternalRatingsUi() {}

    static void open(ModSettingsActivity context) {
        Prefs.load(context);
        if (ExternalRatings.key(context) == null) setup(context);
        else sources(context);
    }

    private static void setup(ModSettingsActivity context) {
        ThemedDialogPanel panel = new ThemedDialogPanel(context, "Connect MDBList");
        TextView help = panel.text("BodyMedium", panel.secondary);
        help.setText("Get your free API key from MDBList Preferences, then paste it below.");
        help.setPadding(panel.dp(8), panel.dp(8), panel.dp(8), panel.dp(12));
        panel.body.addView(help);
        TextView link = panel.action("Open MDBList Preferences", false, () -> {
            try { context.startActivity(new Intent(Intent.ACTION_VIEW,
                    Uri.parse("https://mdblist.com/preferences/"))); }
            catch (Exception ignored) { }
        });
        panel.body.addView(link);
        EditText field = panel.search("MDBList API key");
        field.setCompoundDrawablesRelativeWithIntrinsicBounds(0, 0, 0, 0);
        field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
        field.setContentDescription("MDBList API key");
        field.setSaveEnabled(false);
        panel.body.addView(field);
        TextView status = panel.text("BodyMedium", panel.secondary);
        status.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        status.setPadding(panel.dp(8), panel.dp(8), panel.dp(8), panel.dp(8));
        panel.body.addView(status);
        TextView connect = panel.action("Connect", true, () -> {
            String candidate = field.getText().toString().trim();
            if (!ExternalRatings.validKey(candidate)) {
                field.setError("Paste a valid MDBList API key"); return;
            }
            status.setText("Checking MDBList key…");
            ExternalRatings.validate(candidate, error -> context.runOnUiThread(() -> {
                if (!panel.dialog.isShowing()) return;
                if (error != null) { status.setText(error); return; }
                try {
                    ExternalRatings.saveKey(context, candidate);
                    Prefs.putBoolean(Prefs.KEY_EXTERNAL_RATINGS_ENABLED, true);
                    panel.dialog.dismiss();
                    sources(context);
                } catch (Exception e) { status.setText("Couldn't save the API key. Try again."); }
            }));
        });
        panel.body.addView(connect);
        panel.show(0);
    }

    private static void sources(ModSettingsActivity context) {
        ThemedDialogPanel panel = new ThemedDialogPanel(context, "External ratings");
        TextView note = panel.text("BodyMedium", panel.secondary);
        note.setText("Choose the ratings to show below Where to Watch.");
        note.setPadding(panel.dp(8), panel.dp(8), panel.dp(8), panel.dp(8));
        panel.body.addView(note);
        String[] ids = ExternalRatings.sourceIds(), names = ExternalRatings.sourceNames();
        String saved = Prefs.getString(Prefs.KEY_EXTERNAL_RATINGS_SOURCES, ExternalRatings.DEFAULT_SOURCES);
        boolean[] checked = new boolean[ids.length];
        ScrollView scroll = new ScrollView(context);
        LinearLayout list = new LinearLayout(context);
        list.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(list);
        panel.body.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));
        for (int i = 0; i < ids.length; i++) {
            final int index = i;
            checked[i] = ("," + saved + ",").contains("," + ids[i] + ",");
            android.widget.CheckBox box = new android.widget.CheckBox(context);
            box.setText(names[i]);
            box.setTextColor(panel.primary);
            box.setButtonTintList(android.content.res.ColorStateList.valueOf(panel.accent));
            box.setChecked(checked[i]);
            box.setMinHeight(panel.dp(48));
            box.setPaddingRelative(panel.dp(8), 0, panel.dp(8), 0);
            box.setOnCheckedChangeListener((button, value) -> checked[index] = value);
            list.addView(box);
        }
        TextView save = panel.action("Save choices", true, () -> {
            StringBuilder chosen = new StringBuilder();
            for (int i = 0; i < ids.length; i++) if (checked[i]) {
                if (chosen.length() > 0) chosen.append(',');
                chosen.append(ids[i]);
            }
            Prefs.putString(Prefs.KEY_EXTERNAL_RATINGS_SOURCES, chosen.toString());
            Prefs.putBoolean(Prefs.KEY_EXTERNAL_RATINGS_ENABLED, chosen.length() > 0);
            panel.dialog.dismiss();
        });
        panel.body.addView(save);
        panel.body.addView(panel.action("Change API key", false, () -> {
            panel.dialog.dismiss(); setup(context);
        }));
        panel.body.addView(panel.action("Remove API key", false, () ->
                ModDialog.show(context, "Remove MDBList key?", "External ratings will stop appearing.",
                        "Remove", () -> {
                            ExternalRatings.removeKey(context);
                            Prefs.putBoolean(Prefs.KEY_EXTERNAL_RATINGS_ENABLED, false);
                            panel.dialog.dismiss();
                        }, "Cancel", null)));
        panel.show(0);
    }
}
