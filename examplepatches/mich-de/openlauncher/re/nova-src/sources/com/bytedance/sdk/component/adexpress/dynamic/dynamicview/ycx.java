package com.bytedance.sdk.component.adexpress.dynamic.dynamicview;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;

/* loaded from: classes2.dex */
public class ycx extends zb {
    private final Bitmap sya;

    /* renamed from: zb, reason: collision with root package name */
    private final Rect f23432zb = new Rect();

    /* renamed from: dj, reason: collision with root package name */
    private final Paint f23431dj = new Paint(1);

    public ycx(Bitmap bitmap, zb zbVar) {
        this.sya = bitmap;
        if (zbVar != null) {
            this.ycx = zbVar.ycx;
        }
    }

    @Override // android.graphics.drawable.GradientDrawable, android.graphics.drawable.Drawable
    public void onBoundsChange(Rect rect) {
        super.onBoundsChange(rect);
        int iHeight = rect.height();
        int iWidth = rect.width();
        int width = this.sya.getWidth();
        int height = this.sya.getHeight();
        this.f23432zb.set(0, 0, width, height);
        if (height >= iHeight && width >= iWidth) {
            if (width > iWidth) {
                Rect rect2 = this.f23432zb;
                int i5 = (width - iWidth) / 2;
                rect2.left = i5;
                rect2.right = i5 + iWidth;
            }
            if (height > iHeight) {
                Rect rect3 = this.f23432zb;
                int i11 = (height - iHeight) / 2;
                rect3.top = i11;
                rect3.bottom = i11 + iHeight;
                return;
            }
            return;
        }
        float f11 = iHeight;
        float f12 = f11 * 1.0f;
        float f13 = height;
        float f14 = f12 / f13;
        float f15 = iWidth;
        float f16 = 1.0f * f15;
        float f17 = width;
        if (Math.max(f14, f16 / f17) > f14) {
            int i12 = (int) ((f12 / f15) * f17);
            Rect rect4 = this.f23432zb;
            int i13 = (height - i12) / 2;
            rect4.top = i13;
            rect4.bottom = i13 + i12;
            return;
        }
        int i14 = (int) ((f16 / f11) * f13);
        Rect rect5 = this.f23432zb;
        int i15 = (width - i14) / 2;
        rect5.left = i15;
        rect5.right = i15 + i14;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.zb
    public void ycx(Canvas canvas) {
        canvas.drawBitmap(this.sya, this.f23432zb, getBounds(), this.f23431dj);
    }
}
