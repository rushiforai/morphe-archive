package k60;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.text.Layout;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.style.LeadingMarginSpan;
import android.text.style.MetricAffectingSpan;
import java.util.Arrays;
import java.util.Locale;
import p6.p0;

/* loaded from: classes4.dex */
public final class f extends MetricAffectingSpan implements LeadingMarginSpan {

    /* renamed from: a, reason: collision with root package name */
    public final i60.f f71168a;

    /* renamed from: b, reason: collision with root package name */
    public final Rect f71169b = g.f71172a;

    /* renamed from: c, reason: collision with root package name */
    public final Paint f71170c = g.f71174c;

    /* renamed from: d, reason: collision with root package name */
    public final int f71171d;

    public f(i60.f fVar, int i5) {
        this.f71168a = fVar;
        this.f71171d = i5;
    }

    public final void a(TextPaint textPaint) {
        this.f71168a.getClass();
        textPaint.setFakeBoldText(true);
        int i5 = this.f71171d;
        float[] fArr = i60.f.f61426i;
        if (6 >= i5) {
            textPaint.setTextSize(textPaint.getTextSize() * fArr[i5 - 1]);
            return;
        }
        Locale locale = Locale.US;
        throw new IllegalStateException("Supplied heading level: " + i5 + " is invalid, where configured heading sizes are: `" + Arrays.toString(fArr) + "`");
    }

    @Override // android.text.style.LeadingMarginSpan
    public final void drawLeadingMargin(Canvas canvas, Paint paint, int i5, int i11, int i12, int i13, int i14, CharSequence charSequence, int i15, int i16, boolean z11, Layout layout) {
        int width;
        int i17 = this.f71171d;
        if ((i17 == 1 || i17 == 2) && (charSequence instanceof Spanned) && ((Spanned) charSequence).getSpanEnd(this) == i16) {
            Paint paint2 = this.f71170c;
            paint2.set(paint);
            i60.f fVar = this.f71168a;
            fVar.getClass();
            paint2.setColor(p0.c(paint2.getColor(), 75));
            paint2.setStyle(Paint.Style.FILL);
            int i18 = fVar.f61433g;
            if (i18 >= 0) {
                paint2.setStrokeWidth(i18);
            }
            float strokeWidth = paint2.getStrokeWidth();
            if (strokeWidth > 0.0f) {
                int i19 = (int) ((i14 - strokeWidth) + 0.5f);
                if (i11 > 0) {
                    width = canvas.getWidth();
                } else {
                    width = i5;
                    i5 -= canvas.getWidth();
                }
                Rect rect = this.f71169b;
                rect.set(i5, i19, width, i14);
                canvas.drawRect(rect, paint2);
            }
        }
    }

    @Override // android.text.style.LeadingMarginSpan
    public final int getLeadingMargin(boolean z11) {
        return 0;
    }

    @Override // android.text.style.CharacterStyle
    public final void updateDrawState(TextPaint textPaint) {
        a(textPaint);
    }

    @Override // android.text.style.MetricAffectingSpan
    public final void updateMeasureState(TextPaint textPaint) {
        a(textPaint);
    }
}
