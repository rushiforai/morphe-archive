package defpackage;

import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.medium.proto.event.PostFeatureInPublicationClicked;
import com.medium.proto.event.PostStopFeaturingInPublicationClicked;
import gen.model.SourceParameter;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tl implements asc {
    public final Object a;
    public final Object b;
    public final Object c;
    public final Object d;
    public final Object e;
    public final Object f;
    public final Object g;
    public final Object h;
    public final Object i;
    public final Object j;
    public final Object k;
    public final Object l;
    public final Object m;

    public tl(w7c w7cVar, r00 r00Var, m45 m45Var, d9a d9aVar, x45 x45Var) {
        this.a = r00Var;
        this.b = m45Var;
        this.c = d9aVar;
        this.d = x45Var;
        this.e = new i66();
        this.f = new rl(this);
        this.g = qo7.u(w7cVar);
        this.j = bjc.b(new el(this, 0));
        bjc.b(new el(this, 1));
        this.k = new g49(Float.NaN);
        new x90(0);
        uic.h().g();
        om8.a.getClass();
        this.l = new g49(0.0f);
        this.h = qo7.u(null);
        this.i = qo7.u(new gh7(fy3.a));
        this.m = new ol(this);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object a(defpackage.s78 r15, defpackage.tg r16, defpackage.p92 r17) {
        /*
            Method dump skipped, instruction units count: 201
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tl.a(s78, tg, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0022  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object b(java.lang.Object r19, defpackage.s78 r20, defpackage.d55 r21, defpackage.n92 r22) {
        /*
            Method dump skipped, instruction units count: 244
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tl.b(java.lang.Object, s78, d55, n92):java.lang.Object");
    }

    @Override // defpackage.asc
    public void c(yp0 yp0Var, kp7 kp7Var, boolean z) {
        Object next;
        c52 c52Var;
        synchronized (((LinkedHashSet) this.l)) {
            try {
                Iterator it2 = ((LinkedHashSet) this.l).iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        next = null;
                        break;
                    }
                    next = it2.next();
                    String absolutePath = ((c52) next).a.getAbsolutePath();
                    absolutePath.getClass();
                    if (absolutePath.equals(yp0Var.a)) {
                        break;
                    }
                }
                c52Var = (c52) next;
            } catch (Throwable th) {
                throw th;
            }
        }
        if (c52Var == null) {
            return;
        }
        if (z) {
            File file = c52Var.a;
            File file2 = c52Var.b;
            f66 f66Var = (f66) this.g;
            long jU0 = ht2.u0(file, f66Var);
            pkf pkfVar = (pkf) this.f;
            if (pkfVar.p(file)) {
                ((h08) this.i).d(file, kp7Var, ((xp0) this.b).f.decrementAndGet());
                if (kp7Var.equals(new d4b(Mp4VideoDirectory.TAG_TEMPORAL_QUALITY)) && jU0 > 0) {
                    ((jzb) this.k).z((String) this.j, "android.benchmark.bytes_deleted");
                }
            } else {
                f49.K((f66) this.g, d66.WARN, e66.MAINTAINER, new vp0(file, 2), null, false, 56);
            }
            if (file2 != null && ht2.k0(file2, f66Var) && !pkfVar.p(file2)) {
                f49.K((f66) this.g, d66.WARN, e66.MAINTAINER, new vp0(file2, 3), null, false, 56);
            }
        }
        synchronized (((LinkedHashSet) this.l)) {
            ((LinkedHashSet) this.l).remove(c52Var);
        }
    }

    public Object d(float f, float f2, Object obj) {
        r00 r00Var = (r00) this.a;
        gh7 gh7VarG = g();
        float fD = gh7VarG.d(obj);
        float fFloatValue = ((Number) ((m45) this.b).invoke()).floatValue();
        if (fD != f && !Float.isNaN(fD)) {
            if (fD < f) {
                if (f2 >= fFloatValue) {
                    Object objB = gh7VarG.b(f, true);
                    objB.getClass();
                    return objB;
                }
                Object objB2 = gh7VarG.b(f, true);
                objB2.getClass();
                if (f >= Math.abs(Math.abs(((Number) r00Var.invoke(Float.valueOf(Math.abs(gh7VarG.d(objB2) - fD)))).floatValue()) + fD)) {
                    return objB2;
                }
            } else {
                if (f2 <= (-fFloatValue)) {
                    Object objB3 = gh7VarG.b(f, false);
                    objB3.getClass();
                    return objB3;
                }
                Object objB4 = gh7VarG.b(f, false);
                objB4.getClass();
                float fAbs = Math.abs(fD - Math.abs(((Number) r00Var.invoke(Float.valueOf(Math.abs(fD - gh7VarG.d(objB4))))).floatValue()));
                if (f >= 0.0f ? f <= fAbs : Math.abs(f) >= fAbs) {
                    return objB4;
                }
            }
        }
        return obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object e(java.lang.String r5, java.lang.String r6, gen.model.SourceParameter r7, defpackage.p92 r8) {
        /*
            r4 = this;
            boolean r0 = r8 instanceof defpackage.nd9
            if (r0 == 0) goto L13
            r0 = r8
            nd9 r0 = (defpackage.nd9) r0
            int r1 = r0.g
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.g = r1
            goto L18
        L13:
            nd9 r0 = new nd9
            r0.<init>(r4, r8)
        L18:
            java.lang.Object r8 = r0.e
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.g
            r3 = 1
            if (r2 == 0) goto L38
            if (r2 != r3) goto L31
            gen.model.SourceParameter r7 = r0.d
            java.lang.String r6 = r0.c
            java.lang.String r5 = r0.b
            defpackage.br7.v(r8)
            bjb r8 = (defpackage.bjb) r8
            java.lang.Object r4 = r8.a
            goto L4e
        L31:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L38:
            defpackage.br7.v(r8)
            java.lang.Object r4 = r4.j
            s53 r4 = (defpackage.s53) r4
            r0.b = r5
            r0.c = r6
            r0.d = r7
            r0.g = r3
            java.lang.Object r4 = r4.a(r5, r0)
            if (r4 != r1) goto L4e
            return r1
        L4e:
            java.lang.Throwable r8 = defpackage.bjb.b(r4)
            if (r8 != 0) goto L59
            c1e r4 = (defpackage.c1e) r4
            y53 r4 = defpackage.y53.a
            return r4
        L59:
            k53 r4 = new k53
            r4.<init>(r5, r6, r7, r8)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tl.e(java.lang.String, java.lang.String, gen.model.SourceParameter, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object f(defpackage.n92 r5, gen.model.SourceParameter r6, java.lang.String r7, java.lang.String r8, java.lang.String r9) {
        /*
            r4 = this;
            boolean r0 = r5 instanceof defpackage.od9
            if (r0 == 0) goto L13
            r0 = r5
            od9 r0 = (defpackage.od9) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            od9 r0 = new od9
            r0.<init>(r4, r5)
        L18:
            java.lang.Object r5 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 1
            if (r2 == 0) goto L36
            if (r2 != r3) goto L2f
            gen.model.SourceParameter r6 = r0.c
            java.lang.String r7 = r0.b
            defpackage.br7.v(r5)
            bjb r5 = (defpackage.bjb) r5
            java.lang.Object r4 = r5.a
            goto L51
        L2f:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L36:
            defpackage.br7.v(r5)
            java.lang.Object r4 = r4.b
            jz1 r4 = (defpackage.jz1) r4
            r0.b = r7
            r0.c = r6
            r0.f = r3
            r5 = r7
            r7 = r6
            r6 = r8
            r8 = r9
            r9 = r0
            java.lang.Object r4 = r4.w(r5, r6, r7, r8, r9)
            if (r4 != r1) goto L4f
            return r1
        L4f:
            r6 = r7
            r7 = r5
        L51:
            java.lang.Throwable r5 = defpackage.bjb.b(r4)
            if (r5 != 0) goto L5f
            com.medium.android.graphql.fragment.CollectionFollowData r4 = (com.medium.android.graphql.fragment.CollectionFollowData) r4
            zs4 r4 = new zs4
            r4.<init>(r7, r6)
            return r4
        L5f:
            ys4 r4 = new ys4
            r4.<init>(r6, r7, r5)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tl.f(n92, gen.model.SourceParameter, java.lang.String, java.lang.String, java.lang.String):java.lang.Object");
    }

    public gh7 g() {
        return (gh7) ((k49) this.i).getValue();
    }

    @Override // defpackage.asc
    public sp0 h() {
        synchronized (((LinkedHashSet) this.l)) {
            try {
                xp0 xp0Var = (xp0) this.b;
                LinkedHashSet linkedHashSet = (LinkedHashSet) this.l;
                ArrayList arrayList = new ArrayList(cu1.k0(linkedHashSet, 10));
                Iterator it2 = linkedHashSet.iterator();
                while (it2.hasNext()) {
                    arrayList.add(((c52) it2.next()).a);
                }
                File fileF = xp0Var.f(bu1.q1(arrayList));
                byte[] bArr = null;
                if (fileF == null) {
                    return null;
                }
                File fileD = ((xp0) this.b).d(fileF);
                ((LinkedHashSet) this.l).add(new c52(fileF, fileD));
                String absolutePath = fileF.getAbsolutePath();
                absolutePath.getClass();
                yp0 yp0Var = new yp0(absolutePath);
                if (fileD != null && ht2.k0(fileD, (f66) this.g)) {
                    ba9 ba9Var = (ba9) this.e;
                    byte[] bArrJ0 = ba9.b;
                    try {
                        if (!fileD.exists()) {
                            f49.L(ba9Var.a, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(fileD, 18), null, 56);
                        } else if (fileD.isDirectory()) {
                            f49.L(ba9Var.a, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(fileD, 19), null, 56);
                        } else {
                            bArrJ0 = oh4.J0(fileD);
                        }
                    } catch (IOException e) {
                        f49.L(ba9Var.a, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(fileD, 20), e, 48);
                    } catch (SecurityException e2) {
                        f49.L(ba9Var.a, d66.ERROR, d46.R(e66.MAINTAINER, e66.TELEMETRY), new vp0(fileD, 21), e2, 48);
                    }
                    bArr = bArrJ0;
                }
                return new sp0(yp0Var, ((ba9) this.d).e(fileF), bArr);
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public float i(float f) {
        g49 g49Var = (g49) this.k;
        float fG = (Float.isNaN(g49Var.g()) ? 0.0f : g49Var.g()) + f;
        float fC = g().c();
        Float fK0 = bu1.K0(g().a.values());
        return iq7.u(fG, fC, fK0 != null ? fK0.floatValue() : Float.NaN);
    }

    public float j() {
        g49 g49Var = (g49) this.k;
        if (!Float.isNaN(g49Var.g())) {
            return g49Var.g();
        }
        ygf.f("The offset was read before being initialized. Did you access the offset in a phase before layout, like effects or composition?");
        return 0.0f;
    }

    @Override // defpackage.asc
    public x45 k(vu2 vu2Var) {
        xp0 xp0Var;
        String str = (String) this.j;
        dm0 dm0Var = (dm0) this.a;
        vu2Var.getClass();
        int i = d52.a[vu2Var.o.ordinal()];
        if (i == 1) {
            xp0Var = (xp0) this.b;
        } else if (i != 2) {
            xp0Var = null;
            if (i != 3) {
                ygf.a();
                return null;
            }
        } else {
            xp0Var = (xp0) this.c;
        }
        xp0 xp0Var2 = xp0Var;
        Object obj = this.g;
        Object obj2 = this.m;
        return xp0Var2 == null ? new v80(dm0Var, new qg8(), obj2, str, (f66) obj) : new v80(dm0Var, new mg4(xp0Var2, (ba9) this.d, (ba9) this.e, (rg4) this.h, this, (f66) obj), obj2, str, (f66) obj);
    }

    public void l(Object obj) {
        ((k49) this.g).setValue(obj);
    }

    public void m(Object obj) {
        ((k49) this.h).setValue(obj);
    }

    public Object n(float f, p4d p4dVar) {
        Object value = ((k49) this.g).getValue();
        Object objD = d(j(), f, value);
        boolean zBooleanValue = ((Boolean) ((x45) this.d).invoke(objD)).booleanValue();
        int i = 0;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        if (zBooleanValue) {
            Object objB = b(objD, s78.Default, new mk(this, f, n92Var, i), p4dVar);
            tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
            if (objB != tb2Var) {
                objB = c1eVar;
            }
            if (objB == tb2Var) {
                return objB;
            }
        } else {
            Object objB2 = b(value, s78.Default, new mk(this, f, n92Var, i), p4dVar);
            tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
            if (objB2 != tb2Var2) {
                objB2 = c1eVar;
            }
            if (objB2 == tb2Var2) {
                return objB2;
            }
        }
        return c1eVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object o(boolean r9, java.lang.String r10, java.lang.String r11, java.lang.String r12, gen.model.SourceParameter r13, java.lang.String r14, defpackage.n92 r15) {
        /*
            r8 = this;
            boolean r0 = r15 instanceof defpackage.pd9
            if (r0 == 0) goto L14
            r0 = r15
            pd9 r0 = (defpackage.pd9) r0
            int r1 = r0.i
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.i = r1
        L12:
            r2 = r0
            goto L1a
        L14:
            pd9 r0 = new pd9
            r0.<init>(r8, r15)
            goto L12
        L1a:
            java.lang.Object r15 = r2.g
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r2.i
            r3 = 2
            r4 = 1
            if (r1 == 0) goto L46
            if (r1 == r4) goto L28
            if (r1 != r3) goto L3f
        L28:
            boolean r9 = r2.b
            gen.model.SourceParameter r13 = r2.f
            java.lang.String r12 = r2.e
            java.lang.String r11 = r2.d
            java.lang.String r10 = r2.c
            defpackage.br7.v(r15)
            bjb r15 = (defpackage.bjb) r15
            java.lang.Object r8 = r15.a
        L39:
            r14 = r12
            r12 = r11
            r11 = r10
            r10 = r9
            goto L91
        L3f:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            r8 = 0
            return r8
        L46:
            defpackage.br7.v(r15)
            if (r9 == 0) goto L6e
            java.lang.Object r8 = r8.f
            r1 = r8
            f88 r1 = (defpackage.f88) r1
            r2.c = r10
            r2.d = r11
            r2.e = r12
            r2.f = r13
            r2.b = r9
            r2.i = r4
            r4 = r10
            r5 = r11
            r6 = r12
            r3 = r13
            r7 = r14
            java.lang.Object r8 = r1.b(r2, r3, r4, r5, r6, r7)
            r10 = r3
            if (r8 != r0) goto L69
            goto L8b
        L69:
            r13 = r10
            r10 = r4
            r11 = r5
            r12 = r6
            goto L39
        L6e:
            r4 = r10
            r5 = r11
            r6 = r12
            r10 = r13
            r7 = r14
            java.lang.Object r8 = r8.g
            r1 = r8
            mya r1 = (defpackage.mya) r1
            r2.c = r4
            r2.d = r5
            r2.e = r6
            r2.f = r10
            r2.b = r9
            r2.i = r3
            r3 = r10
            java.lang.Object r8 = r1.x(r2, r3, r4, r5, r6, r7)
            if (r8 != r0) goto L8c
        L8b:
            return r0
        L8c:
            r10 = r9
            r13 = r3
            r11 = r4
            r12 = r5
            r14 = r6
        L91:
            java.lang.Throwable r15 = defpackage.bjb.b(r8)
            if (r15 != 0) goto L9f
            com.medium.android.graphql.fragment.UserMuteData r8 = (com.medium.android.graphql.fragment.UserMuteData) r8
            cnd r9 = new cnd
            r9.<init>(r10, r11, r12, r13, r14)
            return r9
        L9f:
            bnd r9 = new bnd
            r9.<init>(r10, r11, r12, r13, r14, r15)
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tl.o(boolean, java.lang.String, java.lang.String, java.lang.String, gen.model.SourceParameter, java.lang.String, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object p(boolean r9, java.lang.String r10, java.lang.String r11, java.lang.String r12, gen.model.SourceParameter r13, java.lang.String r14, defpackage.n92 r15) {
        /*
            r8 = this;
            boolean r0 = r15 instanceof defpackage.qd9
            if (r0 == 0) goto L14
            r0 = r15
            qd9 r0 = (defpackage.qd9) r0
            int r1 = r0.i
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.i = r1
        L12:
            r2 = r0
            goto L1a
        L14:
            qd9 r0 = new qd9
            r0.<init>(r8, r15)
            goto L12
        L1a:
            java.lang.Object r15 = r2.g
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r2.i
            r3 = 2
            r4 = 1
            if (r1 == 0) goto L46
            if (r1 == r4) goto L28
            if (r1 != r3) goto L3f
        L28:
            boolean r9 = r2.b
            gen.model.SourceParameter r13 = r2.f
            java.lang.String r12 = r2.e
            java.lang.String r11 = r2.d
            java.lang.String r10 = r2.c
            defpackage.br7.v(r15)
            bjb r15 = (defpackage.bjb) r15
            java.lang.Object r8 = r15.a
        L39:
            r14 = r12
            r12 = r11
            r11 = r10
            r10 = r9
            goto L91
        L3f:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            r8 = 0
            return r8
        L46:
            defpackage.br7.v(r15)
            if (r9 == 0) goto L6e
            java.lang.Object r8 = r8.d
            r1 = r8
            gg5 r1 = (defpackage.gg5) r1
            r2.c = r10
            r2.d = r11
            r2.e = r12
            r2.f = r13
            r2.b = r9
            r2.i = r4
            r4 = r10
            r5 = r11
            r6 = r12
            r3 = r13
            r7 = r14
            java.lang.Object r8 = r1.I(r2, r3, r4, r5, r6, r7)
            r10 = r3
            if (r8 != r0) goto L69
            goto L8b
        L69:
            r13 = r10
            r10 = r4
            r11 = r5
            r12 = r6
            goto L39
        L6e:
            r4 = r10
            r5 = r11
            r6 = r12
            r10 = r13
            r7 = r14
            java.lang.Object r8 = r8.e
            r1 = r8
            a1a r1 = (defpackage.a1a) r1
            r2.c = r4
            r2.d = r5
            r2.e = r6
            r2.f = r10
            r2.b = r9
            r2.i = r3
            r3 = r10
            java.lang.Object r8 = r1.F(r2, r3, r4, r5, r6, r7)
            if (r8 != r0) goto L8c
        L8b:
            return r0
        L8c:
            r10 = r9
            r13 = r3
            r11 = r4
            r12 = r5
            r14 = r6
        L91:
            java.lang.Throwable r15 = defpackage.bjb.b(r8)
            if (r15 != 0) goto L9f
            com.medium.android.graphql.fragment.CollectionProfileData r8 = (com.medium.android.graphql.fragment.CollectionProfileData) r8
            end r9 = new end
            r9.<init>(r10, r11, r12, r13, r14)
            return r9
        L9f:
            dnd r9 = new dnd
            r9.<init>(r10, r11, r12, r13, r14, r15)
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tl.p(boolean, java.lang.String, java.lang.String, java.lang.String, gen.model.SourceParameter, java.lang.String, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object q(java.lang.String r6, boolean r7, gen.model.SourceParameter r8, defpackage.n92 r9) {
        /*
            r5 = this;
            boolean r0 = r9 instanceof defpackage.rd9
            if (r0 == 0) goto L13
            r0 = r9
            rd9 r0 = (defpackage.rd9) r0
            int r1 = r0.g
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.g = r1
            goto L18
        L13:
            rd9 r0 = new rd9
            r0.<init>(r5, r9)
        L18:
            java.lang.Object r9 = r0.e
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.g
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L34
            if (r2 != r4) goto L2e
            boolean r7 = r0.d
            gen.model.SourceParameter r8 = r0.c
            java.lang.String r6 = r0.b
            defpackage.br7.v(r9)
            goto L4a
        L2e:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L34:
            defpackage.br7.v(r9)
            java.lang.Object r5 = r5.h
            jnd r5 = (defpackage.jnd) r5
            r0.b = r6
            r0.c = r8
            r0.d = r7
            r0.g = r4
            java.lang.Object r9 = r5.a(r6, r7, r0)
            if (r9 != r1) goto L4a
            return r1
        L4a:
            l99 r9 = (defpackage.l99) r9
            boolean r5 = r9 instanceof defpackage.k99
            if (r5 == 0) goto L56
            knd r5 = new knd
            r5.<init>(r8, r6, r7)
            return r5
        L56:
            boolean r5 = r9 instanceof defpackage.j99
            if (r5 == 0) goto L60
            hnd r5 = new hnd
            r5.<init>(r8, r6, r7)
            return r5
        L60:
            boolean r5 = r9 instanceof defpackage.i99
            if (r5 == 0) goto L6e
            gnd r5 = new gnd
            i99 r9 = (defpackage.i99) r9
            java.lang.Throwable r9 = r9.a
            r5.<init>(r6, r7, r8, r9)
            return r5
        L6e:
            defpackage.ygf.a()
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tl.q(java.lang.String, boolean, gen.model.SourceParameter, n92):java.lang.Object");
    }

    public void r(SourceParameter sourceParameter, String str, String str2, String str3, String str4) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        sourceParameter.getClass();
        str4.getClass();
        ty2 ty2Var = (ty2) this.l;
        rqd.a(ty2Var.a, new PostFeatureInPublicationClicked(null, str, str2, null, 9, null), str3, gp7.u(sourceParameter), false, null, str4, 24);
    }

    public void s(SourceParameter sourceParameter, String str, String str2, String str3, String str4) {
        str.getClass();
        str2.getClass();
        str3.getClass();
        sourceParameter.getClass();
        str4.getClass();
        ty2 ty2Var = (ty2) this.l;
        rqd.a(ty2Var.a, new PostStopFeaturingInPublicationClicked(null, str, str2, null, 9, null), str3, gp7.u(sourceParameter), false, null, str4, 24);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object t(defpackage.n92 r5, gen.model.SourceParameter r6, java.lang.String r7, java.lang.String r8, java.lang.String r9) {
        /*
            r4 = this;
            boolean r0 = r5 instanceof defpackage.sd9
            if (r0 == 0) goto L13
            r0 = r5
            sd9 r0 = (defpackage.sd9) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            sd9 r0 = new sd9
            r0.<init>(r4, r5)
        L18:
            java.lang.Object r5 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 1
            if (r2 == 0) goto L36
            if (r2 != r3) goto L2f
            gen.model.SourceParameter r6 = r0.c
            java.lang.String r7 = r0.b
            defpackage.br7.v(r5)
            bjb r5 = (defpackage.bjb) r5
            java.lang.Object r4 = r5.a
            goto L51
        L2f:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L36:
            defpackage.br7.v(r5)
            java.lang.Object r4 = r4.i
            yzd r4 = (defpackage.yzd) r4
            r0.b = r7
            r0.c = r6
            r0.f = r3
            r5 = r7
            r7 = r6
            r6 = r8
            r8 = r9
            r9 = r0
            java.lang.Object r4 = r4.b(r5, r6, r7, r8, r9)
            if (r4 != r1) goto L4f
            return r1
        L4f:
            r6 = r7
            r7 = r5
        L51:
            java.lang.Throwable r5 = defpackage.bjb.b(r4)
            if (r5 != 0) goto L5f
            c1e r4 = (defpackage.c1e) r4
            c0e r4 = new c0e
            r4.<init>(r7, r6)
            return r4
        L5f:
            b0e r4 = new b0e
            r4.<init>(r6, r7, r5)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tl.t(n92, gen.model.SourceParameter, java.lang.String, java.lang.String, java.lang.String):java.lang.Object");
    }

    public Object u(String str, String str2, SourceParameter sourceParameter, String str3, String str4, n92 n92Var) {
        return o7f.s(new y78(this, str, str4, sourceParameter, str3, str2, null), n92Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object v(defpackage.n92 r9, gen.model.SourceParameter r10, java.lang.String r11, java.lang.String r12, java.lang.String r13) {
        /*
            r8 = this;
            boolean r0 = r9 instanceof defpackage.td9
            if (r0 == 0) goto L14
            r0 = r9
            td9 r0 = (defpackage.td9) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.f = r1
        L12:
            r7 = r0
            goto L1a
        L14:
            td9 r0 = new td9
            r0.<init>(r8, r9)
            goto L12
        L1a:
            java.lang.Object r9 = r7.d
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r7.f
            r2 = 1
            if (r1 == 0) goto L38
            if (r1 != r2) goto L31
            gen.model.SourceParameter r10 = r7.c
            java.lang.String r11 = r7.b
            defpackage.br7.v(r9)
            bjb r9 = (defpackage.bjb) r9
            java.lang.Object r8 = r9.a
            goto L54
        L31:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            r8 = 0
            return r8
        L38:
            defpackage.br7.v(r9)
            java.lang.Object r8 = r8.c
            r1 = r8
            o2b r1 = (defpackage.o2b) r1
            r7.b = r11
            r7.c = r10
            r7.f = r2
            r6 = 0
            r4 = r10
            r2 = r11
            r3 = r12
            r5 = r13
            java.lang.Object r8 = r1.w(r2, r3, r4, r5, r6, r7)
            if (r8 != r0) goto L52
            return r0
        L52:
            r11 = r2
            r10 = r4
        L54:
            java.lang.Throwable r9 = defpackage.bjb.b(r8)
            if (r9 != 0) goto L62
            com.medium.android.graphql.fragment.CollectionFollowData r8 = (com.medium.android.graphql.fragment.CollectionFollowData) r8
            m0e r8 = new m0e
            r8.<init>(r11, r10)
            return r8
        L62:
            l0e r8 = new l0e
            r8.<init>(r10, r11, r9)
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tl.v(n92, gen.model.SourceParameter, java.lang.String, java.lang.String, java.lang.String):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object w(defpackage.n92 r9, gen.model.SourceParameter r10, java.lang.String r11, java.lang.String r12, java.lang.String r13) {
        /*
            r8 = this;
            boolean r0 = r9 instanceof defpackage.ud9
            if (r0 == 0) goto L14
            r0 = r9
            ud9 r0 = (defpackage.ud9) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.f = r1
        L12:
            r7 = r0
            goto L1a
        L14:
            ud9 r0 = new ud9
            r0.<init>(r8, r9)
            goto L12
        L1a:
            java.lang.Object r9 = r7.d
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r7.f
            r2 = 1
            if (r1 == 0) goto L38
            if (r1 != r2) goto L31
            gen.model.SourceParameter r10 = r7.c
            java.lang.String r11 = r7.b
            defpackage.br7.v(r9)
            bjb r9 = (defpackage.bjb) r9
            java.lang.Object r8 = r9.a
            goto L54
        L31:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            r8 = 0
            return r8
        L38:
            defpackage.br7.v(r9)
            java.lang.Object r8 = r8.a
            r1 = r8
            o2b r1 = (defpackage.o2b) r1
            r7.b = r11
            r7.c = r10
            r7.f = r2
            r6 = 0
            r4 = r10
            r2 = r11
            r3 = r12
            r5 = r13
            java.lang.Object r8 = r1.w(r2, r3, r4, r5, r6, r7)
            if (r8 != r0) goto L52
            return r0
        L52:
            r11 = r2
            r10 = r4
        L54:
            java.lang.Throwable r9 = defpackage.bjb.b(r8)
            if (r9 != 0) goto L66
            com.medium.android.graphql.fragment.UserFollowData r8 = (com.medium.android.graphql.fragment.UserFollowData) r8
            v0e r9 = new v0e
            java.lang.String r8 = r8.getName()
            r9.<init>(r10, r11, r8)
            return r9
        L66:
            u0e r8 = new u0e
            r8.<init>(r10, r11, r9)
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tl.w(n92, gen.model.SourceParameter, java.lang.String, java.lang.String, java.lang.String):java.lang.Object");
    }

    public tl(dm0 dm0Var, xp0 xp0Var, xp0 xp0Var2, ba9 ba9Var, ba9 ba9Var2, pkf pkfVar, f66 f66Var, rg4 rg4Var, h08 h08Var, String str) {
        jzb jzbVar = new jzb();
        f66Var.getClass();
        this.a = dm0Var;
        this.b = xp0Var;
        this.c = xp0Var2;
        this.d = ba9Var;
        this.e = ba9Var2;
        this.f = pkfVar;
        this.g = f66Var;
        this.h = rg4Var;
        this.i = h08Var;
        this.j = str;
        this.k = jzbVar;
        this.l = new LinkedHashSet();
        this.m = new Object();
    }

    public tl(o2b o2bVar, jz1 jz1Var, o2b o2bVar2, gg5 gg5Var, a1a a1aVar, f88 f88Var, mya myaVar, jnd jndVar, yzd yzdVar, s53 s53Var, eoc eocVar, ty2 ty2Var, ax2 ax2Var) {
        this.a = o2bVar;
        this.b = jz1Var;
        this.c = o2bVar2;
        this.d = gg5Var;
        this.e = a1aVar;
        this.f = f88Var;
        this.g = myaVar;
        this.h = jndVar;
        this.i = yzdVar;
        this.j = s53Var;
        this.k = eocVar;
        this.l = ty2Var;
        this.m = ax2Var;
    }
}
