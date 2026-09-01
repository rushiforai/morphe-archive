package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class zpb {
    public static final sn3 a = new sn3(1, new lg9(20));
    public static final float b = 16.0f;

    public static final void a(final r28 r28Var, final cqb cqbVar, final b55 b55Var, final b55 b55Var2, final c55 c55Var, final b55 b55Var3, final int i, final boolean z, final m3c m3cVar, final float f, final long j, final long j2, final long j3, final long j4, final long j5, final mz1 mz1Var, x12 x12Var, final int i2, final int i3) {
        int i4;
        cqb cqbVar2;
        b55 b55Var4;
        b55 b55Var5;
        boolean z2;
        int i5;
        long j6;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(1135600301);
        if ((i2 & 6) == 0) {
            i4 = (p65Var2.f(r28Var) ? 4 : 2) | i2;
        } else {
            i4 = i2;
        }
        if ((i2 & 48) == 0) {
            cqbVar2 = cqbVar;
            i4 |= p65Var2.f(cqbVar2) ? 32 : 16;
        } else {
            cqbVar2 = cqbVar;
        }
        if ((i2 & 384) == 0) {
            b55Var4 = b55Var;
            i4 |= p65Var2.h(b55Var4) ? 256 : 128;
        } else {
            b55Var4 = b55Var;
        }
        if ((i2 & 3072) == 0) {
            b55Var5 = b55Var2;
            i4 |= p65Var2.h(b55Var5) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        } else {
            b55Var5 = b55Var2;
        }
        if ((i2 & 24576) == 0) {
            i4 |= p65Var2.h(c55Var) ? 16384 : 8192;
        }
        if ((i2 & 196608) == 0) {
            i4 |= p65Var2.h(b55Var3) ? 131072 : 65536;
        }
        if ((i2 & 1572864) == 0) {
            i4 |= p65Var2.d(i) ? 1048576 : 524288;
        }
        if ((i2 & 12582912) == 0) {
            i4 |= p65Var2.g(false) ? 8388608 : 4194304;
        }
        if ((i2 & 100663296) == 0) {
            i4 |= p65Var2.h(null) ? 67108864 : 33554432;
        }
        if ((805306368 & i2) == 0) {
            z2 = z;
            i4 |= p65Var2.g(z2) ? 536870912 : 268435456;
        } else {
            z2 = z;
        }
        if ((i3 & 6) == 0) {
            i5 = i3 | (p65Var2.f(m3cVar) ? 4 : 2);
        } else {
            i5 = i3;
        }
        if ((i3 & 48) == 0) {
            i5 |= p65Var2.c(f) ? 32 : 16;
        }
        if ((i3 & 384) == 0) {
            i5 |= p65Var2.e(j) ? 256 : 128;
        }
        if ((i3 & 3072) == 0) {
            i5 |= p65Var2.e(j2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i3 & 24576) == 0) {
            j6 = j3;
            i5 |= p65Var2.e(j6) ? 16384 : 8192;
        } else {
            j6 = j3;
        }
        if ((i3 & 196608) == 0) {
            i5 |= p65Var2.e(j4) ? 131072 : 65536;
        }
        if ((i3 & 1572864) == 0) {
            i5 |= p65Var2.e(j5) ? 1048576 : 524288;
        }
        if ((i3 & 12582912) == 0) {
            i5 |= p65Var2.h(mz1Var) ? 8388608 : 4194304;
        }
        if (p65Var2.P(i4 & 1, ((306783379 & i4) == 306783378 && (i5 & 4793491) == 4793490) ? false : true)) {
            p65Var2.U();
            if ((i2 & 1) != 0 && !p65Var2.z()) {
                p65Var2.S();
            }
            p65Var2.q();
            p65Var = p65Var2;
            int i6 = i5 << 3;
            b(new gl4(), r28Var, cqbVar2, b55Var4, b55Var5, c55Var, b55Var3, i, z2, m3cVar, f, j, j2, j6, j4, j5, mz1Var, p65Var, (i4 << 3) & 2147483632, ((i4 >> 27) & 14) | (i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i6 & 896) | (i6 & 7168) | (57344 & i6) | (458752 & i6) | (3670016 & i6) | (29360128 & i6) | (i6 & 234881024));
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: tpb
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(i2 | 1);
                    int iY2 = tr7.y(i3);
                    zpb.a(r28Var, cqbVar, b55Var, b55Var2, c55Var, b55Var3, i, z, m3cVar, f, j, j2, j3, j4, j5, mz1Var, (x12) obj, iY, iY2);
                    return c1e.a;
                }
            };
        }
    }

    public static final void b(final gl4 gl4Var, r28 r28Var, final cqb cqbVar, final b55 b55Var, final b55 b55Var2, final c55 c55Var, final b55 b55Var3, final int i, final boolean z, final m3c m3cVar, final float f, final long j, final long j2, final long j3, final long j4, final long j5, final mz1 mz1Var, x12 x12Var, final int i2, final int i3) {
        int i4;
        b55 b55Var4;
        int i5;
        p65 p65Var;
        final r28 r28Var2;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(50073903);
        if ((i2 & 6) == 0) {
            i4 = (p65Var2.f(gl4Var) ? 4 : 2) | i2;
        } else {
            i4 = i2;
        }
        if ((i2 & 48) == 0) {
            i4 |= p65Var2.f(r28Var) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i4 |= p65Var2.f(cqbVar) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            b55Var4 = b55Var;
            i4 |= p65Var2.h(b55Var4) ? 2048 : 1024;
        } else {
            b55Var4 = b55Var;
        }
        if ((i2 & 24576) == 0) {
            i4 |= p65Var2.h(b55Var2) ? 16384 : 8192;
        }
        int i6 = i2 & 196608;
        int i7 = ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        if (i6 == 0) {
            i4 |= p65Var2.h(c55Var) ? 131072 : 65536;
        }
        if ((i2 & 1572864) == 0) {
            i4 |= p65Var2.h(b55Var3) ? 1048576 : 524288;
        }
        if ((i2 & 12582912) == 0) {
            i4 |= p65Var2.d(i) ? 8388608 : 4194304;
        }
        if ((i2 & 100663296) == 0) {
            i4 |= p65Var2.g(false) ? 67108864 : 33554432;
        }
        if ((i2 & 805306368) == 0) {
            i4 |= p65Var2.h(null) ? 536870912 : 268435456;
        }
        int i8 = i4;
        if ((i3 & 6) == 0) {
            i5 = (p65Var2.g(z) ? 4 : 2) | i3;
        } else {
            i5 = i3;
        }
        if ((i3 & 48) == 0) {
            i5 |= p65Var2.f(m3cVar) ? 32 : 16;
        }
        if ((i3 & 384) == 0) {
            i5 |= p65Var2.c(f) ? 256 : 128;
        }
        if ((i3 & 3072) == 0) {
            i5 |= p65Var2.e(j) ? 2048 : 1024;
        }
        if ((i3 & 24576) == 0) {
            i5 |= p65Var2.e(j2) ? 16384 : 8192;
        }
        if ((i3 & 196608) == 0) {
            if (p65Var2.e(j3)) {
                i7 = 131072;
            }
            i5 |= i7;
        }
        if ((i3 & 1572864) == 0) {
            i5 |= p65Var2.e(j4) ? 1048576 : 524288;
        }
        if ((i3 & 12582912) == 0) {
            i5 |= p65Var2.e(j5) ? 8388608 : 4194304;
        }
        if ((i3 & 100663296) == 0) {
            i5 |= p65Var2.h(mz1Var) ? 67108864 : 33554432;
        }
        if (p65Var2.P(i8 & 1, ((i8 & 306783379) == 306783378 && (38347923 & i5) == 38347922) ? false : true)) {
            p65Var2.U();
            if ((i2 & 1) != 0 && !p65Var2.z()) {
                p65Var2.S();
            }
            p65Var2.q();
            boolean z2 = (i8 & 14) == 4;
            Object objM = p65Var2.M();
            if (z2 || objM == w12.a) {
                objM = new r78(gl4Var);
                p65Var2.j0(objM);
            }
            final r78 r78Var = (r78) objM;
            p65Var = p65Var2;
            final b55 b55Var5 = b55Var4;
            mz1 mz1VarE = pxf.E(-1236753028, new c55() { // from class: upb
                @Override // defpackage.c55
                public final Object f(Object obj, Object obj2, Object obj3) {
                    r28 r28Var3 = (r28) obj;
                    x12 x12Var2 = (x12) obj2;
                    int iIntValue = ((Integer) obj3).intValue();
                    if ((iIntValue & 6) == 0) {
                        iIntValue |= ((p65) x12Var2).f(r28Var3) ? 4 : 2;
                    }
                    p65 p65Var3 = (p65) x12Var2;
                    if (p65Var3.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                        r78 r78Var2 = r78Var;
                        boolean zF = p65Var3.f(r78Var2);
                        gl4 gl4Var2 = gl4Var;
                        boolean zF2 = zF | p65Var3.f(gl4Var2);
                        Object objM2 = p65Var3.M();
                        if (zF2 || objM2 == w12.a) {
                            objM2 = new pda(r78Var2, 12, gl4Var2);
                            p65Var3.j0(objM2);
                        }
                        br7.i(op8.g0(r28Var3, (x45) objM2), null, j4, j5, 0.0f, pxf.E(-1761194824, new kz1(i, b55Var5, mz1Var, b55Var3, r78Var2, b55Var2, c55Var, cqbVar), p65Var3), p65Var3, 1572864, 50);
                    } else {
                        p65Var3.S();
                    }
                    return c1e.a;
                }
            }, p65Var);
            p65Var.Y(1400739380);
            r28Var2 = r28Var;
            mz1VarE.f(r28Var2, p65Var, Integer.valueOf(((i8 >> 3) & 14) | 48));
            p65Var.p(false);
        } else {
            p65Var = p65Var2;
            r28Var2 = r28Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: vpb
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(i2 | 1);
                    int iY2 = tr7.y(i3);
                    zpb.b(gl4Var, r28Var2, cqbVar, b55Var, b55Var2, c55Var, b55Var3, i, z, m3cVar, f, j, j2, j3, j4, j5, mz1Var, (x12) obj, iY, iY2);
                    return c1e.a;
                }
            };
        }
    }

    public static final void c(int i, b55 b55Var, mz1 mz1Var, mz1 mz1Var2, b55 b55Var2, y3f y3fVar, b55 b55Var3, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(675142332);
        int i3 = i2 | (p65Var.g(false) ? 4 : 2) | (p65Var.d(i) ? 32 : 16) | (p65Var.h(b55Var) ? 256 : 128) | (p65Var.h(mz1Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.h(b55Var2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var.f(y3fVar) ? 1048576 : 524288) | (p65Var.h(b55Var3) ? 8388608 : 4194304);
        if (p65Var.P(i3 & 1, (4793491 & i3) != 4793490)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new ypb();
                p65Var.j0(objM);
            }
            ypb ypbVar = (ypb) objM;
            boolean z = ((i3 & 896) == 256) | ((3670016 & i3) == 1048576) | ((458752 & i3) == 131072) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i3 & 14) == 4) | ((29360128 & i3) == 8388608) | ((i3 & 7168) == 2048);
            Object objM2 = p65Var.M();
            if (z || objM2 == uobVar) {
                kz1 kz1Var = new kz1(b55Var, mz1Var2, b55Var2, i, y3fVar, ypbVar, b55Var3, mz1Var);
                p65Var.j0(kz1Var);
                objM2 = kz1Var;
            }
            f76.u(null, (b55) objM2, p65Var, 0, 1);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new iu0(i, b55Var, mz1Var, mz1Var2, b55Var2, y3fVar, b55Var3, i2, 12);
        }
    }

    public static final cqb d(x12 x12Var) {
        om3 om3VarA = nm3.a(pm3.Closed, x12Var);
        p65 p65Var = (p65) x12Var;
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (objM == uobVar) {
            objM = new ohc();
            p65Var.j0(objM);
        }
        ohc ohcVar = (ohc) objM;
        p65 p65Var2 = (p65) x12Var;
        Object objM2 = p65Var2.M();
        if (objM2 == uobVar) {
            objM2 = new cqb(om3VarA, ohcVar);
            p65Var2.j0(objM2);
        }
        return (cqb) objM2;
    }
}
