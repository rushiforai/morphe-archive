package bk;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RadialGradient;
import android.graphics.RectF;
import android.graphics.Region;
import android.graphics.Shader;

/* loaded from: classes3.dex */
public final class n extends s {

    /* renamed from: c, reason: collision with root package name */
    public final p f18030c;

    public n(p pVar) {
        this.f18030c = pVar;
    }

    @Override // bk.s
    public final void a(Matrix matrix, ak.a aVar, int i5, Canvas canvas) {
        float f11;
        p pVar = this.f18030c;
        float f12 = pVar.f18039f;
        float f13 = pVar.f18040g;
        RectF rectF = new RectF(pVar.f18035b, pVar.f18036c, pVar.f18037d, pVar.f18038e);
        Paint paint = aVar.f13529b;
        boolean z11 = f13 < 0.0f;
        Path path = aVar.f13534g;
        int[] iArr = ak.a.f13526k;
        if (z11) {
            iArr[0] = 0;
            iArr[1] = aVar.f13533f;
            iArr[2] = aVar.f13532e;
            iArr[3] = aVar.f13531d;
            f11 = 0.0f;
        } else {
            path.rewind();
            f11 = 0.0f;
            path.moveTo(rectF.centerX(), rectF.centerY());
            path.arcTo(rectF, f12, f13);
            path.close();
            float f14 = -i5;
            rectF.inset(f14, f14);
            iArr[0] = 0;
            iArr[1] = aVar.f13531d;
            iArr[2] = aVar.f13532e;
            iArr[3] = aVar.f13533f;
        }
        float fWidth = rectF.width() / 2.0f;
        if (fWidth <= f11) {
            return;
        }
        float f15 = 1.0f - (i5 / fWidth);
        float fZ = a2.c.z(1.0f, f15, 2.0f, f15);
        float[] fArr = ak.a.f13527l;
        fArr[1] = f15;
        fArr[2] = fZ;
        paint.setShader(new RadialGradient(rectF.centerX(), rectF.centerY(), fWidth, iArr, fArr, Shader.TileMode.CLAMP));
        canvas.save();
        canvas.concat(matrix);
        canvas.scale(1.0f, rectF.height() / rectF.width());
        if (!z11) {
            canvas.clipPath(path, Region.Op.DIFFERENCE);
            canvas.drawPath(path, aVar.f13535h);
        }
        canvas.drawArc(rectF, f12, f13, true, paint);
        canvas.restore();
    }
}
