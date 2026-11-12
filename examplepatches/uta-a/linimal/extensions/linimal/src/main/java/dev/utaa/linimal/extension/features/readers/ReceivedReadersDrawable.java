package dev.utaa.linimal.extension.features.readers;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * 他人のメッセージの時刻の上に置く 1 行。「既読 N」を時刻と同じ端に、「重ねたアイコン」をその外側（吹き出しから遠い側）に
 * 横へ並べ、その下に時刻が続きます。
 * どちらか片方だけのときは、その要素だけを描きます。行の高さはアイコンと文字の高い方にそろえ、両方を上下中央に置きます。
 *
 * <p>文字は時刻の TextView と同じ大きさ・色で描き、描画のたびに色を読み直して LINE の配色の変更にも追従します。
 * 行は時刻の文字と同じ端にそろえます。[alignEnd] が false なら時刻の左端（横並びの行。吹き出し側）、
 * true なら右端（スタンプなど縦並びの行。吹き出しの右端の下）です。位置は描画のたびに時刻の文字の実際の位置から
 * 求めるため、時刻の文字幅や TextView の幅が変わっても追従します。時刻の上の compound drawable として置くため、行の layout（横並び・縦並び）を変更しません。</p>
 */
final class ReceivedReadersDrawable extends Drawable {
    private final AvatarPainter painter = new AvatarPainter();
    /** 色を読む時刻の TextView。drawable を保持する State から View を強参照しないよう弱参照にします。 */
    private final WeakReference<TextView> style;
    private int lastTextColor;
    private final List<ReadersSnapshot.Member> members;
    private final Bitmap[] bitmaps;
    private final String countText;
    private final Paint textPaint;
    private final int diameterPx;
    private final int stepPx;
    private final int gapPx;
    private final float ringPx;
    private final int ringColor;
    private final int width;
    private final int height;
    private final int iconsHeight;
    private final int textHeight;
    private final int iconsWidth;
    private final int textWidth;
    private final int textTop;
    private final boolean alignEnd;
    private int alpha = 255;

    /**
     * @param readers   アイコンを描く場合の既読者。描かない場合は空にします
     * @param countText 既読数の文言。描かない場合は null にします
     */
    ReceivedReadersDrawable(TextView style, List<ReadersSnapshot.Member> readers, String countText, float density,
            int ringColor, boolean alignEnd) {
        this.alignEnd = alignEnd;
        this.style = new WeakReference<>(style);
        this.lastTextColor = style.getCurrentTextColor();
        this.members = readers == null ? Collections.emptyList()
                : new ArrayList<>(readers.subList(0, Math.min(ReaderStripDrawable.MAX_AVATARS, readers.size())));
        this.bitmaps = new Bitmap[members.size()];
        this.countText = countText == null || countText.isEmpty() ? null : countText;
        this.textPaint = new Paint(style.getPaint());
        this.textPaint.setTextAlign(Paint.Align.LEFT);
        this.diameterPx = Math.round(14f * density);
        this.stepPx = Math.round(10f * density);
        // アイコンと既読数の間隔。
        this.gapPx = Math.round(3f * density);
        this.ringPx = Math.max(1f, density);
        this.ringColor = ringColor;

        this.iconsWidth = members.isEmpty() ? 0
                : diameterPx + stepPx * (members.size() - 1) + Math.round(ringPx * 2);
        // 送り幅に左右 1px の余裕を足し、字形の張り出しで切れないようにします。
        this.textWidth = this.countText == null ? 0
                : (int) Math.ceil(textPaint.measureText(this.countText)) + 2;
        Paint.FontMetricsInt metrics = textPaint.getFontMetricsInt();
        // 高さと baseline は同じ整数の metrics（top / bottom）で決め、上下の切れと 1px のずれを防ぎます。
        this.textTop = metrics.top;
        this.textHeight = this.countText == null ? 0 : metrics.bottom - metrics.top;
        this.iconsHeight = members.isEmpty() ? 0 : diameterPx + Math.round(ringPx * 2);
        this.width = iconsWidth + textWidth + (iconsWidth > 0 && textWidth > 0 ? gapPx : 0);
        this.height = Math.max(iconsHeight, textHeight);
        setBounds(0, 0, width, height);
    }

    List<ReadersSnapshot.Member> members() {
        return members;
    }

    boolean isEmpty() {
        return width == 0 || height == 0;
    }

    void setBitmap(int index, Bitmap bitmap) {
        if (index >= 0 && index < bitmaps.length) {
            bitmaps[index] = bitmap;
            invalidateSelf();
        }
    }

    @Override
    public int getIntrinsicWidth() {
        return width;
    }

    @Override
    public int getIntrinsicHeight() {
        return height;
    }

    @Override
    public void draw(Canvas canvas) {
        if (isEmpty()) {
            return;
        }
        int save = canvas.saveLayerAlpha(
                getBounds().left, getBounds().top, getBounds().right, getBounds().bottom, alpha);
        try {
            drawRows(canvas);
        } catch (RuntimeException ignored) {
            // 描けなくても時刻の表示は続けます。
        } finally {
            canvas.restoreToCount(save);
        }
    }

    /**
     * 幅 [rowWidth] の段を、時刻の文字の端にそろえたときの左端（drawable の座標）。
     *
     * <p>TextView は top drawable を {@code compoundPaddingLeft + (hspace - drawableWidth) / 2} に置き、
     * 文字は {@code compoundPaddingLeft + layout の行の位置} に描きます。この 2 つの差から、文字の端を
     * drawable の座標へ写します。段が TextView の内容の幅からはみ出さないよう、内容の幅の中に収めます。
     * layout がまだない場合は中央にそろえます。</p>
     */
    private float rowLeft(int rowWidth) {
        float centered = getBounds().left + (width - rowWidth) / 2f;
        TextView view = style.get();
        android.text.Layout layout = view == null ? null : view.getLayout();
        // 時刻は 1 行で省略されない前提です。そうでなければ文字の端を決められないため中央にそろえます。
        if (layout == null || layout.getLineCount() != 1 || layout.getEllipsisCount(0) > 0) {
            return centered;
        }
        int hspace = view.getWidth() - view.getCompoundPaddingLeft() - view.getCompoundPaddingRight();
        if (hspace <= 0) {
            return centered;
        }
        // drawable は scrollX を含めて translate されるため、文字の位置からも scrollX を引きます。
        int drawableLeft = view.getScrollX() + (hspace - width) / 2;
        float start = alignEnd ? layout.getLineRight(0) - rowWidth : layout.getLineLeft(0);
        start = Math.max(0f, Math.min(start, hspace - rowWidth));
        return getBounds().left + start - drawableLeft;
    }

    /**
     * 既読数を時刻と同じ端に置き、アイコンを吹き出しから遠い外側へ置きます。左端にそろえる行では
     * 「既読 N・アイコン」、右端にそろえる行では「アイコン・既読 N」の順です。
     */
    private void drawRows(Canvas canvas) {
        float left = rowLeft(width);
        float centerY = getBounds().exactCenterY();
        boolean hasIcons = !members.isEmpty();
        boolean hasText = countText != null;
        float iconsLeft;
        float textLeft;
        if (alignEnd) {
            iconsLeft = left;
            textLeft = left + (hasIcons ? iconsWidth + gapPx : 0);
        } else {
            textLeft = left;
            iconsLeft = left + (hasText ? textWidth + gapPx : 0);
        }
        if (hasIcons) {
            float radius = diameterPx / 2f;
            for (int i = members.size() - 1; i >= 0; i--) {
                ReadersSnapshot.Member member = members.get(i);
                float cx = iconsLeft + ringPx + radius + stepPx * i;
                painter.draw(canvas, cx, centerY, radius, bitmaps[i], member.getDisplayName(), member.getMid(),
                        ringPx, ringColor);
            }
        }
        if (hasText) {
            TextView source = style.get();
            if (source != null) {
                lastTextColor = source.getCurrentTextColor();
            }
            textPaint.setColor(lastTextColor);
            float baseline = centerY - textHeight / 2f - textTop;
            canvas.drawText(countText, textLeft + 1, baseline, textPaint);
        }
    }

    @Override
    public void setAlpha(int alpha) {
        this.alpha = alpha;
        invalidateSelf();
    }

    @Override
    public void setColorFilter(ColorFilter colorFilter) {
        // 文字は時刻の色に、アイコンは写真の色に合わせるため、外からの着色は受けません。
    }

    @Override
    public int getOpacity() {
        return PixelFormat.TRANSLUCENT;
    }
}
