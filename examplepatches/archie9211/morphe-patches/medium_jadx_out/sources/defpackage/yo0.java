package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class yo0 {
    static {
        pwd.i(40.0f, 40.0f);
    }

    /* JADX WARN: Removed duplicated region for block: B:101:0x0129  */
    /* JADX WARN: Removed duplicated region for block: B:102:0x012e  */
    /* JADX WARN: Removed duplicated region for block: B:114:0x0157  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x0161  */
    /* JADX WARN: Removed duplicated region for block: B:167:0x0251  */
    /* JADX WARN: Removed duplicated region for block: B:170:0x0268  */
    /* JADX WARN: Removed duplicated region for block: B:172:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:38:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x00d7  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0106  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0110  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x011e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void a(final defpackage.uid r26, final defpackage.x45 r27, final defpackage.r28 r28, boolean r29, final defpackage.mkd r30, final defpackage.sk6 r31, defpackage.pk6 r32, boolean r33, int r34, int r35, defpackage.ywb r36, defpackage.x45 r37, final defpackage.dkc r38, defpackage.c55 r39, defpackage.x12 r40, final int r41, final int r42, final int r43) {
        /*
            Method dump skipped, instruction units count: 647
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yo0.a(uid, x45, r28, boolean, mkd, sk6, pk6, boolean, int, int, ywb, x45, dkc, c55, x12, int, int, int):void");
    }

    public static final void b(final String str, final x45 x45Var, final r28 r28Var, boolean z, final mkd mkdVar, final sk6 sk6Var, final pk6 pk6Var, int i, int i2, ywb ywbVar, x45 x45Var2, final dkc dkcVar, c55 c55Var, x12 x12Var, final int i3, final int i4, final int i5) {
        boolean z2;
        int i6;
        int i7;
        c55 c55Var2;
        p65 p65Var;
        final int i8;
        final ywb ywbVar2;
        final c55 c55Var3;
        final boolean z3;
        final int i9;
        final x45 x45Var3;
        int i10;
        int i11;
        x45 x45Var4;
        c55 c55Var4;
        int i12;
        boolean z4;
        ywb ywbVar3;
        int i13;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(2026950908);
        int i14 = i3 | (p65Var2.f(str) ? 4 : 2) | (p65Var2.h(x45Var) ? 32 : 16) | (p65Var2.f(r28Var) ? 256 : 128);
        int i15 = i5 & 8;
        if (i15 != 0) {
            i6 = i14 | 3072;
            z2 = z;
        } else {
            z2 = z;
            i6 = i14 | (p65Var2.g(z2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        }
        int i16 = i6 | 24576 | (p65Var2.f(mkdVar) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) | (p65Var2.f(sk6Var) ? 1048576 : 524288) | (p65Var2.f(pk6Var) ? 8388608 : 4194304) | 100663296;
        if ((i3 & 805306368) == 0) {
            if ((i5 & 512) == 0) {
                i7 = i;
                int i17 = p65Var2.d(i7) ? 536870912 : 268435456;
                i16 |= i17;
            } else {
                i7 = i;
            }
            i16 |= i17;
        } else {
            i7 = i;
        }
        int i18 = i4 | 3510 | (p65Var2.f(dkcVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192);
        int i19 = i5 & 32768;
        if (i19 != 0) {
            i18 |= 196608;
            c55Var2 = c55Var;
        } else {
            c55Var2 = c55Var;
            if ((i4 & 196608) == 0) {
                i18 |= p65Var2.h(c55Var2) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
            }
        }
        int i20 = i16;
        if (p65Var2.P(i20 & 1, ((i20 & 306783379) == 306783378 && (74899 & i18) == 74898) ? false : true)) {
            p65Var2.U();
            int i21 = i3 & 1;
            uob uobVar = w12.a;
            if (i21 == 0 || p65Var2.z()) {
                if (i15 != 0) {
                    z2 = true;
                }
                if ((i5 & 512) != 0) {
                    i10 = i20 & (-1879048193);
                    i11 = Integer.MAX_VALUE;
                } else {
                    i10 = i20;
                    i11 = i7;
                }
                ywb ywbVar4 = xsa.i;
                Object objM = p65Var2.M();
                if (objM == uobVar) {
                    objM = new nx(11);
                    p65Var2.j0(objM);
                }
                x45 x45Var5 = (x45) objM;
                if (i19 != 0) {
                    x45Var4 = x45Var5;
                    c55Var4 = s42.b;
                } else {
                    x45Var4 = x45Var5;
                    c55Var4 = c55Var2;
                }
                i12 = i11;
                z4 = z2;
                ywbVar3 = ywbVar4;
                i13 = 1;
            } else {
                p65Var2.S();
                if ((i5 & 512) != 0) {
                    i10 = i20 & (-1879048193);
                    i13 = i2;
                    ywbVar3 = ywbVar;
                    x45Var4 = x45Var2;
                } else {
                    i13 = i2;
                    ywbVar3 = ywbVar;
                    x45Var4 = x45Var2;
                    i10 = i20;
                }
                c55Var4 = c55Var2;
                z4 = z2;
                i12 = i7;
            }
            int i22 = 16;
            p65Var2.q();
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = qo7.u(new uid(str, 6, 0L));
                p65Var2.j0(objM2);
            }
            l78 l78Var = (l78) objM2;
            uid uidVarB = uid.b((uid) l78Var.getValue(), str, 0L, 6);
            boolean zF = p65Var2.f(uidVarB);
            Object objM3 = p65Var2.M();
            if (zF || objM3 == uobVar) {
                objM3 = new n(uidVarB, i22, l78Var);
                p65Var2.j0(objM3);
            }
            kyd.v((m45) objM3, p65Var2);
            boolean z5 = (i10 & 14) == 4;
            Object objM4 = p65Var2.M();
            if (z5 || objM4 == uobVar) {
                objM4 = qo7.u(str);
                p65Var2.j0(objM4);
            }
            l78 l78Var2 = (l78) objM4;
            ry5 ry5VarB = sk6Var.b(false);
            boolean zF2 = p65Var2.f(l78Var2) | ((i10 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM5 = p65Var2.M();
            if (zF2 || objM5 == uobVar) {
                objM5 = new wo0(x45Var, l78Var, l78Var2, 0);
                p65Var2.j0(objM5);
            }
            p65Var = p65Var2;
            rv8.c(uidVarB, (x45) objM5, r28Var, mkdVar, ywbVar3, x45Var4, dkcVar, true, i12, i13, ry5VarB, pk6Var, z4, c55Var4, p65Var, (i10 & 896) | ((i10 >> 6) & 7168) | 1794048 | ((i18 << 9) & 29360128), ((i10 >> 15) & 896) | (i10 & 7168) | 24576 | (458752 & i18));
            ywbVar2 = ywbVar3;
            x45Var3 = x45Var4;
            i9 = i12;
            i8 = i13;
            z3 = z4;
            c55Var3 = c55Var4;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            i8 = i2;
            ywbVar2 = ywbVar;
            c55Var3 = c55Var2;
            z3 = z2;
            i9 = i7;
            x45Var3 = x45Var2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55() { // from class: xo0
                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(i3 | 1);
                    int iY2 = tr7.y(i4);
                    yo0.b(str, x45Var, r28Var, z3, mkdVar, sk6Var, pk6Var, i9, i8, ywbVar2, x45Var3, dkcVar, c55Var3, (x12) obj, iY, iY2, i5);
                    return c1e.a;
                }
            };
        }
    }
}
