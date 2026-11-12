package app.morphe.extension.chmate;

import android.Manifest;
import android.app.Activity;

import android.app.DownloadManager;
import android.content.Context;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;

/** System-owned downloads survive closing the viewer. No video is buffered in app memory. */
public final class VideoDownloads {
    static final int REQUEST_STORAGE = 0x4856;
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private VideoDownloads() { }

    static void request(Activity activity, String url, Runnable save) {
        if (!GifViewerActivity.supported(url) && !XMediaAttachments.isVideo(url)) {
            message(activity, "この動画URLは保存できません"); return;
        }
        save.run();
    }

    static boolean needsStoragePermission(Activity activity) {
        return Build.VERSION.SDK_INT >= 23 && Build.VERSION.SDK_INT <= 28
                && activity.checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED;
    }

    /** Called after an explicit Save action (and legacy storage access, if needed). */
    public static void enqueue(Context context, String url) {
        Context app = context.getApplicationContext();
        boolean gif = GifViewerActivity.supported(url);
        if (!gif && !XMediaAttachments.isVideo(url)) { message(app, "この動画URLは保存できません"); return; }
        WORKER.execute(() -> {
            try {
                DownloadManager manager = (DownloadManager) app.getSystemService(Context.DOWNLOAD_SERVICE);
                if (manager == null) throw new IllegalStateException("ダウンロード機能が利用できません");
                String filename = VideoDownloadNames.filename(url);
                if (gif) filename = filename.substring(0, filename.length() - 4) + ".gif";
                DownloadManager.Request request = new DownloadManager.Request(Uri.parse(url));
                request.setTitle(filename);
                request.setDescription(gif ? "Haiagaru GIF保存" : "Haiagaru 動画保存");
                request.setMimeType(gif ? "image/gif" : "video/mp4");
                request.setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED);
                request.setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS, "Haiagaru/" + filename);
                // Preserve the exact playback URL, including signed query parameters. Do not pass login cookies.
                long id = manager.enqueue(request);
                if (id <= 0) throw new IllegalStateException("ダウンロードを登録できませんでした");
                message(app, "動画の保存を開始しました。進捗はダウンロード通知で確認できます");
            } catch (RuntimeException error) {
                // Do not log signed URLs or account information.
                message(app, "動画の保存を開始できませんでした。空き容量・保存権限・ダウンロード機能を確認してください");
            }
        });
    }
    static void message(Context context, String text) {
        MAIN.post(() -> Toast.makeText(context, text, Toast.LENGTH_LONG).show());
    }
}
