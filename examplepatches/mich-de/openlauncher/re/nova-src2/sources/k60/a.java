package k60;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.text.Layout;
import android.text.style.LeadingMarginSpan;
import b.c0;
import p6.p0;

/* loaded from: classes4.dex */
public final class a implements LeadingMarginSpan {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f71153a;

    /* renamed from: b, reason: collision with root package name */
    public final i60.f f71154b;

    /* renamed from: c, reason: collision with root package name */
    public final Rect f71155c;

    /* renamed from: d, reason: collision with root package name */
    public final Paint f71156d;

    public a(i60.f fVar, int i5) {
        this.f71153a = i5;
        switch (i5) {
            case 1:
                this.f71155c = g.f71172a;
                this.f71156d = g.f71174c;
                this.f71154b = fVar;
                break;
            default:
                this.f71155c = g.f71172a;
                this.f71156d = g.f71174c;
                this.f71154b = fVar;
                break;
        }
    }

    @Override // android.text.style.LeadingMarginSpan
    public final void drawLeadingMargin(Canvas canvas, Paint paint, int i5, int i11, int i12, int i13, int i14, CharSequence charSequence, int i15, int i16, boolean z11, Layout layout) {
        int width;
        switch (this.f71153a) {
            case 0:
                i60.f fVar = this.f71154b;
                int i17 = fVar.f61428b;
                if (i17 == 0) {
                    i17 = (int) ((fVar.f61427a * 0.25f) + 0.5f);
                }
                Paint paint2 = this.f71156d;
                paint2.set(paint);
                fVar.getClass();
                int iC = p0.c(paint2.getColor(), 25);
                paint2.setStyle(Paint.Style.FILL);
                paint2.setColor(iC);
                int i18 = i11 * i17;
                int i19 = i5 + i18;
                int i21 = i18 + i19;
                int iMin = Math.min(i19, i21);
                int iMax = Math.max(i19, i21);
                Rect rect = this.f71155c;
                rect.set(iMin, i12, iMax, i14);
                canvas.drawRect(rect, paint2);
                break;
            default:
                int iC2 = c0.c(i14, i12, 2, i12);
                Paint paint3 = this.f71156d;
                paint3.set(paint);
                i60.f fVar2 = this.f71154b;
                fVar2.getClass();
                paint3.setColor(p0.c(paint3.getColor(), 25));
                paint3.setStyle(Paint.Style.FILL);
                int i22 = fVar2.f61434h;
                if (i22 >= 0) {
                    paint3.setStrokeWidth(i22);
                }
                int strokeWidth = (int) ((((int) (paint3.getStrokeWidth() + 0.5f)) / 2.0f) + 0.5f);
                if (i11 > 0) {
                    width = canvas.getWidth();
                } else {
                    width = i5;
                    i5 -= canvas.getWidth();
                }
                int i23 = iC2 - strokeWidth;
                int i24 = iC2 + strokeWidth;
                Rect rect2 = this.f71155c;
                rect2.set(i5, i23, width, i24);
                canvas.drawRect(rect2, paint3);
                break;
        }
    }

    @Override // android.text.style.LeadingMarginSpan
    public final int getLeadingMargin(boolean z11) {
        switch (this.f71153a) {
            case 0:
                return this.f71154b.f61427a;
            default:
                return 0;
        }
    }
}
