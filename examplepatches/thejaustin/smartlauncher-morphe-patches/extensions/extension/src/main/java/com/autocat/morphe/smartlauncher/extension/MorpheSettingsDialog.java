package com.autocat.morphe.smartlauncher.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.view.View;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

/**
 * Modern, dependency-free settings and management UI for Morphe Smart Launcher patches.
 */
public final class MorpheSettingsDialog {

    private MorpheSettingsDialog() {}

    public static void show(final Context context) {
        try {
            AlertDialog.Builder builder = new AlertDialog.Builder(context);
            builder.setTitle("⚡ Morphe Patches & Archiving");

            ScrollView scrollView = new ScrollView(context);
            LinearLayout layout = new LinearLayout(context);
            layout.setOrientation(LinearLayout.VERTICAL);
            int pad = (int) (18 * context.getResources().getDisplayMetrics().density);
            layout.setPadding(pad, pad, pad, pad);

            // Subtitle
            TextView header = new TextView(context);
            header.setText("Smart Launcher 6 Mod Settings");
            header.setTextSize(14f);
            header.setPadding(0, 0, 0, (int) (12 * context.getResources().getDisplayMetrics().density));
            layout.addView(header);

            // 1. Hide Archived Apps Toggle
            final CheckBox cbHide = new CheckBox(context);
            cbHide.setText("Hide Archived Apps from App Drawer");
            cbHide.setChecked(MorphePreferences.isHideArchivedEnabled(context));
            cbHide.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                @Override
                public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                    MorphePreferences.setHideArchivedEnabled(context, isChecked);
                    ArchivedAppFilter.setFilterEnabled(isChecked);
                }
            });
            layout.addView(cbHide);

            // 2. Native Archiving Toggle
            final CheckBox cbNative = new CheckBox(context);
            cbNative.setText("Enable Native Archiving (Android 15+)");
            cbNative.setChecked(MorphePreferences.isNativeEnabled(context));
            cbNative.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                @Override
                public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                    MorphePreferences.setNativeEnabled(context, isChecked);
                }
            });
            layout.addView(cbNative);

            // 3. Shizuku Archiving Toggle
            final CheckBox cbShizuku = new CheckBox(context);
            cbShizuku.setText("Enable Shizuku Privileged Archiving");
            cbShizuku.setChecked(MorphePreferences.isShizukuEnabled(context));
            cbShizuku.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                @Override
                public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                    MorphePreferences.setShizukuEnabled(context, isChecked);
                }
            });
            layout.addView(cbShizuku);

            scrollView.addView(layout);
            builder.setView(scrollView);

            builder.setPositiveButton("Archive App...", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    showAppArchivePicker(context, false);
                }
            });

            builder.setNeutralButton("Unarchive App...", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    showAppArchivePicker(context, true);
                }
            });

            builder.setNegativeButton("Close", null);

            AlertDialog dialog = builder.create();
            dialog.show();
        } catch (Throwable t) {
            Toast.makeText(context, "Error opening Morphe Settings: " + t.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

    private static void showAppArchivePicker(final Context context, final boolean unarchiveMode) {
        try {
            PackageManager pm = context.getPackageManager();
            List<PackageInfo> installed = pm.getInstalledPackages(0);
            final List<String> packageNames = new ArrayList<>();
            final List<String> appLabels = new ArrayList<>();

            for (PackageInfo pi : installed) {
                if (pi.applicationInfo != null && (pi.applicationInfo.flags & ApplicationInfo.FLAG_SYSTEM) == 0) {
                    boolean isArchived = (pi.applicationInfo.flags & 0x40000000) != 0;
                    if (unarchiveMode == isArchived) {
                        packageNames.add(pi.packageName);
                        CharSequence label = pi.applicationInfo.loadLabel(pm);
                        appLabels.add(label != null ? label.toString() : pi.packageName);
                    }
                }
            }

            if (appLabels.isEmpty()) {
                Toast.makeText(context, unarchiveMode ? "No archived apps found" : "No user apps available", Toast.LENGTH_SHORT).show();
                return;
            }

            AlertDialog.Builder picker = new AlertDialog.Builder(context);
            picker.setTitle(unarchiveMode ? "Select App to Restore" : "Select App to Archive");
            picker.setItems(appLabels.toArray(new CharSequence[0]), new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    String pkg = packageNames.get(which);
                    String name = appLabels.get(which);
                    if (unarchiveMode) {
                        boolean ok = ShizukuArchiveHelper.unarchivePackage(pkg);
                        if (!ok && context instanceof Activity) {
                            ok = NativeArchiveHelper.unarchivePackage((Activity) context, pkg);
                        }
                        Toast.makeText(context, ok ? "Restoring " + name + "..." : "Failed to unarchive " + name, Toast.LENGTH_SHORT).show();
                    } else {
                        boolean ok = ShizukuArchiveHelper.archivePackage(pkg);
                        if (!ok && context instanceof Activity) {
                            ok = NativeArchiveHelper.archivePackage((Activity) context, pkg);
                        }
                        Toast.makeText(context, ok ? "Archiving " + name + "..." : "Failed to archive " + name, Toast.LENGTH_SHORT).show();
                    }
                }
            });
            picker.setNegativeButton("Cancel", null);
            picker.show();
        } catch (Throwable t) {
            Toast.makeText(context, "Error loading apps: " + t.getMessage(), Toast.LENGTH_LONG).show();
        }
    }
}
