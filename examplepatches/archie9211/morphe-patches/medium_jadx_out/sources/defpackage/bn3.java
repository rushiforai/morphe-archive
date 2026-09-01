package defpackage;

import android.graphics.Color;
import android.graphics.Matrix;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bn3 {
    public float a;
    public float b;
    public float c;
    public int d;
    public float[] e = null;

    public bn3(bn3 bn3Var) {
        this.a = 0.0f;
        this.b = 0.0f;
        this.c = 0.0f;
        this.d = 0;
        this.a = bn3Var.a;
        this.b = bn3Var.b;
        this.c = bn3Var.c;
        this.d = bn3Var.d;
    }

    public final void a(int i, ao6 ao6Var) {
        int iAlpha = Color.alpha(this.d);
        int iC = a18.c(i);
        Matrix matrix = gpe.a;
        int i2 = (int) ((((iAlpha / 255.0f) * iC) / 255.0f) * 255.0f);
        if (i2 <= 0) {
            ao6Var.clearShadowLayer();
        } else {
            ao6Var.setShadowLayer(Math.max(this.a, Float.MIN_VALUE), this.b, this.c, Color.argb(i2, Color.red(this.d), Color.green(this.d), Color.blue(this.d)));
        }
    }

    public final void b(int i) {
        this.d = Color.argb(Math.round((a18.c(i) * Color.alpha(this.d)) / 255.0f), Color.red(this.d), Color.green(this.d), Color.blue(this.d));
    }

    public final void c(Matrix matrix) {
        float[] fArr = this.e;
        if (fArr == null) {
            fArr = new float[2];
            this.e = fArr;
        }
        fArr[0] = this.b;
        fArr[1] = this.c;
        matrix.mapVectors(fArr);
        float[] fArr2 = this.e;
        this.b = fArr2[0];
        this.c = fArr2[1];
        this.a = matrix.mapRadius(this.a);
    }
}
