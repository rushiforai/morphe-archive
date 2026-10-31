package com.instabridge.ai.chat.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.text.style.ReplacementSpan;
import com.instabridge.ai.chat.util.DomainUtils;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0010\u0007\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\r\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\b\u0001\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ2\u0010\u0016\u001a\u00020\u00052\u0006\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u00052\u0006\u0010\u001c\u001a\u00020\u00052\b\u0010\u001d\u001a\u0004\u0018\u00010\u001eH\u0016JP\u0010\u001f\u001a\u00020 2\u0006\u0010!\u001a\u00020\"2\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u00052\u0006\u0010\u001c\u001a\u00020\u00052\u0006\u0010#\u001a\u00020\u00102\u0006\u0010$\u001a\u00020\u00052\u0006\u0010%\u001a\u00020\u00052\u0006\u0010&\u001a\u00020\u00052\u0006\u0010\u0017\u001a\u00020\u0018H\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u000e\u0010\f\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082D¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0010X\u0082D¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0010X\u0082D¢\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0010X\u0082D¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0010X\u0082D¢\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0010X\u0082D¢\u0006\u0002\n\u0000R\u0018\u0010'\u001a\u00020\u0010*\u00020\u00188BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b(\u0010)¨\u0006*"}, d2 = {"Lcom/instabridge/ai/chat/ui/CitationBadgeSpan;", "Landroid/text/style/ReplacementSpan;", "context", "Landroid/content/Context;", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Landroid/content/Context;ILjava/lang/String;)V", "getUrl", "()Ljava/lang/String;", "domain", "bgColor", "textColor", "cornerRadius", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "hPadding", "vPadding", "gap", "margin", "textSizeSp", "getSize", "paint", "Landroid/graphics/Paint;", "text", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "start", "end", "fm", "Landroid/graphics/Paint$FontMetricsInt;", "draw", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "canvas", "Landroid/graphics/Canvas;", "x", "top", "y", "bottom", "density", "getDensity", "(Landroid/graphics/Paint;)F", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class CitationBadgeSpan extends ReplacementSpan {
    public static final int $stable = 8;
    private final int bgColor;
    private final float cornerRadius;

    @NotNull
    private final String domain;
    private final float gap;
    private final float hPadding;
    private final int index;
    private final float margin;
    private final int textColor;
    private final float textSizeSp;

    @NotNull
    private final String url;
    private final float vPadding;

    public CitationBadgeSpan(@NotNull Context context, int i5, @NotNull String url) {
        Intrinsics.g(context, "context");
        Intrinsics.g(url, "url");
        this.index = i5;
        this.url = url;
        this.domain = DomainUtils.INSTANCE.extractDomain(url);
        this.bgColor = context.getColor(2131099706);
        this.textColor = context.getColor(2131099707);
        this.cornerRadius = 6.0f;
        this.hPadding = 8.0f;
        this.vPadding = 2.0f;
        this.gap = 4.0f;
        this.margin = 3.0f;
        this.textSizeSp = 11.0f;
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
        String strValueOf = String.valueOf(this.index);
        float fMeasureText = paint2.measureText(strValueOf);
        float fMeasureText2 = paint2.measureText(this.domain);
        float f11 = this.hPadding * density;
        float f12 = this.vPadding * density;
        float f13 = this.gap * density;
        float f14 = this.margin * density;
        float f15 = (2 * f11) + fMeasureText + f13 + fMeasureText2;
        float f16 = this.cornerRadius * density;
        float f17 = x11 + f14;
        Paint paint3 = new Paint();
        paint3.setColor(this.bgColor);
        paint3.setAntiAlias(true);
        float f18 = y11;
        canvas.drawRoundRect(new RectF(f17, (paint2.ascent() + f18) - f12, f15 + f17, paint2.descent() + f18 + f12), f16, f16, paint3);
        paint2.setColor(this.textColor);
        paint2.setFakeBoldText(true);
        float f19 = f17 + f11;
        canvas.drawText(strValueOf, f19, f18, paint2);
        paint2.setFakeBoldText(false);
        canvas.drawText(this.domain, f19 + fMeasureText + f13, f18, paint2);
    }

    @Override // android.text.style.ReplacementSpan
    public int getSize(@NotNull Paint paint, @NotNull CharSequence text, int start, int end, @Nullable Paint.FontMetricsInt fm) {
        Intrinsics.g(paint, "paint");
        Intrinsics.g(text, "text");
        float density = getDensity(paint);
        Paint paint2 = new Paint(paint);
        paint2.setTextSize(this.textSizeSp * density);
        float f11 = 2;
        float fMeasureText = (((this.hPadding * f11) + this.gap) * density) + (this.margin * f11 * density) + paint2.measureText(String.valueOf(this.index)) + paint2.measureText(this.domain);
        if (fm != null) {
            Paint.FontMetricsInt fontMetricsInt = paint2.getFontMetricsInt();
            fm.ascent = fontMetricsInt.ascent;
            fm.descent = fontMetricsInt.descent;
            fm.top = fontMetricsInt.top;
            fm.bottom = fontMetricsInt.bottom;
        }
        return (int) fMeasureText;
    }

    @NotNull
    public final String getUrl() {
        return this.url;
    }
}
