package defpackage;

import android.os.Trace;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pgd extends q28 implements sp6, xl3, xxb {
    public x45 A;
    public Map B;
    public i58 C;
    public ngd D;
    public ogd E;
    public mx o;
    public mkd p;
    public yy4 q;
    public x45 r;
    public int s;
    public boolean t;
    public int u;
    public int v;
    public List w;
    public x45 x;
    public dv1 y;
    public oh0 z;

    @Override // defpackage.xxb
    public final boolean I() {
        return false;
    }

    public final i58 I0() {
        i58 i58Var = this.C;
        if (i58Var == null) {
            i58 i58Var2 = new i58(this.o, this.p, this.q, this.s, this.t, this.u, this.v, this.w, this.z);
            this.C = i58Var2;
            i58Var = i58Var2;
        }
        i58Var.getClass();
        return i58Var;
    }

    public final i58 J0(m73 m73Var) {
        i58 i58Var;
        ogd ogdVar = this.E;
        if (ogdVar != null && ogdVar.c && (i58Var = ogdVar.d) != null) {
            i58Var.d(m73Var);
            return i58Var;
        }
        i58 i58VarI0 = I0();
        i58VarI0.d(m73Var);
        return i58VarI0;
    }

    @Override // defpackage.sp6
    public final int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return jq7.g(J0(fb7Var).e(fb7Var.getLayoutDirection()).q());
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        Trace.beginSection("TextAnnotatedStringNode:measure");
        try {
            i58 i58VarJ0 = J0(bl7Var);
            boolean zC = i58VarJ0.c(j, bl7Var.getLayoutDirection());
            qjd qjdVar = i58VarJ0.o;
            if (qjdVar == null) {
                throw new IllegalStateException("Internal Error: MultiParagraphLayoutCache could not provide TextLayoutResult during the draw phase. Please report this bug on the official Issue Tracker with the following diagnostic information: " + i58VarJ0);
            }
            long j2 = qjdVar.c;
            qjdVar.b.a.a();
            if (zC) {
                flb.t0(this, 2).V0();
                x45 x45Var = this.r;
                if (x45Var != null) {
                    x45Var.invoke(qjdVar);
                }
                Map linkedHashMap = this.B;
                if (linkedHashMap == null) {
                    linkedHashMap = new LinkedHashMap(2);
                }
                linkedHashMap.put(be.a, Integer.valueOf(Math.round(qjdVar.d)));
                linkedHashMap.put(be.b, Integer.valueOf(Math.round(qjdVar.e)));
                this.B = linkedHashMap;
            }
            x45 x45Var2 = this.x;
            if (x45Var2 != null) {
                x45Var2.invoke(qjdVar.f);
            }
            int i = (int) (j2 >> 32);
            int i2 = (int) (j2 & 4294967295L);
            t99 t99VarS = tk7Var.s(g01.Q(i, i, i2, i2));
            Map map = this.B;
            map.getClass();
            return bl7Var.q0(i, i2, map, new y0(t99VarS, 13));
        } finally {
            Trace.endSection();
        }
    }

    @Override // defpackage.sp6
    public final int d(fb7 fb7Var, tk7 tk7Var, int i) {
        return J0(fb7Var).a(i, fb7Var.getLayoutDirection());
    }

    @Override // defpackage.sp6
    public final int e(fb7 fb7Var, tk7 tk7Var, int i) {
        return J0(fb7Var).a(i, fb7Var.getLayoutDirection());
    }

    @Override // defpackage.xl3
    public final void e0(cq6 cq6Var) {
        List list;
        if (!this.n) {
            return;
        }
        e61 e61VarX = cq6Var.a.b.x();
        i58 i58VarJ0 = J0(cq6Var);
        qjd qjdVar = i58VarJ0.o;
        if (qjdVar == null) {
            ik4.o("Internal Error: MultiParagraphLayoutCache could not provide TextLayoutResult during the draw phase. Please report this bug on the official Issue Tracker with the following diagnostic information: ", i58VarJ0);
            return;
        }
        f58 f58Var = qjdVar.b;
        boolean z = qjdVar.d() && this.s != 3;
        if (z) {
            long j = qjdVar.c;
            zwa zwaVarL = lk7.l(0L, (((long) Float.floatToRawIntBits((int) (j >> 32))) << 32) | (4294967295L & ((long) Float.floatToRawIntBits((int) (j & 4294967295L)))));
            e61VarX.h();
            e61VarX.r(zwaVarL);
        }
        try {
            skc skcVar = this.p.a;
            ohd ohdVar = skcVar.m;
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
            ez0 ez0VarE = skcVar.a.e();
            if (ez0VarE != null) {
                f58.j(f58Var, e61VarX, ez0VarE, this.p.a.a.a(), i3cVar2, ohdVar2, pxfVar2);
            } else {
                dv1 dv1Var = this.y;
                long jA = dv1Var != null ? dv1Var.a() : uu1.h;
                if (jA == 16) {
                    jA = this.p.b() != 16 ? this.p.b() : uu1.b;
                }
                f58.i(f58Var, e61VarX, jA, i3cVar2, ohdVar2, pxfVar2, 32);
            }
            if (z) {
                e61VarX.q();
            }
            ogd ogdVar = this.E;
            if (((ogdVar == null || !ogdVar.c) ? gq7.C(this.o) : false) || !((list = this.w) == null || list.isEmpty())) {
                cq6Var.a();
            }
        } finally {
        }
    }

    @Override // defpackage.sp6
    public final int g(fb7 fb7Var, tk7 tk7Var, int i) {
        return jq7.g(J0(fb7Var).e(fb7Var.getLayoutDirection()).h());
    }

    @Override // defpackage.xxb
    public final boolean i() {
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [x45] */
    /* JADX WARN: Type inference failed for: r0v2, types: [ngd] */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r0v4 */
    @Override // defpackage.xxb
    public final void r0(jyb jybVar) {
        ngd ngdVar = this.D;
        ?? r0 = ngdVar;
        if (ngdVar == null) {
            final int i = 0;
            ?? r02 = new x45(this) { // from class: ngd
                public final /* synthetic */ pgd b;

                {
                    this.b = this;
                }

                @Override // defpackage.x45
                public final Object invoke(Object obj) {
                    boolean z;
                    int i2 = i;
                    qjd qjdVar = null;
                    pgd pgdVar = this.b;
                    switch (i2) {
                        case 0:
                            List list = (List) obj;
                            qjd qjdVar2 = pgdVar.I0().o;
                            if (qjdVar2 != null) {
                                pjd pjdVar = qjdVar2.a;
                                mx mxVar = pjdVar.a;
                                mkd mkdVar = pgdVar.p;
                                dv1 dv1Var = pgdVar.y;
                                qjd qjdVar3 = new qjd(new pjd(mxVar, mkd.e(mkdVar, dv1Var != null ? dv1Var.a() : uu1.h, 0L, 0L, null, 0, 0L, 16777214), pjdVar.c, pjdVar.d, pjdVar.e, pjdVar.f, pjdVar.g, pjdVar.h, pjdVar.i, pjdVar.j), qjdVar2.b, qjdVar2.c);
                                list.add(qjdVar3);
                                qjdVar = qjdVar3;
                            }
                            return Boolean.valueOf(qjdVar != null);
                        case 1:
                            mx mxVar2 = (mx) obj;
                            ogd ogdVar = pgdVar.E;
                            ey3 ey3Var = ey3.a;
                            if (ogdVar == null) {
                                ogd ogdVar2 = new ogd(pgdVar.o, mxVar2);
                                i58 i58Var = new i58(mxVar2, pgdVar.p, pgdVar.q, pgdVar.s, pgdVar.t, pgdVar.u, pgdVar.v, ey3Var, pgdVar.z);
                                i58Var.d(pgdVar.I0().k);
                                ogdVar2.d = i58Var;
                                pgdVar.E = ogdVar2;
                            } else if (!g76.L(mxVar2, ogdVar.b)) {
                                ogdVar.b = mxVar2;
                                i58 i58Var2 = ogdVar.d;
                                if (i58Var2 != null) {
                                    mkd mkdVar2 = pgdVar.p;
                                    yy4 yy4Var = pgdVar.q;
                                    int i3 = pgdVar.s;
                                    boolean z2 = pgdVar.t;
                                    int i4 = pgdVar.u;
                                    int i5 = pgdVar.v;
                                    oh0 oh0Var = pgdVar.z;
                                    i58Var2.a = mxVar2;
                                    i58Var2.f(mkdVar2);
                                    i58Var2.b = yy4Var;
                                    i58Var2.c = i3;
                                    i58Var2.d = z2;
                                    i58Var2.e = i4;
                                    i58Var2.f = i5;
                                    i58Var2.g = ey3Var;
                                    i58Var2.h = oh0Var;
                                    i58Var2.s = (i58Var2.s << 2) | 2;
                                    i58Var2.m = null;
                                    i58Var2.o = null;
                                    i58Var2.q = -1;
                                    i58Var2.p = -1;
                                    i58Var2.r = null;
                                }
                            }
                            dl7.u(pgdVar);
                            gx1.M(pgdVar);
                            wgf.y(pgdVar);
                            return Boolean.TRUE;
                        default:
                            boolean zBooleanValue = ((Boolean) obj).booleanValue();
                            ogd ogdVar3 = pgdVar.E;
                            if (ogdVar3 == null) {
                                z = false;
                            } else {
                                x45 x45Var = pgdVar.A;
                                if (x45Var != null) {
                                    x45Var.invoke(ogdVar3);
                                }
                                ogd ogdVar4 = pgdVar.E;
                                if (ogdVar4 != null) {
                                    ogdVar4.c = zBooleanValue;
                                }
                                dl7.u(pgdVar);
                                gx1.M(pgdVar);
                                wgf.y(pgdVar);
                                z = true;
                            }
                            return Boolean.valueOf(z);
                    }
                }
            };
            this.D = r02;
            r0 = r02;
        }
        mx mxVar = this.o;
        fj6[] fj6VarArr = gyb.a;
        jybVar.d(eyb.C, d46.Q(mxVar));
        ogd ogdVar = this.E;
        if (ogdVar != null) {
            mx mxVar2 = ogdVar.b;
            iyb iybVar = eyb.D;
            fj6[] fj6VarArr2 = gyb.a;
            fj6 fj6Var = fj6VarArr2[16];
            jybVar.d(iybVar, mxVar2);
            boolean z = ogdVar.c;
            iyb iybVar2 = eyb.E;
            fj6 fj6Var2 = fj6VarArr2[17];
            jybVar.d(iybVar2, Boolean.valueOf(z));
        }
        final int i2 = 1;
        jybVar.d(sxb.l, new i4(null, new x45(this) { // from class: ngd
            public final /* synthetic */ pgd b;

            {
                this.b = this;
            }

            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z2;
                int i22 = i2;
                qjd qjdVar = null;
                pgd pgdVar = this.b;
                switch (i22) {
                    case 0:
                        List list = (List) obj;
                        qjd qjdVar2 = pgdVar.I0().o;
                        if (qjdVar2 != null) {
                            pjd pjdVar = qjdVar2.a;
                            mx mxVar3 = pjdVar.a;
                            mkd mkdVar = pgdVar.p;
                            dv1 dv1Var = pgdVar.y;
                            qjd qjdVar3 = new qjd(new pjd(mxVar3, mkd.e(mkdVar, dv1Var != null ? dv1Var.a() : uu1.h, 0L, 0L, null, 0, 0L, 16777214), pjdVar.c, pjdVar.d, pjdVar.e, pjdVar.f, pjdVar.g, pjdVar.h, pjdVar.i, pjdVar.j), qjdVar2.b, qjdVar2.c);
                            list.add(qjdVar3);
                            qjdVar = qjdVar3;
                        }
                        return Boolean.valueOf(qjdVar != null);
                    case 1:
                        mx mxVar22 = (mx) obj;
                        ogd ogdVar2 = pgdVar.E;
                        ey3 ey3Var = ey3.a;
                        if (ogdVar2 == null) {
                            ogd ogdVar22 = new ogd(pgdVar.o, mxVar22);
                            i58 i58Var = new i58(mxVar22, pgdVar.p, pgdVar.q, pgdVar.s, pgdVar.t, pgdVar.u, pgdVar.v, ey3Var, pgdVar.z);
                            i58Var.d(pgdVar.I0().k);
                            ogdVar22.d = i58Var;
                            pgdVar.E = ogdVar22;
                        } else if (!g76.L(mxVar22, ogdVar2.b)) {
                            ogdVar2.b = mxVar22;
                            i58 i58Var2 = ogdVar2.d;
                            if (i58Var2 != null) {
                                mkd mkdVar2 = pgdVar.p;
                                yy4 yy4Var = pgdVar.q;
                                int i3 = pgdVar.s;
                                boolean z22 = pgdVar.t;
                                int i4 = pgdVar.u;
                                int i5 = pgdVar.v;
                                oh0 oh0Var = pgdVar.z;
                                i58Var2.a = mxVar22;
                                i58Var2.f(mkdVar2);
                                i58Var2.b = yy4Var;
                                i58Var2.c = i3;
                                i58Var2.d = z22;
                                i58Var2.e = i4;
                                i58Var2.f = i5;
                                i58Var2.g = ey3Var;
                                i58Var2.h = oh0Var;
                                i58Var2.s = (i58Var2.s << 2) | 2;
                                i58Var2.m = null;
                                i58Var2.o = null;
                                i58Var2.q = -1;
                                i58Var2.p = -1;
                                i58Var2.r = null;
                            }
                        }
                        dl7.u(pgdVar);
                        gx1.M(pgdVar);
                        wgf.y(pgdVar);
                        return Boolean.TRUE;
                    default:
                        boolean zBooleanValue = ((Boolean) obj).booleanValue();
                        ogd ogdVar3 = pgdVar.E;
                        if (ogdVar3 == null) {
                            z2 = false;
                        } else {
                            x45 x45Var = pgdVar.A;
                            if (x45Var != null) {
                                x45Var.invoke(ogdVar3);
                            }
                            ogd ogdVar4 = pgdVar.E;
                            if (ogdVar4 != null) {
                                ogdVar4.c = zBooleanValue;
                            }
                            dl7.u(pgdVar);
                            gx1.M(pgdVar);
                            wgf.y(pgdVar);
                            z2 = true;
                        }
                        return Boolean.valueOf(z2);
                }
            }
        }));
        final int i3 = 2;
        jybVar.d(sxb.m, new i4(null, new x45(this) { // from class: ngd
            public final /* synthetic */ pgd b;

            {
                this.b = this;
            }

            @Override // defpackage.x45
            public final Object invoke(Object obj) {
                boolean z2;
                int i22 = i3;
                qjd qjdVar = null;
                pgd pgdVar = this.b;
                switch (i22) {
                    case 0:
                        List list = (List) obj;
                        qjd qjdVar2 = pgdVar.I0().o;
                        if (qjdVar2 != null) {
                            pjd pjdVar = qjdVar2.a;
                            mx mxVar3 = pjdVar.a;
                            mkd mkdVar = pgdVar.p;
                            dv1 dv1Var = pgdVar.y;
                            qjd qjdVar3 = new qjd(new pjd(mxVar3, mkd.e(mkdVar, dv1Var != null ? dv1Var.a() : uu1.h, 0L, 0L, null, 0, 0L, 16777214), pjdVar.c, pjdVar.d, pjdVar.e, pjdVar.f, pjdVar.g, pjdVar.h, pjdVar.i, pjdVar.j), qjdVar2.b, qjdVar2.c);
                            list.add(qjdVar3);
                            qjdVar = qjdVar3;
                        }
                        return Boolean.valueOf(qjdVar != null);
                    case 1:
                        mx mxVar22 = (mx) obj;
                        ogd ogdVar2 = pgdVar.E;
                        ey3 ey3Var = ey3.a;
                        if (ogdVar2 == null) {
                            ogd ogdVar22 = new ogd(pgdVar.o, mxVar22);
                            i58 i58Var = new i58(mxVar22, pgdVar.p, pgdVar.q, pgdVar.s, pgdVar.t, pgdVar.u, pgdVar.v, ey3Var, pgdVar.z);
                            i58Var.d(pgdVar.I0().k);
                            ogdVar22.d = i58Var;
                            pgdVar.E = ogdVar22;
                        } else if (!g76.L(mxVar22, ogdVar2.b)) {
                            ogdVar2.b = mxVar22;
                            i58 i58Var2 = ogdVar2.d;
                            if (i58Var2 != null) {
                                mkd mkdVar2 = pgdVar.p;
                                yy4 yy4Var = pgdVar.q;
                                int i32 = pgdVar.s;
                                boolean z22 = pgdVar.t;
                                int i4 = pgdVar.u;
                                int i5 = pgdVar.v;
                                oh0 oh0Var = pgdVar.z;
                                i58Var2.a = mxVar22;
                                i58Var2.f(mkdVar2);
                                i58Var2.b = yy4Var;
                                i58Var2.c = i32;
                                i58Var2.d = z22;
                                i58Var2.e = i4;
                                i58Var2.f = i5;
                                i58Var2.g = ey3Var;
                                i58Var2.h = oh0Var;
                                i58Var2.s = (i58Var2.s << 2) | 2;
                                i58Var2.m = null;
                                i58Var2.o = null;
                                i58Var2.q = -1;
                                i58Var2.p = -1;
                                i58Var2.r = null;
                            }
                        }
                        dl7.u(pgdVar);
                        gx1.M(pgdVar);
                        wgf.y(pgdVar);
                        return Boolean.TRUE;
                    default:
                        boolean zBooleanValue = ((Boolean) obj).booleanValue();
                        ogd ogdVar3 = pgdVar.E;
                        if (ogdVar3 == null) {
                            z2 = false;
                        } else {
                            x45 x45Var = pgdVar.A;
                            if (x45Var != null) {
                                x45Var.invoke(ogdVar3);
                            }
                            ogd ogdVar4 = pgdVar.E;
                            if (ogdVar4 != null) {
                                ogdVar4.c = zBooleanValue;
                            }
                            dl7.u(pgdVar);
                            gx1.M(pgdVar);
                            wgf.y(pgdVar);
                            z2 = true;
                        }
                        return Boolean.valueOf(z2);
                }
            }
        }));
        jybVar.d(sxb.n, new i4(null, new doc(10, this)));
        gyb.a(jybVar, r0);
    }

    @Override // defpackage.xxb
    public final boolean s0() {
        return false;
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }

    @Override // defpackage.xl3
    public final void L() {
    }
}
