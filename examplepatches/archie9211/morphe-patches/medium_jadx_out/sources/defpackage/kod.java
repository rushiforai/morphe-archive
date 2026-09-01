package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class kod {
    public static final jy8 a = new jy8(8.0f, 4.0f, 8.0f, 4.0f);

    /* JADX WARN: Removed duplicated region for block: B:114:0x0205  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x021a  */
    /* JADX WARN: Removed duplicated region for block: B:119:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x004c  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x009b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(defpackage.nod r27, defpackage.r28 r28, defpackage.m3c r29, float r30, defpackage.m3c r31, long r32, long r34, defpackage.mz1 r36, defpackage.x12 r37, int r38, int r39) {
        /*
            Method dump skipped, instruction units count: 548
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kod.a(nod, r28, m3c, float, m3c, long, long, mz1, x12, int, int):void");
    }

    public static final void b(gd9 gd9Var, mz1 mz1Var, pod podVar, r28 r28Var, boolean z, mz1 mz1Var2, x12 x12Var, int i, int i2) {
        int i3;
        r28 r28Var2;
        boolean z2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-293753984);
        if ((i & 6) == 0) {
            i3 = (p65Var.f(gd9Var) ? 4 : 2) | i;
        } else {
            i3 = i;
        }
        if ((i & 48) == 0) {
            i3 |= p65Var.h(mz1Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i3 |= (i & 512) == 0 ? p65Var.f(podVar) : p65Var.h(podVar) ? 256 : 128;
        }
        int i4 = i2 & 8;
        if (i4 != 0) {
            i3 |= 3072;
        } else if ((i & 3072) == 0) {
            i3 |= p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i5 = i3 | 24576;
        if ((i2 & 32) != 0) {
            i5 = 221184 | i3;
        } else if ((196608 & i) == 0) {
            i5 |= p65Var.g(false) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        int i6 = 14155776 | i5;
        if ((100663296 & i) == 0) {
            i6 |= p65Var.h(mz1Var2) ? 67108864 : 33554432;
        }
        if (p65Var.P(i6 & 1, (38347923 & i6) != 38347922)) {
            r28 r28Var3 = i4 != 0 ? o28.b : r28Var;
            dsd dsdVarK0 = k40.K0(podVar.c, "tooltip transition", p65Var, 48);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(null);
                p65Var.j0(objM);
            }
            l78 l78Var = (l78) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new nod(new z7b(l78Var, 17), gd9Var);
                p65Var.j0(objM2);
            }
            guc.a(gd9Var, pxf.E(-527401546, new zx7(dsdVarK0, mz1Var, (nod) objM2), p65Var), podVar, r28Var3, false, pxf.E(-23901870, new kd(l78Var, 12, mz1Var2), p65Var), p65Var, (i6 & 14) | 100663344 | (i6 & 896) | (i6 & 7168) | (57344 & i6) | (458752 & i6) | (3670016 & i6) | (i6 & 29360128));
            r28Var2 = r28Var3;
            z2 = true;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            z2 = z;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mc0(gd9Var, mz1Var, podVar, r28Var2, z2, mz1Var2, i, i2);
        }
    }

    public static final float c(float f, int i, zwa zwaVar) {
        float fMin;
        float f2 = zwaVar.a;
        float f3 = zwaVar.c;
        float f4 = (f2 + f3) / 2.0f;
        float f5 = i;
        if (f >= f5) {
            return f4;
        }
        float f6 = f / 2.0f;
        if (f4 - f6 < 0.0f) {
            fMin = Math.max(f - f5, -f2);
        } else {
            if (f4 + f6 <= f5) {
                return f6;
            }
            fMin = Math.min(f - f3, 0.0f);
        }
        return fMin + f4;
    }

    public static final pod d(int i, int i2, x12 x12Var) {
        boolean z = true;
        boolean z2 = (i2 & 2) == 0;
        z78 z78Var = hp0.a;
        boolean z3 = (((i & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) ^ 48) > 32 && ((p65) x12Var).g(z2)) || (i & 48) == 32;
        if ((((i & 896) ^ 384) <= 256 || !((p65) x12Var).f(z78Var)) && (i & 384) != 256) {
            z = false;
        }
        boolean z4 = z3 | z;
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        if (z4 || objM == w12.a) {
            objM = new pod(false, z2, z78Var);
            p65Var.j0(objM);
        }
        return (pod) objM;
    }
}
