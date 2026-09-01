package defpackage;

import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class zr7 {
    public static final long a = pwd.i(8.0f, 8.0f);
    public static final float b = 4.0f;
    public static final float c = 2.0f;

    public static final void a(float f, x45 x45Var, r28 r28Var, boolean z, hp1 hp1Var, m45 m45Var, qfc qfcVar, x12 x12Var, int i) {
        r28 r28Var2;
        boolean z2;
        boolean z3;
        x45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-567669489);
        int i2 = i | (p65Var.c(f) ? 4 : 2) | (p65Var.h(x45Var) ? 32 : 16) | 3072 | (p65Var.f(hp1Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.h(m45Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.f(qfcVar) ? 1048576 : 524288);
        if (p65Var.P(i2 & 1, (599187 & i2) != 599186)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                z3 = true;
            } else {
                p65Var.S();
                z3 = z;
            }
            p65Var.q();
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = ka1.k(p65Var);
            }
            m68 m68Var = (m68) objM;
            r28Var2 = r28Var;
            int i3 = i2 >> 3;
            agc.a(f, x45Var, bgf.N(r28Var2, "slider"), z3, m45Var, qfcVar, m68Var, pxf.E(1096737619, new pr3(m68Var, qfcVar, z3, 1), p65Var), pxf.E(1332907442, new xr7(z3, qfcVar, 0), p65Var), hp1Var, p65Var, (i2 & 14) | 907542528 | (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 3072 | (57344 & i3) | (i3 & 458752), (i2 >> 12) & 14);
            z2 = z3;
        } else {
            r28Var2 = r28Var;
            p65Var.S();
            z2 = z;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new yr7(f, x45Var, r28Var2, z2, hp1Var, m45Var, qfcVar, i);
        }
    }
}
