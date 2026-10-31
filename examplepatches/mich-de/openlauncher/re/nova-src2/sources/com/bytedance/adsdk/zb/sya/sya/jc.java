package com.bytedance.adsdk.zb.sya.sya;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Path;
import android.graphics.RectF;
import android.view.View;

/* loaded from: classes2.dex */
public class jc extends dj {
    private Path fby;

    /* renamed from: jc, reason: collision with root package name */
    private int f22959jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f22960jw;

    public jc(com.bytedance.adsdk.zb.jw jwVar, lud ludVar, Context context) {
        super(jwVar, ludVar);
        this.fby = null;
        this.f22960jw = -1;
        this.f22959jc = -1;
        if (((dj) this).f22953ul != null) {
            float fYcx = com.bytedance.adsdk.zb.lt.lt.ycx();
            this.f22960jw = (int) (((dj) this).f22953ul.ycx() * fYcx);
            this.f22959jc = (int) (((dj) this).f22953ul.zb() * fYcx);
            RectF rectF = new RectF();
            rectF.set(0.0f, 0.0f, this.f22960jw, this.f22959jc);
            Path path = new Path();
            this.fby = path;
            float f11 = fYcx * 40.0f;
            path.addRoundRect(rectF, f11, f11, Path.Direction.CW);
        }
    }

    private static void ycx(View view, int i5, int i11) {
        view.layout(0, 0, i5, i11);
        view.measure(View.MeasureSpec.makeMeasureSpec(i5, 1073741824), View.MeasureSpec.makeMeasureSpec(i11, 1073741824));
        view.layout(0, 0, view.getMeasuredWidth(), view.getMeasuredHeight());
    }

    @Override // com.bytedance.adsdk.zb.sya.sya.dj, com.bytedance.adsdk.zb.sya.sya.ycx
    public void zb(Canvas canvas, Matrix matrix, int i5) {
        View viewYcx = this.f23013zb.ycx();
        if (this.f22960jw <= 0 || viewYcx == null) {
            return;
        }
        canvas.save();
        canvas.concat(matrix);
        ycx(i5);
        float fLt = lt();
        ycx(viewYcx, this.f22960jw, this.f22959jc);
        viewYcx.setAlpha(fLt);
        canvas.clipPath(this.fby);
        viewYcx.draw(canvas);
        canvas.restore();
    }
}
