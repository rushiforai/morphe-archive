package dev.utaa.linimal.extension.features.readers;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;

import java.util.ArrayList;
import java.util.List;

/**
 * 既読ラベルの左に置く、重なった小さなアバターの列。人数は既読ラベルの数字が示すため、
 * 先頭の {@link #MAX_AVATARS} 人だけを描きます。
 */
final class ReaderStripDrawable extends Drawable {
    static final int MAX_AVATARS = 4;

    private final AvatarPainter painter = new AvatarPainter();
    private final List<ReadersSnapshot.Member> members;
    private final Bitmap[] bitmaps;
    private final int diameterPx;
    private final int stepPx;
    private final float ringPx;
    private final int ringColor;
    private int alpha = 255;

    ReaderStripDrawable(List<ReadersSnapshot.Member> readers, float density, int ringColor) {
        this.members = new ArrayList<>(readers.subList(0, Math.min(MAX_AVATARS, readers.size())));
        this.bitmaps = new Bitmap[members.size()];
        this.diameterPx = Math.round(14f * density);
        this.stepPx = Math.round(10f * density);
        this.ringPx = Math.max(1f, density);
        this.ringColor = ringColor;
        setBounds(0, 0, getIntrinsicWidth(), getIntrinsicHeight());
    }

    List<ReadersSnapshot.Member> members() {
        return members;
    }

    /** 取得できた画像を差し込み、再描画を要求します。 */
    void setBitmap(int index, Bitmap bitmap) {
        if (index >= 0 && index < bitmaps.length) {
            bitmaps[index] = bitmap;
            invalidateSelf();
        }
    }

    boolean isEmpty() {
        return members.isEmpty();
    }

    @Override
    public int getIntrinsicWidth() {
        if (members.isEmpty()) {
            return 0;
        }
        return diameterPx + stepPx * (members.size() - 1) + Math.round(ringPx * 2);
    }

    @Override
    public int getIntrinsicHeight() {
        return members.isEmpty() ? 0 : diameterPx + Math.round(ringPx * 2);
    }

    @Override
    public void draw(Canvas canvas) {
        if (members.isEmpty()) {
            return;
        }
        int save = canvas.saveLayerAlpha(
                getBounds().left, getBounds().top, getBounds().right, getBounds().bottom, alpha);
        float radius = diameterPx / 2f;
        float cy = getBounds().exactCenterY();
        // 左のアバターが上に重なるよう、右から描きます。
        for (int i = members.size() - 1; i >= 0; i--) {
            ReadersSnapshot.Member member = members.get(i);
            float cx = getBounds().left + ringPx + radius + stepPx * i;
            painter.draw(canvas, cx, cy, radius, bitmaps[i], member.getDisplayName(), member.getMid(),
                    ringPx, ringColor);
        }
        canvas.restoreToCount(save);
    }

    @Override
    public void setAlpha(int alpha) {
        this.alpha = alpha;
        invalidateSelf();
    }

    @Override
    public void setColorFilter(ColorFilter colorFilter) {
        // アバターは写真のため着色しません。
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }
}
