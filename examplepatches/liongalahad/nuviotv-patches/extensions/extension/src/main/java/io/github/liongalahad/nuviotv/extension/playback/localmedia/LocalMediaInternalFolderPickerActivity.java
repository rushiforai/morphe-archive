package io.github.liongalahad.nuviotv.extension.playback.localmedia;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.graphics.Color;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.provider.Settings;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;

/** D-pad folder browser used when Android TV has no real ACTION_OPEN_DOCUMENT_TREE handler. */
public final class LocalMediaInternalFolderPickerActivity extends Activity {
    private static final int REQUEST_ALL_FILES_ACCESS = 7204;
    private static final int KIND_USE = 0;
    private static final int KIND_DEVICES = 1;
    private static final int KIND_UP = 2;
    private static final int KIND_FOLDER = 3;

    private final List<FolderRow> rows = new ArrayList<>();
    private TextView locationView;
    private ListView listView;
    private File currentFolder;
    private boolean accessRequestStarted;
    private Object backCallback;

    @Override protected void onCreate(Bundle state) {
        super.onCreate(state);
        accessRequestStarted = state != null && state.getBoolean("accessRequestStarted", false);
        String restoredPath = state == null ? null : state.getString("currentFolder");
        if (restoredPath != null) currentFolder = canonicalFile(new File(restoredPath));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            backCallback = Api33Back.register(this, this::handleBackNavigation);
        }
        if (LocalMediaRuntime.hasDefaultFolderAccess(this)) {
            createBrowser();
        } else if (!accessRequestStarted) {
            requestStorageAccess();
        }
    }

    @Override protected void onSaveInstanceState(Bundle state) {
        state.putBoolean("accessRequestStarted", accessRequestStarted);
        if (currentFolder != null) state.putString("currentFolder", currentFolder.getAbsolutePath());
        super.onSaveInstanceState(state);
    }

    @Override protected void onResume() {
        super.onResume();
        if (listView == null && LocalMediaRuntime.hasDefaultFolderAccess(this)) createBrowser();
    }

    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != REQUEST_ALL_FILES_ACCESS) return;
        if (LocalMediaRuntime.hasDefaultFolderAccess(this)) {
            createBrowser();
        } else {
            Toast.makeText(this, "Storage access is required to choose a folder", Toast.LENGTH_LONG).show();
            finish();
        }
    }

    @Override public void onRequestPermissionsResult(
            int requestCode,
            String[] permissions,
            int[] grantResults
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode != REQUEST_ALL_FILES_ACCESS) return;
        if (LocalMediaRuntime.hasDefaultFolderAccess(this)) {
            createBrowser();
        } else {
            Toast.makeText(this, "Storage access is required to choose a folder", Toast.LENGTH_LONG).show();
            finish();
        }
    }

    private void requestStorageAccess() {
        accessRequestStarted = true;
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) {
            requestPermissions(new String[]{
                    android.Manifest.permission.READ_EXTERNAL_STORAGE,
                    android.Manifest.permission.WRITE_EXTERNAL_STORAGE
            }, REQUEST_ALL_FILES_ACCESS);
            return;
        }
        Intent access = new Intent(
                Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION,
                Uri.parse("package:" + getPackageName())
        );
        try {
            startActivityForResult(access, REQUEST_ALL_FILES_ACCESS);
        } catch (ActivityNotFoundException | SecurityException ignored) {
            try {
                startActivityForResult(
                        new Intent(Settings.ACTION_MANAGE_ALL_FILES_ACCESS_PERMISSION),
                        REQUEST_ALL_FILES_ACCESS
                );
            } catch (ActivityNotFoundException | SecurityException unavailable) {
                Toast.makeText(this, "Android storage access settings are unavailable",
                        Toast.LENGTH_LONG).show();
                finish();
            }
        }
    }

    private void createBrowser() {
        if (listView != null) return;
        getWindow().setStatusBarColor(Color.rgb(16, 16, 20));
        getWindow().setNavigationBarColor(Color.rgb(16, 16, 20));

        LinearLayout page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setPadding(dp(56), dp(38), dp(56), dp(38));
        page.setBackgroundColor(Color.rgb(16, 16, 20));

        TextView title = new TextView(this);
        title.setText("Choose storage folder");
        title.setTextColor(Color.WHITE);
        title.setTextSize(28);
        title.setGravity(Gravity.START);
        page.addView(title, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        locationView = new TextView(this);
        locationView.setTextColor(Color.rgb(176, 181, 194));
        locationView.setTextSize(18);
        locationView.setPadding(0, dp(12), 0, dp(20));
        page.addView(locationView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        listView = new ListView(this);
        listView.setDividerHeight(dp(2));
        listView.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
        listView.setAdapter(new ArrayAdapter<FolderRow>(this, android.R.layout.simple_list_item_1, rows) {
            @Override public View getView(int position, View convertView, ViewGroup parent) {
                TextView view = (TextView) super.getView(position, convertView, parent);
                view.setText(rows.get(position).label);
                view.setTextColor(Color.WHITE);
                view.setTextSize(21);
                view.setGravity(Gravity.CENTER_VERTICAL);
                view.setMinHeight(dp(64));
                view.setPadding(dp(24), 0, dp(24), 0);
                return view;
            }
        });
        listView.setOnItemClickListener((parent, view, position, id) -> activate(rows.get(position)));
        page.addView(listView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        setContentView(page);

        if (currentFolder == null) currentFolder = canonicalFile(Environment.getExternalStorageDirectory());
        showFolder(currentFolder);
    }

    private void activate(FolderRow row) {
        if (row.kind == KIND_USE) {
            chooseCurrentFolder();
        } else if (row.kind == KIND_DEVICES) {
            showStorageDevices();
        } else if (row.kind == KIND_UP) {
            File root = containingStorageRoot(currentFolder);
            if (root == null || sameFile(root, currentFolder)) {
                showStorageDevices();
            } else {
                showFolder(currentFolder.getParentFile());
            }
        } else if (row.folder != null) {
            showFolder(row.folder);
        }
    }

    private void chooseCurrentFolder() {
        if (!isAllowedFolder(currentFolder)) {
            Toast.makeText(this, "This folder cannot be used", Toast.LENGTH_LONG).show();
            return;
        }
        if (!LocalMediaRuntime.setFolderPath(this, currentFolder.getAbsolutePath())) {
            Toast.makeText(this, "Folder selection could not be saved", Toast.LENGTH_LONG).show();
            return;
        }
        MorpheSettingsUi.refresh();
        Intent result = new Intent().putExtra(
                LocalMediaFolderPickerActivity.EXTRA_FOLDER_PATH,
                currentFolder.getAbsolutePath()
        );
        setResult(RESULT_OK, result);
        finish();
    }

    private void showStorageDevices() {
        currentFolder = null;
        rows.clear();
        for (File root : storageRoots()) {
            String label = sameFile(root, canonicalFile(Environment.getExternalStorageDirectory()))
                    ? "Internal storage" : root.getName();
            rows.add(new FolderRow(KIND_FOLDER, label, root));
        }
        locationView.setText("Storage devices");
        notifyRowsChanged();
    }

    private void showFolder(File requested) {
        File folder = canonicalFile(requested);
        if (!isAllowedFolder(folder)) {
            showStorageDevices();
            return;
        }
        currentFolder = folder;
        rows.clear();
        rows.add(new FolderRow(KIND_USE, "Use this folder", null));
        rows.add(new FolderRow(KIND_DEVICES, "Storage devices", null));
        rows.add(new FolderRow(KIND_UP, "Up one level", null));

        File[] children;
        try {
            children = folder.listFiles(File::isDirectory);
        } catch (SecurityException ignored) {
            children = null;
        }
        List<File> directories = new ArrayList<>();
        if (children != null) Collections.addAll(directories, children);
        directories.sort(Comparator.comparing(
                File::getName,
                String.CASE_INSENSITIVE_ORDER
        ));
        for (File child : directories) {
            rows.add(new FolderRow(KIND_FOLDER, child.getName(), canonicalFile(child)));
        }
        locationView.setText(LocalMediaRuntime.folderDisplayLabelForPath(folder.getAbsolutePath()));
        notifyRowsChanged();
    }

    private void notifyRowsChanged() {
        ((ArrayAdapter<?>) listView.getAdapter()).notifyDataSetChanged();
        listView.setSelection(0);
        listView.requestFocus();
    }

    @Override public void onBackPressed() {
        handleBackNavigation();
    }

    private void handleBackNavigation() {
        if (listView == null || currentFolder == null) {
            finish();
            return;
        }
        File root = containingStorageRoot(currentFolder);
        if (root == null || sameFile(root, currentFolder)) {
            showStorageDevices();
        } else {
            showFolder(currentFolder.getParentFile());
        }
    }

    @Override protected void onDestroy() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU && backCallback != null) {
            Api33Back.unregister(this, backCallback);
        }
        super.onDestroy();
    }

    static boolean isAllowedFolder(File folder) {
        if (folder == null || !folder.isDirectory()) return false;
        for (File root : storageRoots()) {
            if (contains(root, folder)) return true;
        }
        return false;
    }

    private static File containingStorageRoot(File folder) {
        if (folder == null) return null;
        File best = null;
        for (File root : storageRoots()) {
            if (contains(root, folder) && (best == null ||
                    root.getAbsolutePath().length() > best.getAbsolutePath().length())) {
                best = root;
            }
        }
        return best;
    }

    private static List<File> storageRoots() {
        List<File> roots = new ArrayList<>();
        Set<String> paths = new HashSet<>();
        addStorageRoot(roots, paths, Environment.getExternalStorageDirectory());
        File storage = new File("/storage");
        File[] mounted = storage.listFiles(File::isDirectory);
        if (mounted != null) {
            for (File root : mounted) {
                String name = root.getName().toLowerCase(Locale.ROOT);
                if ("emulated".equals(name) || "self".equals(name)) continue;
                addStorageRoot(roots, paths, root);
            }
        }
        return roots;
    }

    private static void addStorageRoot(List<File> roots, Set<String> paths, File candidate) {
        File root = canonicalFile(candidate);
        if (root != null && root.isDirectory() && paths.add(root.getAbsolutePath())) roots.add(root);
    }

    private static boolean contains(File root, File folder) {
        File canonicalRoot = canonicalFile(root);
        File canonicalFolder = canonicalFile(folder);
        if (canonicalRoot == null || canonicalFolder == null) return false;
        String rootPath = canonicalRoot.getAbsolutePath();
        String folderPath = canonicalFolder.getAbsolutePath();
        return folderPath.equals(rootPath) || folderPath.startsWith(rootPath + File.separator);
    }

    private static boolean sameFile(File first, File second) {
        File canonicalFirst = canonicalFile(first);
        File canonicalSecond = canonicalFile(second);
        return canonicalFirst != null && canonicalFirst.equals(canonicalSecond);
    }

    private static File canonicalFile(File file) {
        if (file == null) return null;
        try {
            return file.getCanonicalFile();
        } catch (IOException ignored) {
            return file.getAbsoluteFile();
        }
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private static final class Api33Back {
        private Api33Back() {}

        static Object register(Activity activity, Runnable action) {
            OnBackInvokedCallback callback = action::run;
            activity.getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                    OnBackInvokedDispatcher.PRIORITY_DEFAULT,
                    callback
            );
            return callback;
        }

        static void unregister(Activity activity, Object callback) {
            activity.getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback(
                    (OnBackInvokedCallback) callback
            );
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

        @Override public String toString() {
            return label;
        }
    }
}
