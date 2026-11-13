package app.abeja.extension.gamespace;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

import androidx.fragment.app.FragmentActivity;

import java.io.File;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

/**
 * Settings entry and selection logic for a custom Game Space background music
 * track.
 *
 * <p>Imported tracks are copied into {@code files/bgm_tracks} so they persist
 * across reboots and do not require any storage permission.</p>
 */
public final class BackgroundMusicSettings {
    private static final String TAG = "BackgroundMusicSettings";
    private static final String PREFS_NAME = "game_space_background_music";
    private static final String KEY_SELECTED = "selected_track";
    private static final String DIR_NAME = "bgm_tracks";
    private static final String DEFAULT_SUMMARY = "Default music";

    private BackgroundMusicSettings() {
    }

    static CharSequence buildSummary(Context context) {
        File file = getSelectedFile(context);
        return file == null ? DEFAULT_SUMMARY : "Custom: " + file.getName();
    }

    /**
     * Called from the patched {@code BgmHelper.initMediaPlayer()}.
     *
     * @return the selected track URI, or {@code fallback} for the bundled music.
     */
    public static Uri resolveBgmUri(Context context, Uri fallback) {
        try {
            File file = getSelectedFile(context);
            return file == null ? fallback : Uri.fromFile(file);
        } catch (Throwable t) {
            Log.w(TAG, "Unable to resolve the background music", t);
            return fallback;
        }
    }

    static void showGalleryDialog(Context context) {
        if (context == null) {
            return;
        }

        try {
            final List<File> files = getGalleryFiles(context);
            final TrackAdapter adapter =
                    new TrackAdapter(context, files, getSelectedFile(context));

            AlertDialog dialog = new AlertDialog.Builder(context)
                    .setCustomTitle(buildGalleryTitle(context, files.size()))
                    .setAdapter(adapter, (dialogInterface, which) -> {
                        if (which == 0) {
                            setSelectedFile(context, null);
                            adapter.setSelected(null);
                            toast(context, "Default background music selected");
                        } else {
                            File file = adapter.getItem(which);
                            setSelectedFile(context, file);
                            adapter.setSelected(file);
                            toast(context, "Selected: " + file.getName());
                        }
                    })
                    .setPositiveButton("Import audio", (dialogInterface, which) ->
                            startPicker(context))
                    .setNegativeButton("Close", null)
                    .create();

            adapter.setOnDeleteClickListener(file -> confirmDelete(context, file, adapter));
            dialog.show();
        } catch (Throwable t) {
            Log.w(TAG, "Unable to show the background music dialog", t);
        }
    }

    static void onImportFinished(FragmentActivity activity, boolean success) {
        if (activity == null || !success) {
            return;
        }

        if (activity.isFinishing() || activity.isDestroyed()) {
            return;
        }

        activity.getWindow().getDecorView().postDelayed(() -> {
            if (!activity.isFinishing() && !activity.isDestroyed()) {
                showGalleryDialog(activity);
            }
        }, 350L);
    }

    private static View buildGalleryTitle(Context context, int importedCount) {
        LinearLayout container = new LinearLayout(context);
        container.setOrientation(LinearLayout.VERTICAL);
        int padding = dp(context, 24);
        container.setPadding(padding, padding, padding, dp(context, 8));

        TextView title = new TextView(context);
        title.setText("Background music");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        container.addView(title);

        TextView helper = new TextView(context);
        helper.setText(importedCount == 0
                ? "Import an audio file to replace the bundled music."
                : "Tap a track to use it, or tap the bin to delete it.");
        helper.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        helper.setAlpha(0.65f);
        LinearLayout.LayoutParams helperParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        helperParams.topMargin = dp(context, 4);
        container.addView(helper, helperParams);

        return container;
    }

    private static void confirmDelete(Context context, File file, TrackAdapter adapter) {
        final String path = file.getAbsolutePath();
        final boolean wasSelected =
                path.equals(preferences(context).getString(KEY_SELECTED, null));

        new AlertDialog.Builder(context)
                .setTitle("Delete track?")
                .setMessage(file.getName()
                        + "\n\nThis track will be permanently removed from the gallery.")
                .setPositiveButton("Delete", (dialog, which) -> {
                    if (!file.delete()) {
                        toast(context, "Unable to delete the track");
                        return;
                    }

                    if (wasSelected) {
                        setSelectedFile(context, null);
                    }
                    adapter.remove(file);
                    toast(context, "Deleted: " + file.getName());
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private static void startPicker(Context context) {
        if (context instanceof FragmentActivity) {
            PickerFragment.launchAudio((FragmentActivity) context);
        } else {
            toast(context, "Unable to open the audio picker");
        }
    }

    private static SharedPreferences preferences(Context context) {
        Context appContext = context.getApplicationContext();
        if (appContext == null) {
            appContext = context;
        }
        return appContext.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    static File getSelectedFile(Context context) {
        if (context == null) {
            return null;
        }

        String path = preferences(context).getString(KEY_SELECTED, null);
        if (TextUtils.isEmpty(path)) {
            return null;
        }

        File file = new File(path);
        if (!file.isFile()) {
            preferences(context).edit().remove(KEY_SELECTED).apply();
            return null;
        }

        return file;
    }

    static void setSelectedFile(Context context, File file) {
        if (context == null) {
            return;
        }

        SharedPreferences preferences = preferences(context);
        if (file == null) {
            preferences.edit().remove(KEY_SELECTED).apply();
        } else {
            preferences.edit().putString(KEY_SELECTED, file.getAbsolutePath()).apply();
        }

        reloadBgm();
    }

    /**
     * Recreates the app's {@code BgmHelper} media player so a new selection
     * takes effect immediately.
     */
    private static void reloadBgm() {
        Handler handler = new Handler(Looper.getMainLooper());
        handler.post(() -> {
            try {
                Class<?> clazz = Class.forName("cn.nubia.gamelauncher.helper.BgmHelper");
                Method getInstance = clazz.getMethod("getInstance");
                Object helper = getInstance.invoke(null);
                Method initMediaPlayer = clazz.getMethod("initMediaPlayer");
                initMediaPlayer.invoke(helper);
            } catch (Throwable t) {
                Log.w(TAG, "Unable to reload the background music", t);
            }
        });
    }

    static File getGalleryDir(Context context) {
        Context appContext = context.getApplicationContext();
        if (appContext == null) {
            appContext = context;
        }

        File dir = new File(appContext.getFilesDir(), DIR_NAME);
        if (!dir.exists() && !dir.mkdirs()) {
            Log.w(TAG, "Unable to create the background music gallery directory");
        }
        return dir;
    }

    private static List<File> getGalleryFiles(Context context) {
        File dir = getGalleryDir(context);
        File[] files = dir.listFiles(file -> file.isFile() && isAudio(file.getName()));
        if (files == null || files.length == 0) {
            return new ArrayList<>();
        }

        List<File> list = new ArrayList<>(Arrays.asList(files));
        list.sort((first, second) ->
                Long.compare(second.lastModified(), first.lastModified()));
        return list;
    }

    private static boolean isAudio(String name) {
        String lower = name.toLowerCase(Locale.US);
        return lower.endsWith(".mp3")
                || lower.endsWith(".m4a")
                || lower.endsWith(".aac")
                || lower.endsWith(".ogg")
                || lower.endsWith(".opus")
                || lower.endsWith(".wav")
                || lower.endsWith(".flac")
                || lower.endsWith(".mid")
                || lower.endsWith(".midi");
    }

    private static void toast(Context context, String message) {
        try {
            Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
            Log.w(TAG, "Unable to show toast", t);
        }
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }

    private static String formatSize(File file) {
        long bytes = file.length();
        if (bytes <= 0L) {
            return "unknown size";
        }
        if (bytes < 1024L * 1024L) {
            return String.format(Locale.US, "%.0f KB", bytes / 1024.0);
        }
        return String.format(Locale.US, "%.1f MB", bytes / (1024.0 * 1024.0));
    }

    private interface OnDeleteClickListener {
        void onDelete(File file);
    }

    private static final class TrackAdapter extends BaseAdapter {
        private final Context context;
        private final List<File> files;
        private final List<File> entries;
        private OnDeleteClickListener deleteClickListener;
        private File selected;

        TrackAdapter(Context context, List<File> files, File selected) {
            this.context = context;
            this.files = files;
            this.entries = new ArrayList<>();
            this.entries.add(null);
            this.entries.addAll(files);
            this.selected = selected;
        }

        void setOnDeleteClickListener(OnDeleteClickListener listener) {
            this.deleteClickListener = listener;
        }

        void setSelected(File file) {
            this.selected = file;
            notifyDataSetChanged();
        }

        void remove(File file) {
            files.remove(file);
            entries.remove(file);
            if (selected != null
                    && selected.getAbsolutePath().equals(file.getAbsolutePath())) {
                selected = null;
            }
            notifyDataSetChanged();
        }

        @Override
        public int getCount() {
            return entries.size();
        }

        @Override
        public File getItem(int position) {
            return entries.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            Row row;
            if (convertView instanceof LinearLayout && convertView.getTag() instanceof Row) {
                row = (Row) convertView.getTag();
            } else {
                row = createRow(parent);
                convertView = row.root;
                convertView.setTag(row);
            }

            final File file = getItem(position);
            boolean isDefault = file == null;
            boolean isSelected = isDefault
                    ? selected == null
                    : selected != null
                            && selected.getAbsolutePath().equals(file.getAbsolutePath());

            row.radio.setChecked(isSelected);
            row.delete.setVisibility(isDefault ? View.INVISIBLE : View.VISIBLE);

            if (isDefault) {
                row.name.setText("Default music");
                row.meta.setText("Bundled Game Space soundtrack");
                row.delete.setOnClickListener(null);
                return convertView;
            }

            row.name.setText(file.getName());
            row.meta.setText(formatSize(file));

            row.delete.setOnClickListener(v -> {
                OnDeleteClickListener listener = deleteClickListener;
                if (listener != null) {
                    listener.onDelete(file);
                }
            });

            return convertView;
        }

        private Row createRow(ViewGroup parent) {
            Context context = parent.getContext();

            LinearLayout root = new LinearLayout(context);
            root.setOrientation(LinearLayout.HORIZONTAL);
            root.setGravity(Gravity.CENTER_VERTICAL);
            root.setPadding(dp(context, 24), dp(context, 12),
                    dp(context, 8), dp(context, 12));
            // Focusable children (the delete button) would make the ListView treat
            // the whole item as focusable and stop delivering item clicks.
            root.setDescendantFocusability(ViewGroup.FOCUS_BLOCK_DESCENDANTS);

            LinearLayout text = new LinearLayout(context);
            text.setOrientation(LinearLayout.VERTICAL);
            LinearLayout.LayoutParams textParams = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            root.addView(text, textParams);

            TextView name = new TextView(context);
            name.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            name.setSingleLine(true);
            name.setEllipsize(TextUtils.TruncateAt.END);
            text.addView(name);

            TextView meta = new TextView(context);
            meta.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            meta.setAlpha(0.6f);
            LinearLayout.LayoutParams metaParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            metaParams.topMargin = dp(context, 2);
            text.addView(meta, metaParams);

            RadioButton radio = new RadioButton(context);
            radio.setClickable(false);
            radio.setFocusable(false);
            radio.setFocusableInTouchMode(false);
            root.addView(radio, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

            ImageButton delete = new ImageButton(context);
            delete.setImageResource(android.R.drawable.ic_menu_delete);
            delete.setBackground(null);
            delete.setContentDescription("Delete");
            delete.setFocusable(false);
            delete.setFocusableInTouchMode(false);
            LinearLayout.LayoutParams deleteParams = new LinearLayout.LayoutParams(
                    dp(context, 48), dp(context, 48));
            deleteParams.leftMargin = dp(context, 4);
            root.addView(delete, deleteParams);

            return new Row(root, name, meta, radio, delete);
        }
    }

    private static final class Row {
        final LinearLayout root;
        final TextView name;
        final TextView meta;
        final RadioButton radio;
        final ImageButton delete;

        Row(LinearLayout root, TextView name, TextView meta,
                RadioButton radio, ImageButton delete) {
            this.root = root;
            this.name = name;
            this.meta = meta;
            this.radio = radio;
            this.delete = delete;
        }
    }
}
