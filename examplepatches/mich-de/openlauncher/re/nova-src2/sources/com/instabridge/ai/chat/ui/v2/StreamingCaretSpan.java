package com.instabridge.ai.chat.ui.v2;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RectF;
import android.text.style.ReplacementSpan;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\n\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\r\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ4\u0010\u000f\u001a\u00020\u00032\u0006\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u00132\u0006\u0010\u0014\u001a\u00020\u00032\u0006\u0010\u0015\u001a\u00020\u00032\b\u0010\u0016\u001a\u0004\u0018\u00010\u0017H\u0016JR\u0010\u0018\u001a\u00020\u00192\u0006\u0010\u001a\u001a\u00020\u001b2\b\u0010\u0012\u001a\u0004\u0018\u00010\u00132\u0006\u0010\u0014\u001a\u00020\u00032\u0006\u0010\u0015\u001a\u00020\u00032\u0006\u0010\u001c\u001a\u00020\u00062\u0006\u0010\u001d\u001a\u00020\u00032\u0006\u0010\u001e\u001a\u00020\u00032\u0006\u0010\u001f\u001a\u00020\u00032\u0006\u0010\u0010\u001a\u00020\u0011H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\t\u001a\u00020\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\n\u0010\u000b\"\u0004\b\f\u0010\rR\u000e\u0010\u000e\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006 "}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/StreamingCaretSpan;", "Landroid/text/style/ReplacementSpan;", "widthPx", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "heightPx", "radiusPx", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(IIF)V", "spanAlpha", "getSpanAlpha", "()I", "setSpanAlpha", "(I)V", "color", "getSize", "paint", "Landroid/graphics/Paint;", "text", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "start", "end", "fm", "Landroid/graphics/Paint$FontMetricsInt;", "draw", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "canvas", "Landroid/graphics/Canvas;", "x", "top", "y", "bottom", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class StreamingCaretSpan extends ReplacementSpan {
    public static final int $stable = 8;
    private final int heightPx;
    private final float radiusPx;
    private final int widthPx;
    private int spanAlpha = 255;
    private final int color = Color.parseColor("#FB7C36");

    public StreamingCaretSpan(int i5, int i11, float f11) {
        this.widthPx = i5;
        this.heightPx = i11;
        this.radiusPx = f11;
    }

    @Override // android.text.style.ReplacementSpan
    public void draw(@NotNull Canvas canvas, @Nullable CharSequence text, int start, int end, float x11, int top, int y11, int bottom, @NotNull Paint paint) {
        Intrinsics.g(canvas, "canvas");
        Intrinsics.g(paint, "paint");
        if (this.spanAlpha == 0) {
            return;
        }
        int color = paint.getColor();
        int alpha = paint.getAlpha();
        Paint.Style style = paint.getStyle();
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(this.color);
        paint.setAlpha(this.spanAlpha);
        RectF rectF = new RectF(x11, y11 - this.heightPx, this.widthPx + x11, y11);
        float f11 = this.radiusPx;
        canvas.drawRoundRect(rectF, f11, f11, paint);
        paint.setColor(color);
        paint.setAlpha(alpha);
        paint.setStyle(style);
    }

    @Override // android.text.style.ReplacementSpan
    public int getSize(@NotNull Paint paint, @Nullable CharSequence text, int start, int end, @Nullable Paint.FontMetricsInt fm) {
        Intrinsics.g(paint, "paint");
        return this.widthPx;
    }

    public final int getSpanAlpha() {
        return this.spanAlpha;
    }

    public final void setSpanAlpha(int i5) {
        this.spanAlpha = i5;
    }
}
