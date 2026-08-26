package io.github.liongalahad.nuviotv.extension.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.provider.Settings;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/** D-pad folder browser used when Android TV has no usable document-tree picker. */
public final class MorpheStorageInternalFolderPickerActivity extends Activity {
    static final String EXTRA_SHOW_APP_FOLDER_FALLBACK =
            "io.github.liongalahad.nuviotv.extra.MORPHE_STORAGE_SHOW_APP_FOLDER_FALLBACK";
    private static final String LOG_TAG = "MorpheStorage";
    private static final int REQUEST_ACCESS = 7352;
    private static final int REQUEST_TREE = 7353;
    private static final int USE = 0, DEVICES = 1, UP = 2, FOLDER = 3, APP_FOLDER = 4;

    private final List<FolderRow> rows = new ArrayList<>();
    private TextView location;
    private TextView diagnostic;
    private ListView list;
    private File current;
    private boolean accessStarted;
    private boolean requireWrite;
    private boolean showAppFolderFallback;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        accessStarted = state != null && state.getBoolean("accessStarted", false);
        showAppFolderFallback = state != null && state.getBoolean("showAppFolderFallback", false);
        if (state == null && getIntent().getBooleanExtra(EXTRA_SHOW_APP_FOLDER_FALLBACK, false)) {
            showAppFolderFallback = true;
        }
        requireWrite = state != null
                ? state.getBoolean("requireWrite", false)
                : getIntent().getBooleanExtra(
                        MorpheStorageFolderPickerActivity.EXTRA_REQUIRE_WRITE, false);
        String restored = state == null ? null : state.getString("current");
        if (restored != null) current = canonical(new File(restored));
        if ((showAppFolderFallback && requireWrite) || hasDirectAccess(this, requireWrite)) createBrowser();
        else if (!accessStarted) requestAccess();
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        state.putBoolean("accessStarted", accessStarted);
        state.putBoolean("requireWrite", requireWrite);
        state.putBoolean("showAppFolderFallback", showAppFolderFallback);
        if (current != null) state.putString("current", current.getAbsolutePath());
        super.onSaveInstanceState(state);
    }

    @Override protected void onResume() {
        super.onResume();
        if (list == null && hasDirectAccess(this, requireWrite)) createBrowser();
    }

    static boolean hasDirectAccess(Context context) {
        return hasDirectAccess(context, false);
    }

    static boolean hasDirectAccess(Context context, boolean requireWrite) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            return Environment.isExternalStorageManager();
        }
        boolean readable = context.checkSelfPermission(
                android.Manifest.permission.READ_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED;
        boolean writable = context.checkSelfPermission(
                android.Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_GRANTED;
        return hasLegacyDirectAccess(readable, writable, requireWrite);
    }

    static boolean hasLegacyDirectAccess(boolean readable, boolean writable, boolean requireWrite) {
        return readable && (!requireWrite || writable);
    }

    private void requestAccess() {
        accessStarted = true;
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
            requestPermissions(requireWrite
                            ? new String[]{android.Manifest.permission.READ_EXTERNAL_STORAGE,
                                    android.Manifest.permission.WRITE_EXTERNAL_STORAGE}
                            : new String[]{android.Manifest.permission.READ_EXTERNAL_STORAGE},
                    REQUEST_ACCESS);
            return;
        }
        try {
            startActivityForResult(new Intent(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION,
                    Uri.parse("package:" + getPackageName())), REQUEST_ACCESS);
        } catch (ActivityNotFoundException | SecurityException error) {
            try {
                startActivityForResult(
                        new Intent(Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION), REQUEST_ACCESS);
            } catch (ActivityNotFoundException | SecurityException unavailable) {
                Toast.makeText(this, "Android storage access settings are unavailable",
                        Toast.LENGTH_LONG).show();
                finish();
            }
        }
    }

    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQUEST_TREE) {
            if (resultCode == RESULT_OK && data != null && data.getData() != null) {
                setResult(RESULT_OK, data);
                finish();
                return;
            }
            showAppFolderFallback = true;
            if (current != null) showFolder(current);
            showDiagnostic("PERMISSION_NOT_GRANTED",
                    "Folder permission was not granted. You can use the private app folder instead.");
            return;
        }
        if (requestCode != REQUEST_ACCESS) return;
        if (hasDirectAccess(this, requireWrite)) createBrowser();
        else {
            Toast.makeText(this, "Storage access is required to choose a folder",
                    Toast.LENGTH_LONG).show();
            finish();
        }
    }

    @Override public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] results) {
        super.onRequestPermissionsResult(requestCode, permissions, results);
        if (requestCode == REQUEST_ACCESS) {
            if (hasDirectAccess(this, requireWrite)) createBrowser();
            else finish();
        }
    }

    private void createBrowser() {
        if (list != null) return;
        getWindow().setStatusBarColor(Color.rgb(16, 16, 20));
        getWindow().setNavigationBarColor(Color.rgb(16, 16, 20));

        LinearLayout page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setPadding(dp(56), dp(38), dp(56), dp(38));
        page.setBackgroundColor(Color.rgb(16, 16, 20));

        TextView title = text("Choose local storage path", 28, Color.WHITE);
        page.addView(title, new LinearLayout.LayoutParams(-1, -2));
        location = text("", 18, Color.rgb(176, 181, 194));
        location.setPadding(0, dp(12), 0, dp(20));
        page.addView(location, new LinearLayout.LayoutParams(-1, -2));
        diagnostic = text("Choose a folder, then select Use this folder.",
                15, Color.rgb(255, 193, 7));
        diagnostic.setPadding(0, 0, 0, dp(16));
        page.addView(diagnostic, new LinearLayout.LayoutParams(-1, -2));

        list = new ListView(this);
        list.setDividerHeight(dp(8));
        list.setDivider(null);
        list.setSelector(android.R.color.transparent);
        list.setAdapter(new FolderAdapter());
        list.setOnItemClickListener((parent, view, position, id) -> activate(rows.get(position)));
        page.addView(list, new LinearLayout.LayoutParams(-1, 0, 1f));
        setContentView(page);

        if (current == null) current = canonical(Environment.getExternalStorageDirectory());
        showFolder(current);
    }

    private void activate(FolderRow row) {
        Log.i(LOG_TAG, "Picker activate: kind=" + row.kind + " label=" + row.label +
                " path=" + (row.folder == null ? "<none>" : row.folder.getAbsolutePath()));
        if (row.kind == USE) choose();
        else if (row.kind == APP_FOLDER) confirmAppFolder();
        else if (row.kind == DEVICES) showDevices();
        else if (row.kind == UP) {
            File root = containingRoot(current);
            if (root == null || same(root, current)) showDevices();
            else showFolder(current.getParentFile());
        } else if (row.folder != null) showFolder(row.folder);
    }

    private void choose() {
        if (!isBrowsableFolder(current)) {
            showDiagnostic("UNAVAILABLE", "This folder is no longer available.");
            return;
        }
        if (requireWrite) {
            MorpheStoragePath.DirectoryProbeResult probe =
                    MorpheStoragePath.probeReadWriteDirectory(current);
            if (!probe.success) {
                Uri initialUri = MorpheStoragePath.initialDocumentUriForPath(this, current);
                if (MorpheStorageFolderPickerActivity.launchTreePicker(
                        this, initialUri, REQUEST_TREE)) {
                    Toast.makeText(this, "Grant folder access to write to this drive",
                            Toast.LENGTH_LONG).show();
                    return;
                }
                showAppFolderFallback = true;
                showFolder(current);
                showDiagnostic("FOLDER_PERMISSION_UNAVAILABLE",
                        "Android cannot grant this folder. Use the private app folder on this drive.");
                return;
            }
            diagnostic.setText("Storage test PASS: " + probe.message);
        }
        if (!MorpheStoragePath.setFolderPath(this, current.getAbsolutePath())) {
            showDiagnostic("SAVE_FAILED", "The successful folder selection could not be saved.");
            return;
        }
        MorpheSettingsUi.refresh();
        setResult(RESULT_OK, new Intent().putExtra(
                MorpheStorageFolderPickerActivity.EXTRA_FOLDER_PATH, current.getAbsolutePath()));
        finish();
    }

    private void showDevices() {
        current = null;
        rows.clear();
        File primary = canonical(Environment.getExternalStorageDirectory());
        for (File root : storageRoots()) {
            String label = same(root, primary) ? "Internal storage" :
                    MorpheStoragePath.displayLabelForPath(root.getAbsolutePath());
            Log.i(LOG_TAG, "Picker volume: label=" + label +
                    " path=" + root.getAbsolutePath() +
                    " exists=" + root.exists() + " directory=" + root.isDirectory() +
                    " readable=" + root.canRead() + " writable=" + root.canWrite());
            rows.add(new FolderRow(FOLDER, label, root));
        }
        location.setText("Storage devices");
        refreshRows();
    }

    private void showFolder(File requested) {
        File folder = canonical(requested);
        Log.i(LOG_TAG, "Picker open folder: requested=" + requested +
                " canonical=" + folder +
                " exists=" + (folder != null && folder.exists()) +
                " directory=" + (folder != null && folder.isDirectory()) +
                " readable=" + (folder != null && folder.canRead()) +
                " writable=" + (folder != null && folder.canWrite()));
        if (!isBrowsableFolder(folder)) {
            showDiagnostic("OPEN_FAILED", "Fire OS reports that this storage path is unavailable.");
            showDevices();
            return;
        }
        current = folder;
        rows.clear();
        rows.add(new FolderRow(USE, "Use this folder", null));
        if (showAppFolderFallback && requireWrite && isOnSecondaryStorage(folder)) {
            rows.add(new FolderRow(APP_FOLDER, "Use private app folder on this drive", null));
        }
        rows.add(new FolderRow(DEVICES, "Storage devices", null));
        rows.add(new FolderRow(UP, "Up one level", null));
        File[] children;
        try { children = folder.listFiles(File::isDirectory); }
        catch (SecurityException error) {
            Log.e(LOG_TAG, "Picker list failed for " + folder.getAbsolutePath(), error);
            children = null;
        }
        List<File> directories = new ArrayList<>();
        if (children != null) Collections.addAll(directories, children);
        else showDiagnostic("LIST_FAILED",
                "The folder opened, but Fire OS did not allow its contents to be listed. " +
                        "You can still select Use this folder to run the storage test.");
        directories.sort(Comparator.comparing(File::getName, String.CASE_INSENSITIVE_ORDER));
        for (File child : directories) rows.add(new FolderRow(FOLDER, child.getName(), canonical(child)));
        location.setText(MorpheStoragePath.displayLabelForPath(folder.getAbsolutePath()));
        refreshRows();
    }

    private void refreshRows() {
        ((BaseAdapter) list.getAdapter()).notifyDataSetChanged();
        list.setSelection(0);
        list.requestFocus();
    }

    @android.annotation.SuppressLint("GestureBackNavigation")
    @Override public void onBackPressed() {
        if (list == null || current == null) {
            finish();
            return;
        }
        File root = containingRoot(current);
        if (root == null || same(root, current)) showDevices();
        else showFolder(current.getParentFile());
    }

    private boolean isBrowsableFolder(File folder) {
        if (folder == null || !folder.isDirectory()) return false;
        for (File root : storageRoots()) if (contains(root, folder)) return true;
        return false;
    }

    private boolean isOnSecondaryStorage(File folder) {
        File root = containingRoot(folder);
        return root != null && !same(root, Environment.getExternalStorageDirectory());
    }

    private void confirmAppFolder() {
        new AlertDialog.Builder(this)
                .setTitle("Use private app folder?")
                .setMessage("Fire OS allows downloads in this folder, but Android removes them " +
                        "if this app is uninstalled.")
                .setPositiveButton("Continue", (dialog, which) -> chooseAppFolder())
                .setNegativeButton("Cancel", null)
                .show();
    }

    private void chooseAppFolder() {
        File root = containingRoot(current);
        File folder = MorpheStoragePath.appSpecificDownloadsFolder(this, root);
        if (folder == null) {
            showDiagnostic("APP_FOLDER_UNAVAILABLE",
                    "Fire OS did not provide a private folder on this drive.");
            return;
        }
        MorpheStoragePath.DirectoryProbeResult probe =
                MorpheStoragePath.probeReadWriteDirectory(folder);
        if (!probe.success) {
            showDiagnostic(probe.code, probe.message);
            return;
        }
        current = folder;
        if (!MorpheStoragePath.setFolderPath(this, folder.getAbsolutePath())) {
            showDiagnostic("SAVE_FAILED", "The private folder could not be saved.");
            return;
        }
        MorpheSettingsUi.refresh();
        setResult(RESULT_OK, new Intent().putExtra(
                MorpheStorageFolderPickerActivity.EXTRA_FOLDER_PATH, folder.getAbsolutePath()));
        finish();
    }

    private void showDiagnostic(String code, String message) {
        String visible = "Storage diagnostic " + code + ": " + message;
        Log.w(LOG_TAG, visible + " path=" +
                (current == null ? "<none>" : current.getAbsolutePath()));
        if (diagnostic != null) diagnostic.setText(visible);
        Toast.makeText(this, visible, Toast.LENGTH_LONG).show();
    }

    private File containingRoot(File folder) {
        File best = null;
        for (File root : storageRoots()) {
            if (contains(root, folder) && (best == null ||
                    root.getAbsolutePath().length() > best.getAbsolutePath().length())) best = root;
        }
        return best;
    }

    private List<File> storageRoots() {
        return MorpheStoragePath.mountedStorageRoots(this);
    }

    private static boolean contains(File root, File folder) {
        File a = canonical(root), b = canonical(folder);
        if (a == null || b == null) return false;
        return b.getAbsolutePath().equals(a.getAbsolutePath()) ||
                b.getAbsolutePath().startsWith(a.getAbsolutePath() + File.separator);
    }

    private static boolean same(File first, File second) {
        File a = canonical(first), b = canonical(second);
        return a != null && a.equals(b);
    }

    private static File canonical(File file) {
        if (file == null) return null;
        try { return file.getCanonicalFile(); }
        catch (IOException ignored) { return file.getAbsoluteFile(); }
    }

    private TextView text(String value, float sp, int color) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(sp);
        view.setTextColor(color);
        view.setGravity(Gravity.START);
        view.setIncludeFontPadding(false);
        return view;
    }

    private StateListDrawable rowBackground() {
        StateListDrawable list = new StateListDrawable();
        list.addState(new int[]{android.R.attr.state_focused}, shape(Color.rgb(245, 245, 245)));
        list.addState(new int[]{android.R.attr.state_selected}, shape(Color.rgb(245, 245, 245)));
        list.addState(new int[]{android.R.attr.state_activated}, shape(Color.rgb(245, 245, 245)));
        list.addState(new int[]{}, shape(Color.rgb(35, 35, 35)));
        return list;
    }

    private GradientDrawable shape(int color) {
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(color);
        shape.setCornerRadius(dp(28));
        return shape;
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private final class FolderAdapter extends BaseAdapter {
        @Override public int getCount() { return rows.size(); }
        @Override public FolderRow getItem(int position) { return rows.get(position); }
        @Override public long getItemId(int position) { return position; }
        @Override public View getView(int position, View recycled, ViewGroup parent) {
            TextView row = recycled instanceof TextView ? (TextView) recycled : new TextView(
                    MorpheStorageInternalFolderPickerActivity.this);
            row.setText(getItem(position).label);
            row.setTextSize(20);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setIncludeFontPadding(false);
            row.setPadding(dp(24), 0, dp(24), 0);
            row.setMinHeight(dp(58));
            row.setFocusable(false);
            row.setBackground(rowBackground());
            row.setTextColor(new ColorStateList(
                    new int[][]{{android.R.attr.state_focused}, {android.R.attr.state_selected},
                            {android.R.attr.state_activated}, {}},
                    new int[]{Color.rgb(25, 25, 25), Color.rgb(25, 25, 25),
                            Color.rgb(25, 25, 25), Color.rgb(245, 245, 245)}));
            return row;
        }
    }

    private static final class FolderRow {
        final int kind;
        final String label;
        final File folder;
        FolderRow(int kind, String label, File folder) {
            this.kind = kind;
            this.label = label;
            this.folder = folder;
        }
    }
}
