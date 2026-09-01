package defpackage;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RadialGradient;
import android.graphics.RectF;
import android.graphics.Region;
import android.graphics.Shader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d4c extends i4c {
    public final f4c c;

    public d4c(f4c f4cVar) {
        this.c = f4cVar;
    }

    @Override // defpackage.i4c
    public final void a(Matrix matrix, k3c k3cVar, int i, Canvas canvas) {
        RectF rectF = f4c.h;
        f4c f4cVar = this.c;
        float f = f4cVar.f;
        float f2 = f4cVar.g;
        RectF rectF2 = new RectF(f4cVar.b, f4cVar.c, f4cVar.d, f4cVar.e);
        Paint paint = k3cVar.b;
        boolean z = f2 < 0.0f;
        Path path = k3cVar.g;
        int[] iArr = k3c.k;
        if (z) {
            iArr[0] = 0;
            iArr[1] = k3cVar.f;
            iArr[2] = k3cVar.e;
            iArr[3] = k3cVar.d;
        } else {
            path.rewind();
            path.moveTo(rectF2.centerX(), rectF2.centerY());
            path.arcTo(rectF2, f, f2);
            path.close();
            float f3 = -i;
            rectF2.inset(f3, f3);
            iArr[0] = 0;
            iArr[1] = k3cVar.d;
            iArr[2] = k3cVar.e;
            iArr[3] = k3cVar.f;
        }
        float fWidth = rectF2.width() / 2.0f;
        if (fWidth <= 0.0f) {
            return;
        }
        float f4 = 1.0f - (i / fWidth);
        float[] fArr = k3c.l;
        fArr[1] = f4;
        fArr[2] = ((1.0f - f4) / 2.0f) + f4;
        paint.setShader(new RadialGradient(rectF2.centerX(), rectF2.centerY(), fWidth, iArr, fArr, Shader.TileMode.CLAMP));
        canvas.save();
        canvas.concat(matrix);
        canvas.scale(1.0f, rectF2.height() / rectF2.width());
        if (!z) {
            canvas.clipPath(path, Region.Op.DIFFERENCE);
            canvas.drawPath(path, k3cVar.h);
        }
        canvas.drawArc(rectF2, f, f2, true, paint);
        canvas.restore();
    }
}
