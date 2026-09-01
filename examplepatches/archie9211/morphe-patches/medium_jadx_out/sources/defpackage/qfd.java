package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qfd {
    public static final ol3 a = new ol3(3, 3, null);

    /* JADX WARN: Removed duplicated region for block: B:17:0x0049 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x0047 -> B:18:0x004a). Please report as a decompilation issue!!! */
    /*  JADX ERROR: JadxOverflowException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxOverflowException: Regions count limit reached
        	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:59)
        	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:31)
        	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:19)
        */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object a(defpackage.u4d r5, boolean r6, defpackage.mb9 r7, defpackage.kn0 r8) {
        /*
            boolean r0 = r8 instanceof defpackage.hfd
            if (r0 == 0) goto L13
            r0 = r8
            hfd r0 = (defpackage.hfd) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            hfd r0 = new hfd
            r0.<init>(r8)
        L18:
            java.lang.Object r8 = r0.e
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 1
            if (r2 == 0) goto L38
            if (r2 != r3) goto L31
            boolean r5 = r0.d
            mb9 r6 = r0.c
            u4d r7 = r0.b
            defpackage.br7.v(r8)
            r4 = r6
            r6 = r5
            r5 = r7
            r7 = r4
            goto L4a
        L31:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            r5 = 0
            return r5
        L38:
            defpackage.br7.v(r8)
        L3b:
            r0.b = r5
            r0.c = r7
            r0.d = r6
            r0.f = r3
            java.lang.Object r8 = r5.a(r7, r0)
            if (r8 != r1) goto L4a
            return r1
        L4a:
            lb9 r8 = (defpackage.lb9) r8
            boolean r2 = e(r8, r6)
            if (r2 == 0) goto L3b
            java.util.List r5 = r8.a
            r6 = 0
            java.lang.Object r5 = r5.get(r6)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qfd.a(u4d, boolean, mb9, kn0):java.lang.Object");
    }

    public static /* synthetic */ Object b(u4d u4dVar, mb9 mb9Var, kn0 kn0Var, int i) {
        boolean z = (i & 1) != 0;
        if ((i & 2) != 0) {
            mb9Var = mb9.Main;
        }
        return a(u4dVar, z, mb9Var, kn0Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x003d A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x004a A[LOOP:0: B:19:0x0048->B:20:0x004a, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x003b -> B:18:0x003e). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object c(defpackage.u4d r8, defpackage.p92 r9) {
        /*
            boolean r0 = r9 instanceof defpackage.ifd
            if (r0 == 0) goto L13
            r0 = r9
            ifd r0 = (defpackage.ifd) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ifd r0 = new ifd
            r0.<init>(r9)
        L18:
            java.lang.Object r9 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L30
            if (r2 != r3) goto L29
            u4d r8 = r0.b
            defpackage.br7.v(r9)
            goto L3e
        L29:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            r8 = 0
            return r8
        L30:
            defpackage.br7.v(r9)
        L33:
            r0.b = r8
            r0.d = r3
            java.lang.Object r9 = defpackage.y30.b(r8, r0)
            if (r9 != r1) goto L3e
            return r1
        L3e:
            lb9 r9 = (defpackage.lb9) r9
            java.util.List r2 = r9.a
            int r4 = r2.size()
            r5 = 0
            r6 = r5
        L48:
            if (r6 >= r4) goto L56
            java.lang.Object r7 = r2.get(r6)
            rb9 r7 = (defpackage.rb9) r7
            r7.a()
            int r6 = r6 + 1
            goto L48
        L56:
            java.util.List r9 = r9.a
            int r2 = r9.size()
        L5c:
            if (r5 >= r2) goto L6c
            java.lang.Object r4 = r9.get(r5)
            rb9 r4 = (defpackage.rb9) r4
            boolean r4 = r4.d
            if (r4 == 0) goto L69
            goto L33
        L69:
            int r5 = r5 + 1
            goto L5c
        L6c:
            c1e r8 = defpackage.c1e.a
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qfd.c(u4d, p92):java.lang.Object");
    }

    public static Object d(vb9 vb9Var, zfc zfcVar, x45 x45Var, n92 n92Var, int i) {
        Object obj = zfcVar;
        if ((i & 4) != 0) {
            obj = a;
        }
        Object objS = o7f.s(new yu(vb9Var, (Object) null, (Object) null, obj, x45Var, (n92) null, 23), n92Var);
        return objS == tb2.COROUTINE_SUSPENDED ? objS : c1e.a;
    }

    public static boolean e(lb9 lb9Var, boolean z) {
        List list = lb9Var.a;
        int size = list.size();
        for (int i = 0; i < size; i++) {
            rb9 rb9Var = (rb9) list.get(i);
            if (!(z ? mq7.u(rb9Var) : mq7.v(rb9Var))) {
                return false;
            }
        }
        return true;
    }

    public static enc f(sb2 sb2Var, va6 va6Var, b55 b55Var) {
        return vx0.c0(sb2Var, null, wb2.UNDISPATCHED, new j5d(va6Var, b55Var, (n92) null, 2), 1);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:100:0x03aa  */
    /* JADX WARN: Removed duplicated region for block: B:102:0x03c1  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x018d  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x01aa  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x01b0  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x01e2  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0216  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0249  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0260  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x026d  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x027e  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x02c5  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x02d2  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x035b  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x038f  */
    /* JADX WARN: Type inference failed for: r0v27 */
    /* JADX WARN: Type inference failed for: r0v31 */
    /* JADX WARN: Type inference failed for: r0v34, types: [rb9] */
    /* JADX WARN: Type inference failed for: r0v41 */
    /* JADX WARN: Type inference failed for: r0v42 */
    /* JADX WARN: Type inference failed for: r0v43 */
    /* JADX WARN: Type inference failed for: r0v53 */
    /* JADX WARN: Type inference failed for: r0v54 */
    /* JADX WARN: Type inference failed for: r0v55 */
    /* JADX WARN: Type inference failed for: r10v0 */
    /* JADX WARN: Type inference failed for: r10v1, types: [ib2, n92] */
    /* JADX WARN: Type inference failed for: r10v22, types: [rb9] */
    /* JADX WARN: Type inference failed for: r10v25 */
    /* JADX WARN: Type inference failed for: r10v26 */
    /* JADX WARN: Type inference failed for: r10v28 */
    /* JADX WARN: Type inference failed for: r10v29 */
    /* JADX WARN: Type inference failed for: r10v30 */
    /* JADX WARN: Type inference failed for: r10v8 */
    /* JADX WARN: Type inference failed for: r11v12 */
    /* JADX WARN: Type inference failed for: r11v13, types: [n92] */
    /* JADX WARN: Type inference failed for: r11v14 */
    /* JADX WARN: Type inference failed for: r11v15, types: [ib2, java.lang.Object, n92] */
    /* JADX WARN: Type inference failed for: r11v18 */
    /* JADX WARN: Type inference failed for: r11v19 */
    /* JADX WARN: Type inference failed for: r11v2 */
    /* JADX WARN: Type inference failed for: r11v20 */
    /* JADX WARN: Type inference failed for: r11v21, types: [n92] */
    /* JADX WARN: Type inference failed for: r11v22, types: [java.lang.Object, x45] */
    /* JADX WARN: Type inference failed for: r11v25 */
    /* JADX WARN: Type inference failed for: r11v26, types: [n92] */
    /* JADX WARN: Type inference failed for: r11v27 */
    /* JADX WARN: Type inference failed for: r11v28 */
    /* JADX WARN: Type inference failed for: r11v29 */
    /* JADX WARN: Type inference failed for: r11v3 */
    /* JADX WARN: Type inference failed for: r11v30 */
    /* JADX WARN: Type inference failed for: r11v31 */
    /* JADX WARN: Type inference failed for: r11v32 */
    /* JADX WARN: Type inference failed for: r11v33 */
    /* JADX WARN: Type inference failed for: r11v34 */
    /* JADX WARN: Type inference failed for: r11v35 */
    /* JADX WARN: Type inference failed for: r11v36 */
    /* JADX WARN: Type inference failed for: r11v37 */
    /* JADX WARN: Type inference failed for: r11v38 */
    /* JADX WARN: Type inference failed for: r11v5 */
    /* JADX WARN: Type inference failed for: r11v6 */
    /* JADX WARN: Type inference failed for: r11v7 */
    /* JADX WARN: Type inference failed for: r11v8, types: [n92] */
    /* JADX WARN: Type inference failed for: r11v9, types: [java.lang.Object, x45] */
    /* JADX WARN: Type inference failed for: r1v12, types: [java.lang.Object, rb9] */
    /* JADX WARN: Type inference failed for: r1v17 */
    /* JADX WARN: Type inference failed for: r1v18 */
    /* JADX WARN: Type inference failed for: r1v42 */
    /* JADX WARN: Type inference failed for: r1v43 */
    /* JADX WARN: Type inference failed for: r1v44 */
    /* JADX WARN: Type inference failed for: r25v1, types: [n92] */
    /* JADX WARN: Type inference failed for: r25v2, types: [n92] */
    /* JADX WARN: Type inference failed for: r4v17 */
    /* JADX WARN: Type inference failed for: r4v25, types: [java.lang.Object, rb9] */
    /* JADX WARN: Type inference failed for: r4v32 */
    /* JADX WARN: Type inference failed for: r4v39 */
    /* JADX WARN: Type inference failed for: r4v40 */
    /* JADX WARN: Type inference failed for: r4v41 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object g(defpackage.u4d r21, defpackage.sb2 r22, defpackage.f0a r23, defpackage.x45 r24, defpackage.x45 r25, defpackage.c55 r26, defpackage.x45 r27, defpackage.kn0 r28) {
        /*
            Method dump skipped, instruction units count: 1014
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qfd.g(u4d, sb2, f0a, x45, x45, c55, x45, kn0):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object h(defpackage.u4d r8, defpackage.mb9 r9, defpackage.p92 r10) {
        /*
            boolean r0 = r10 instanceof defpackage.ofd
            if (r0 == 0) goto L13
            r0 = r10
            ofd r0 = (defpackage.ofd) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ofd r0 = new ofd
            r0.<init>(r10)
        L18:
            java.lang.Object r10 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L30
            if (r2 != r4) goto L2a
            rya r8 = r0.b
            defpackage.br7.v(r10)     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> L55
            goto L52
        L2a:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r3
        L30:
            rya r10 = defpackage.ev6.p(r10)
            na7 r2 = defpackage.na7.a
            r10.a = r2
            zte r2 = r8.e()     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> L55
            long r5 = r2.b()     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> L55
            i05 r2 = new i05     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> L55
            r7 = 3
            r2.<init>(r9, r10, r3, r7)     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> L55
            r0.b = r10     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> L55
            r0.d = r4     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> L55
            java.lang.Object r8 = r8.g(r5, r2, r0)     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> L55
            if (r8 != r1) goto L51
            return r1
        L51:
            r8 = r10
        L52:
            java.lang.Object r8 = r8.a
            return r8
        L55:
            pa7 r8 = defpackage.pa7.a
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qfd.h(u4d, mb9, p92):java.lang.Object");
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x00ad, code lost:
    
        if (r0 == r2) goto L36;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x00c7, code lost:
    
        return null;
     */
    /* JADX WARN: Removed duplicated region for block: B:21:0x005b  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:35:0x00ad -> B:13:0x0031). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object i(defpackage.u4d r17, defpackage.mb9 r18, defpackage.kn0 r19) {
        /*
            Method dump skipped, instruction units count: 213
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qfd.i(u4d, mb9, kn0):java.lang.Object");
    }
}
