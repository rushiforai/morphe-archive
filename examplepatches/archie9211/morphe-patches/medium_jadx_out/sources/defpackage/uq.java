package defpackage;

import android.graphics.Paint;
import android.graphics.PorterDuffXfermode;
import android.graphics.Shader;
import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uq {
    public final Paint a;
    public int b = 3;
    public Shader c;
    public bs0 d;

    public uq(Paint paint) {
        this.a = paint;
    }

    public final int a() {
        Paint.Cap strokeCap = this.a.getStrokeCap();
        int i = strokeCap == null ? -1 : vq.a[strokeCap.ordinal()];
        if (i == 1) {
            return 0;
        }
        if (i != 2) {
            return i != 3 ? 0 : 2;
        }
        return 1;
    }

    public final int b() {
        Paint.Join strokeJoin = this.a.getStrokeJoin();
        int i = strokeJoin == null ? -1 : vq.b[strokeJoin.ordinal()];
        if (i == 1) {
            return 0;
        }
        if (i != 2) {
            return i != 3 ? 0 : 1;
        }
        return 2;
    }

    public final void c(float f) {
        this.a.setAlpha((int) Math.rint(f * 255.0f));
    }

    public final void d(int i) {
        if (this.b == i) {
            return;
        }
        this.b = i;
        int i2 = Build.VERSION.SDK_INT;
        Paint paint = this.a;
        if (i2 >= 29) {
            nm.D(paint, i);
        } else {
            paint.setXfermode(new PorterDuffXfermode(nm.M(i)));
        }
    }

    public final void e(long j) {
        this.a.setColor(op8.n0(j));
    }

    public final void f(bs0 bs0Var) {
        this.d = bs0Var;
        this.a.setColorFilter(bs0Var != null ? bs0Var.a : null);
    }

    public final void g(int i) {
        this.a.setFilterBitmap(!(i == 0));
    }

    public final void h(Shader shader) {
        this.c = shader;
        this.a.setShader(shader);
    }

    public final void i(int i) {
        this.a.setStrokeCap(i == 2 ? Paint.Cap.SQUARE : i == 1 ? Paint.Cap.ROUND : i == 0 ? Paint.Cap.BUTT : Paint.Cap.BUTT);
    }

    public final void j(int i) {
        this.a.setStrokeJoin(i == 0 ? Paint.Join.MITER : i == 2 ? Paint.Join.BEVEL : i == 1 ? Paint.Join.ROUND : Paint.Join.MITER);
    }

    public final void k(float f) {
        this.a.setStrokeWidth(f);
    }

    public final void l(int i) {
        this.a.setStyle(i == 1 ? Paint.Style.STROKE : Paint.Style.FILL);
    }
}
