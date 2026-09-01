package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qs7 {
    public static final cud a = f76.Q(250, 0, ao3.a, 2);

    public static final void a(List list, List list2, int i, r28 r28Var, x45 x45Var, x12 x12Var, int i2) {
        int i3;
        r28 r28Var2;
        x45 x45Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-274411770);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(null) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.h(list) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.h(list2) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.d(i) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        int i4 = i3 | 221184;
        int i5 = 1;
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = new be7(22);
                p65Var.j0(objM);
            }
            fa4 fa4Var = fa4.p;
            es7 es7Var = new es7(((vj3) list2.get(i)).a, i5, (h7d) list.get(i));
            o28 o28Var = o28.b;
            fa4Var.p(1.0f, 3120, 0, ((zo7) p65Var.j(kt7.b)).n, p65Var, gx1.E(o28Var, es7Var));
            x45Var2 = (x45) objM;
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            x45Var2 = x45Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new fc(list, list2, i, r28Var2, x45Var2, i2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x003e  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0043  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00f2  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00fc  */
    /* JADX WARN: Removed duplicated region for block: B:53:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(final java.util.List r15, defpackage.r28 r16, int r17, final defpackage.x45 r18, defpackage.x12 r19, final int r20, final int r21) {
        /*
            Method dump skipped, instruction units count: 267
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qs7.b(java.util.List, r28, int, x45, x12, int, int):void");
    }

    public static final void c(final int i, final r28 r28Var, final long j, long j2, final float f, final mz1 mz1Var, final mz1 mz1Var2, final mz1 mz1Var3, x12 x12Var, final int i2) {
        int i3;
        r28 r28Var2;
        mz1 mz1Var4;
        mz1 mz1Var5;
        mz1 mz1Var6;
        final long j3;
        int i4;
        long jB;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-395791668);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.d(i) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            r28Var2 = r28Var;
            i3 |= p65Var.f(r28Var2) ? 32 : 16;
        } else {
            r28Var2 = r28Var;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.e(j) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var.c(f) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            mz1Var4 = mz1Var;
            i3 |= p65Var.h(mz1Var4) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        } else {
            mz1Var4 = mz1Var;
        }
        if ((i2 & 1572864) == 0) {
            mz1Var5 = mz1Var2;
            i3 |= p65Var.h(mz1Var5) ? 1048576 : 524288;
        } else {
            mz1Var5 = mz1Var2;
        }
        if ((12582912 & i2) == 0) {
            mz1Var6 = mz1Var3;
            i3 |= p65Var.h(mz1Var6) ? 8388608 : 4194304;
        } else {
            mz1Var6 = mz1Var3;
        }
        if (p65Var.P(i3 & 1, (4793491 & i3) != 4793490)) {
            p65Var.U();
            if ((i2 & 1) == 0 || p65Var.z()) {
                i4 = i3 & (-7169);
                jB = tv1.b(j, p65Var);
            } else {
                p65Var.S();
                i4 = i3 & (-7169);
                jB = j2;
            }
            p65Var.q();
            int i5 = ((i4 >> 3) & 14) | 1572864 | (i4 & 896);
            r28 r28Var3 = r28Var2;
            long j4 = jB;
            br7.i(r28Var3, null, j, j4, 0.0f, pxf.E(2069233680, new fs7(mz1Var5, f, mz1Var6, mz1Var4, i), p65Var), p65Var, i5, 50);
            j3 = j4;
        } else {
            p65Var.S();
            j3 = j2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: os7
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    qs7.c(i, r28Var, j, j3, f, mz1Var, mz1Var2, mz1Var3, (x12) obj, tr7.y(i2 | 1));
                    return c1e.a;
                }
            };
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void d(List list, List list2, x45 x45Var, int i, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1672394993);
        List list3 = list2;
        int i3 = 256;
        int i4 = i2 | (p65Var.h(list) ? 4 : 2) | (p65Var.h(list3) ? 32 : 16) | (p65Var.h(x45Var) ? 256 : 128) | (p65Var.d(i) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        int i5 = 1;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            m73 m73Var = (m73) p65Var.j(z22.h);
            int i6 = 0;
            for (Object obj : list) {
                int i7 = i6 + 1;
                if (i6 < 0) {
                    d46.i0();
                    throw null;
                }
                String str = (String) obj;
                int i8 = i6 == i ? i5 : 0;
                int i9 = ((i4 & 896) == i3 ? i5 : 0) | (p65Var.d(i6) ? 1 : 0);
                Object objM = p65Var.M();
                if (i9 != 0 || objM == w12.a) {
                    objM = new ls7(i6, i5, x45Var);
                    p65Var.j0(objM);
                }
                boolean z = i8;
                f7d.a(z, (m45) objM, null, false, 0L, 0L, pxf.E(1414206008, new ms7(z, str, list3, i6, m73Var), p65Var), p65Var, 12582912);
                m73Var = m73Var;
                i6 = i7;
                i3 = i3;
                i5 = i5;
                list3 = list2;
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ds7(list, list2, x45Var, i, i2, 2);
        }
    }
}
