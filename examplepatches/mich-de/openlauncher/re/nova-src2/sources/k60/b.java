package k60;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.text.Layout;
import android.text.Spanned;
import android.text.style.LeadingMarginSpan;

/* loaded from: classes4.dex */
public final class b implements LeadingMarginSpan {

    /* renamed from: a, reason: collision with root package name */
    public final i60.f f71157a;

    /* renamed from: b, reason: collision with root package name */
    public final Paint f71158b = g.f71174c;

    /* renamed from: c, reason: collision with root package name */
    public final RectF f71159c = g.f71173b;

    /* renamed from: d, reason: collision with root package name */
    public final Rect f71160d = g.f71172a;

    /* renamed from: e, reason: collision with root package name */
    public final int f71161e;

    public b(i60.f fVar, int i5) {
        this.f71157a = fVar;
        this.f71161e = i5;
    }

    @Override // android.text.style.LeadingMarginSpan
    public final void drawLeadingMargin(Canvas canvas, Paint paint, int i5, int i11, int i12, int i13, int i14, CharSequence charSequence, int i15, int i16, boolean z11, Layout layout) {
        RectF rectF = this.f71159c;
        Rect rect = this.f71160d;
        if (z11 && (charSequence instanceof Spanned) && ((Spanned) charSequence).getSpanStart(this) == i15) {
            Paint paint2 = this.f71158b;
            paint2.set(paint);
            i60.f fVar = this.f71157a;
            fVar.getClass();
            int i17 = fVar.f61427a;
            paint2.setColor(paint2.getColor());
            int i18 = fVar.f61429c;
            if (i18 != 0) {
                paint2.setStrokeWidth(i18);
            }
            int iSave = canvas.save();
            try {
                int iMin = Math.min(i17, (int) ((paint2.descent() - paint2.ascent()) + 0.5f)) / 2;
                int i19 = (i17 - iMin) / 2;
                if (i11 <= 0) {
                    i5 -= i17;
                }
                int i21 = i5 + i19;
                int i22 = i21 + iMin;
                int iDescent = (i13 + ((int) (((paint2.descent() + paint2.ascent()) / 2.0f) + 0.5f))) - (iMin / 2);
                int i23 = iMin + iDescent;
                int i24 = this.f71161e;
                if (i24 == 0 || i24 == 1) {
                    rectF.set(i21, iDescent, i22, i23);
                    paint2.setStyle(i24 == 0 ? Paint.Style.FILL : Paint.Style.STROKE);
                    canvas.drawOval(rectF, paint2);
                } else {
                    rect.set(i21, iDescent, i22, i23);
                    paint2.setStyle(Paint.Style.FILL);
                    canvas.drawRect(rect, paint2);
                }
                canvas.restoreToCount(iSave);
            } catch (Throwable th2) {
                canvas.restoreToCount(iSave);
                throw th2;
            }
        }
    }

    @Override // android.text.style.LeadingMarginSpan
    public final int getLeadingMargin(boolean z11) {
        return this.f71157a.f61427a;
    }
}
