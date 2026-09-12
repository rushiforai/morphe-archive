package app.fdroidbackends.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import app.fdroidbackends.extension.InstallBackendPrefs;

/**
 * Standalone settings screen for choosing the install backend. Built entirely in code (no new
 * layout/string/drawable resources) so it can be reached from a single injected
 * {@code <Preference>} entry that launches this activity by component name, without any other
 * changes to F-Droid's resource files beyond the manifest and preferences.xml entries.
 */
public class InstallBackendSettingsActivity extends Activity {
    private EditText customPackageField;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        int pad = dp(20);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(pad, pad, pad, pad);

        TextView title = new TextView(this);
        title.setText("Install backend");
        title.setTextSize(20);
        title.setPadding(0, 0, 0, dp(16));
        root.addView(title);

        RadioGroup group = new RadioGroup(this);
        group.setOrientation(LinearLayout.VERTICAL);

        RadioButton system = radio("System / F-Droid default");
        RadioButton shizuku = radio("Shizuku (direct, no prompts)");
        RadioButton installerX = radio("InstallerX");
        RadioButton custom = radio("Custom installer package");

        group.addView(system);
        group.addView(shizuku);
        group.addView(installerX);
        group.addView(custom);
        root.addView(group);

        LinearLayout customRow = new LinearLayout(this);
        customRow.setOrientation(LinearLayout.HORIZONTAL);
        customRow.setGravity(Gravity.CENTER_VERTICAL);

        customPackageField = new EditText(this);
        customPackageField.setHint("Custom installer package name");
        customPackageField.setInputType(InputType.TYPE_CLASS_TEXT);
        customPackageField.setText(InstallBackendPrefs.getCustomPackage(this));
        customRow.addView(customPackageField, new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        Button pickApp = new Button(this);
        pickApp.setText("Choose…");
        pickApp.setOnClickListener(v -> {
            custom.setChecked(true);
            showAppPickerDialog();
        });
        customRow.addView(pickApp);
        root.addView(customRow);

        String mode = InstallBackendPrefs.getMode(this);
        if (InstallBackendPrefs.MODE_SHIZUKU.equals(mode)) {
            shizuku.setChecked(true);
        } else if (InstallBackendPrefs.MODE_INSTALLERX.equals(mode)) {
            installerX.setChecked(true);
        } else if (InstallBackendPrefs.MODE_CUSTOM.equals(mode)) {
            custom.setChecked(true);
        } else {
            system.setChecked(true);
        }

        Button save = new Button(this);
        save.setText("Save");
        save.setOnClickListener(v -> {
            String selectedMode;
            int checkedId = group.getCheckedRadioButtonId();
            if (checkedId == shizuku.getId()) {
                selectedMode = InstallBackendPrefs.MODE_SHIZUKU;
            } else if (checkedId == installerX.getId()) {
                selectedMode = InstallBackendPrefs.MODE_INSTALLERX;
            } else if (checkedId == custom.getId()) {
                selectedMode = InstallBackendPrefs.MODE_CUSTOM;
                InstallBackendPrefs.setCustomPackage(this, customPackageField.getText().toString().trim());
            } else {
                selectedMode = InstallBackendPrefs.MODE_SYSTEM;
            }
            InstallBackendPrefs.setMode(this, selectedMode);
            Toast.makeText(this, "Install backend saved.", Toast.LENGTH_SHORT).show();
            finish();
        });
        LinearLayout.LayoutParams saveParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        saveParams.topMargin = dp(20);
        saveParams.gravity = Gravity.END;
        root.addView(save, saveParams);

        setContentView(root);
    }

    /**
     * Checks whether {@code packageName} declares an activity that handles the exact install
     * intent {@link org.fdroid.fdroid.installer.ExternalInstallerActivity} dispatches (same
     * action, data scheme and MIME type, explicitly targeted at that package) — a static intent
     * resolution check, not a real install: nothing is sent to the app, no APK data has to
     * exist, and no side effects happen in the candidate app.
     */
    private boolean canHandleInstallPackage(PackageManager pm, String packageName) {
        Intent probe = new Intent("android.intent.action.INSTALL_PACKAGE");
        probe.setDataAndType(Uri.parse("content://" + getPackageName() + ".installer/dummy.apk"),
                "application/vnd.android.package-archive");
        probe.setPackage(packageName);
        ResolveInfo resolved = pm.resolveActivity(probe, 0);
        return resolved != null && resolved.activityInfo != null;
    }

    private static final class AppEntry {
        final String label;
        final String packageName;
        final Drawable icon;

        AppEntry(String label, String packageName, Drawable icon) {
            this.label = label;
            this.packageName = packageName;
            this.icon = icon;
        }
    }

    private void showAppPickerDialog() {
        PackageManager pm = getPackageManager();
        List<ApplicationInfo> installed = pm.getInstalledApplications(PackageManager.GET_META_DATA);

        List<AppEntry> entries = new ArrayList<>(installed.size());
        for (ApplicationInfo info : installed) {
            boolean isSystemApp = (info.flags & ApplicationInfo.FLAG_SYSTEM) != 0;
            if (isSystemApp || !canHandleInstallPackage(pm, info.packageName)) {
                continue;
            }
            entries.add(new AppEntry(String.valueOf(info.loadLabel(pm)), info.packageName, info.loadIcon(pm)));
        }
        Collections.sort(entries, Comparator.comparing(entry -> entry.label.toLowerCase()));

        if (entries.isEmpty()) {
            Toast.makeText(this, "No installed apps declare a handler for APK installs.", Toast.LENGTH_LONG).show();
            return;
        }

        BaseAdapter adapter = new BaseAdapter() {
            @Override
            public int getCount() {
                return entries.size();
            }

            @Override
            public Object getItem(int position) {
                return entries.get(position);
            }

            @Override
            public long getItemId(int position) {
                return position;
            }

            @Override
            public View getView(int position, View convertView, ViewGroup parent) {
                AppEntry entry = entries.get(position);

                LinearLayout row = new LinearLayout(InstallBackendSettingsActivity.this);
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setGravity(Gravity.CENTER_VERTICAL);
                int rowPad = dp(12);
                row.setPadding(rowPad, rowPad, rowPad, rowPad);

                ImageView icon = new ImageView(InstallBackendSettingsActivity.this);
                icon.setImageDrawable(entry.icon);
                int iconSize = dp(36);
                LinearLayout.LayoutParams iconParams = new LinearLayout.LayoutParams(iconSize, iconSize);
                iconParams.rightMargin = dp(16);
                row.addView(icon, iconParams);

                LinearLayout textColumn = new LinearLayout(InstallBackendSettingsActivity.this);
                textColumn.setOrientation(LinearLayout.VERTICAL);

                TextView label = new TextView(InstallBackendSettingsActivity.this);
                label.setText(entry.label);
                label.setTextSize(16);
                textColumn.addView(label);

                TextView packageName = new TextView(InstallBackendSettingsActivity.this);
                packageName.setText(entry.packageName);
                packageName.setTextSize(12);
                packageName.setAlpha(0.6f);
                textColumn.addView(packageName);

                row.addView(textColumn);
                return row;
            }
        };

        AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle("Choose installer app")
                .setAdapter(adapter, (d, which) -> {
                    customPackageField.setText(entries.get(which).packageName);
                })
                .setNegativeButton("Cancel", null)
                .create();
        dialog.show();
    }

    private RadioButton radio(String text) {
        RadioButton button = new RadioButton(this);
        button.setText(text);
        button.setId(View.generateViewId());
        return button;
    }

    private int dp(int value) {
        return (int) (value * getResources().getDisplayMetrics().density);
    }
}
