package k60;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.text.Layout;
import android.text.TextPaint;
import android.text.style.LeadingMarginSpan;
import android.text.style.MetricAffectingSpan;
import p6.p0;

/* loaded from: classes4.dex */
public final class c extends MetricAffectingSpan implements LeadingMarginSpan {

    /* renamed from: a, reason: collision with root package name */
    public final i60.f f71162a;

    /* renamed from: b, reason: collision with root package name */
    public final Rect f71163b = g.f71172a;

    /* renamed from: c, reason: collision with root package name */
    public final Paint f71164c = g.f71174c;

    public c(i60.f fVar) {
        this.f71162a = fVar;
    }

    @Override // android.text.style.LeadingMarginSpan
    public final void drawLeadingMargin(Canvas canvas, Paint paint, int i5, int i11, int i12, int i13, int i14, CharSequence charSequence, int i15, int i16, boolean z11, Layout layout) {
        int width;
        Paint.Style style = Paint.Style.FILL;
        Paint paint2 = this.f71164c;
        paint2.setStyle(style);
        int iC = this.f71162a.f61431e;
        if (iC == 0) {
            iC = p0.c(paint.getColor(), 25);
        }
        paint2.setColor(iC);
        if (i11 > 0) {
            width = canvas.getWidth();
        } else {
            i5 -= canvas.getWidth();
            width = i5;
        }
        Rect rect = this.f71163b;
        rect.set(i5, i12, width, i14);
        canvas.drawRect(rect, paint2);
    }

    @Override // android.text.style.LeadingMarginSpan
    public final int getLeadingMargin(boolean z11) {
        return this.f71162a.f61432f;
    }

    @Override // android.text.style.CharacterStyle
    public final void updateDrawState(TextPaint textPaint) {
        int i5 = this.f71162a.f61430d;
        if (i5 != 0) {
            textPaint.setColor(i5);
        }
        textPaint.setTypeface(Typeface.MONOSPACE);
        textPaint.setTextSize(textPaint.getTextSize() * 0.87f);
    }

    @Override // android.text.style.MetricAffectingSpan
    public final void updateMeasureState(TextPaint textPaint) {
        int i5 = this.f71162a.f61430d;
        if (i5 != 0) {
            textPaint.setColor(i5);
        }
        textPaint.setTypeface(Typeface.MONOSPACE);
        textPaint.setTextSize(textPaint.getTextSize() * 0.87f);
    }
}
