package dev.utaa.cutlog.extension.editor;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.ImageDecoder;
import android.net.Uri;
import android.util.Log;
import dev.utaa.cutlog.extension.hook.CaptureInterceptor;
import java.io.IOException;

/** スタンプにする画像の読み込み。 */
final class StickerImages {
    /** 長い辺をこれ以下に縮める。出力は最大 1280x720 なので、これで十分きれいに描ける。 */
    static final int MAX_SIDE = 1024;

    private StickerImages() {}

    /**
     * 画像を縮小して読む。EXIF の向きは ImageDecoder が反映する。書き出しのキャンバス（ソフトウェア描画）
     * にも描けるよう、ハードウェア Bitmap にはしない。読めなければ null。main thread 以外から呼ぶ。
     */
    static Bitmap decode(Context context, Uri uri) {
        try {
            ImageDecoder.Source source = ImageDecoder.createSource(context.getContentResolver(), uri);
            return ImageDecoder.decodeBitmap(source, (decoder, info, src) -> {
                decoder.setAllocator(ImageDecoder.ALLOCATOR_SOFTWARE);
                int[] size = scaledSize(info.getSize().getWidth(), info.getSize().getHeight(), MAX_SIDE);
                decoder.setTargetSize(size[0], size[1]);
            });
        } catch (IOException | RuntimeException e) {
            Log.w(CaptureInterceptor.TAG, "Cannot decode the sticker image.", e);
            return null;
        }
    }

    /** 縦横比を保って、長い辺を maxSide 以下にした大きさ。小さい画像は拡大しない。 */
    static int[] scaledSize(int width, int height, int maxSide) {
        int longer = Math.max(width, height);
        if (longer <= maxSide) {
            return new int[] {width, height};
        }
        float scale = maxSide / (float) longer;
        return new int[] {Math.max(1, Math.round(width * scale)), Math.max(1, Math.round(height * scale))};
    }
}
