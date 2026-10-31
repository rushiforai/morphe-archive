package com.teslacoilsw.launcher.launcher3.pageindicators;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View;
import com.android.launcher3.pageindicators.PageIndicatorDots;

/* loaded from: classes.dex */
public class VerticalPageIndicatorDots extends PageIndicatorDots {

    /* renamed from: l, reason: collision with root package name */
    public static final RectF f45861l = new RectF();

    public VerticalPageIndicatorDots(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
    }

    @Override // com.android.launcher3.pageindicators.PageIndicatorDots
    public final RectF e() {
        float f11 = this.f21206f;
        float f12 = (int) f11;
        float f13 = f11 - f12;
        float f14 = this.f21202b;
        float f15 = 3.0f * f14;
        RectF rectF = f45861l;
        rectF.left = (getWidth() * 0.5f) - f14;
        rectF.right = (getWidth() * 0.5f) + f14;
        float height = (f12 * f15) + (((getHeight() - (this.f21204d * f15)) + f14) / 2.0f);
        rectF.top = height;
        float f16 = (f14 * 2.0f) + height;
        rectF.bottom = f16;
        if (f13 < 0.5f) {
            rectF.bottom = (f13 * f15 * 2.0f) + f16;
            return rectF;
        }
        rectF.bottom = f16 + f15;
        rectF.top = ((f13 - 0.5f) * f15 * 2.0f) + height;
        return rectF;
    }

    @Override // com.android.launcher3.pageindicators.PageIndicatorDots, android.view.View
    public final void onDraw(Canvas canvas) {
        float f11 = this.f21202b;
        float f12 = 3.0f * f11;
        float height = (((getHeight() - (this.f21204d * f12)) + f11) / 2.0f) + f11;
        float width = getWidth() / 2;
        float[] fArr = this.f21209i;
        int i5 = 0;
        Paint paint = this.f21201a;
        if (fArr != null) {
            if (this.f21203c) {
                height = getHeight() - height;
                f12 = -f12;
            }
            while (i5 < this.f21209i.length) {
                paint.setAlpha(i5 == this.f21205e ? 255 : 128);
                canvas.drawCircle(width, height, this.f21209i[i5] * f11, paint);
                height += f12;
                i5++;
            }
            return;
        }
        paint.setAlpha(128);
        while (i5 < this.f21204d) {
            float f13 = this.f21206f;
            if (i5 != ((int) f13) || f13 != ((int) f13)) {
                canvas.drawCircle(width, height, f11, paint);
            }
            height += f12;
            i5++;
        }
        paint.setAlpha(255);
        canvas.drawRoundRect(e(), f11, f11, paint);
    }

    @Override // com.android.launcher3.pageindicators.PageIndicatorDots, android.view.View
    public final void onMeasure(int i5, int i11) {
        int mode = View.MeasureSpec.getMode(i5);
        float f11 = this.f21202b;
        setMeasuredDimension(mode == 1073741824 ? View.MeasureSpec.getSize(i5) : (int) (((this.f21204d * 3) + 2) * f11), View.MeasureSpec.getMode(i11) == 1073741824 ? View.MeasureSpec.getSize(i11) : (int) (f11 * 4.0f));
    }
}
