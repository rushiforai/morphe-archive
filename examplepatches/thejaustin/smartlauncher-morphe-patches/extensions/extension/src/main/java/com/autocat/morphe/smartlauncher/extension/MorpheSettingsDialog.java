package com.autocat.morphe.smartlauncher.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.DialogInterface;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.util.Log;
import android.view.ContextThemeWrapper;
import android.view.Gravity;
import android.view.View;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public final class MorpheSettingsDialog {

    private static final String TAG = "MorpheSettingsDialog";

    private MorpheSettingsDialog() {}

    public static void show(final Context context) {
        if (context == null) return;
        try {
            // 1. Resolve host Activity
            Activity activity = MorpheMenuInjector.findActivity(context);
            if (activity == null) {
                activity = MorpheMenuInjector.getForegroundActivity();
            }

            if (activity != null && (activity.isFinishing() || activity.isDestroyed())) {
                Log.w(TAG, "Host activity is finishing or destroyed; skipping dialog");
                return;
            }

            final Context baseContext = (activity != null) ? activity : context;
            final Context themedContext = new ContextThemeWrapper(baseContext, android.R.style.Theme_DeviceDefault_Dialog_Alert);

            // 2. Resolve theme colors safely
            int colorPrimary = 0xFF212121;
            int colorSecondary = 0xFF757575;
            int colorAccent = 0xFF4CAF50;
            try {
                int[] colorAttrs = {android.R.attr.textColorPrimary, android.R.attr.textColorSecondary, android.R.attr.colorAccent};
                TypedArray ta = themedContext.obtainStyledAttributes(colorAttrs);
                colorPrimary = ta.getColor(0, 0xFF212121);
                colorSecondary = ta.getColor(1, 0xFF757575);
                colorAccent = ta.getColor(2, 0xFF4CAF50);
                ta.recycle();
            } catch (Throwable ignored) {}

            float d = themedContext.getResources().getDisplayMetrics().density;
            int dp4 = Math.round(4 * d);
            int dp8 = Math.round(8 * d);
            int dp12 = Math.round(12 * d);
            int dp16 = Math.round(16 * d);

            LinearLayout root = new LinearLayout(themedContext);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setPadding(0, dp8, 0, dp16);

            // ── App Drawer ─────────────────────────────────────────────
            root.addView(sectionHeader(themedContext, "App Drawer", colorSecondary, dp16, dp12, dp4));

            CheckBox swHide = toggleRow(themedContext, root,
                    "Hide Archived Apps",
                    "Removes archived apps from the app drawer so they stay out of sight.",
                    MorphePreferences.isHideArchivedEnabled(themedContext),
                    colorPrimary, colorSecondary, dp16, dp8, dp4);
            swHide.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                @Override
                public void onCheckedChanged(CompoundButton b, boolean checked) {
                    MorphePreferences.setHideArchivedEnabled(themedContext, checked);
                    ArchivedAppFilter.setFilterEnabled(checked);
                }
            });

            root.addView(divider(themedContext, dp16, dp4));

            // ── App Archiving ───────────────────────────────────────────
            root.addView(sectionHeader(themedContext, "App Archiving", colorSecondary, dp16, dp12, dp4));

            CheckBox swNative = toggleRow(themedContext, root,
                    "Native Archiving",
                    "Uses Android 15+ system PackageInstaller APIs. No extra permissions needed.",
                    MorphePreferences.isNativeEnabled(themedContext),
                    colorPrimary, colorSecondary, dp16, dp8, dp4);
            swNative.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                @Override
                public void onCheckedChanged(CompoundButton b, boolean checked) {
                    MorphePreferences.setNativeEnabled(themedContext, checked);
                }
            });

            CheckBox swShizuku = toggleRow(themedContext, root,
                    "Shizuku Archiving",
                    "Uses Shizuku for privileged archiving. Works across Android 14/15/16.",
                    MorphePreferences.isShizukuEnabled(themedContext),
                    colorPrimary, colorSecondary, dp16, dp8, dp4);
            swShizuku.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
                @Override
                public void onCheckedChanged(CompoundButton b, boolean checked) {
                    MorphePreferences.setShizukuEnabled(themedContext, checked);
                }
            });

            // Shizuku Service Status Row
            ShizukuArchiveHelper.Status status = ShizukuArchiveHelper.getStatus();
            String statusText;
            int statusColor;
            if (status == ShizukuArchiveHelper.Status.ACTIVE) {
                statusText = "⚡ Shizuku: Running & Authorized";
                statusColor = 0xFF2E7D32; // Green
            } else if (status == ShizukuArchiveHelper.Status.PERMISSION_REQUIRED) {
                statusText = "⚠️ Shizuku: Running (Tap to authorize)";
                statusColor = 0xFFE65100; // Orange
            } else {
                statusText = "🔌 Shizuku: Not Running";
                statusColor = colorSecondary;
            }

            TextView tvStatus = new TextView(themedContext);
            tvStatus.setText(statusText);
            tvStatus.setTextSize(13f);
            tvStatus.setTextColor(statusColor);
            tvStatus.setPadding(dp16, dp8, dp16, dp8);
            if (status == ShizukuArchiveHelper.Status.PERMISSION_REQUIRED) {
                tvStatus.setTypeface(null, Typeface.BOLD);
                tvStatus.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        ShizukuArchiveHelper.requestPermissionWithFeedback(themedContext);
                    }
                });
            }
            root.addView(tvStatus);

            ScrollView scrollView = new ScrollView(themedContext);
            scrollView.addView(root);

            AlertDialog.Builder builder = new AlertDialog.Builder(themedContext);
            builder.setTitle("Morphe Settings");
            builder.setView(scrollView);

            builder.setPositiveButton("Archive App…", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    showAppArchivePicker(themedContext, false);
                }
            });

            builder.setNeutralButton("Restore App…", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    showAppArchivePicker(themedContext, true);
                }
            });

            builder.setNegativeButton("Done", null);
            builder.create().show();

        } catch (Throwable t) {
            Log.e(TAG, "Error displaying MorpheSettingsDialog", t);
            try {
                Toast.makeText(context.getApplicationContext(), "Morphe Settings error: " + t.getMessage(), Toast.LENGTH_LONG).show();
            } catch (Throwable ignored) {}
        }
    }

    private static TextView sectionHeader(Context context, String title,
                                          int color, int padH, int padTop, int padBottom) {
        TextView tv = new TextView(context);
        tv.setText(title.toUpperCase());
        tv.setTextSize(11f);
        tv.setTextColor(color);
        tv.setTypeface(null, Typeface.BOLD);
        tv.setLetterSpacing(0.12f);
        tv.setPadding(padH, padTop, padH, padBottom);
        return tv;
    }

    private static CheckBox toggleRow(Context context, LinearLayout parent,
                                      String title, String description,
                                      boolean checked,
                                      int colorPrimary, int colorSecondary,
                                      int padH, int padV, int dp4) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setPadding(padH, padV, padH, padV);
        row.setGravity(Gravity.CENTER_VERTICAL);

        LinearLayout textCol = new LinearLayout(context);
        textCol.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams textParams = new LinearLayout.LayoutParams(
                0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
        textCol.setLayoutParams(textParams);

        TextView tvTitle = new TextView(context);
        tvTitle.setText(title);
        tvTitle.setTextSize(15f);
        tvTitle.setTextColor(colorPrimary);
        textCol.addView(tvTitle);

        TextView tvDesc = new TextView(context);
        tvDesc.setText(description);
        tvDesc.setTextSize(12f);
        tvDesc.setTextColor(colorSecondary);
        tvDesc.setPadding(0, dp4, 0, 0);
        textCol.addView(tvDesc);

        row.addView(textCol);

        CheckBox cb = new CheckBox(context);
        cb.setChecked(checked);
        LinearLayout.LayoutParams cbParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.WRAP_CONTENT,
                LinearLayout.LayoutParams.WRAP_CONTENT);
        cbParams.leftMargin = padV;
        cb.setLayoutParams(cbParams);
        row.addView(cb);

        parent.addView(row);
        return cb;
    }

    private static View divider(Context context, int padH, int dp4) {
        View v = new View(context);
        int dp1 = Math.max(1, Math.round(context.getResources().getDisplayMetrics().density));
        LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, dp1);
        p.leftMargin = padH;
        p.rightMargin = padH;
        p.topMargin = dp4;
        p.bottomMargin = dp4;
        v.setLayoutParams(p);
        v.setBackgroundColor(0x1A808080);
        return v;
    }

    private static class AppEntry {
        final String packageName;
        final String label;

        AppEntry(String packageName, String label) {
            this.packageName = packageName;
            this.label = label;
        }
    }

    private static void showAppArchivePicker(final Context context, final boolean unarchiveMode) {
        try {
            PackageManager pm = context.getPackageManager();
            // MATCH_ARCHIVED_PACKAGES (0x8000) is required on API 35+ for archived packages to appear.
            int pmFlags = (Build.VERSION.SDK_INT >= 35) ? 0x00008000 : 0;
            List<PackageInfo> installed = pm.getInstalledPackages(pmFlags);
            List<AppEntry> entries = new ArrayList<>();

            for (PackageInfo pi : installed) {
                if (pi.applicationInfo != null
                        && (pi.applicationInfo.flags & ApplicationInfo.FLAG_SYSTEM) == 0) {
                    boolean isArchived = ArchivedAppFilter.isAppArchived(pi.applicationInfo);
                    if (unarchiveMode == isArchived) {
                        CharSequence label = pi.applicationInfo.loadLabel(pm);
                        String labelStr = label != null ? label.toString() : pi.packageName;
                        entries.add(new AppEntry(pi.packageName, labelStr));
                    }
                }
            }

            if (entries.isEmpty()) {
                Toast.makeText(context,
                        unarchiveMode ? "No archived apps found" : "No user apps available to archive",
                        Toast.LENGTH_SHORT).show();
                return;
            }

            // Sort alphabetically by app name
            Collections.sort(entries, new Comparator<AppEntry>() {
                @Override
                public int compare(AppEntry o1, AppEntry o2) {
                    return o1.label.compareToIgnoreCase(o2.label);
                }
            });

            final List<String> packageNames = new ArrayList<>(entries.size());
            final List<String> appLabels = new ArrayList<>(entries.size());
            for (AppEntry e : entries) {
                packageNames.add(e.packageName);
                appLabels.add(e.label);
            }

            AlertDialog.Builder picker = new AlertDialog.Builder(context);
            picker.setTitle(unarchiveMode ? "Restore Archived App" : "Archive App");
            picker.setItems(appLabels.toArray(new CharSequence[0]),
                    new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            String pkg = packageNames.get(which);
                            MorpheMenuInjector.performArchiveOrRestoreAsync(context, pkg, unarchiveMode);
                        }
                    });
            picker.setNegativeButton("Cancel", null);
            picker.show();
        } catch (Throwable t) {
            Toast.makeText(context, "Error loading apps: " + t.getMessage(), Toast.LENGTH_LONG).show();
        }
    }
}
