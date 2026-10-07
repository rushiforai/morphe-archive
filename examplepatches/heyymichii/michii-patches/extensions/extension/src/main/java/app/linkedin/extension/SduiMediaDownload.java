package app.linkedin.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.util.LruCache;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Download button on the SDUI media viewer screens (photo: MediaUpdateDetail, video: VideoViewer,
 * profile photo and banner), driven by SduiFragment lifecycle hooks. Long press opens Michii Patches.
 *
 * Viewer payloads are transformed off the main thread shortly after the viewer fragment resumes,
 * so media is attached to the media screen that is in front (or the next one to resume).
 */
@SuppressWarnings("unused")
public final class SduiMediaDownload {
    private static final String DOWNLOAD_TAG = "morphe_sdui_download";
    /** Photo (MediaUpdateDetail) and video (VideoViewer) viewers. */
    private static final String MEDIA_SCREEN_PREFIX = "com.linkedin.sdui.flagshipnav.media.";
    /** ProfilePictureNonSelf, ProfilePictureEdit (own photo). */
    private static final String PROFILE_PHOTO_SCREEN_PREFIX = "com.linkedin.sdui.flagshipnav.profile.ProfilePicture";
    /** Own banner. */
    private static final String PROFILE_COVER_SCREEN = "com.linkedin.sdui.flagshipnav.profile.ProfileCoverImageViewer";
    /** Someone else's banner. */
    private static final String PROFILE_BACKGROUND_SCREEN = "com.linkedin.sdui.flagshipnav.profile.ProfilePreviewBackgroundPhoto";
    private static final long PENDING_WINDOW_MS = 5000;

    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final Map<Object, List<MediaItem>> mediaByFragment = new WeakHashMap<>();
    private static final ExecutorService thumbnailLoader = Executors.newFixedThreadPool(2);
    private static final LruCache<String, Bitmap> thumbnails = new LruCache<>(40);

    private static Object resumedFragment;
    private static boolean resumedIsMedia;
    private static List<MediaItem> pending;
    private static long pendingAt;

    // region Hooks from SduiFragment (main thread)

    public static void onFragmentResumed(Object fragment) {
        try {
            SettingsShortcut.ensureRegistered();
            String screen = screenId(fragment);
            Settings.debugLog("SduiFragment resumed screen=" + screen);
            resumedFragment = fragment;
            resumedIsMedia = screen.startsWith(MEDIA_SCREEN_PREFIX)
                    || screen.startsWith(PROFILE_PHOTO_SCREEN_PREFIX) || screen.equals(PROFILE_COVER_SCREEN)
                    || screen.equals(PROFILE_BACKGROUND_SCREEN);

            Activity activity = activity(fragment);
            if (activity == null) return;
            WhatsNew.maybeShow(activity);
            removeView(activity, DOWNLOAD_TAG);
            if (!resumedIsMedia || !Settings.downloadMedia()) return;

            if (pending != null && SystemClock.uptimeMillis() - pendingAt < PENDING_WINDOW_MS) {
                attach(fragment, pending);
            }
            pending = null;
            if (mediaByFragment.containsKey(fragment)) showDownloadButton(activity, fragment);
        } catch (Throwable t) {
            Log.e(Settings.TAG, "onFragmentResumed failed", t);
        }
    }

    public static void onFragmentPaused(Object fragment) {
        try {
            if (resumedFragment != fragment) return;
            resumedFragment = null;
            resumedIsMedia = false;
            Activity activity = activity(fragment);
            if (activity == null) return;
            removeView(activity, DOWNLOAD_TAG);
        } catch (Throwable t) {
            Log.e(Settings.TAG, "onFragmentPaused failed", t);
        }
    }

    public static void onFragmentHiddenChanged(Object fragment, boolean hidden) {
        if (hidden) onFragmentPaused(fragment);
        else onFragmentResumed(fragment);
    }

    // endregion

    /** Called from the SDUI transformer, possibly on a background thread. */
    static void offer(ProtoScanner scan, String source, boolean profileScreen) {
        List<MediaItem> items = MediaItem.extract(scan, profileScreen);
        Settings.debugLog("media payload from " + source + ": " + describe(items));
        if (items.isEmpty()) return;

        main.post(() -> {
            Object fragment = resumedFragment;
            if (fragment != null && resumedIsMedia) {
                attach(fragment, items);
                Activity activity = activity(fragment);
                if (activity != null) showDownloadButton(activity, fragment);
            } else {
                // The viewer fragment has not resumed yet.
                pending = merge(pending, items);
                pendingAt = SystemClock.uptimeMillis();
            }
        });
    }

    private static void attach(Object fragment, List<MediaItem> items) {
        mediaByFragment.put(fragment, merge(mediaByFragment.get(fragment), items));
        Settings.debugLog("media attached: " + describe(mediaByFragment.get(fragment)));
    }

    private static List<MediaItem> merge(List<MediaItem> base, List<MediaItem> extra) {
        List<MediaItem> result = base == null ? new ArrayList<>() : new ArrayList<>(base);
        outer:
        for (MediaItem item : extra) {
            for (MediaItem existing : result) {
                if (existing.assetId.equals(item.assetId)) continue outer;
            }
            result.add(item);
        }
        return result;
    }

    // region Buttons

    private static void showDownloadButton(Activity activity, Object fragment) {
        ViewGroup content = activity.findViewById(android.R.id.content);
        if (content == null) return;
        View button = content.findViewWithTag(DOWNLOAD_TAG);
        if (button == null) {
            button = createDownloadButton(activity);
            content.addView(button);
        }
        button.bringToFront();
        button.setOnClickListener(v -> onDownloadClick(activity, fragment));
        button.setOnLongClickListener(v -> {
            SettingsActivity.open(activity);
            return true;
        });
    }

    private static void removeView(Activity activity, String tag) {
        ViewGroup content = activity.findViewById(android.R.id.content);
        View view = content == null ? null : content.findViewWithTag(tag);
        if (view != null) content.removeView(view);
    }

    private static View createDownloadButton(Context context) {
        ImageButton button = new ImageButton(context);
        button.setTag(DOWNLOAD_TAG);
        button.setImageResource(android.R.drawable.stat_sys_download);
        button.setContentDescription("Download");
        GradientDrawable background = new GradientDrawable();
        background.setShape(GradientDrawable.OVAL);
        background.setColor(0x99000000);
        button.setBackground(background);
        int padding = dp(context, 10);
        button.setPadding(padding, padding, padding, padding);

        int size = dp(context, 44);
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(size, size, Gravity.TOP | Gravity.END);
        // Below the viewer's top bar.
        params.topMargin = dp(context, 88);
        params.setMarginEnd(dp(context, 16));
        button.setLayoutParams(params);
        return button;
    }

    private static void onDownloadClick(Activity activity, Object fragment) {
        List<MediaItem> items = mediaByFragment.get(fragment);
        if (items == null || items.isEmpty()) {
            Downloads.toast(activity, "Media tidak ditemukan");
            return;
        }
        if (items.size() == 1) {
            download(activity, items);
            return;
        }
        showChooser(activity, new ArrayList<>(items));
    }

    // endregion

    // region Chooser

    private static void showChooser(Activity activity, List<MediaItem> items) {
        BaseAdapter adapter = new BaseAdapter() {
            @Override
            public int getCount() {
                return items.size();
            }

            @Override
            public Object getItem(int position) {
                return items.get(position);
            }

            @Override
            public long getItemId(int position) {
                return position;
            }

            @Override
            public View getView(int position, View convertView, ViewGroup parent) {
                return row(activity, items.get(position), position);
            }
        };

        new AlertDialog.Builder(activity)
                .setTitle("Pilih media")
                .setAdapter(adapter, (dialog, which) -> download(activity, items.subList(which, which + 1)))
                .setPositiveButton("Semua (" + items.size() + ")", (dialog, which) -> download(activity, items))
                .setNegativeButton("Batal", null)
                .show();
    }

    private static View row(Context context, MediaItem item, int position) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        int pad = dp(context, 12);
        row.setPadding(dp(context, 20), pad / 2, pad, pad / 2);

        ImageView thumb = new ImageView(context);
        thumb.setScaleType(ImageView.ScaleType.CENTER_CROP);
        thumb.setBackgroundColor(0x33888888);
        int size = dp(context, 64);
        row.addView(thumb, new LinearLayout.LayoutParams(size, size));
        loadThumbnail(thumb, item.thumbnailUrl);

        TextView label = new TextView(context);
        label.setText((position + 1) + ". " + item.label());
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        label.setPadding(pad, 0, 0, 0);
        row.addView(label);
        return row;
    }

    private static void loadThumbnail(ImageView view, String url) {
        if (url == null) return;
        Bitmap cached = thumbnails.get(url);
        if (cached != null) {
            view.setImageBitmap(cached);
            return;
        }
        view.setTag(url);
        thumbnailLoader.execute(() -> {
            Bitmap bitmap = fetchBitmap(url);
            if (bitmap == null) return;
            thumbnails.put(url, bitmap);
            main.post(() -> {
                if (url.equals(view.getTag())) view.setImageBitmap(bitmap);
            });
        });
    }

    private static Bitmap fetchBitmap(String url) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(8000);
            connection.setReadTimeout(8000);
            try (InputStream in = connection.getInputStream()) {
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inSampleSize = 2;
                return BitmapFactory.decodeStream(in, null, options);
            }
        } catch (Throwable t) {
            return null;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    // endregion

    private static void download(Activity activity, List<MediaItem> items) {
        int started = 0;
        boolean allVideos = true;
        for (MediaItem item : items) {
            if (Downloads.enqueue(activity, item.url, item.assetId, item.video)) started++;
            allVideos &= item.video;
        }
        if (started > 0) Downloads.toastStarted(activity, started, allVideos);
    }

    private static Activity activity(Object fragment) {
        Object activity = Proto.call(fragment, "getActivity");
        return activity instanceof Activity ? (Activity) activity : null;
    }

    private static String screenId(Object fragment) {
        Object viewModel = Reflect.get(fragment, "viewModel");
        Object screenContext = Reflect.get(viewModel, "screenContext");
        return Proto.string(screenContext, "getScreenId");
    }

    private static String describe(List<MediaItem> items) {
        if (items == null) return "[]";
        StringBuilder sb = new StringBuilder("[");
        for (MediaItem item : items) {
            if (sb.length() > 1) sb.append(", ");
            sb.append(item.label()).append(' ').append(item.assetId);
        }
        return sb.append(']').toString();
    }

    private static int dp(Context context, int value) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics());
    }
}
