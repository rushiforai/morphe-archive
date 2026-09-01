package defpackage;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import com.drew.lang.RandomAccessStreamReader;
import com.medium.reader.R;
import gen.model.SourceParameter;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class l5d {
    static {
        new SourceParameter("preview", null, null, null, null, null, null, null, 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -258, 8191, null);
        bo.Z(new yc9("p1", "How I Built a Full App With Claude Code", new sw5("img1", null, null, null, 62)), new yc9("p2", "Anthropic Released a New Course", null)).getClass();
        x1 x1VarZ = bo.Z("img1", "img2", "img3");
        x1 x1VarZ2 = bo.Z(new yc9("post1", "The Future of AI in Everyday Life", new sw5("img1", null, null, null, 62)), new yc9("post2", "Why Every Developer Should Learn Kotlin", null));
        x1VarZ.getClass();
        x1VarZ2.getClass();
        bo.Z(new yc9("p3", "Design Systems That Scale", null)).getClass();
    }

    public static final void a(float f, r28 r28Var, x12 x12Var, int i) {
        int i2;
        r28 r28Var2;
        boolean z;
        o28 o28Var;
        ar0 ar0Var = z46.d;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-542376937);
        int i3 = (p65Var.c(f) ? 4 : 2) | i | 48;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            float fAbs = Math.abs(f);
            o28 o28Var2 = o28.b;
            if (fAbs > 0.0f) {
                p65Var.Y(-284173079);
                float f2 = 0.8f * fAbs;
                boolean z2 = f > 0.0f;
                ar0 ar0Var2 = z2 ? ar0Var : z46.f;
                r28 r28VarY = r40.y(jfc.c, aoc.a);
                sn3 sn3Var = kt7.b;
                r28 r28VarA0 = flb.a0(r28VarY, uu1.b(f2, ((zo7) p65Var.j(sn3Var)).a), rv8.r);
                zk7 zk7VarC = dy0.c(ar0Var, false);
                long j = p65Var.T;
                int i4 = (int) (j ^ (j >>> 32));
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
                tp7.B(p65Var, q12.g, Integer.valueOf(i4));
                tp7.y(p65Var, q12.h);
                tp7.B(p65Var, q12.d, r28VarR);
                o28Var = o28Var2;
                z = false;
                i2 = 1;
                jjd.b(vo7.R(p65Var, z2 ? R.string.onboarding_starter_pack_detail_follow : R.string.onboarding_starter_pack_detail_not_for_me), w2g.C(iy0.a.a(o28Var2, ar0Var2), 24.0f), uu1.b(fAbs, ((zo7) p65Var.j(sn3Var)).n), 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((bu7) p65Var.j(jt7.c)).h, p65Var, 0, 0, 131064);
                p65Var = p65Var;
                p65Var.p(true);
            } else {
                i2 = 1;
                z = false;
                o28Var = o28Var2;
                p65Var.Y(-297426261);
            }
            p65Var.p(z);
            r28Var2 = o28Var;
        } else {
            i2 = 1;
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kj9(f, r28Var2, i, i2);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void b(az5 az5Var, c5d c5dVar, koc kocVar, r28 r28Var, x12 x12Var, int i) {
        Object obj;
        sb2 sb2Var;
        Object dwbVar;
        float f;
        int i2;
        uob uobVar;
        sb2 sb2Var2;
        float f2;
        ou ouVar;
        final ou ouVar2;
        sb2 sb2Var3;
        final float f3;
        r28 r28VarW;
        boolean z;
        boolean z2;
        Object k5dVar;
        String str;
        r28 r28Var2;
        ar0 ar0Var = z46.d;
        c5dVar.getClass();
        kocVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1943626846);
        int i3 = i | (p65Var.f(az5Var) ? 4 : 2) | (p65Var.f(kocVar) ? 256 : 128) | (p65Var.f(r28Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            boc bocVar = (boc) bu1.H0(az5Var);
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (objM == uobVar2) {
                objM = kyd.M(p65Var);
                p65Var.j0(objM);
            }
            sb2 sb2Var4 = (sb2) objM;
            m73 m73Var = (m73) p65Var.j(z22.h);
            float fZ = m73Var.Z(120.0f);
            float fZ2 = m73Var.Z(800.0f);
            boolean zF = p65Var.f(bocVar.getId());
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar2) {
                objM2 = yi2.h(0.0f);
                p65Var.j0(objM2);
            }
            ou ouVar3 = (ou) objM2;
            boolean zF2 = p65Var.f(bocVar.getId());
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar2) {
                objM3 = yi2.h(0.0f);
                p65Var.j0(objM3);
            }
            ou ouVar4 = (ou) objM3;
            String id = bocVar.getId();
            int i4 = i3 & 896;
            boolean zF3 = p65Var.f(bocVar) | (i4 == 256);
            Object objM4 = p65Var.M();
            if (zF3 || objM4 == uobVar2) {
                sb2Var = sb2Var4;
                objM4 = new n79(bocVar, kocVar, null, 20);
                p65Var.j0(objM4);
            } else {
                sb2Var = sb2Var4;
            }
            kyd.k(p65Var, (b55) objM4, id);
            String id2 = bocVar.getId();
            boolean zC = p65Var.c(fZ2) | p65Var.h(ouVar3) | p65Var.h(ouVar4) | p65Var.f(bocVar) | (i4 == 256);
            Object objM5 = p65Var.M();
            if (zC || objM5 == uobVar2) {
                f = fZ;
                i2 = i4;
                uobVar = uobVar2;
                sb2Var2 = sb2Var;
                dwbVar = new dwb(c5dVar, fZ2, bocVar, kocVar, ouVar3, ouVar4, null);
                ouVar4 = ouVar4;
                f2 = fZ2;
                ouVar = ouVar3;
                p65Var.j0(dwbVar);
            } else {
                i2 = i4;
                uobVar = uobVar2;
                ouVar = ouVar3;
                dwbVar = objM5;
                sb2Var2 = sb2Var;
                f = fZ;
                f2 = fZ2;
            }
            kyd.k(p65Var, (b55) dwbVar, id2);
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j = p65Var.T;
            int i5 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
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
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(-193233000);
            Iterator it2 = az5Var.iterator();
            while (it2.hasNext()) {
                boc bocVar2 = (boc) it2.next();
                p65Var.W(1957938124, bocVar2.getKey());
                boolean zL = g76.L(bocVar2.getId(), bocVar.getId());
                if (zL) {
                    p65Var.Y(566645133);
                    r28 r28VarV = f49.V();
                    boolean zH = p65Var.h(ouVar) | p65Var.h(ouVar4);
                    Object objM6 = p65Var.M();
                    if (zH || objM6 == uobVar) {
                        objM6 = new pda(ouVar, 18, ouVar4);
                        p65Var.j0(objM6);
                    }
                    r28 r28VarR2 = guc.R(r28VarV, (x45) objM6);
                    boolean zH2 = p65Var.h(ouVar) | p65Var.c(f);
                    Object objM7 = p65Var.M();
                    if (zH2 || objM7 == uobVar) {
                        objM7 = new b4a(f, 1, ouVar);
                        p65Var.j0(objM7);
                    }
                    r28 r28VarW2 = xz5.W(r28VarR2, (x45) objM7);
                    String id3 = bocVar.getId();
                    boolean zH3 = p65Var.h(sb2Var2) | p65Var.h(ouVar) | p65Var.c(f) | p65Var.c(f2) | p65Var.h(ouVar4) | p65Var.f(bocVar) | (i2 == 256);
                    Object objM8 = p65Var.M();
                    if (zH3 || objM8 == uobVar) {
                        float f4 = f;
                        str = id3;
                        sb2Var3 = sb2Var2;
                        r28Var2 = r28VarW2;
                        boc bocVar3 = bocVar;
                        k5dVar = new k5d(sb2Var3, ouVar, f4, bocVar3, kocVar, f2, ouVar4);
                        ouVar2 = ouVar;
                        f3 = f4;
                        bocVar = bocVar3;
                        p65Var.j0(k5dVar);
                    } else {
                        sb2 sb2Var5 = sb2Var2;
                        r28Var2 = r28VarW2;
                        k5dVar = objM8;
                        ouVar2 = ouVar;
                        f3 = f;
                        str = id3;
                        sb2Var3 = sb2Var5;
                    }
                    r28VarW = r4d.a(r28Var2, str, (PointerInputEventHandler) k5dVar);
                    z = false;
                    p65Var.p(false);
                } else {
                    ouVar2 = ouVar;
                    sb2Var3 = sb2Var2;
                    f3 = f;
                    p65Var.Y(571944862);
                    t0 t0Var = (t0) az5Var;
                    final boolean z3 = t0Var.getSize() >= 2 && g76.L(bocVar2.getId(), ((boc) az5Var.get(t0Var.getSize() - 2)).getId());
                    boolean zG = p65Var.g(z3) | p65Var.h(ouVar2) | p65Var.c(f3);
                    Object objM9 = p65Var.M();
                    if (zG || objM9 == uobVar) {
                        objM9 = new x45() { // from class: d5d
                            @Override // defpackage.x45
                            public final Object invoke(Object obj2) {
                                tjb tjbVar = (tjb) obj2;
                                tjbVar.getClass();
                                tjbVar.j((1.0f - (z3 ? iq7.u(Math.abs(((Number) ouVar2.d()).floatValue()) / f3, 0.0f, 1.0f) : 0.0f)) * (-3.0f));
                                return c1e.a;
                            }
                        };
                        p65Var.j0(objM9);
                    }
                    r28VarW = xz5.W(o28.b, (x45) objM9);
                    z = false;
                    p65Var.p(false);
                }
                zk7 zk7VarC2 = dy0.c(ar0Var, z);
                Iterator it3 = it2;
                ar0 ar0Var2 = ar0Var;
                long j2 = p65Var.T;
                int i6 = (int) (j2 ^ (j2 >>> 32));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarW);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                uob uobVar3 = uobVar;
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, q12.f, zk7VarC2);
                tp7.B(p65Var, q12.e, i89VarL2);
                tp7.B(p65Var, q12.g, Integer.valueOf(i6));
                tp7.y(p65Var, q12.h);
                tp7.B(p65Var, q12.d, r28VarR3);
                if (bocVar2 instanceof nca) {
                    p65Var.Y(1902231852);
                    tp7.i((nca) bocVar2, null, p65Var, 0);
                    p65Var.p(false);
                } else {
                    if (bocVar2 instanceof hae) {
                        p65Var.Y(1902234021);
                        vx0.z((hae) bocVar2, null, p65Var, 0);
                    } else {
                        p65Var.Y(-1172967669);
                    }
                    p65Var.p(false);
                }
                if (zL) {
                    p65Var.Y(-1160207449);
                    z2 = false;
                    a(iq7.u(((Number) ouVar2.d()).floatValue() / f3, -1.0f, 1.0f), null, p65Var, 0);
                } else {
                    z2 = false;
                    p65Var.Y(-1172967669);
                }
                p65Var.p(z2);
                p65Var.p(true);
                p65Var.p(z2);
                sb2Var2 = sb2Var3;
                f = f3;
                ar0Var = ar0Var2;
                ouVar = ouVar2;
                it2 = it3;
                uobVar = uobVar3;
            }
            obj = az5Var;
            p65Var.p(false);
            p65Var.p(true);
        } else {
            obj = az5Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new g9b(i, 12, obj, c5dVar, kocVar, r28Var);
        }
    }
}
