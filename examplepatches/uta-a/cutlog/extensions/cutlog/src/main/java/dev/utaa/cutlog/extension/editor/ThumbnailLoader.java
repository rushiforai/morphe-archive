package dev.utaa.cutlog.extension.editor;

import android.content.Context;
import android.graphics.Bitmap;
import android.media.MediaMetadataRetriever;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import dev.utaa.cutlog.extension.hook.CaptureInterceptor;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.function.Consumer;

/** タイムラインに並べるサムネイルを裏で読む。新しい要求が来たら、古い要求の結果は捨てる。 */
final class ThumbnailLoader {
    private static final int COUNT = 10;
    private static final int HEIGHT_PX = 160;

    private final Context context;
    private final Uri source;
    private final ExecutorService executor = Executors.newSingleThreadExecutor();
    private final Handler main = new Handler(Looper.getMainLooper());
    private volatile int generation;

    ThumbnailLoader(Context context, Uri source) {
        this.context = context.getApplicationContext();
        this.source = source;
    }

    /** startMs から durationMs の区間を等間隔に読む。 */
    void load(long startMs, long durationMs, Consumer<List<Bitmap>> callback) {
        int request = ++generation;
        executor.execute(() -> {
            List<Bitmap> frames = new ArrayList<>();
            MediaMetadataRetriever retriever = new MediaMetadataRetriever();
            try {
                retriever.setDataSource(context, source);
                for (int i = 0; i < COUNT && request == generation; i++) {
                    long timeUs = (startMs + durationMs * (2 * i + 1) / (2 * COUNT)) * 1000;
                    Bitmap frame = retriever.getScaledFrameAtTime(
                            timeUs, MediaMetadataRetriever.OPTION_CLOSEST_SYNC, HEIGHT_PX, HEIGHT_PX);
                    if (frame != null) {
                        frames.add(frame);
                    }
                }
            } catch (RuntimeException e) {
                Log.w(CaptureInterceptor.TAG, "Cannot load thumbnails.", e);
            } finally {
                try {
                    retriever.release();
                } catch (Exception ignored) {
                    // 片付けの失敗はサムネイルに影響しない。
                }
            }
            if (request == generation) {
                main.post(() -> {
                    if (request == generation) {
                        callback.accept(frames);
                    }
                });
            }
        });
    }

    void release() {
        generation++;
        executor.shutdownNow();
    }
}
