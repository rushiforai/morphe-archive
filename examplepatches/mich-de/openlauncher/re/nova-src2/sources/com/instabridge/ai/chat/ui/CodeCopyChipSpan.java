package com.instabridge.ai.chat.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.text.style.ReplacementSpan;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\r\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\b\u0001\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J2\u0010\u0010\u001a\u00020\t2\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\t2\u0006\u0010\u0016\u001a\u00020\t2\b\u0010\u0017\u001a\u0004\u0018\u00010\u0018H\u0016JP\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\t2\u0006\u0010\u0016\u001a\u00020\t2\u0006\u0010\u001d\u001a\u00020\f2\u0006\u0010\u001e\u001a\u00020\t2\u0006\u0010\u001f\u001a\u00020\t2\u0006\u0010 \u001a\u00020\t2\u0006\u0010\u0011\u001a\u00020\u0012H\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\fX\u0082D¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\fX\u0082D¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\fX\u0082D¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\fX\u0082D¢\u0006\u0002\n\u0000R\u0018\u0010!\u001a\u00020\f*\u00020\u00128BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\"\u0010#¨\u0006$"}, d2 = {"Lcom/instabridge/ai/chat/ui/CodeCopyChipSpan;", "Landroid/text/style/ReplacementSpan;", "context", "Landroid/content/Context;", "label", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Landroid/content/Context;Ljava/lang/String;)V", "bgColor", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "textColor", "cornerRadius", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hPadding", "vPadding", "textSizeSp", "getSize", "paint", "Landroid/graphics/Paint;", "text", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "start", "end", "fm", "Landroid/graphics/Paint$FontMetricsInt;", "draw", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "canvas", "Landroid/graphics/Canvas;", "x", "top", "y", "bottom", "density", "getDensity", "(Landroid/graphics/Paint;)F", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class CodeCopyChipSpan extends ReplacementSpan {
    public static final int $stable = 8;
    private final int bgColor;
    private final float cornerRadius;
    private final float hPadding;

    @NotNull
    private final String label;
    private final int textColor;
    private final float textSizeSp;
    private final float vPadding;

    public CodeCopyChipSpan(@NotNull Context context, @NotNull String label) {
        Intrinsics.g(context, "context");
        Intrinsics.g(label, "label");
        this.label = label;
        this.bgColor = context.getColor(2131099708);
        this.textColor = context.getColor(2131099709);
        this.cornerRadius = 6.0f;
        this.hPadding = 8.0f;
        this.vPadding = 3.0f;
        this.textSizeSp = 12.0f;
    }

    private final float getDensity(Paint paint) {
        return paint.getTextSize() / 16.0f;
    }

    @Override // android.text.style.ReplacementSpan
    public void draw(@NotNull Canvas canvas, @NotNull CharSequence text, int start, int end, float x11, int top, int y11, int bottom, @NotNull Paint paint) {
        Intrinsics.g(canvas, "canvas");
        Intrinsics.g(text, "text");
        Intrinsics.g(paint, "paint");
        float density = getDensity(paint);
        Paint paint2 = new Paint(paint);
        paint2.setTextSize(this.textSizeSp * density);
        paint2.setAntiAlias(true);
        float f11 = this.hPadding * density;
        float f12 = this.vPadding * density;
        float fMeasureText = paint2.measureText(this.label);
        float f13 = this.cornerRadius * density;
        Paint paint3 = new Paint();
        paint3.setColor(this.bgColor);
        paint3.setAntiAlias(true);
        float f14 = y11;
        canvas.drawRoundRect(new RectF(x11, (paint2.ascent() + f14) - f12, (2 * f11) + fMeasureText + x11, paint2.descent() + f14 + f12), f13, f13, paint3);
        paint2.setColor(this.textColor);
        paint2.setFakeBoldText(true);
        canvas.drawText(this.label, x11 + f11, f14, paint2);
    }

    @Override // android.text.style.ReplacementSpan
    public int getSize(@NotNull Paint paint, @NotNull CharSequence text, int start, int end, @Nullable Paint.FontMetricsInt fm) {
        Intrinsics.g(paint, "paint");
        Intrinsics.g(text, "text");
        float density = getDensity(paint);
        Paint paint2 = new Paint(paint);
        paint2.setTextSize(this.textSizeSp * density);
        float fMeasureText = (this.hPadding * 2 * density) + paint2.measureText(this.label);
        if (fm != null) {
            Paint.FontMetricsInt fontMetricsInt = paint2.getFontMetricsInt();
            fm.ascent = fontMetricsInt.ascent;
            fm.descent = fontMetricsInt.descent;
            fm.top = fontMetricsInt.top;
            fm.bottom = fontMetricsInt.bottom;
        }
        return (int) fMeasureText;
    }
}
