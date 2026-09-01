package defpackage;

import android.graphics.Path;
import android.graphics.PathMeasure;
import android.graphics.PointF;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n59 extends vk6 {
    public final PointF h;
    public final float[] i;
    public final float[] j;
    public final PathMeasure k;
    public m59 l;

    public n59(ArrayList arrayList) {
        super(arrayList);
        this.h = new PointF();
        this.i = new float[2];
        this.j = new float[2];
        this.k = new PathMeasure();
    }

    @Override // defpackage.rn0
    public final Object e(uk6 uk6Var, float f) {
        m59 m59Var = (m59) uk6Var;
        Path path = m59Var.q;
        if (path == null) {
            return (PointF) uk6Var.b;
        }
        m59 m59Var2 = this.l;
        PathMeasure pathMeasure = this.k;
        if (m59Var2 != m59Var) {
            pathMeasure.setPath(path, false);
            this.l = m59Var;
        }
        float length = pathMeasure.getLength();
        float f2 = f * length;
        float[] fArr = this.i;
        float[] fArr2 = this.j;
        pathMeasure.getPosTan(f2, fArr, fArr2);
        float f3 = fArr[0];
        float f4 = fArr[1];
        PointF pointF = this.h;
        pointF.set(f3, f4);
        if (f2 < 0.0f) {
            pointF.offset(fArr2[0] * f2, fArr2[1] * f2);
            return pointF;
        }
        if (f2 > length) {
            float f5 = f2 - length;
            pointF.offset(fArr2[0] * f5, fArr2[1] * f5);
        }
        return pointF;
    }
}
