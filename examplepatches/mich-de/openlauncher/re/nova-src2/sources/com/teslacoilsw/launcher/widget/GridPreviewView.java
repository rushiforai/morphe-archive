package com.teslacoilsw.launcher.widget;

import aa.p;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.View;
import w20.e;

/* loaded from: classes4.dex */
public class GridPreviewView extends View {

    /* renamed from: a, reason: collision with root package name */
    public int f46419a;

    /* renamed from: b, reason: collision with root package name */
    public int f46420b;

    /* renamed from: c, reason: collision with root package name */
    public final Paint f46421c;

    public GridPreviewView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        Paint paint = new Paint(1);
        this.f46421c = paint;
        paint.setColor(p.b(context, 2130968934));
        setWillNotDraw(false);
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.f46420b <= 0 || this.f46419a <= 0) {
            return;
        }
        int iK = e.k(2);
        int i5 = this.f46420b + 1;
        int i11 = this.f46419a + 1;
        int iMin = Math.min((getWidth() - (iK * i5)) / this.f46420b, (getHeight() - (iK * i11)) / this.f46419a);
        int width = i5 > 0 ? (getWidth() - (this.f46420b * iMin)) / i5 : 0;
        int height = i11 > 0 ? (getHeight() - (this.f46419a * iMin)) / i11 : 0;
        int width2 = ((getWidth() - (this.f46420b * iMin)) - (i5 * width)) / 2;
        int height2 = ((getHeight() - (this.f46419a * iMin)) - (i11 * height)) / 2;
        float f11 = iMin / 5.0f;
        for (int i12 = 0; i12 < this.f46420b; i12++) {
            for (int i13 = 0; i13 < this.f46419a; i13++) {
                canvas.drawRoundRect(((iMin + width) * i12) + width + width2, ((iMin + height) * i13) + height + height2, r9 + iMin, r10 + iMin, f11, f11, this.f46421c);
            }
        }
    }
}
