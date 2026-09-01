package defpackage;

import android.content.ContentResolver;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.view.View;
import android.widget.FrameLayout;
import com.medium.android.common.post.paragraph.ParagraphView;
import com.medium.android.core.models.EntityType;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import com.medium.android.donkey.write.EditPostFragment;
import com.medium.android.following.FollowingTab;
import com.medium.android.susi.data.CreateAccountData;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class o8 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ o8(oya oyaVar, xrb xrbVar, oya oyaVar2, az2 az2Var) {
        this.a = 8;
        this.b = oyaVar;
        this.c = xrbVar;
        this.d = oyaVar2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v110, types: [az5, java.lang.Object, java.util.List] */
    /* JADX WARN: Type inference failed for: r0v78, types: [ejc] */
    /* JADX WARN: Type inference failed for: r17v3, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r1v90, types: [android.view.View, android.view.ViewGroup, android.widget.FrameLayout, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r3v38 */
    /* JADX WARN: Type inference failed for: r3v39, types: [ib2, n92, wb2] */
    /* JADX WARN: Type inference failed for: r3v40 */
    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        e61 e61Var;
        Uri uri;
        ju3 ju3Var;
        ?? r3;
        e7e e7eVar;
        Float f;
        Float f2;
        va8 va8VarC;
        int i = this.a;
        int i2 = 16;
        int i3 = 26;
        int i4 = 15;
        int i5 = 28;
        int i6 = 22;
        int i7 = 13;
        int i8 = 2;
        n92 n92Var = null;
        final int i9 = 1;
        final int i10 = 0;
        c1e c1eVar = c1e.a;
        Object obj2 = this.d;
        Object obj3 = this.c;
        Object obj4 = this.b;
        switch (i) {
            case 0:
                np2 np2Var = (np2) obj;
                np2Var.getClass();
                eo2 eo2Var = np2Var.a;
                ys2 ys2Var = (ys2) eo2Var.e;
                vob vobVar = ys2Var.a;
                ko2 ko2Var = eo2Var.b;
                a13 a13VarV = ko2Var.v();
                ax2 ax2VarT = ko2Var.t();
                hac hacVarX = ys2Var.x();
                r13 r13Var = xg3.a;
                iq7.s(r13Var);
                return new r9((String) obj4, (CreateAccountData) obj3, (SusiDestination) obj2, vobVar, a13VarV, ax2VarT, hacVarX, r13Var);
            case 1:
                oya oyaVar = (oya) obj4;
                vod vodVar = (vod) obj3;
                vw vwVar = (vw) obj;
                float fFloatValue = ((Number) vwVar.e.getValue()).floatValue() - oyaVar.a;
                float fG = vodVar.c.g();
                vodVar.b(fG + fFloatValue);
                float fAbs = Math.abs(fG - vodVar.c.g());
                oyaVar.a = ((Number) vwVar.e.getValue()).floatValue();
                ((oya) obj2).a = ((Number) vwVar.b()).floatValue();
                if (Math.abs(fFloatValue - fAbs) > 0.5f) {
                    vwVar.a();
                }
                return c1eVar;
            case 2:
                String str = (String) obj4;
                SusiDestination susiDestination = (SusiDestination) obj2;
                SusiOperation susiOperation = (SusiOperation) obj3;
                hp2 hp2Var = (hp2) obj;
                hp2Var.getClass();
                eo2 eo2Var2 = hp2Var.a;
                ys2 ys2Var2 = (ys2) eo2Var2.e;
                vob vobVar2 = ys2Var2.a;
                j3b j3bVar = new j3b((zk2) ys2Var2.b.r.get(), ys2Var2.C());
                oo1 oo1Var = new oo1((zk2) ys2Var2.b.r.get(), 0);
                ko2 ko2Var2 = eo2Var2.b;
                a13 a13VarV2 = ko2Var2.v();
                dm4 dm4Var = (dm4) ko2Var2.j.get();
                i03 i03Var = i03.a;
                no3 no3Var = new no3(23);
                hac hacVarW = ys2Var2.w();
                hac hacVarX2 = ys2Var2.x();
                z3d z3dVarC = ys2Var2.C();
                ko2 ko2Var3 = ys2Var2.b;
                azb azbVar = new azb(z3dVarC, (gwa) ko2Var3.S.get(), (dm4) ko2Var3.j.get());
                hy2 hy2Var = (hy2) ko2Var2.K.get();
                r13 r13Var2 = xg3.a;
                iq7.s(r13Var2);
                return new yd0(vobVar2, str, susiDestination, susiOperation, j3bVar, oo1Var, a13VarV2, dm4Var, no3Var, hacVarW, hacVarX2, azbVar, hy2Var, r13Var2);
            case 3:
                ip0 ip0Var = new ip0((sb2) obj3, (pod) obj2, 0);
                fj6[] fj6VarArr = gyb.a;
                ((jyb) obj).d(sxb.c, new i4((String) obj4, ip0Var));
                return c1eVar;
            case 4:
                return new ox0((px0) obj, (m73) obj4, (ww) obj3, (x45) obj2);
            case 5:
                k82 k82Var = (k82) obj4;
                va6 va6Var = (va6) obj3;
                tsb tsbVar = (tsb) obj2;
                float fFloatValue2 = ((Float) obj).floatValue();
                float f3 = k82Var.q ? 1.0f : -1.0f;
                vsb vsbVar = k82Var.p;
                long jE = vsbVar.e(vsbVar.h(f3 * fFloatValue2));
                vsb vsbVar2 = tsbVar.a;
                float fG2 = vsbVar.g(vsbVar.e(vsbVar2.c(vsbVar2.k, jE, 1))) * f3;
                if (Math.abs(fG2) < Math.abs(fFloatValue2)) {
                    CancellationException cancellationException = new CancellationException("Scroll animation cancelled because scroll was not consumed (" + fG2 + " < " + fFloatValue2 + ')');
                    cancellationException.initCause(null);
                    va6Var.m(cancellationException);
                }
                return c1eVar;
            case 6:
                kx6 kx6Var = (kx6) obj4;
                uid uidVar = (uid) obj3;
                yqa yqaVar = (yqa) obj2;
                zl3 zl3Var = (zl3) obj;
                rjd rjdVarD = kx6Var.d();
                if (rjdVarD != null) {
                    e61 e61VarX = zl3Var.b0().x();
                    long j = ((bkd) kx6Var.A.getValue()).a;
                    long j2 = ((bkd) kx6Var.B.getValue()).a;
                    qjd qjdVar = rjdVarD.a;
                    f58 f58Var = qjdVar.b;
                    pjd pjdVar = qjdVar.a;
                    uq uqVar = kx6Var.y;
                    long j3 = kx6Var.z;
                    if (!bkd.c(j)) {
                        uqVar.e(j3);
                        int iF = bkd.f(j);
                        yqaVar.a(iF);
                        int iE = bkd.e(j);
                        yqaVar.a(iE);
                        if (iF != iE) {
                            e61VarX.f(qjdVar.i(iF, iE), uqVar);
                        }
                    } else if (!bkd.c(j2)) {
                        long jB = pjdVar.b.b();
                        uu1 uu1Var = new uu1(jB);
                        if (jB == 16) {
                            uu1Var = null;
                        }
                        long j4 = uu1Var != null ? uu1Var.a : uu1.b;
                        uqVar.e(uu1.b(uu1.c(j4) * 0.2f, j4));
                        int iF2 = bkd.f(j2);
                        yqaVar.a(iF2);
                        int iE2 = bkd.e(j2);
                        yqaVar.a(iE2);
                        if (iF2 != iE2) {
                            e61VarX.f(qjdVar.i(iF2, iE2), uqVar);
                        }
                    } else if (!bkd.c(uidVar.b)) {
                        uqVar.e(j3);
                        long j5 = uidVar.b;
                        int iF3 = bkd.f(j5);
                        yqaVar.a(iF3);
                        int iE3 = bkd.e(j5);
                        yqaVar.a(iE3);
                        if (iF3 != iE3) {
                            e61VarX.f(qjdVar.i(iF3, iE3), uqVar);
                        }
                    }
                    boolean z = qjdVar.d() && pjdVar.f != 3;
                    if (z) {
                        long j6 = qjdVar.c;
                        zwa zwaVarL = lk7.l(0L, (((long) Float.floatToRawIntBits((int) (j6 & 4294967295L))) & 4294967295L) | (((long) Float.floatToRawIntBits((int) (j6 >> 32))) << 32));
                        e61VarX.h();
                        e61VarX.r(zwaVarL);
                    }
                    skc skcVar = pjdVar.b.a;
                    ohd ohdVar = skcVar.m;
                    wid widVar = skcVar.a;
                    if (ohdVar == null) {
                        ohdVar = ohd.b;
                    }
                    ohd ohdVar2 = ohdVar;
                    i3c i3cVar = skcVar.n;
                    if (i3cVar == null) {
                        i3cVar = i3c.d;
                    }
                    i3c i3cVar2 = i3cVar;
                    pxf pxfVar = skcVar.o;
                    if (pxfVar == null) {
                        pxfVar = ph4.R;
                    }
                    pxf pxfVar2 = pxfVar;
                    try {
                        ez0 ez0VarE = widVar.e();
                        vid vidVar = vid.a;
                        if (ez0VarE != null) {
                            f58.j(f58Var, e61VarX, ez0VarE, widVar != vidVar ? widVar.a() : 1.0f, i3cVar2, ohdVar2, pxfVar2);
                            e61Var = e61VarX;
                        } else {
                            e61Var = e61VarX;
                            try {
                                f58.i(f58Var, e61Var, widVar != vidVar ? widVar.b() : uu1.b, i3cVar2, ohdVar2, pxfVar2, 32);
                            } catch (Throwable th) {
                                th = th;
                                if (z) {
                                    e61Var.q();
                                }
                                throw th;
                            }
                        }
                        if (z) {
                            e61Var.q();
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        e61Var = e61VarX;
                    }
                    break;
                }
                return c1eVar;
            case 7:
                l78 l78Var = (l78) obj3;
                jl2 jl2Var = (jl2) obj2;
                ml2 ml2Var = (ml2) obj;
                ml2Var.getClass();
                ol2 ol2Var = (ol2) ((pl2) obj4);
                if (ol2Var.b) {
                    l78Var.setValue(ml2Var);
                } else if (ol2Var.c) {
                    jl2Var.a(ol2Var.d);
                }
                return c1eVar;
            case 8:
                oya oyaVar2 = (oya) obj4;
                vw vwVar2 = (vw) obj;
                float fFloatValue3 = ((Number) vwVar2.e.getValue()).floatValue() - oyaVar2.a;
                float fA = ((xrb) obj3).a(fFloatValue3);
                oyaVar2.a = ((Number) vwVar2.e.getValue()).floatValue();
                ((oya) obj2).a = ((Number) vwVar2.b()).floatValue();
                if (Math.abs(fFloatValue3 - fA) > 0.5f) {
                    vwVar2.a();
                }
                return c1eVar;
            case 9:
                Context context = (Context) obj3;
                khd khdVar = (khd) obj2;
                g92 g92Var = (g92) obj;
                List list = ((xgd) obj4).a;
                int size = list.size();
                for (int i11 = 0; i11 < size; i11++) {
                    vgd vgdVar = (vgd) list.get(i11);
                    if (vgdVar instanceof fhd) {
                        fhd fhdVar = (fhd) vgdVar;
                        g92.b(g92Var, new l23(i10, fhdVar), fhdVar.c == 0 ? null : new mz1(new m23(i10, fhdVar), true, -1930700965), new gf2(fhdVar, 24, khdVar), 6);
                    } else if (vgdVar instanceof lhd) {
                        if (Build.VERSION.SDK_INT >= 28) {
                            ep6.g(g92Var, context, (lhd) vgdVar);
                        }
                    } else if (vgdVar instanceof jhd) {
                        g92Var.a.add(d46.c);
                    }
                }
                return c1eVar;
            case 10:
                ?? r0 = (ejc) obj4;
                ba8 ba8Var = (ba8) obj3;
                r0.add(ba8Var);
                return new dv((ob3) obj2, ba8Var, r0);
            case 11:
                final ie3 ie3Var = (ie3) obj4;
                final ld3 ld3Var = (ld3) obj3;
                sh9 sh9Var = (sh9) obj2;
                xu6 xu6Var = (xu6) obj;
                xu6Var.getClass();
                ev6.j(xu6Var, "digest_digest_history", new mz1(new c55() { // from class: hd3
                    @Override // defpackage.c55
                    public final Object f(Object obj5, Object obj6, Object obj7) {
                        int i12 = i10;
                        c1e c1eVar2 = c1e.a;
                        ld3 ld3Var2 = ld3Var;
                        ie3 ie3Var2 = ie3Var;
                        switch (i12) {
                            case 0:
                                x12 x12Var = (x12) obj6;
                                int iIntValue = ((Integer) obj7).intValue();
                                ((xr6) obj5).getClass();
                                p65 p65Var = (p65) x12Var;
                                if (!p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                                    p65Var.S();
                                } else {
                                    jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                                    o28 o28Var = o28.b;
                                    r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                                    zk7 zk7VarC = dy0.c(z46.h, false);
                                    long j7 = p65Var.T;
                                    int i13 = (int) (j7 ^ (j7 >>> 32));
                                    i89 i89VarL = p65Var.l();
                                    r28 r28VarR = gx1.R(p65Var, r28VarJ);
                                    r12.W.getClass();
                                    ot2 ot2Var = q12.b;
                                    p65Var.c0();
                                    if (p65Var.S) {
                                        p65Var.k(ot2Var);
                                    } else {
                                        p65Var.m0();
                                    }
                                    cu cuVar = q12.f;
                                    tp7.B(p65Var, cuVar, zk7VarC);
                                    cu cuVar2 = q12.e;
                                    tp7.B(p65Var, cuVar2, i89VarL);
                                    Integer numValueOf = Integer.valueOf(i13);
                                    cu cuVar3 = q12.g;
                                    tp7.B(p65Var, cuVar3, numValueOf);
                                    fn fnVar = q12.h;
                                    tp7.y(p65Var, fnVar);
                                    cu cuVar4 = q12.d;
                                    tp7.B(p65Var, cuVar4, r28VarR);
                                    r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                                    long j8 = p65Var.T;
                                    int i14 = (int) (j8 ^ (j8 >>> 32));
                                    i89 i89VarL2 = p65Var.l();
                                    r28 r28VarR2 = gx1.R(p65Var, r28VarD);
                                    p65Var.c0();
                                    if (p65Var.S) {
                                        p65Var.k(ot2Var);
                                    } else {
                                        p65Var.m0();
                                    }
                                    tp7.B(p65Var, cuVar, zk7VarC2);
                                    tp7.B(p65Var, cuVar2, i89VarL2);
                                    ka1.z(i14, p65Var, cuVar3, p65Var, fnVar);
                                    tp7.B(p65Var, cuVar4, r28VarR2);
                                    nk7.j(ie3Var2, ld3Var2, null, p65Var, 0);
                                    p65Var.p(true);
                                    p65Var.p(true);
                                }
                                break;
                            default:
                                x12 x12Var2 = (x12) obj6;
                                int iIntValue2 = ((Integer) obj7).intValue();
                                ((xr6) obj5).getClass();
                                p65 p65Var2 = (p65) x12Var2;
                                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                                    p65Var2.S();
                                } else {
                                    jp7 jp7Var2 = (jp7) p65Var2.j(kt7.a);
                                    o28 o28Var2 = o28.b;
                                    r28 r28VarJ2 = ka1.j(jp7Var2, o28Var2, 3, 1.0f);
                                    zk7 zk7VarC3 = dy0.c(z46.h, false);
                                    long j9 = p65Var2.T;
                                    int i15 = (int) (j9 ^ (j9 >>> 32));
                                    i89 i89VarL3 = p65Var2.l();
                                    r28 r28VarR3 = gx1.R(p65Var2, r28VarJ2);
                                    r12.W.getClass();
                                    ot2 ot2Var2 = q12.b;
                                    p65Var2.c0();
                                    if (p65Var2.S) {
                                        p65Var2.k(ot2Var2);
                                    } else {
                                        p65Var2.m0();
                                    }
                                    cu cuVar5 = q12.f;
                                    tp7.B(p65Var2, cuVar5, zk7VarC3);
                                    cu cuVar6 = q12.e;
                                    tp7.B(p65Var2, cuVar6, i89VarL3);
                                    Integer numValueOf2 = Integer.valueOf(i15);
                                    cu cuVar7 = q12.g;
                                    tp7.B(p65Var2, cuVar7, numValueOf2);
                                    fn fnVar2 = q12.h;
                                    tp7.y(p65Var2, fnVar2);
                                    cu cuVar8 = q12.d;
                                    tp7.B(p65Var2, cuVar8, r28VarR3);
                                    r28 r28VarD2 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                                    zk7 zk7VarC4 = dy0.c(z46.d, false);
                                    long j10 = p65Var2.T;
                                    int i16 = (int) (j10 ^ (j10 >>> 32));
                                    i89 i89VarL4 = p65Var2.l();
                                    r28 r28VarR4 = gx1.R(p65Var2, r28VarD2);
                                    p65Var2.c0();
                                    if (p65Var2.S) {
                                        p65Var2.k(ot2Var2);
                                    } else {
                                        p65Var2.m0();
                                    }
                                    tp7.B(p65Var2, cuVar5, zk7VarC4);
                                    tp7.B(p65Var2, cuVar6, i89VarL4);
                                    ka1.z(i16, p65Var2, cuVar7, p65Var2, fnVar2);
                                    tp7.B(p65Var2, cuVar8, r28VarR4);
                                    nk7.i(ie3Var2.e, ld3Var2, null, p65Var2, 0);
                                    p65Var2.p(true);
                                    p65Var2.p(true);
                                }
                                break;
                        }
                        return c1eVar2;
                    }
                }, true, 471396042), 2);
                int i12 = 0;
                for (Object obj5 : ie3Var.c) {
                    int i13 = i12 + 1;
                    if (i12 < 0) {
                        ?? r17 = n92Var;
                        d46.i0();
                        throw r17;
                    }
                    he3 he3Var = (he3) obj5;
                    n92 n92Var2 = n92Var;
                    ev6.j(xu6Var, ev6.w("digest_section_", i12, "_title"), new mz1(new id3(i12, he3Var), true, 1595012110), 2);
                    List list2 = he3Var.b;
                    xu6Var.l0(list2.size(), new s2(new jd3(i12, i10), 18, list2), new re(list2, 11), new mz1(new kd3(list2, i12, sh9Var, i10), true, 2039820996));
                    i12 = i13;
                    n92Var = n92Var2;
                }
                ev6.j(xu6Var, "digest_footer", new mz1(new c55() { // from class: hd3
                    @Override // defpackage.c55
                    public final Object f(Object obj52, Object obj6, Object obj7) {
                        int i122 = i9;
                        c1e c1eVar2 = c1e.a;
                        ld3 ld3Var2 = ld3Var;
                        ie3 ie3Var2 = ie3Var;
                        switch (i122) {
                            case 0:
                                x12 x12Var = (x12) obj6;
                                int iIntValue = ((Integer) obj7).intValue();
                                ((xr6) obj52).getClass();
                                p65 p65Var = (p65) x12Var;
                                if (!p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                                    p65Var.S();
                                } else {
                                    jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                                    o28 o28Var = o28.b;
                                    r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                                    zk7 zk7VarC = dy0.c(z46.h, false);
                                    long j7 = p65Var.T;
                                    int i132 = (int) (j7 ^ (j7 >>> 32));
                                    i89 i89VarL = p65Var.l();
                                    r28 r28VarR = gx1.R(p65Var, r28VarJ);
                                    r12.W.getClass();
                                    ot2 ot2Var = q12.b;
                                    p65Var.c0();
                                    if (p65Var.S) {
                                        p65Var.k(ot2Var);
                                    } else {
                                        p65Var.m0();
                                    }
                                    cu cuVar = q12.f;
                                    tp7.B(p65Var, cuVar, zk7VarC);
                                    cu cuVar2 = q12.e;
                                    tp7.B(p65Var, cuVar2, i89VarL);
                                    Integer numValueOf = Integer.valueOf(i132);
                                    cu cuVar3 = q12.g;
                                    tp7.B(p65Var, cuVar3, numValueOf);
                                    fn fnVar = q12.h;
                                    tp7.y(p65Var, fnVar);
                                    cu cuVar4 = q12.d;
                                    tp7.B(p65Var, cuVar4, r28VarR);
                                    r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                                    long j8 = p65Var.T;
                                    int i14 = (int) (j8 ^ (j8 >>> 32));
                                    i89 i89VarL2 = p65Var.l();
                                    r28 r28VarR2 = gx1.R(p65Var, r28VarD);
                                    p65Var.c0();
                                    if (p65Var.S) {
                                        p65Var.k(ot2Var);
                                    } else {
                                        p65Var.m0();
                                    }
                                    tp7.B(p65Var, cuVar, zk7VarC2);
                                    tp7.B(p65Var, cuVar2, i89VarL2);
                                    ka1.z(i14, p65Var, cuVar3, p65Var, fnVar);
                                    tp7.B(p65Var, cuVar4, r28VarR2);
                                    nk7.j(ie3Var2, ld3Var2, null, p65Var, 0);
                                    p65Var.p(true);
                                    p65Var.p(true);
                                }
                                break;
                            default:
                                x12 x12Var2 = (x12) obj6;
                                int iIntValue2 = ((Integer) obj7).intValue();
                                ((xr6) obj52).getClass();
                                p65 p65Var2 = (p65) x12Var2;
                                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                                    p65Var2.S();
                                } else {
                                    jp7 jp7Var2 = (jp7) p65Var2.j(kt7.a);
                                    o28 o28Var2 = o28.b;
                                    r28 r28VarJ2 = ka1.j(jp7Var2, o28Var2, 3, 1.0f);
                                    zk7 zk7VarC3 = dy0.c(z46.h, false);
                                    long j9 = p65Var2.T;
                                    int i15 = (int) (j9 ^ (j9 >>> 32));
                                    i89 i89VarL3 = p65Var2.l();
                                    r28 r28VarR3 = gx1.R(p65Var2, r28VarJ2);
                                    r12.W.getClass();
                                    ot2 ot2Var2 = q12.b;
                                    p65Var2.c0();
                                    if (p65Var2.S) {
                                        p65Var2.k(ot2Var2);
                                    } else {
                                        p65Var2.m0();
                                    }
                                    cu cuVar5 = q12.f;
                                    tp7.B(p65Var2, cuVar5, zk7VarC3);
                                    cu cuVar6 = q12.e;
                                    tp7.B(p65Var2, cuVar6, i89VarL3);
                                    Integer numValueOf2 = Integer.valueOf(i15);
                                    cu cuVar7 = q12.g;
                                    tp7.B(p65Var2, cuVar7, numValueOf2);
                                    fn fnVar2 = q12.h;
                                    tp7.y(p65Var2, fnVar2);
                                    cu cuVar8 = q12.d;
                                    tp7.B(p65Var2, cuVar8, r28VarR3);
                                    r28 r28VarD2 = jfc.d(jfc.o(o28Var2, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                                    zk7 zk7VarC4 = dy0.c(z46.d, false);
                                    long j10 = p65Var2.T;
                                    int i16 = (int) (j10 ^ (j10 >>> 32));
                                    i89 i89VarL4 = p65Var2.l();
                                    r28 r28VarR4 = gx1.R(p65Var2, r28VarD2);
                                    p65Var2.c0();
                                    if (p65Var2.S) {
                                        p65Var2.k(ot2Var2);
                                    } else {
                                        p65Var2.m0();
                                    }
                                    tp7.B(p65Var2, cuVar5, zk7VarC4);
                                    tp7.B(p65Var2, cuVar6, i89VarL4);
                                    ka1.z(i16, p65Var2, cuVar7, p65Var2, fnVar2);
                                    tp7.B(p65Var2, cuVar8, r28VarR4);
                                    nk7.i(ie3Var2.e, ld3Var2, null, p65Var2, 0);
                                    p65Var2.p(true);
                                    p65Var2.p(true);
                                }
                                break;
                        }
                        return c1eVar2;
                    }
                }, true, 563254273), 2);
                return c1eVar;
            case 12:
                ll3 ll3Var = (ll3) obj3;
                t99 t99Var = (t99) obj2;
                s99 s99Var = (s99) obj;
                boolean zW = ((bl7) obj4).W();
                tl tlVar = ll3Var.o;
                float fD = zW ? tlVar.g().d(((j83) ll3Var.o.j).getValue()) : tlVar.j();
                hw8 hw8Var = ll3Var.q;
                float f4 = hw8Var == hw8.Horizontal ? fD : 0.0f;
                if (hw8Var != hw8.Vertical) {
                    fD = 0.0f;
                }
                s99Var.a = true;
                s99Var.g(t99Var, nk7.w0(f4), nk7.w0(fD), 0.0f);
                s99Var.a = false;
                return c1eVar;
            case 13:
                ml3 ml3Var = (ml3) obj3;
                t99 t99Var2 = (t99) obj2;
                s99 s99Var2 = (s99) obj;
                boolean zW2 = ((bl7) obj4).W();
                sl slVar = ml3Var.o;
                float fC = zW2 ? slVar.d().c(ml3Var.o.h.getValue()) : slVar.f();
                hw8 hw8Var2 = ml3Var.q;
                s99Var2.g(t99Var2, nk7.w0(hw8Var2 == hw8.Horizontal ? fC : 0.0f), nk7.w0(hw8Var2 == hw8.Vertical ? fC : 0.0f), 0.0f);
                return c1eVar;
            case 14:
                EditPostFragment editPostFragment = (EditPostFragment) obj3;
                String str2 = (String) obj4;
                int i14 = EditPostFragment.Q0;
                b09.O(editPostFragment.Z(), editPostFragment.S(), ((i06) obj2).a, str2, null, null, null, 120);
                return c1eVar;
            case 15:
                ju3 ju3Var2 = (ju3) obj4;
                Context context2 = (Context) obj3;
                l78 l78Var2 = (l78) obj2;
                if (((Boolean) obj).booleanValue() && (uri = (Uri) l78Var2.getValue()) != null) {
                    n92 n92Var3 = null;
                    try {
                        ContentResolver contentResolver = context2.getContentResolver();
                        contentResolver.getClass();
                        e7eVar = new e7e(uri, contentResolver);
                        ju3Var = ju3Var2;
                        r3 = 0;
                    } catch (Exception e) {
                        e = e;
                        ju3Var = ju3Var2;
                        r3 = 0;
                    }
                    try {
                        vx0.c0(f76.F(ju3Var2), null, null, new lj1((que) ju3Var2, (Object) e7eVar, true, n92Var3, 3), 3);
                    } catch (Exception e2) {
                        e = e2;
                        vx0.c0(f76.F(ju3Var), r3, r3, new xs3(e, ju3Var, r3, i8), 3);
                    }
                    break;
                }
                return c1eVar;
            case 16:
                xu6 xu6Var2 = (xu6) obj;
                xu6Var2.getClass();
                ?? r02 = ((u64) obj4).e;
                xu6Var2.l0(((t0) r02).getSize(), new s2(new iz2(19), 24, r02), new re(r02, 15), new mz1(new o64(r02, (cs1) obj3, (obe) obj2, i10), true, 802480018));
                return c1eVar;
            case 17:
                ti4 ti4Var = (ti4) obj4;
                xu6 xu6Var3 = (xu6) obj;
                xu6Var3.getClass();
                ev6.j(xu6Var3, "find_friends_info_section", new mz1(new g64(ti4Var, 8, (hi4) obj3), true, -129044826), 2);
                List list3 = ti4Var.b;
                xu6Var3.l0(list3.size(), new s2(new iz2(27), i3, list3), new re(list3, 16), new mz1(new wf(list3, (obe) obj2, 5), true, 802480018));
                if (ti4Var.d) {
                    ev6.j(xu6Var3, "find_friends_loading_more", guc.e, 2);
                }
                return c1eVar;
            case 18:
                bq2 bq2Var = (bq2) obj;
                bq2Var.getClass();
                r13 r13Var3 = xg3.a;
                iq7.s(r13Var3);
                eo2 eo2Var3 = bq2Var.a;
                ys2 ys2Var3 = (ys2) eo2Var3.e;
                s53 s53Var = new s53(ys2Var3.N());
                md5 md5Var = new md5(i2, ys2Var3.t());
                ku3 ku3VarH = ys2Var3.h();
                o2b o2bVarI = ys2Var3.I();
                o2b o2bVarA = ys2Var3.A();
                eoc eocVarK = ys2Var3.K();
                ko2 ko2Var4 = eo2Var3.b;
                return new qu4((String) obj4, (EntityType) obj3, (String) obj2, r13Var3, s53Var, md5Var, ku3VarH, o2bVarI, o2bVarA, eocVarK, ko2Var4.t(), ko2Var4.m());
            case 19:
                ov4 ov4Var = (ov4) obj4;
                oe1 oe1Var = (oe1) obj2;
                xu6 xu6Var4 = (xu6) obj;
                xu6Var4.getClass();
                bo.F(xu6Var4, ov4Var.a, (ye1) obj3, oe1Var);
                if (ov4Var.c) {
                    ev6.j(xu6Var4, "catalog_item_skeleton", new mz1(new so1(i7, oe1Var), true, 916731324), 2);
                }
                return c1eVar;
            case 20:
                gq2 gq2Var = (gq2) obj;
                gq2Var.getClass();
                eo2 eo2Var4 = gq2Var.a;
                return new ty4((String) obj4, (String) obj3, (FollowingTab) obj2, ((ys2) eo2Var4.e).a, eo2Var4.b.t());
            case 21:
                jy4 jy4Var = (jy4) obj4;
                x45 x45Var = (x45) obj3;
                obe obeVar = (obe) obj2;
                xu6 xu6Var5 = (xu6) obj;
                xu6Var5.getClass();
                if (jy4Var.d) {
                    ev6.j(xu6Var5, "following_find_friends_button", new mz1(new g64(x45Var, i7, jy4Var), true, -138164366), 2);
                }
                List list4 = jy4Var.a;
                xu6Var5.l0(list4.size(), new dy4(new p44(13), i8, list4), new re(list4, 22), new mz1(new wf(list4, obeVar, 7), true, 2039820996));
                if (jy4Var.c) {
                    ev6.j(xu6Var5, "following_users_item_loading_more", pxf.g, 2);
                }
                return c1eVar;
            case 22:
                k25 k25Var = (k25) obj4;
                j15 j15Var = (j15) obj3;
                ba8 ba8Var2 = (ba8) obj2;
                iy6 iy6Var = (iy6) obj;
                ArrayList arrayList = k25Var.g;
                if (arrayList.isEmpty()) {
                    i9 = 0;
                } else {
                    Iterator it2 = arrayList.iterator();
                    while (it2.hasNext()) {
                        if (g76.L(((f09) it2.next()).a, j15Var.y)) {
                        }
                    }
                    i9 = 0;
                }
                if (iy6Var != null && i9 == 0) {
                    w25 w25VarQ = j15Var.q();
                    w25VarQ.b();
                    ky6 ky6Var = w25VarQ.e;
                    if (ky6Var.d.isAtLeast(vx6.CREATED)) {
                        ky6Var.a((hy6) k25Var.i.invoke(ba8Var2));
                    }
                }
                return c1eVar;
            case 23:
                iy6 iy6Var2 = (iy6) obj4;
                rya ryaVar = new rya();
                ay6 ay6Var = new ay6((ry6) obj3, ryaVar, (x45) obj2, 0);
                iy6Var2.getLifecycle().a(ay6Var);
                return new dv(iy6Var2, ay6Var, ryaVar, i8);
            case 24:
                upc upcVar = (upc) obj3;
                tjb tjbVar = (tjb) obj;
                tjbVar.k(((Number) upcVar.getValue()).floatValue());
                tjbVar.l(((Number) upcVar.getValue()).floatValue());
                tjbVar.c(((Number) ((upc) obj2).getValue()).floatValue());
                tjbVar.s(((nrd) ((l78) obj4).getValue()).a);
                return c1eVar;
            case 25:
                v7c v7cVar = (v7c) obj3;
                vx0.c0((sb2) obj4, null, null, new jx0(v7cVar, ((Float) obj).floatValue(), n92Var, i9), 3).R(new m18(v7cVar, (m45) obj2, 1));
                return c1eVar;
            case 26:
                l78 l78Var3 = (l78) obj3;
                l78 l78Var4 = (l78) obj2;
                kb9 kb9Var = (kb9) obj;
                ((l78) obj4).setValue((kb9Var == null || (f2 = kb9Var.c) == null) ? null : Long.valueOf((long) f2.floatValue()));
                l78Var3.setValue((kb9Var == null || (f = kb9Var.a) == null) ? null : Long.valueOf((long) f.floatValue()));
                l78Var4.setValue(kb9Var != null ? Long.valueOf(kb9Var.b) : null);
                return c1eVar;
            case 27:
                sc8 sc8Var = (sc8) obj4;
                ob8 ob8Var = (ob8) obj3;
                w6 w6Var = (w6) obj2;
                ba8 ba8Var3 = (ba8) obj;
                ba8Var3.getClass();
                da8 da8Var = ba8Var3.h;
                va8 va8Var = ba8Var3.b;
                if (va8Var == null) {
                    va8Var = null;
                }
                if (va8Var == null || (va8VarC = sc8Var.c(va8Var, da8Var.a(), ob8Var, w6Var)) == null) {
                    return null;
                }
                return va8VarC.equals(va8Var) ? ba8Var3 : sc8Var.b().b(va8VarC, va8VarC.f(da8Var.a()));
            case 28:
                xu6 xu6Var6 = (xu6) obj;
                xu6Var6.getClass();
                List list5 = ((qk8) obj4).b;
                xu6Var6.l0(list5.size(), new dy4(new wn7(i5), i4, list5), new re(list5, 26), new mz1(new o37(list5, (ek8) obj3, (obe) obj2, i9), true, 2039820996));
                return c1eVar;
            default:
                h09 h09Var = (h09) obj4;
                l78 l78Var5 = (l78) obj3;
                Context context3 = (Context) obj2;
                ?? r1 = (FrameLayout) obj;
                r1.getClass();
                View childAt = r1.getChildAt(0);
                ParagraphView paragraphView = childAt instanceof ParagraphView ? (ParagraphView) childAt : null;
                if (paragraphView != null) {
                    paragraphView.setActionHandler(h09Var);
                    zm8 zm8Var = ((n39) l78Var5.getValue()).r;
                    o19 o19Var = new o19(2, new s7(r1, paragraphView, context3, h09Var, l78Var5, 8));
                    o19 o19Var2 = new o19(3, new hb8(i6));
                    zm8Var.getClass();
                    do6 do6Var = new do6(o19Var, o19Var2);
                    zm8Var.b0(do6Var);
                    Object tag = r1.getTag(-1712675874);
                    sh3 sh3Var = tag instanceof sh3 ? (sh3) tag : null;
                    if (sh3Var != null) {
                        sh3Var.dispose();
                    }
                    r1.setTag(-1712675874, do6Var);
                    paragraphView.a(new g98(1, ((n39) l78Var5.getValue()).f, z19.class, "onHighlightPresented", "onHighlightPresented(Lcom/medium/android/domain/post/models/Highlight;)V", 0, 12));
                }
                return c1eVar;
        }
    }

    public /* synthetic */ o8(k82 k82Var, d4e d4eVar, va6 va6Var, tsb tsbVar) {
        this.a = 5;
        this.b = k82Var;
        this.c = va6Var;
        this.d = tsbVar;
    }

    public /* synthetic */ o8(EditPostFragment editPostFragment, i06 i06Var, String str) {
        this.a = 14;
        this.c = editPostFragment;
        this.d = i06Var;
        this.b = str;
    }

    public /* synthetic */ o8(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }

    public /* synthetic */ o8(String str, SusiDestination susiDestination, SusiOperation susiOperation) {
        this.a = 2;
        this.b = str;
        this.d = susiDestination;
        this.c = susiOperation;
    }
}
