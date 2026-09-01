package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class b10 {
    public static final r28 a;
    public static final r28 b;
    public static final gl4 c;

    static {
        o28 o28Var = o28.b;
        a = jfc.p(o28Var, 12.0f);
        b = jfc.p(jfc.c(o28Var, 1.0f), 68.0f);
        c = new gl4();
    }

    public static final void a(long j, long j2, float f, hy8 hy8Var, y3f y3fVar, r28 r28Var, mz1 mz1Var, x12 x12Var, int i) {
        int i2;
        r28 r28Var2;
        p65 p65Var;
        nr5 nr5Var = rv8.r;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1222317265);
        if ((i & 6) == 0) {
            i2 = (p65Var2.e(j) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var2.e(j2) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var2.c(f) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.f(hy8Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var2.f(nr5Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var2.f(y3fVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((i & 1572864) == 0) {
            r28Var2 = r28Var;
            i2 |= p65Var2.f(r28Var2) ? 1048576 : 524288;
        } else {
            r28Var2 = r28Var;
        }
        if ((12582912 & i) == 0) {
            i2 |= p65Var2.h(mz1Var) ? 8388608 : 4194304;
        }
        int i3 = 0;
        if (p65Var2.P(i2 & 1, (4793491 & i2) != 4793490)) {
            int i4 = i2 << 6;
            p65Var = p65Var2;
            br7.i(r28Var2, nr5Var, j, j2, f, pxf.E(-1628734195, new q00(y3fVar, hy8Var, mz1Var, i3), p65Var2), p65Var, ((i2 >> 18) & 14) | 1572864 | ((i2 >> 9) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i4 & 896) | (i4 & 7168) | ((i2 << 9) & 458752), 16);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new w00(j, j2, f, hy8Var, y3fVar, r28Var, mz1Var, i);
        }
    }

    public static final void b(final mz1 mz1Var, final y3f y3fVar, final r28 r28Var, final b55 b55Var, final c55 c55Var, final long j, final long j2, final float f, x12 x12Var, final int i) {
        int i2;
        y3f y3fVar2;
        r28 r28Var2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(138090236);
        if ((i & 6) == 0) {
            i2 = (p65Var2.h(mz1Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            y3fVar2 = y3fVar;
            i2 |= p65Var2.f(y3fVar2) ? 32 : 16;
        } else {
            y3fVar2 = y3fVar;
        }
        if ((i & 384) == 0) {
            r28Var2 = r28Var;
            i2 |= p65Var2.f(r28Var2) ? 256 : 128;
        } else {
            r28Var2 = r28Var;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var2.h(b55Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var2.h(c55Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var2.e(j) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i2 |= p65Var2.e(j2) ? 1048576 : 524288;
        }
        if ((12582912 & i) == 0) {
            i2 |= p65Var2.c(f) ? 8388608 : 4194304;
        }
        if (p65Var2.P(i2 & 1, (4793491 & i2) != 4793490)) {
            p65Var2.U();
            if ((i & 1) != 0 && !p65Var2.z()) {
                p65Var2.S();
            }
            p65Var2.q();
            int i3 = i2 >> 15;
            int i4 = i2 << 12;
            p65Var = p65Var2;
            a(j, j2, f, o00.a, y3fVar2, r28Var2, pxf.E(-2019867954, new nh(b55Var, mz1Var, c55Var, 14), p65Var2), p65Var, (i3 & 896) | (i3 & 14) | 12610560 | (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (458752 & i4) | (i4 & 3670016));
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: y00
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    b10.b(mz1Var, y3fVar, r28Var, b55Var, c55Var, j, j2, f, (x12) obj, tr7.y(i | 1));
                    return c1e.a;
                }
            };
        }
    }

    public static final void c(mz1 mz1Var, r28 r28Var, b55 b55Var, c55 c55Var, long j, long j2, float f, x12 x12Var, int i) {
        int i2;
        long jB;
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-350082398);
        if ((i & 6) == 0) {
            i2 = (p65Var.h(mz1Var) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.f(r28Var) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.h(b55Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.h(c55Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= p65Var.e(j) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i2 |= p65Var.c(f) ? 1048576 : 524288;
        }
        if (p65Var.P(i2 & 1, (599187 & i2) != 599186)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                i3 = i2 & (-458753);
                jB = tv1.b(j, p65Var);
            } else {
                p65Var.S();
                i3 = i2 & (-458753);
                jB = j2;
            }
            p65Var.q();
            int i4 = (i3 & 14) | 48;
            int i5 = i3 << 3;
            b(mz1Var, c, r28Var, b55Var, c55Var, j, jB, f, p65Var, i4 | (i5 & 896) | (i5 & 7168) | (57344 & i5) | (458752 & i5) | (i5 & 29360128));
        } else {
            p65Var.S();
            jB = j2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new w00(mz1Var, r28Var, b55Var, c55Var, j, jB, f, i);
        }
    }
}
