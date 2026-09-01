package defpackage;

import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class xz4 {
    public static final float[] a = {8.0f, 10.0f, 12.0f, 14.0f, 18.0f, 20.0f, 24.0f, 30.0f, 100.0f};
    public static volatile xkc b = new xkc(0);
    public static final Object[] c;

    static {
        Object[] objArr = new Object[0];
        c = objArr;
        synchronized (objArr) {
            b.d(115, new yz4(new float[]{8.0f, 10.0f, 12.0f, 14.0f, 18.0f, 20.0f, 24.0f, 30.0f, 100.0f}, new float[]{9.2f, 11.5f, 13.8f, 16.4f, 19.8f, 21.8f, 25.2f, 30.0f, 100.0f}));
            b.d(NikonType2MakernoteDirectory.TAG_ADAPTER, new yz4(new float[]{8.0f, 10.0f, 12.0f, 14.0f, 18.0f, 20.0f, 24.0f, 30.0f, 100.0f}, new float[]{10.4f, 13.0f, 15.6f, 18.8f, 21.6f, 23.6f, 26.4f, 30.0f, 100.0f}));
            b.d(150, new yz4(new float[]{8.0f, 10.0f, 12.0f, 14.0f, 18.0f, 20.0f, 24.0f, 30.0f, 100.0f}, new float[]{12.0f, 15.0f, 18.0f, 22.0f, 24.0f, 26.0f, 28.0f, 30.0f, 100.0f}));
            b.d(180, new yz4(new float[]{8.0f, 10.0f, 12.0f, 14.0f, 18.0f, 20.0f, 24.0f, 30.0f, 100.0f}, new float[]{14.4f, 18.0f, 21.6f, 24.4f, 27.6f, 30.8f, 32.8f, 34.8f, 100.0f}));
            b.d(200, new yz4(new float[]{8.0f, 10.0f, 12.0f, 14.0f, 18.0f, 20.0f, 24.0f, 30.0f, 100.0f}, new float[]{16.0f, 20.0f, 24.0f, 26.0f, 30.0f, 34.0f, 36.0f, 38.0f, 100.0f}));
        }
        if ((b.c(0) / 100.0f) - 0.01f > 1.03f) {
            return;
        }
        d26.b("You should only apply non-linear scaling to font scales > 1");
    }

    public static wz4 a(float f) {
        float fC;
        wz4 yz4Var;
        float[] fArr = a;
        if (f < 1.03f) {
            return null;
        }
        xkc xkcVar = b;
        int i = (int) (f * 100.0f);
        xkcVar.getClass();
        wz4 wz4Var = (wz4) s42.L(xkcVar, i);
        if (wz4Var != null) {
            return wz4Var;
        }
        xkc xkcVar2 = b;
        if (xkcVar2.a) {
            s42.U(xkcVar2);
        }
        int iC = vc2.C(xkcVar2.d, i, xkcVar2.b);
        if (iC >= 0) {
            return (wz4) b.g(iC);
        }
        int i2 = -(iC + 1);
        int i3 = i2 - 1;
        if (i2 >= b.e()) {
            yz4 yz4Var2 = new yz4(new float[]{1.0f}, new float[]{f});
            b(f, yz4Var2);
            return yz4Var2;
        }
        if (i3 < 0) {
            yz4Var = new yz4(fArr, fArr);
            fC = 1.0f;
        } else {
            fC = b.c(i3) / 100.0f;
            yz4Var = (wz4) b.g(i3);
        }
        float fC2 = b.c(i2) / 100.0f;
        float fMax = (Math.max(0.0f, Math.min(1.0f, fC == fC2 ? 0.0f : (f - fC) / (fC2 - fC))) * 1.0f) + 0.0f;
        wz4 wz4Var2 = (wz4) b.g(i2);
        float[] fArr2 = new float[9];
        for (int i4 = 0; i4 < 9; i4++) {
            float f2 = fArr[i4];
            float fB = yz4Var.b(f2);
            fArr2[i4] = ((wz4Var2.b(f2) - fB) * fMax) + fB;
        }
        yz4 yz4Var3 = new yz4(fArr, fArr2);
        b(f, yz4Var3);
        return yz4Var3;
    }

    public static void b(float f, yz4 yz4Var) {
        synchronized (c) {
            xkc xkcVarClone = b.clone();
            xkcVarClone.d((int) (f * 100.0f), yz4Var);
            b = xkcVarClone;
        }
    }
}
