package k60;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.text.Layout;
import android.text.Spanned;
import android.text.style.LeadingMarginSpan;

/* loaded from: classes4.dex */
public final class h implements LeadingMarginSpan {

    /* renamed from: a, reason: collision with root package name */
    public final i60.f f71175a;

    /* renamed from: b, reason: collision with root package name */
    public final String f71176b;

    /* renamed from: c, reason: collision with root package name */
    public final Paint f71177c = g.f71174c;

    /* renamed from: d, reason: collision with root package name */
    public int f71178d;

    public h(i60.f fVar, String str) {
        this.f71175a = fVar;
        this.f71176b = str;
    }

    @Override // android.text.style.LeadingMarginSpan
    public final void drawLeadingMargin(Canvas canvas, Paint paint, int i5, int i11, int i12, int i13, int i14, CharSequence charSequence, int i15, int i16, boolean z11, Layout layout) {
        int i17;
        if (z11 && (charSequence instanceof Spanned) && ((Spanned) charSequence).getSpanStart(this) == i15) {
            Paint paint2 = this.f71177c;
            paint2.set(paint);
            i60.f fVar = this.f71175a;
            fVar.getClass();
            paint2.setColor(paint2.getColor());
            int i18 = fVar.f61429c;
            if (i18 != 0) {
                paint2.setStrokeWidth(i18);
            }
            String str = this.f71176b;
            int iMeasureText = (int) (paint2.measureText(str) + 0.5f);
            int i19 = fVar.f61427a;
            if (iMeasureText > i19) {
                this.f71178d = iMeasureText;
                i19 = iMeasureText;
            } else {
                this.f71178d = 0;
            }
            if (i11 > 0) {
                i17 = ((i19 * i11) + i5) - iMeasureText;
            } else {
                i17 = (i19 - iMeasureText) + (i11 * i19) + i5;
            }
            canvas.drawText(str, i17, i13, paint2);
        }
    }

    @Override // android.text.style.LeadingMarginSpan
    public final int getLeadingMargin(boolean z11) {
        return Math.max(this.f71178d, this.f71175a.f61427a);
    }
}
