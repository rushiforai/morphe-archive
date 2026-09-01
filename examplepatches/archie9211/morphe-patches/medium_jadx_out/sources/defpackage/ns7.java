package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ns7 {
    public static final cud a = f76.Q(250, 0, ao3.a, 2);

    /* JADX WARN: Removed duplicated region for block: B:38:0x0073  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x012a  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0140  */
    /* JADX WARN: Removed duplicated region for block: B:63:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(float r27, int r28, int r29, int r30, long r31, long r33, defpackage.x12 r35, defpackage.x45 r36, defpackage.b55 r37, defpackage.r28 r38, defpackage.yrb r39, java.util.List r40) {
        /*
            Method dump skipped, instruction units count: 334
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ns7.a(float, int, int, int, long, long, x12, x45, b55, r28, yrb, java.util.List):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:129:0x0198  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x019c  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x021e  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x022f  */
    /* JADX WARN: Removed duplicated region for block: B:142:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0049  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00ad  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x00cb  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00d4  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x00f6  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0115  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x011f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(float r23, int r24, int r25, int r26, long r27, long r29, defpackage.x12 r31, defpackage.x45 r32, defpackage.b55 r33, defpackage.r28 r34, defpackage.yrb r35, java.util.List r36) {
        /*
            Method dump skipped, instruction units count: 575
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ns7.b(float, int, int, int, long, long, x12, x45, b55, r28, yrb, java.util.List):void");
    }

    public static final void c(int i, r28 r28Var, long j, long j2, float f, yrb yrbVar, mz1 mz1Var, b55 b55Var, mz1 mz1Var2, x12 x12Var, int i2) {
        int i3;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(531010460);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.d(i) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var2.f(r28Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.e(j) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.e(j2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.c(f) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(yrbVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i2) == 0) {
            i3 |= p65Var2.h(mz1Var) ? 1048576 : 524288;
        }
        if ((i2 & 12582912) == 0) {
            i3 |= p65Var2.h(b55Var) ? 8388608 : 4194304;
        }
        if ((100663296 & i2) == 0) {
            i3 |= p65Var2.h(mz1Var2) ? 67108864 : 33554432;
        }
        if (p65Var2.P(i3 & 1, (38347923 & i3) != 38347922)) {
            p65Var = p65Var2;
            g3d.a(r28Var, null, j, j2, 0.0f, 0.0f, null, pxf.E(-955091807, new lu0(b55Var, yrbVar, f, mz1Var2, mz1Var, i), p65Var2), p65Var, ((i3 >> 3) & 14) | 12582912 | (i3 & 896) | (i3 & 7168), 114);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ks7(i, r28Var, j, j2, f, yrbVar, mz1Var, b55Var, mz1Var2, i2);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void d(List list, List list2, x45 x45Var, int i, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1633938234);
        List list3 = list2;
        int i3 = 256;
        int i4 = i2 | (p65Var.h(list) ? 4 : 2) | (p65Var.h(list3) ? 32 : 16) | (p65Var.h(x45Var) ? 256 : 128) | (p65Var.d(i) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        int i5 = 0;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            m73 m73Var = (m73) p65Var.j(z22.h);
            int i6 = 0;
            for (Object obj : list) {
                int i7 = i6 + 1;
                if (i6 < 0) {
                    d46.i0();
                    throw null;
                }
                d55 d55Var = (d55) obj;
                int i8 = i6 == i ? 1 : i5;
                int i9 = ((i4 & 896) == i3 ? 1 : i5) | (p65Var.d(i6) ? 1 : 0);
                Object objM = p65Var.M();
                if (i9 != 0 || objM == w12.a) {
                    objM = new ls7(i6, i5, x45Var);
                    p65Var.j0(objM);
                }
                boolean z = i8;
                e7d.a(z, (m45) objM, null, false, 0L, 0L, pxf.E(1271660703, new ms7(d55Var, z, list3, i6, m73Var), p65Var), p65Var, 12582912);
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
            mwaVarS.d = new ds7(list, list2, x45Var, i, i2, 0);
        }
    }
}
