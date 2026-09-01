package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fpa {
    public static final fpa a = new fpa();
    public static final amb b = bmb.a;
    public static final float c = 80.0f;
    public static final float d = 80.0f;
    public static final float e = 3.0f;

    public final void a(final npa npaVar, final boolean z, final r28 r28Var, final long j, final long j2, float f, x12 x12Var, final int i) {
        final float f2;
        int i2;
        float f3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1076870256);
        int i3 = i | (p65Var.f(npaVar) ? 4 : 2) | (p65Var.g(z) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | (p65Var.e(j) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.e(j2) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID | (p65Var.f(this) ? 1048576 : 524288);
        if (p65Var.P(i3 & 1, (599187 & i3) != 599186)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                i2 = i3 & (-458753);
                f3 = d;
            } else {
                p65Var.S();
                i2 = i3 & (-458753);
                f3 = f;
            }
            p65Var.q();
            mz1 mz1VarE = pxf.E(298232649, new epa(z, j2, npaVar), p65Var);
            int i4 = (i2 & 14) | 12582912 | (i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i2 & 896);
            int i5 = i2 << 6;
            b(npaVar, z, r28Var, f3, null, j, 0.0f, mz1VarE, p65Var, i4 | (458752 & i5) | (i5 & 234881024));
            f2 = f3;
        } else {
            p65Var.S();
            f2 = f;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(npaVar, z, r28Var, j, j2, f2, i) { // from class: zoa
                public final /* synthetic */ npa b;
                public final /* synthetic */ boolean c;
                public final /* synthetic */ r28 d;
                public final /* synthetic */ long e;
                public final /* synthetic */ long f;
                public final /* synthetic */ float g;

                @Override // defpackage.b55
                public final Object invoke(Object obj, Object obj2) {
                    ((Integer) obj2).getClass();
                    int iY = tr7.y(1);
                    this.a.a(this.b, this.c, this.d, this.e, this.f, this.g, (x12) obj, iY);
                    return c1e.a;
                }
            };
        }
    }

    public final void b(final npa npaVar, final boolean z, final r28 r28Var, final float f, m3c m3cVar, final long j, float f2, final mz1 mz1Var, x12 x12Var, final int i) {
        final npa npaVar2;
        int i2;
        fpa fpaVar;
        final m3c m3cVar2;
        final float f3;
        int i3;
        m3c m3cVar3;
        Object obj;
        r28 r28Var2;
        final m3c m3cVar4;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1341144489);
        if ((i & 6) == 0) {
            npaVar2 = npaVar;
            i2 = (p65Var.f(npaVar2) ? 4 : 2) | i;
        } else {
            npaVar2 = npaVar;
            i2 = i;
        }
        if ((i & 48) == 0) {
            i2 |= p65Var.g(z) ? 32 : 16;
        }
        if ((i & 384) == 0) {
            i2 |= p65Var.f(r28Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i2 |= p65Var.c(f) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i2 |= 8192;
        }
        if ((196608 & i) == 0) {
            i2 |= p65Var.e(j) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if ((1572864 & i) == 0) {
            i2 |= 524288;
        }
        if ((12582912 & i) == 0) {
            i2 |= p65Var.h(mz1Var) ? 8388608 : 4194304;
        }
        if ((100663296 & i) == 0) {
            fpaVar = this;
            i2 |= p65Var.f(fpaVar) ? 67108864 : 33554432;
        } else {
            fpaVar = this;
        }
        int i4 = 1;
        if (p65Var.P(i2 & 1, (38347923 & i2) != 38347922)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                i3 = i2 & (-3727361);
                m3cVar3 = b;
                f3 = e;
            } else {
                p65Var.S();
                i3 = i2 & (-3727361);
                m3cVar3 = m3cVar;
                f3 = f2;
            }
            int i5 = i3;
            p65Var.q();
            r28 r28VarL = jfc.l(r28Var, 40.0f);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = new qna(i4);
                p65Var.j0(objM);
            }
            r28 r28VarC = guc.C(r28VarL, (x45) objM);
            boolean zC = ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32) | ((i5 & 14) == 4) | ((((i5 & 7168) ^ 3072) > 2048 && p65Var.c(f)) || (i5 & 3072) == 2048) | p65Var.c(f3) | p65Var.f(m3cVar3);
            Object objM2 = p65Var.M();
            if (zC || objM2 == uobVar) {
                r28Var2 = r28VarC;
                m3cVar4 = m3cVar3;
                obj = new c55() { // from class: apa
                    @Override // defpackage.c55
                    public final Object f(Object obj2, Object obj3, Object obj4) {
                        final t99 t99VarS = ((tk7) obj3).s(((f72) obj4).a);
                        int i6 = t99VarS.a;
                        int i7 = t99VarS.b;
                        final npa npaVar3 = npaVar2;
                        final boolean z2 = z;
                        final float f4 = f;
                        final float f5 = f3;
                        final m3c m3cVar5 = m3cVar4;
                        return ((bl7) obj2).q0(i6, i7, fy3.a, new x45() { // from class: cpa
                            @Override // defpackage.x45
                            public final Object invoke(Object obj5) {
                                final npa npaVar4 = npaVar3;
                                final boolean z3 = z2;
                                final float f6 = f4;
                                final float f7 = f5;
                                final m3c m3cVar6 = m3cVar5;
                                s99.p((s99) obj5, t99VarS, 0, 0, new x45() { // from class: yoa
                                    @Override // defpackage.x45
                                    public final Object invoke(Object obj6) {
                                        tjb tjbVar = (tjb) obj6;
                                        npa npaVar5 = npaVar4;
                                        boolean z4 = ((Number) npaVar5.a.d()).floatValue() > 0.0f || z3;
                                        float fFloatValue = ((Number) npaVar5.a.d()).floatValue();
                                        tjbVar.getClass();
                                        tjbVar.v((fFloatValue * ho2.d(tjbVar, f6)) - Float.intBitsToFloat((int) (tjbVar.r & 4294967295L)));
                                        tjbVar.m(z4 ? tjbVar.s.b() * f7 : 0.0f);
                                        tjbVar.n(m3cVar6);
                                        tjbVar.e(true);
                                        return c1e.a;
                                    }
                                }, 4);
                                return c1e.a;
                            }
                        });
                    }
                };
                p65Var.j0(obj);
            } else {
                r28Var2 = r28VarC;
                obj = objM2;
                m3cVar4 = m3cVar3;
            }
            r28 r28VarA0 = flb.a0(dm2.M(r28Var2, (c55) obj), j, m3cVar4);
            int i6 = ((i5 >> 12) & 7168) | 48;
            zk7 zk7VarC = dy0.c(z46.h, false);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarA0);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, zk7VarC);
            tp7.B(p65Var, q12.e, i89VarL);
            cu cuVar = q12.g;
            if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                lv8.w(iS, p65Var, iS, cuVar);
            }
            tp7.B(p65Var, q12.d, r28VarR);
            mz1Var.f(iy0.a, p65Var, Integer.valueOf(((i6 >> 6) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 6));
            p65Var.p(true);
            m3cVar2 = m3cVar4;
        } else {
            p65Var.S();
            m3cVar2 = m3cVar;
            f3 = f2;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            final fpa fpaVar2 = fpaVar;
            mwaVarS.d = new b55() { // from class: bpa
                @Override // defpackage.b55
                public final Object invoke(Object obj2, Object obj3) {
                    ((Integer) obj3).getClass();
                    this.a.b(npaVar, z, r28Var, f, m3cVar2, j, f3, mz1Var, (x12) obj2, tr7.y(i | 1));
                    return c1e.a;
                }
            };
        }
    }
}
