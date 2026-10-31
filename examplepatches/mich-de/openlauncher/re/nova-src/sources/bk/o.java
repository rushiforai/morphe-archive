package bk;

import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;

/* loaded from: classes3.dex */
public final class o extends s {

    /* renamed from: c, reason: collision with root package name */
    public final q f18031c;

    /* renamed from: d, reason: collision with root package name */
    public final float f18032d;

    /* renamed from: e, reason: collision with root package name */
    public final float f18033e;

    public o(q qVar, float f11, float f12) {
        this.f18031c = qVar;
        this.f18032d = f11;
        this.f18033e = f12;
    }

    @Override // bk.s
    public final void a(Matrix matrix, ak.a aVar, int i5, Canvas canvas) {
        q qVar = this.f18031c;
        float f11 = qVar.f18042c;
        float f12 = this.f18033e;
        float f13 = qVar.f18041b;
        float f14 = this.f18032d;
        RectF rectF = new RectF(0.0f, 0.0f, (float) Math.hypot(f11 - f12, f13 - f14), 0.0f);
        Matrix matrix2 = this.f18045a;
        matrix2.set(matrix);
        matrix2.preTranslate(f14, f12);
        matrix2.preRotate(b());
        aVar.getClass();
        rectF.bottom += i5;
        rectF.offset(0.0f, -i5);
        int i11 = aVar.f13533f;
        int[] iArr = ak.a.f13524i;
        iArr[0] = i11;
        iArr[1] = aVar.f13532e;
        iArr[2] = aVar.f13531d;
        Paint paint = aVar.f13530c;
        float f15 = rectF.left;
        paint.setShader(new LinearGradient(f15, rectF.top, f15, rectF.bottom, iArr, ak.a.f13525j, Shader.TileMode.CLAMP));
        canvas.save();
        canvas.concat(matrix2);
        canvas.drawRect(rectF, paint);
        canvas.restore();
    }

    public final float b() {
        q qVar = this.f18031c;
        return (float) Math.toDegrees(Math.atan((qVar.f18042c - this.f18033e) / (qVar.f18041b - this.f18032d)));
    }
}
