package defpackage;

import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e4c extends i4c {
    public final g4c c;
    public final float d;
    public final float e;

    public e4c(g4c g4cVar, float f, float f2) {
        this.c = g4cVar;
        this.d = f;
        this.e = f2;
    }

    @Override // defpackage.i4c
    public final void a(Matrix matrix, k3c k3cVar, int i, Canvas canvas) {
        g4c g4cVar = this.c;
        float f = g4cVar.c;
        float f2 = this.e;
        float f3 = g4cVar.b;
        float f4 = this.d;
        RectF rectF = new RectF(0.0f, 0.0f, (float) Math.hypot(f - f2, f3 - f4), 0.0f);
        Matrix matrix2 = this.a;
        matrix2.set(matrix);
        matrix2.preTranslate(f4, f2);
        matrix2.preRotate(b());
        k3cVar.getClass();
        rectF.bottom += i;
        rectF.offset(0.0f, -i);
        int i2 = k3cVar.f;
        int[] iArr = k3c.i;
        iArr[0] = i2;
        iArr[1] = k3cVar.e;
        iArr[2] = k3cVar.d;
        Paint paint = k3cVar.c;
        float f5 = rectF.left;
        paint.setShader(new LinearGradient(f5, rectF.top, f5, rectF.bottom, iArr, k3c.j, Shader.TileMode.CLAMP));
        canvas.save();
        canvas.concat(matrix2);
        canvas.drawRect(rectF, paint);
        canvas.restore();
    }

    public final float b() {
        g4c g4cVar = this.c;
        return (float) Math.toDegrees(Math.atan((g4cVar.c - this.e) / (g4cVar.b - this.d)));
    }
}
