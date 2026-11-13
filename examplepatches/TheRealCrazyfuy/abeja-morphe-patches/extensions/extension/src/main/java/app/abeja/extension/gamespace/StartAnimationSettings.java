package app.abeja.extension.gamespace;

import android.app.AlertDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

import androidx.fragment.app.FragmentActivity;
import androidx.preference.Preference;
import androidx.preference.PreferenceScreen;

import java.io.File;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Settings entry and selection logic for a custom Game Space start animation.
 *
 * <p>Imported videos are copied into {@code files/start_animations} so they
 * persist across reboots and do not require any storage permission.</p>
 */
public final class StartAnimationSettings {
    private static final String TAG = "StartAnimationSettings";
    private static final String PREFS_NAME = "game_space_start_animation";
    private static final String KEY_SELECTED = "selected_video";
    private static final String KEY_PREFERENCE = "abeja_patch_features";
    private static final String DIR_NAME = "start_animations";
    private static final long DEFAULT_TIMEOUT_MS = 2600L;
    private static final long DURATION_BUFFER_MS = 400L;
    private static final String DEFAULT_SUMMARY = "Default animation";
    private static final int THUMBNAIL_WIDTH = 192;
    private static final int THUMBNAIL_HEIGHT = 108;

    private static WeakReference<Preference> sPreference = new WeakReference<>(null);

    private static final Map<String, VideoInfo> sVideoInfoCache = new HashMap<>();
    private static final Set<String> sLoadingVideoInfo = new HashSet<>();
    private static final ExecutorService sVideoInfoExecutor = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "gamespace-start-animation-gallery");
        thread.setDaemon(true);
        return thread;
    });
    private static final Handler sMainHandler = new Handler(Looper.getMainLooper());

    private StartAnimationSettings() {
    }

    /**
     * Called from the patched {@code OtherOptionsFragment.onCreate}.
     */
    public static void addPreference(PreferenceScreen screen) {
        if (screen == null) {
            return;
        }

        Context context = screen.getContext();
        if (context == null) {
            return;
        }

        if (screen.findPreference(KEY_PREFERENCE) != null) {
            return;
        }

        try {
            Preference preference = createPreference(context);
            preference.setKey(KEY_PREFERENCE);
            preference.setTitle("Patch features");
            preference.setSummary(buildHubSummary());
            preference.setPersistent(false);
            preference.setOnPreferenceClickListener(p -> {
                showHubDialog(context);
                return true;
            });
            screen.addPreference(preference);
            sPreference = new WeakReference<>(preference);
        } catch (Throwable t) {
            Log.w(TAG, "Unable to add the patch features preference", t);
        }
    }

    /**
     * Called from the patched {@code GameSpaceActivity.onBackPressed()}.
     *
     * <p>When the start animation is playing, back skips it instead of doing
     * nothing (the stock activity ignores back entirely on game-key devices).</p>
     *
     * @param splash the activity's {@code SplashFragment}, may be {@code null}.
     * @return {@code true} when the back press was consumed.
     */
    public static boolean handleBackPress(Object splash) {
        if (splash == null) {
            return false;
        }

        try {
            Field running = splash.getClass().getDeclaredField("isDoingStartAnim");
            running.setAccessible(true);
            if (!running.getBoolean(splash)) {
                return false;
            }

            Method playEnd = splash.getClass().getMethod("playEnd");
            playEnd.invoke(splash);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "Unable to skip the start animation on back press", t);
            return false;
        }
    }

    /**
     * Called from the patched {@code WallpaperManager.getCurrentUrl()}.
     *
     * @return the custom video URL, or {@code null} to keep the default URL.
     */
    public static String getSelectedStartAnimationUrl(Context context) {
        try {
            File file = getSelectedFile(context);
            return file == null ? null : Uri.fromFile(file).toString();
        } catch (Throwable t) {
            Log.w(TAG, "Unable to resolve the selected start animation", t);
            return null;
        }
    }

    /**
     * Called from the patched {@code SplashFragment.showStartAnim()}.
     *
     * <p>The original timeout is 2600 ms, which cuts off longer custom videos.
     * When a custom video is selected the timeout is based on its duration.</p>
     *
     * @param wallpaperManager the {@code cn.nubia.common.wallpaper.WallpaperManager}
     *                         instance, used only to obtain an application context.
     */
    public static long getStartAnimationDurationMillis(Object wallpaperManager) {
        Context context = getContext(wallpaperManager);
        if (context == null) {
            return DEFAULT_TIMEOUT_MS;
        }

        File file = getSelectedFile(context);
        if (file == null) {
            return DEFAULT_TIMEOUT_MS;
        }

        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            retriever.setDataSource(file.getAbsolutePath());
            String duration = retriever.extractMetadata(
                    MediaMetadataRetriever.METADATA_KEY_DURATION);
            if (duration != null) {
                long millis = Long.parseLong(duration);
                if (millis > 0L) {
                    return millis + DURATION_BUFFER_MS;
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Unable to read the start animation duration", t);
        } finally {
            try {
                retriever.release();
            } catch (Throwable ignored) {
                // Nothing else to do.
            }
        }

        return DEFAULT_TIMEOUT_MS;
    }

    static void onImportFinished(FragmentActivity activity, boolean success) {
        if (activity == null || !success) {
            return;
        }

        updatePreferenceSummary(activity);

        if (activity.isFinishing() || activity.isDestroyed()) {
            return;
        }

        activity.getWindow().getDecorView().postDelayed(() -> {
            if (!activity.isFinishing() && !activity.isDestroyed()) {
                showGalleryDialog(activity);
            }
        }, 350L);
    }

    private static Preference createPreference(Context context) {
        try {
            Class<?> clazz = Class.forName(
                    "cn.nubia.gamecenter.settings.preference.GameCenterPreference");
            Constructor<?> constructor = clazz.getConstructor(
                    Context.class, AttributeSet.class);
            Object preference = constructor.newInstance(context, null);
            if (preference instanceof Preference) {
                return (Preference) preference;
            }
        } catch (Throwable t) {
            Log.w(TAG, "Falling back to the default preference row", t);
        }

        return new Preference(context);
    }

    private static void showHubDialog(Context context) {
        if (context == null) {
            return;
        }

        try {
            final List<Feature> features = new ArrayList<>();
            features.add(new Feature(
                    "Start animation",
                    buildSummary(context).toString(),
                    () -> showGalleryDialog(context)));
            features.add(new Feature(
                    "Background music",
                    BackgroundMusicSettings.buildSummary(context).toString(),
                    () -> BackgroundMusicSettings.showGalleryDialog(context)));

            final FeatureAdapter adapter = new FeatureAdapter(context, features);
            AlertDialog dialog = new AlertDialog.Builder(context)
                    .setCustomTitle(buildHubTitle(context))
                    .setAdapter(adapter, (dialogInterface, which) ->
                            features.get(which).action.run())
                    .setNegativeButton("Close", null)
                    .create();
            dialog.show();
        } catch (Throwable t) {
            Log.w(TAG, "Unable to show the patch features dialog", t);
        }
    }

    private static View buildHubTitle(Context context) {
        LinearLayout container = new LinearLayout(context);
        container.setOrientation(LinearLayout.VERTICAL);
        int padding = dp(context, 24);
        container.setPadding(padding, padding, padding, dp(context, 8));

        TextView title = new TextView(context);
        title.setText("Patch features");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        container.addView(title);

        TextView helper = new TextView(context);
        helper.setText("Extra options added by the Abeja patches.");
        helper.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        helper.setAlpha(0.65f);
        LinearLayout.LayoutParams helperParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        helperParams.topMargin = dp(context, 4);
        container.addView(helper, helperParams);

        return container;
    }

    private static void showGalleryDialog(Context context) {
        if (context == null) {
            return;
        }

        try {
            final List<File> files = getGalleryFiles(context);
            final GalleryAdapter adapter = new GalleryAdapter(context, files, getSelectedFile(context));

            AlertDialog dialog = new AlertDialog.Builder(context)
                    .setCustomTitle(buildGalleryTitle(context, files.size()))
                    .setAdapter(adapter, (dialogInterface, which) -> {
                        if (which == 0) {
                            setSelectedFile(context, null);
                            adapter.setSelected(null);
                            toast(context, "Default start animation selected");
                        } else {
                            File file = adapter.getItem(which);
                            setSelectedFile(context, file);
                            adapter.setSelected(file);
                            toast(context, "Selected: " + file.getName());
                        }
                    })
                    .setPositiveButton("Import video", (dialogInterface, which) -> startPicker(context))
                    .setNegativeButton("Close", null)
                    .create();

            adapter.setOnDeleteClickListener(file -> confirmDelete(context, file, adapter));
            dialog.show();
        } catch (Throwable t) {
            Log.w(TAG, "Unable to show the start animation dialog", t);
        }
    }

    private static View buildGalleryTitle(Context context, int importedCount) {
        LinearLayout container = new LinearLayout(context);
        container.setOrientation(LinearLayout.VERTICAL);
        int padding = dp(context, 24);
        container.setPadding(padding, padding, padding, dp(context, 8));

        TextView title = new TextView(context);
        title.setText("Start animation");
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        title.setTypeface(Typeface.DEFAULT_BOLD);
        container.addView(title);

        TextView helper = new TextView(context);
        helper.setText(importedCount == 0
                ? "Import a video to replace the bundled animation."
                : "Tap a video to use it, or tap the bin to delete it.");
        helper.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        helper.setAlpha(0.65f);
        LinearLayout.LayoutParams helperParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        helperParams.topMargin = dp(context, 4);
        container.addView(helper, helperParams);

        return container;
    }

    private static void confirmDelete(Context context, File file, GalleryAdapter adapter) {
        final String path = file.getAbsolutePath();
        final boolean wasSelected =
                path.equals(preferences(context).getString(KEY_SELECTED, null));

        new AlertDialog.Builder(context)
                .setTitle("Delete video?")
                .setMessage(file.getName()
                        + "\n\nThis video will be permanently removed from the gallery.")
                .setPositiveButton("Delete", (dialog, which) -> {
                    if (!file.delete()) {
                        toast(context, "Unable to delete the video");
                        return;
                    }

                    sVideoInfoCache.remove(path);
                    if (wasSelected) {
                        setSelectedFile(context, null);
                    }
                    adapter.remove(file);
                    toast(context, "Deleted: " + file.getName());
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private static void requestVideoInfo(File file, Runnable onLoaded) {
        final String path = file.getAbsolutePath();
        if (sVideoInfoCache.containsKey(path) || !sLoadingVideoInfo.add(path)) {
            return;
        }

        sVideoInfoExecutor.execute(() -> {
            final VideoInfo info = readVideoInfo(file);
            sMainHandler.post(() -> {
                sLoadingVideoInfo.remove(path);
                if (file.exists()) {
                    sVideoInfoCache.put(path, info);
                }
                onLoaded.run();
            });
        });
    }

    private static VideoInfo readVideoInfo(File file) {
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            retriever.setDataSource(file.getAbsolutePath());

            long duration = 0L;
            String value = retriever.extractMetadata(
                    MediaMetadataRetriever.METADATA_KEY_DURATION);
            if (value != null) {
                try {
                    duration = Long.parseLong(value);
                } catch (NumberFormatException ignored) {
                    // Keep the duration unknown.
                }
            }

            Bitmap frame = null;
            try {
                frame = retriever.getScaledFrameAtTime(
                        0L, MediaMetadataRetriever.OPTION_CLOSEST_SYNC,
                        THUMBNAIL_WIDTH, THUMBNAIL_HEIGHT);
            } catch (Throwable ignored) {
                // Some containers do not support scaled frames.
            }
            if (frame == null) {
                frame = retriever.getFrameAtTime(
                        0L, MediaMetadataRetriever.OPTION_CLOSEST_SYNC);
            }

            return new VideoInfo(frame, duration);
        } catch (Throwable t) {
            return new VideoInfo(null, 0L);
        } finally {
            try {
                retriever.release();
            } catch (Throwable ignored) {
                // Nothing else to do.
            }
        }
    }

    private static void startPicker(Context context) {
        if (context instanceof FragmentActivity) {
            PickerFragment.launch((FragmentActivity) context);
        } else {
            toast(context, "Unable to open the video picker");
        }
    }

    private static CharSequence buildSummary(Context context) {
        File file = getSelectedFile(context);
        return file == null ? DEFAULT_SUMMARY : "Custom: " + file.getName();
    }

    private static CharSequence buildHubSummary() {
        return "Start animation and background music";
    }

    private static void updatePreferenceSummary(Context context) {
        Preference preference = sPreference.get();
        if (preference == null || context == null) {
            return;
        }

        try {
            preference.setSummary(buildHubSummary());
        } catch (Throwable t) {
            Log.w(TAG, "Unable to update the preference summary", t);
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

        updatePreferenceSummary(context);
    }

    static File getGalleryDir(Context context) {
        Context appContext = context.getApplicationContext();
        if (appContext == null) {
            appContext = context;
        }

        File dir = new File(appContext.getFilesDir(), DIR_NAME);
        if (!dir.exists() && !dir.mkdirs()) {
            Log.w(TAG, "Unable to create the start animation gallery directory");
        }
        return dir;
    }

    private static List<File> getGalleryFiles(Context context) {
        File dir = getGalleryDir(context);
        File[] files = dir.listFiles(file -> file.isFile() && isVideo(file.getName()));
        if (files == null || files.length == 0) {
            return new ArrayList<>();
        }

        List<File> list = new ArrayList<>(Arrays.asList(files));
        list.sort((first, second) ->
                Long.compare(second.lastModified(), first.lastModified()));
        return list;
    }

    private static boolean isVideo(String name) {
        String lower = name.toLowerCase(Locale.US);
        return lower.endsWith(".mp4")
                || lower.endsWith(".m4v")
                || lower.endsWith(".webm")
                || lower.endsWith(".mkv")
                || lower.endsWith(".mov")
                || lower.endsWith(".3gp")
                || lower.endsWith(".avi");
    }

    private static Context getContext(Object wallpaperManager) {
        if (wallpaperManager == null) {
            return null;
        }

        try {
            Field field = wallpaperManager.getClass().getDeclaredField("mContext");
            field.setAccessible(true);
            Object value = field.get(wallpaperManager);
            if (value instanceof Context) {
                return (Context) value;
            }
        } catch (Throwable t) {
            Log.w(TAG, "Unable to obtain the WallpaperManager context", t);
        }

        // Last resort for unusual ROM builds.
        try {
            Class<?> activityThread = Class.forName("android.app.ActivityThread");
            Method currentApplication = activityThread.getMethod("currentApplication");
            Object application = currentApplication.invoke(null);
            if (application instanceof Context) {
                return (Context) application;
            }
        } catch (Throwable t) {
            Log.w(TAG, "Unable to obtain the application context", t);
        }

        return null;
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

    private static GradientDrawable placeholderDrawable(Context context) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(0x22888888);
        drawable.setCornerRadius(dp(context, 6));
        return drawable;
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

    private static String formatDuration(long millis) {
        if (millis <= 0L) {
            return "unknown length";
        }
        long totalSeconds = Math.round(millis / 1000.0);
        long minutes = totalSeconds / 60L;
        long seconds = totalSeconds % 60L;
        return String.format(Locale.US, "%d:%02d", minutes, seconds);
    }

    private interface OnDeleteClickListener {
        void onDelete(File file);
    }

    private interface FeatureAction {
        void run();
    }

    private static final class Feature {
        final String title;
        final String summary;
        final FeatureAction action;

        Feature(String title, String summary, FeatureAction action) {
            this.title = title;
            this.summary = summary;
            this.action = action;
        }
    }

    private static final class FeatureAdapter extends BaseAdapter {
        private final Context context;
        private final List<Feature> features;

        FeatureAdapter(Context context, List<Feature> features) {
            this.context = context;
            this.features = features;
        }

        @Override
        public int getCount() {
            return features.size();
        }

        @Override
        public Feature getItem(int position) {
            return features.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            LinearLayout row;
            if (convertView instanceof LinearLayout
                    && convertView.getTag() instanceof TextView[]) {
                row = (LinearLayout) convertView;
            } else {
                row = new LinearLayout(context);
                row.setOrientation(LinearLayout.VERTICAL);
                row.setPadding(dp(context, 24), dp(context, 12),
                        dp(context, 24), dp(context, 12));

                TextView title = new TextView(context);
                title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
                row.addView(title);

                TextView summary = new TextView(context);
                summary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
                summary.setAlpha(0.6f);
                LinearLayout.LayoutParams summaryParams = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT);
                summaryParams.topMargin = dp(context, 2);
                row.addView(summary, summaryParams);

                row.setTag(new TextView[]{title, summary});
            }

            Feature feature = getItem(position);
            TextView[] views = (TextView[]) row.getTag();
            views[0].setText(feature.title);
            views[1].setText(feature.summary);
            return row;
        }
    }

    private static final class VideoInfo {
        final Bitmap thumbnail;
        final long durationMillis;

        VideoInfo(Bitmap thumbnail, long durationMillis) {
            this.thumbnail = thumbnail;
            this.durationMillis = durationMillis;
        }
    }

    private static final class GalleryAdapter extends BaseAdapter {
        private final Context context;
        private final List<File> files;
        private final List<File> entries;
        private File selected;
        private OnDeleteClickListener deleteClickListener;

        GalleryAdapter(Context context, List<File> files, File selected) {
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
                row.name.setText("Default animation");
                row.meta.setText("Bundled Game Space intro");
                row.thumbnail.setImageDrawable(placeholderDrawable(context));
                row.delete.setOnClickListener(null);
                return convertView;
            }

            row.name.setText(file.getName());

            VideoInfo info = sVideoInfoCache.get(file.getAbsolutePath());
            if (info == null) {
                row.meta.setText(formatSize(file));
                row.thumbnail.setImageDrawable(placeholderDrawable(context));
                requestVideoInfo(file, this::notifyDataSetChanged);
            } else {
                row.meta.setText(formatSize(file)
                        + "  \u00b7  " + formatDuration(info.durationMillis));
                if (info.thumbnail != null) {
                    row.thumbnail.setImageBitmap(info.thumbnail);
                } else {
                    row.thumbnail.setImageDrawable(placeholderDrawable(context));
                }
            }

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
            root.setPadding(dp(context, 16), dp(context, 10), dp(context, 8), dp(context, 10));
            // Focusable children (the delete button) would make the ListView treat
            // the whole item as focusable and stop delivering item clicks.
            root.setDescendantFocusability(ViewGroup.FOCUS_BLOCK_DESCENDANTS);

            ImageView thumbnail = new ImageView(context);
            thumbnail.setScaleType(ImageView.ScaleType.CENTER_CROP);
            thumbnail.setImageDrawable(placeholderDrawable(context));
            root.addView(thumbnail, new LinearLayout.LayoutParams(
                    dp(context, 64), dp(context, 36)));

            LinearLayout text = new LinearLayout(context);
            text.setOrientation(LinearLayout.VERTICAL);
            LinearLayout.LayoutParams textParams = new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
            textParams.leftMargin = dp(context, 16);
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

            return new Row(root, thumbnail, name, meta, radio, delete);
        }
    }

    private static final class Row {
        final LinearLayout root;
        final ImageView thumbnail;
        final TextView name;
        final TextView meta;
        final RadioButton radio;
        final ImageButton delete;

        Row(LinearLayout root, ImageView thumbnail, TextView name, TextView meta,
                RadioButton radio, ImageButton delete) {
            this.root = root;
            this.thumbnail = thumbnail;
            this.name = name;
            this.meta = meta;
            this.radio = radio;
            this.delete = delete;
        }
    }
}
