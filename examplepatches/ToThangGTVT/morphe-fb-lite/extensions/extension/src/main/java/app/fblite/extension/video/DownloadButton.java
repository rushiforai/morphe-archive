package app.fblite.extension.video;

import android.Manifest;
import android.app.Activity;
import android.app.DownloadManager;
import android.content.Context;
import android.content.pm.PackageManager;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.Locale;

/** A floating button over the video that is playing, which saves it to Movies/Facebook Lite. */
final class DownloadButton {
    private static ImageView button;
    private static WeakReference<Activity> owner = new WeakReference<>(null);
    private static WeakReference<View> target = new WeakReference<>(null);
    private static final Rect RECT = new Rect();

    private DownloadButton() {
    }

    static void show(Activity activity, View video) {
        if (owner.get() != activity || button == null) create(activity);
        target = new WeakReference<>(video);
        if (!video.getGlobalVisibleRect(RECT)) {
            hide();
            return;
        }
        int size = dp(activity, 44);
        int margin = dp(activity, 12);
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) button.getLayoutParams();
        // Right edge, a third of the way down: clear of the Reels header and of the like column.
        int top = RECT.top + Math.max(margin, Math.min(RECT.height() / 3, RECT.height() - size - margin));
        int left = RECT.right - size - margin;
        if (params.leftMargin != left || params.topMargin != top) {
            params.leftMargin = left;
            params.topMargin = top;
            button.setLayoutParams(params);
        }
        button.setVisibility(View.VISIBLE);
        button.bringToFront();
    }

    static void hide() {
        if (button != null) button.setVisibility(View.GONE);
    }

    static void forget(Activity activity) {
        if (owner.get() == activity) {
            owner = new WeakReference<>(null);
            button = null;
        }
    }

    private static void create(final Activity activity) {
        int size = dp(activity, 44);
        ImageView view = new ImageView(activity);
        view.setImageResource(android.R.drawable.stat_sys_download);
        view.setColorFilter(0xFFFFFFFF);
        int pad = dp(activity, 10);
        view.setPadding(pad, pad, pad, pad);
        GradientDrawable background = new GradientDrawable();
        background.setShape(GradientDrawable.OVAL);
        background.setColor(0x99000000);
        view.setBackground(background);
        view.setContentDescription(vi() ? "Tải video" : "Download video");
        view.setOnClickListener(v -> download(activity));
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(size, size, Gravity.TOP | Gravity.START);
        ((ViewGroup) activity.getWindow().getDecorView()).addView(view, params);
        view.setVisibility(View.GONE);
        button = view;
        owner = new WeakReference<>(activity);
    }

    private static void download(Activity activity) {
        View video = target.get();
        if (video == null) return;
        try {
            if (Build.VERSION.SDK_INT < 29 && activity.checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE)
                    != PackageManager.PERMISSION_GRANTED) {
                activity.requestPermissions(new String[] {Manifest.permission.WRITE_EXTERNAL_STORAGE}, 0x4d6f);
                return;
            }
            String[] source = source(video);
            if (source == null) {
                toast(activity, vi() ? "Không lấy được link video này" : "This video has no downloadable link");
                return;
            }
            String name = (source[1] != null ? source[1] : String.valueOf(System.currentTimeMillis())) + ".mp4";
            DownloadManager.Request request = new DownloadManager.Request(Uri.parse(source[0]))
                    .setTitle(name)
                    .setMimeType("video/mp4")
                    .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)
                    .setDestinationInExternalPublicDir(Environment.DIRECTORY_MOVIES, "Facebook Lite/" + name);
            ((DownloadManager) activity.getSystemService(Context.DOWNLOAD_SERVICE)).enqueue(request);
            VideoFeatures.log("Downloading " + name + " from " + source[0], null);
            toast(activity, vi() ? "Đang tải video vào Movies/Facebook Lite" : "Downloading to Movies/Facebook Lite");
        } catch (Throwable t) {
            VideoFeatures.log("Download failed", t);
            toast(activity, vi() ? "Tải video thất bại" : "Download failed");
        }
    }

    /** The progressive MP4 URL and the video id the server sent, or null. Live videos are skipped. */
    private static String[] source(View video) throws Exception {
        Class<?> videoView = VideoFeatures.videoViewClass();
        if (Boolean.TRUE.equals(VideoFeatures.field(video, videoView, "A0m"))) return null;
        String url = null;
        String id = null;
        // Full screen player: its show-video command.
        for (Class<?> c = video.getClass(); c != null && c != videoView; c = c.getSuperclass()) {
            if (c.getName().endsWith("FBFullScreenVideoView")) {
                Object command = VideoFeatures.field(video, c, "A05");
                if (command != null) {
                    url = (String) field(command, "A0G");
                    id = (String) field(command, "A0D");
                }
            }
        }
        // Inline, feed and Reels players: their props.
        if (isEmpty(url)) {
            Object props = VideoFeatures.field(video, videoView, "A0F");
            if (props != null) {
                url = (String) field(props, "A0c");
                id = (String) field(props, "A0b");
            }
        }
        if (isEmpty(url) || !url.startsWith("http")) return null;
        return new String[] {url, id};
    }

    private static Object field(Object target, String name) throws Exception {
        for (Class<?> c = target.getClass(); c != null; c = c.getSuperclass()) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f.get(target);
            } catch (NoSuchFieldException ignored) {
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static boolean isEmpty(String s) {
        return s == null || s.isEmpty();
    }

    private static boolean vi() {
        return "vi".equals(Locale.getDefault().getLanguage());
    }

    private static void toast(Context context, String text) {
        Toast.makeText(context, text, Toast.LENGTH_SHORT).show();
    }

    private static int dp(Context context, int value) {
        return Math.round(value * context.getResources().getDisplayMetrics().density);
    }
}
