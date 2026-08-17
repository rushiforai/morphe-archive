package io.github.liongalahad.nuviotv.extension.settings;

import android.app.Activity;
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
    private static final int REQUEST_ACCESS = 7352;
    private static final int USE = 0, DEVICES = 1, UP = 2, FOLDER = 3;

    private final List<FolderRow> rows = new ArrayList<>();
    private TextView location;
    private ListView list;
    private File current;
    private boolean accessStarted;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        accessStarted = state != null && state.getBoolean("accessStarted", false);
        String restored = state == null ? null : state.getString("current");
        if (restored != null) current = canonical(new File(restored));
        if (hasDirectAccess(this)) createBrowser();
        else if (!accessStarted) requestAccess();
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        state.putBoolean("accessStarted", accessStarted);
        if (current != null) state.putString("current", current.getAbsolutePath());
        super.onSaveInstanceState(state);
    }

    @Override protected void onResume() {
        super.onResume();
        if (list == null && hasDirectAccess(this)) createBrowser();
    }

    static boolean hasDirectAccess(Context context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            return Environment.isExternalStorageManager();
        }
        return context.checkSelfPermission(android.Manifest.permission.READ_EXTERNAL_STORAGE) ==
                PackageManager.PERMISSION_GRANTED;
    }

    private void requestAccess() {
        accessStarted = true;
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
            requestPermissions(new String[]{android.Manifest.permission.READ_EXTERNAL_STORAGE,
                    android.Manifest.permission.WRITE_EXTERNAL_STORAGE}, REQUEST_ACCESS);
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
        if (requestCode != REQUEST_ACCESS) return;
        if (hasDirectAccess(this)) createBrowser();
        else {
            Toast.makeText(this, "Storage access is required to choose a folder",
                    Toast.LENGTH_LONG).show();
            finish();
        }
    }

    @Override public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] results) {
        super.onRequestPermissionsResult(requestCode, permissions, results);
        if (requestCode == REQUEST_ACCESS) {
            if (hasDirectAccess(this)) createBrowser();
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
        if (row.kind == USE) choose();
        else if (row.kind == DEVICES) showDevices();
        else if (row.kind == UP) {
            File root = containingRoot(current);
            if (root == null || same(root, current)) showDevices();
            else showFolder(current.getParentFile());
        } else if (row.folder != null) showFolder(row.folder);
    }

    private void choose() {
        if (!isAllowedFolder(current) || !MorpheStoragePath.setFolderPath(this, current.getAbsolutePath())) {
            Toast.makeText(this, "This folder cannot be used", Toast.LENGTH_LONG).show();
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
        for (File root : storageRoots()) rows.add(new FolderRow(FOLDER,
                same(root, primary) ? "Internal storage" :
                        MorpheStoragePath.displayLabelForPath(root.getAbsolutePath()), root));
        location.setText("Storage devices");
        refreshRows();
    }

    private void showFolder(File requested) {
        File folder = canonical(requested);
        if (!isAllowedFolder(folder)) {
            showDevices();
            return;
        }
        current = folder;
        rows.clear();
        rows.add(new FolderRow(USE, "Use this folder", null));
        rows.add(new FolderRow(DEVICES, "Storage devices", null));
        rows.add(new FolderRow(UP, "Up one level", null));
        File[] children;
        try { children = folder.listFiles(File::isDirectory); }
        catch (SecurityException ignored) { children = null; }
        List<File> directories = new ArrayList<>();
        if (children != null) Collections.addAll(directories, children);
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

    @Override public void onBackPressed() {
        if (list == null || current == null) {
            finish();
            return;
        }
        File root = containingRoot(current);
        if (root == null || same(root, current)) showDevices();
        else showFolder(current.getParentFile());
    }

    private boolean isAllowedFolder(File folder) {
        if (folder == null || !folder.isDirectory()) return false;
        for (File root : storageRoots()) if (contains(root, folder)) return true;
        return false;
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
