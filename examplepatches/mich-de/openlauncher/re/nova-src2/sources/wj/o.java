package wj;

import ai.u1;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.RectF;
import com.google.android.gms.internal.consent_sdk.k0;

/* loaded from: classes3.dex */
public final class o extends u1 {

    /* renamed from: b, reason: collision with root package name */
    public float f94465b;

    /* renamed from: c, reason: collision with root package name */
    public float f94466c;

    /* renamed from: d, reason: collision with root package name */
    public float f94467d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f94468e;

    /* renamed from: f, reason: collision with root package name */
    public float f94469f;

    public final void E(Canvas canvas, Paint paint, float f11, float f12, int i5, int i11, int i12) {
        float f13;
        float fE = v4.a.e(f11, 0.0f, 1.0f);
        float fE2 = v4.a.e(f12, 0.0f, 1.0f);
        float fR = ph.a.r(1.0f - this.f94469f, 1.0f, fE);
        float fR2 = ph.a.r(1.0f - this.f94469f, 1.0f, fE2);
        int iE = (int) ((v4.a.e(fR, 0.0f, 0.01f) * i11) / 0.01f);
        float fE3 = 1.0f - v4.a.e(fR2, 0.99f, 1.0f);
        float f14 = this.f94465b;
        int i13 = (int) ((fR * f14) + iE);
        int i14 = (int) ((fR2 * f14) - ((int) ((fE3 * i12) / 0.01f)));
        float f15 = (-f14) / 2.0f;
        if (i13 <= i14) {
            float f16 = this.f94467d;
            float f17 = i13 + f16;
            float f18 = i14 - f16;
            float f19 = f16 * 2.0f;
            paint.setColor(i5);
            paint.setAntiAlias(true);
            paint.setStrokeWidth(this.f94466c);
            if (f17 >= f18) {
                F(canvas, paint, new PointF(f17 + f15, 0.0f), new PointF(f18 + f15, 0.0f), f19, this.f94466c);
                return;
            }
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(this.f94468e ? Paint.Cap.ROUND : Paint.Cap.BUTT);
            float f21 = f17 + f15;
            float f22 = f18 + f15;
            canvas.drawLine(f21, 0.0f, f22, 0.0f, paint);
            if (this.f94468e || this.f94467d <= 0.0f) {
                return;
            }
            paint.setStyle(Paint.Style.FILL);
            if (f17 > 0.0f) {
                f13 = f19;
                F(canvas, paint, new PointF(f21, 0.0f), null, f13, this.f94466c);
            } else {
                f13 = f19;
            }
            if (f18 < this.f94465b) {
                F(canvas, paint, new PointF(f22, 0.0f), null, f13, this.f94466c);
            }
        }
    }

    public final void F(Canvas canvas, Paint paint, PointF pointF, PointF pointF2, float f11, float f12) {
        float fMin = Math.min(f12, this.f94466c);
        float f13 = f11 / 2.0f;
        float fMin2 = Math.min(f13, (this.f94467d * fMin) / this.f94466c);
        RectF rectF = new RectF((-f11) / 2.0f, (-fMin) / 2.0f, f13, fMin / 2.0f);
        paint.setStyle(Paint.Style.FILL);
        canvas.save();
        if (pointF2 != null) {
            canvas.translate(pointF2.x, pointF2.y);
            Path path = new Path();
            path.addRoundRect(rectF, fMin2, fMin2, Path.Direction.CCW);
            canvas.clipPath(path);
            canvas.translate(-pointF2.x, -pointF2.y);
        }
        canvas.translate(pointF.x, pointF.y);
        canvas.drawRoundRect(rectF, fMin2, fMin2, paint);
        canvas.restore();
    }

    @Override // ai.u1
    public final void g(Canvas canvas, Rect rect, float f11, boolean z11, boolean z12) {
        this.f94465b = rect.width();
        s sVar = (s) ((d) this.f13368a);
        float f12 = sVar.f94413a;
        canvas.translate((rect.width() / 2.0f) + rect.left, Math.max(0.0f, (rect.height() - f12) / 2.0f) + (rect.height() / 2.0f) + rect.top);
        if (sVar.f94490j) {
            canvas.scale(-1.0f, 1.0f);
        }
        float f13 = this.f94465b / 2.0f;
        float f14 = f12 / 2.0f;
        canvas.clipRect(-f13, -f14, f13, f14);
        int i5 = sVar.f94413a;
        this.f94468e = i5 / 2 == sVar.f94414b;
        this.f94466c = i5 * f11;
        this.f94467d = Math.min(i5 / 2, r6) * f11;
        if (z11 || z12) {
            if ((z11 && sVar.f94417e == 2) || (z12 && sVar.f94418f == 1)) {
                canvas.scale(1.0f, -1.0f);
            }
            if (z11 || (z12 && sVar.f94418f != 3)) {
                canvas.translate(0.0f, ((1.0f - f11) * sVar.f94413a) / 2.0f);
            }
        }
        if (z12 && sVar.f94418f == 3) {
            this.f94469f = f11;
        } else {
            this.f94469f = 1.0f;
        }
    }

    @Override // ai.u1
    public final void j(Canvas canvas, Paint paint, int i5, int i11) {
        int iH = k0.h(i5, i11);
        s sVar = (s) ((d) this.f13368a);
        if (sVar.f94491k <= 0 || iH == 0) {
            return;
        }
        paint.setStyle(Paint.Style.FILL);
        paint.setColor(iH);
        PointF pointF = new PointF((this.f94465b / 2.0f) - (this.f94466c / 2.0f), 0.0f);
        int i12 = sVar.f94491k;
        F(canvas, paint, pointF, null, i12, i12);
    }

    @Override // ai.u1
    public final void k(Canvas canvas, Paint paint, m mVar, int i5) {
        int iH = k0.h(mVar.f94461c, i5);
        float f11 = mVar.f94459a;
        float f12 = mVar.f94460b;
        int i11 = mVar.f94462d;
        E(canvas, paint, f11, f12, iH, i11, i11);
    }

    @Override // ai.u1
    public final void l(Canvas canvas, Paint paint, float f11, float f12, int i5, int i11, int i12) {
        E(canvas, paint, f11, f12, k0.h(i5, i11), i12, i12);
    }

    @Override // ai.u1
    public final int p() {
        return ((s) ((d) this.f13368a)).f94413a;
    }

    @Override // ai.u1
    public final int q() {
        return -1;
    }
}
