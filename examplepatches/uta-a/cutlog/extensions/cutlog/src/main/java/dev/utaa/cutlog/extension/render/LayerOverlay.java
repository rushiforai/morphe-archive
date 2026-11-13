package dev.utaa.cutlog.extension.render;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.util.Log;
import dev.utaa.cutlog.extension.editor.FramePainter;
import dev.utaa.cutlog.extension.editor.FrameStyle;
import dev.utaa.cutlog.extension.editor.Layer;
import dev.utaa.cutlog.extension.editor.LayerPainter;
import dev.utaa.cutlog.extension.hook.CaptureInterceptor;
import dev.utaa.cutlog.shaded.androidx.media3.effect.BitmapOverlay;
import java.util.ArrayList;
import java.util.List;

/**
 * 書き出しでフレームと文字・スタンプを焼き込む overlay。プレビューと同じく、フレームを先に、その上に
 * 文字・スタンプを描く。見た目が時刻で変わるものがあるときだけ毎フレーム描き直す
 * （{@link BitmapOverlay} は bitmap の generation ID が変わったらテクスチャを送り直す）。
 *
 * <p>時刻は最初のフレームを 0 とする。撮影した動画では Transformer の時刻も 0 から始まる（XIG07 で確認）が、
 * 区間を切り出した取り込み動画でも、プレビュー（切り出した区間の先頭が 0）と揃うようにするため。
 */
final class LayerOverlay extends BitmapOverlay {
    private final FrameStyle frame;
    private final List<Layer> layers;
    private final long durationMs;
    private final int width;
    private final int height;
    private final boolean animated;
    private final FramePainter framePainter = new FramePainter();
    private final LayerPainter painter = new LayerPainter();
    private Bitmap bitmap;
    private Canvas canvas;
    private boolean drawn;
    private long firstTimeUs;

    LayerOverlay(FrameStyle frame, List<Layer> layers, long durationMs, int width, int height) {
        this.frame = frame;
        // 書き出しの途中で編集画面から変えられても影響しないよう、一覧は写しを持つ。
        this.layers = new ArrayList<>(layers);
        this.durationMs = durationMs;
        this.width = width;
        this.height = height;
        boolean anyAnimated = frame.animated;
        for (Layer layer : layers) {
            anyAnimated |= layer.isAnimated();
        }
        this.animated = anyAnimated;
    }

    @Override
    public Bitmap getBitmap(long presentationTimeUs) {
        if (bitmap == null) {
            bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
            canvas = new Canvas(bitmap);
            firstTimeUs = presentationTimeUs;
            Log.i(CaptureInterceptor.TAG, "Overlay first frame at " + presentationTimeUs + "us, animated=" + animated);
        }
        if (!drawn || animated) {
            bitmap.eraseColor(0);
            long timeMs = Math.max(0, presentationTimeUs - firstTimeUs) / 1000;
            framePainter.draw(canvas, width, height, frame, timeMs);
            painter.draw(canvas, width, height, layers, timeMs, durationMs);
            drawn = true;
        }
        return bitmap;
    }
}
