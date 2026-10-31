package i2;

import android.graphics.Path;
import android.graphics.RectF;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public interface n0 {
    static void a(n0 n0Var, h2.d dVar) {
        m0[] m0VarArr = m0.f61128a;
        h hVar = (h) n0Var;
        if (hVar.f61118b == null) {
            hVar.f61118b = new RectF();
        }
        RectF rectF = hVar.f61118b;
        Intrinsics.d(rectF);
        float f11 = dVar.f59022a;
        long j11 = dVar.f59029h;
        long j12 = dVar.f59028g;
        long j13 = dVar.f59027f;
        long j14 = dVar.f59026e;
        rectF.set(f11, dVar.f59023b, dVar.f59024c, dVar.f59025d);
        if (hVar.f61119c == null) {
            hVar.f61119c = new float[8];
        }
        float[] fArr = hVar.f61119c;
        Intrinsics.d(fArr);
        fArr[0] = Float.intBitsToFloat((int) (j14 >> 32));
        fArr[1] = Float.intBitsToFloat((int) (j14 & 4294967295L));
        fArr[2] = Float.intBitsToFloat((int) (j13 >> 32));
        fArr[3] = Float.intBitsToFloat((int) (j13 & 4294967295L));
        fArr[4] = Float.intBitsToFloat((int) (j12 >> 32));
        fArr[5] = Float.intBitsToFloat((int) (j12 & 4294967295L));
        fArr[6] = Float.intBitsToFloat((int) (j11 >> 32));
        fArr[7] = Float.intBitsToFloat((int) (j11 & 4294967295L));
        Path path = hVar.f61117a;
        RectF rectF2 = hVar.f61118b;
        Intrinsics.d(rectF2);
        float[] fArr2 = hVar.f61119c;
        Intrinsics.d(fArr2);
        path.addRoundRect(rectF2, fArr2, Path.Direction.CCW);
    }
}
