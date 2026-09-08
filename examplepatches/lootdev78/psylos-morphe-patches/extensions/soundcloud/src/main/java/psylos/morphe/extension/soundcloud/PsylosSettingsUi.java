/**
 * Copyright 2026 Psylos
 * Private SoundCloud patch.
 */
package psylos.morphe.extension.soundcloud;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BooleanSetting;

@SuppressWarnings({"unused", "deprecation"})
public final class PsylosSettingsUi {
    private PsylosSettingsUi() {
    }

    private static void addHeader(Context context, LinearLayout root, String text) {
        TextView header = new TextView(context);
        header.setText(text);
        header.setTextSize(18.0f);
        root.addView(header);
    }

    private static Switch addToggle(
            Context context,
            LinearLayout root,
            String text,
            BooleanSetting setting) {
        Switch toggle = new Switch(context);
        toggle.setText(text);
        toggle.setChecked(setting.get().booleanValue());
        toggle.setTag(setting);
        root.addView(toggle);
        return toggle;
    }

    public static void saveSwitches(View view) {
        if (view == null) {
            return;
        }

        if (view instanceof Switch) {
            Switch toggle = (Switch) view;
            Object tag = toggle.getTag();
            if (tag instanceof BooleanSetting) {
                ((BooleanSetting) tag).save(Boolean.valueOf(toggle.isChecked()));
            }
            return;
        }

        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                saveSwitches(group.getChildAt(i));
            }
        }
    }

    public static void show() {
        Activity activity = Utils.getActivity();
        if (activity == null) {
            return;
        }

        boolean includeDownload = PatchStatus.downloadButtonHookIncluded();
        boolean includeCast = PatchStatus.hideCastIconIncluded();
        if (!includeDownload && !includeCast) {
            return;
        }

        LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);

        EditText packageInput = null;
        if (includeDownload) {
            addHeader(activity, root, "Download-Hook");
            addToggle(activity, root, "Download-Hook aktivieren", DownloadHookSettings.ENABLED);

            packageInput = new EditText(activity);
            packageInput.setSingleLine(true);
            packageInput.setHint("com.example.downloader");
            packageInput.setText(DownloadHookSettings.TARGET_PACKAGE.get());
            root.addView(packageInput);
        }

        if (includeCast) {
            addHeader(activity, root, "Oberleiste - Icons ausblenden");
            addToggle(activity, root, "Cast-Icon",
                    SoundCloudPrivateSettings.HIDE_TOP_CAST);
        }

        ScrollView scrollView = new ScrollView(activity);
        scrollView.addView(root);

        new AlertDialog.Builder(activity)
                .setTitle("Psylos SoundCloud Patches")
                .setView(scrollView)
                .setPositiveButton("Speichern", new SaveClick(root, packageInput))
                .setNegativeButton("Abbrechen", null)
                .show();
    }

    private static final class SaveClick implements DialogInterface.OnClickListener {
        private final View root;
        private final EditText packageInput;

        private SaveClick(View root, EditText packageInput) {
            this.root = root;
            this.packageInput = packageInput;
        }

        @Override
        public void onClick(DialogInterface dialog, int which) {
            saveSwitches(root);
            if (packageInput != null) {
                DownloadHookSettings.TARGET_PACKAGE.save(
                        packageInput.getText().toString().trim());
            }
            if (dialog != null) {
                dialog.dismiss();
            }

            Activity activity = Utils.getActivity();
            if (activity != null) {
                activity.recreate();
            }
        }
    }
}
