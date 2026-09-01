package defpackage;

import java.io.EOFException;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r0d {
    public final k33 a;
    public final hha b;
    public final x45 c;
    public final l9f d;

    public r0d(k33 k33Var, hha hhaVar, x45 x45Var, l9f l9fVar) {
        hhaVar.getClass();
        this.a = k33Var;
        this.b = hhaVar;
        this.c = x45Var;
        this.d = l9fVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0043 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x0044 -> B:23:0x0045). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.Object d(defpackage.r0d r4, defpackage.p92 r5) {
        /*
            boolean r0 = r5 instanceof defpackage.o9f
            if (r0 == 0) goto L13
            r0 = r5
            o9f r0 = (defpackage.o9f) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            o9f r0 = new o9f
            r0.<init>(r4, r5)
        L18:
            java.lang.Object r5 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 1
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2d
            r0d r4 = r0.c
            r0d r2 = r0.b
            defpackage.br7.v(r5)     // Catch: java.lang.Exception -> L2b java.util.concurrent.CancellationException -> L65
            goto L45
        L2b:
            r4 = move-exception
            goto L4f
        L2d:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L34:
            defpackage.br7.v(r5)
        L37:
            r0.b = r4     // Catch: java.lang.Exception -> L4c java.util.concurrent.CancellationException -> L65
            r0.c = r4     // Catch: java.lang.Exception -> L4c java.util.concurrent.CancellationException -> L65
            r0.f = r3     // Catch: java.lang.Exception -> L4c java.util.concurrent.CancellationException -> L65
            java.lang.Object r5 = r4.c(r0)     // Catch: java.lang.Exception -> L4c java.util.concurrent.CancellationException -> L65
            if (r5 != r1) goto L44
            return r1
        L44:
            r2 = r4
        L45:
            java.util.Map r5 = (java.util.Map) r5     // Catch: java.lang.Exception -> L2b java.util.concurrent.CancellationException -> L65
            r4.b(r5)     // Catch: java.lang.Exception -> L2b java.util.concurrent.CancellationException -> L65
            r4 = r2
            goto L37
        L4c:
            r5 = move-exception
            r2 = r4
            r4 = r5
        L4f:
            hha r5 = r2.b
            r5.getClass()
            java.lang.Object r5 = r5.a
            t1f r5 = (defpackage.t1f) r5
            uz0 r5 = r5.g
            ud8 r0 = new ud8
            r0.<init>(r4)
            r5.e(r0)
            c1e r4 = defpackage.c1e.a
            return r4
        L65:
            r4 = move-exception
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.r0d.d(r0d, p92):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x0078, code lost:
    
        if (defpackage.wo7.z(10000, r8, r0) == r1) goto L24;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.p92 r8) throws java.io.EOFException {
        /*
            r7 = this;
            boolean r0 = r8 instanceof defpackage.q0d
            if (r0 == 0) goto L13
            r0 = r8
            q0d r0 = (defpackage.q0d) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            q0d r0 = new q0d
            r0.<init>(r7, r8)
        L18:
            java.lang.Object r8 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            r4 = 2
            r5 = 1
            if (r2 == 0) goto L37
            if (r2 == r5) goto L31
            if (r2 != r4) goto L2b
            defpackage.br7.v(r8)
            goto L7b
        L2b:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r3
        L31:
            java.util.LinkedHashMap r2 = r0.b
            defpackage.br7.v(r8)
            goto L59
        L37:
            defpackage.br7.v(r8)
            f09 r8 = new f09
            java.lang.String r2 = "type"
            java.lang.String r6 = "connection_init"
            r8.<init>(r2, r6)
            f09[] r2 = new defpackage.f09[r5]
            r6 = 0
            r2[r6] = r8
            java.util.LinkedHashMap r2 = defpackage.ei7.R(r2)
            r0.b = r2
            r0.e = r5
            x45 r8 = r7.c
            java.lang.Object r8 = r8.invoke(r0)
            if (r8 != r1) goto L59
            goto L7a
        L59:
            java.util.Map r8 = (java.util.Map) r8
            if (r8 == 0) goto L62
            java.lang.String r5 = "payload"
            r2.put(r5, r8)
        L62:
            l9f r8 = r7.d
            r7.e(r2, r8)
            xi7 r8 = new xi7
            r2 = 21
            r8.<init>(r7, r3, r2)
            r0.b = r3
            r0.e = r4
            r2 = 10000(0x2710, double:4.9407E-320)
            java.lang.Object r7 = defpackage.wo7.z(r2, r8, r0)
            if (r7 != r1) goto L7b
        L7a:
            return r1
        L7b:
            c1e r7 = defpackage.c1e.a
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.r0d.a(p92):java.lang.Object");
    }

    public final void b(Map map) {
        map.getClass();
        Object obj = map.get("type");
        boolean zL = g76.L(obj, "data");
        hha hhaVar = this.b;
        if (zL) {
            Object obj2 = map.get("id");
            obj2.getClass();
            Object obj3 = map.get("payload");
            obj3.getClass();
            hhaVar.getClass();
            ((t1f) hhaVar.a).g.e(new mv8((String) obj2, (Map) obj3));
            return;
        }
        if (!g76.L(obj, "error")) {
            if (g76.L(obj, "complete")) {
                Object obj4 = map.get("id");
                obj4.getClass();
                hhaVar.getClass();
                ((t1f) hhaVar.a).g.e(new iv8((String) obj4));
                return;
            }
            return;
        }
        Object obj5 = map.get("id");
        if (!(obj5 instanceof String)) {
            ((t1f) hhaVar.a).g.e(new x65((Map) map.get("payload")));
        } else {
            Map map2 = (Map) map.get("payload");
            hhaVar.getClass();
            ((t1f) hhaVar.a).g.e(new jv8((String) obj5, map2));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0041 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x006a A[Catch: Exception -> 0x006d, TRY_LEAVE, TryCatch #0 {Exception -> 0x006d, blocks: (B:20:0x004b, B:22:0x006a), top: B:28:0x004b }] */
    /* JADX WARN: Removed duplicated region for block: B:24:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0070 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:18:0x0042 -> B:19:0x0043). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object c(defpackage.p92 r7) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof defpackage.n9f
            if (r0 == 0) goto L13
            r0 = r7
            n9f r0 = (defpackage.n9f) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            n9f r0 = new n9f
            r0.<init>(r6, r7)
        L18:
            java.lang.Object r7 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L30
            if (r2 != r4) goto L2a
            r0d r2 = r0.b
            defpackage.br7.v(r7)
            goto L43
        L2a:
            java.lang.String r6 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r6)
            return r3
        L30:
            defpackage.br7.v(r7)
        L33:
            r0.b = r6
            r0.e = r4
            k33 r7 = r6.a
            wj1 r7 = r7.a
            java.lang.Object r7 = r7.q(r0)
            if (r7 != r1) goto L42
            return r1
        L42:
            r2 = r6
        L43:
            java.lang.String r7 = (java.lang.String) r7
            r2.getClass()
            r7.getClass()
            fa4 r2 = defpackage.k8.a     // Catch: java.lang.Exception -> L6d
            a01 r2 = new a01     // Catch: java.lang.Exception -> L6d
            kz0 r5 = new kz0     // Catch: java.lang.Exception -> L6d
            r5.<init>()     // Catch: java.lang.Exception -> L6d
            r5.R0(r7)     // Catch: java.lang.Exception -> L6d
            r2.<init>(r5)     // Catch: java.lang.Exception -> L6d
            yl2 r7 = defpackage.yl2.e     // Catch: java.lang.Exception -> L6d
            r7.getClass()     // Catch: java.lang.Exception -> L6d
            java.lang.Object r7 = defpackage.d46.Y(r2)     // Catch: java.lang.Exception -> L6d
            r7.getClass()     // Catch: java.lang.Exception -> L6d
            boolean r2 = r7 instanceof java.util.Map     // Catch: java.lang.Exception -> L6d
            if (r2 == 0) goto L6d
            java.util.Map r7 = (java.util.Map) r7     // Catch: java.lang.Exception -> L6d
            goto L6e
        L6d:
            r7 = r3
        L6e:
            if (r7 == 0) goto L33
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.r0d.c(p92):java.lang.Object");
    }

    public final void e(Map map, l9f l9fVar) throws EOFException {
        k33 k33Var = this.a;
        wj1 wj1Var = k33Var.a;
        zva zvaVar = k33Var.b;
        map.getClass();
        int i = m9f.a[l9fVar.ordinal()];
        if (i == 1) {
            kz0 kz0Var = new kz0();
            f76.R(new yz0(kz0Var), map);
            String strG0 = kz0Var.G0();
            zvaVar.getClass();
            h21 h21Var = h21.d;
            if (zvaVar.i(1, dq1.o(strG0))) {
                return;
            }
            wj1Var.c(null);
            return;
        }
        if (i != 2) {
            ygf.a();
            return;
        }
        kz0 kz0Var2 = new kz0();
        f76.R(new yz0(kz0Var2), map);
        h21 h21VarR = kz0Var2.r(kz0Var2.b);
        h21VarR.getClass();
        zvaVar.getClass();
        if (zvaVar.i(2, h21VarR)) {
            return;
        }
        wj1Var.c(null);
    }
}
