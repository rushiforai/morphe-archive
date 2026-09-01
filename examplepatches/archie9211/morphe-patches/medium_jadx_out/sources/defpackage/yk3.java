package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class yk3 {
    public static final float a = 0.125f / 18.0f;

    /* JADX WARN: Code restructure failed: missing block: B:46:0x00bb, code lost:
    
        if (defpackage.ip8.b(defpackage.mq7.F(r11, true), 0) == false) goto L47;
     */
    /* JADX WARN: Removed duplicated region for block: B:20:0x005b A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:21:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0082 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:21:0x005c -> B:22:0x0061). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object a(defpackage.u4d r17, long r18, defpackage.p92 r20) {
        /*
            Method dump skipped, instruction units count: 201
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yk3.a(u4d, long, p92):java.lang.Object");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r10v3, types: [rya] */
    /* JADX WARN: Type inference failed for: r10v5 */
    /* JADX WARN: Type inference failed for: r10v6 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object b(defpackage.u4d r9, long r10, defpackage.kn0 r12) {
        /*
            boolean r0 = r12 instanceof defpackage.rk3
            if (r0 == 0) goto L13
            r0 = r12
            rk3 r0 = (defpackage.rk3) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            rk3 r0 = new rk3
            r0.<init>(r12)
        L18:
            java.lang.Object r12 = r0.e
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2e
            nya r9 = r0.d
            rya r10 = r0.c
            rb9 r11 = r0.b
            defpackage.br7.v(r12)     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> La4
            goto L97
        L2e:
            java.lang.String r9 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r9)
            return r4
        L34:
            defpackage.br7.v(r12)
            w4d r12 = r9.e
            lb9 r12 = r12.s
            boolean r12 = f(r12, r10)
            if (r12 == 0) goto L42
            goto La3
        L42:
            w4d r12 = r9.e
            lb9 r12 = r12.s
            java.util.List r12 = r12.a
            int r2 = r12.size()
            r5 = 0
        L4d:
            if (r5 >= r2) goto L62
            java.lang.Object r6 = r12.get(r5)
            r7 = r6
            rb9 r7 = (defpackage.rb9) r7
            long r7 = r7.a
            boolean r7 = defpackage.br7.q(r7, r10)
            if (r7 == 0) goto L5f
            goto L63
        L5f:
            int r5 = r5 + 1
            goto L4d
        L62:
            r6 = r4
        L63:
            r11 = r6
            rb9 r11 = (defpackage.rb9) r11
            if (r11 != 0) goto L69
            goto La3
        L69:
            rya r10 = new rya
            r10.<init>()
            rya r12 = new rya
            r12.<init>()
            r12.a = r11
            zte r2 = r9.e()
            long r5 = r2.b()
            nya r2 = new nya     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> La4
            r2.<init>()     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> La4
            sk3 r7 = new sk3     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> La4
            r7.<init>(r2, r12, r10, r4)     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> La4
            r0.b = r11     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> La4
            r0.c = r10     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> La4
            r0.d = r2     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> La4
            r0.f = r3     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> La4
            java.lang.Object r9 = r9.g(r5, r7, r0)     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> La4
            if (r9 != r1) goto L96
            return r1
        L96:
            r9 = r2
        L97:
            boolean r9 = r9.a     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> La4
            if (r9 == 0) goto La3
            java.lang.Object r9 = r10.a     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> La4
            rb9 r9 = (defpackage.rb9) r9     // Catch: androidx.compose.ui.input.pointer.PointerEventTimeoutCancellationException -> La4
            if (r9 != 0) goto La2
            return r11
        La2:
            return r9
        La3:
            return r4
        La4:
            java.lang.Object r9 = r10.a
            rb9 r9 = (defpackage.rb9) r9
            if (r9 != 0) goto Lab
            goto Lac
        Lab:
            r11 = r9
        Lac:
            return r11
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yk3.b(u4d, long, kn0):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00b6  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x010f  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x016a  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00d0 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:71:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:61:0x015d -> B:62:0x0163). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object c(defpackage.u4d r18, long r19, defpackage.h9b r21, defpackage.kn0 r22) {
        /*
            Method dump skipped, instruction units count: 373
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yk3.c(u4d, long, h9b, kn0):java.lang.Object");
    }

    public static final Object d(vb9 vb9Var, x45 x45Var, m45 m45Var, m45 m45Var2, b55 b55Var, n92 n92Var) {
        Object objL = w2g.l(vb9Var, new uk3(new e73(1), new pk3(0, x45Var), b55Var, m45Var2, new r00(2, m45Var), null, 0), n92Var);
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        c1e c1eVar = c1e.a;
        if (objL != tb2Var) {
            objL = c1eVar;
        }
        return objL == tb2Var ? objL : c1eVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0043 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x004b  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x0041 -> B:18:0x0044). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object e(defpackage.u4d r4, long r5, defpackage.x45 r7, defpackage.kn0 r8) {
        /*
            boolean r0 = r8 instanceof defpackage.wk3
            if (r0 == 0) goto L13
            r0 = r8
            wk3 r0 = (defpackage.wk3) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            wk3 r0 = new wk3
            r0.<init>(r8)
        L18:
            java.lang.Object r8 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2d
            x45 r4 = r0.c
            u4d r5 = r0.b
            defpackage.br7.v(r8)
            r7 = r4
            r4 = r5
            goto L44
        L2d:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L34:
            defpackage.br7.v(r8)
        L37:
            r0.b = r4
            r0.c = r7
            r0.e = r3
            java.lang.Object r8 = a(r4, r5, r0)
            if (r8 != r1) goto L44
            return r1
        L44:
            rb9 r8 = (defpackage.rb9) r8
            if (r8 != 0) goto L4b
            java.lang.Boolean r4 = java.lang.Boolean.FALSE
            return r4
        L4b:
            boolean r5 = defpackage.mq7.x(r8)
            if (r5 == 0) goto L54
            java.lang.Boolean r4 = java.lang.Boolean.TRUE
            return r4
        L54:
            r7.invoke(r8)
            long r5 = r8.a
            goto L37
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yk3.e(u4d, long, x45, kn0):java.lang.Object");
    }

    public static final boolean f(lb9 lb9Var, long j) {
        Object obj;
        List list = lb9Var.a;
        int size = list.size();
        boolean z = false;
        int i = 0;
        while (true) {
            if (i >= size) {
                obj = null;
                break;
            }
            obj = list.get(i);
            if (br7.q(((rb9) obj).a, j)) {
                break;
            }
            i++;
        }
        rb9 rb9Var = (rb9) obj;
        if (rb9Var != null && rb9Var.d) {
            z = true;
        }
        return true ^ z;
    }

    public static final float g(zte zteVar, int i) {
        return i == 2 ? zteVar.g() * a : zteVar.g();
    }

    /* JADX WARN: Code restructure failed: missing block: B:168:0x05bf, code lost:
    
        if (f(r10.e.s, r0) != false) goto L169;
     */
    /* JADX WARN: Code restructure failed: missing block: B:199:0x0661, code lost:
    
        if (defpackage.ip8.c(defpackage.mq7.F(r5, true)) == 0.0f) goto L200;
     */
    /* JADX WARN: Path cross not found for [B:130:0x04c5, B:132:0x04d5], limit reached: 227 */
    /* JADX WARN: Path cross not found for [B:135:0x04dc, B:130:0x04c5], limit reached: 227 */
    /* JADX WARN: Path cross not found for [B:46:0x02c0, B:47:0x02cc], limit reached: 227 */
    /* JADX WARN: Path cross not found for [B:50:0x02d3, B:46:0x02c0], limit reached: 227 */
    /* JADX WARN: Removed duplicated region for block: B:107:0x040c  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x047d  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x0493  */
    /* JADX WARN: Removed duplicated region for block: B:137:0x04e2  */
    /* JADX WARN: Removed duplicated region for block: B:148:0x0508  */
    /* JADX WARN: Removed duplicated region for block: B:161:0x057e  */
    /* JADX WARN: Removed duplicated region for block: B:167:0x05a1  */
    /* JADX WARN: Removed duplicated region for block: B:176:0x05fe  */
    /* JADX WARN: Removed duplicated region for block: B:183:0x0628  */
    /* JADX WARN: Removed duplicated region for block: B:185:0x062b  */
    /* JADX WARN: Removed duplicated region for block: B:208:0x067b  */
    /* JADX WARN: Removed duplicated region for block: B:210:0x067f  */
    /* JADX WARN: Removed duplicated region for block: B:211:0x0683  */
    /* JADX WARN: Removed duplicated region for block: B:212:0x0687  */
    /* JADX WARN: Removed duplicated region for block: B:219:0x061f A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:222:0x04bd A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:227:0x0405 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:230:0x058e A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:234:0x02b4 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:238:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:241:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0235  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0239  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0277  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0290  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x02d9  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x02fe  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0373  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x037a  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0386  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x038b  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x038e  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x03e1  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:101:0x03fc -> B:91:0x03b0). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:116:0x0442 -> B:117:0x0457). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:158:0x0572 -> B:159:0x0578). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:172:0x05f0 -> B:174:0x05f3). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x0235 -> B:31:0x0236). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:46:0x02c0 -> B:77:0x0378). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:67:0x031a -> B:77:0x0378). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:73:0x0365 -> B:74:0x036d). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object h(defpackage.u4d r24, defpackage.rb9 r25, defpackage.e73 r26, defpackage.pk3 r27, defpackage.b55 r28, defpackage.m45 r29, defpackage.r00 r30, defpackage.kn0 r31) {
        /*
            Method dump skipped, instruction units count: 1720
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yk3.h(u4d, rb9, e73, pk3, b55, m45, r00, kn0):java.lang.Object");
    }
}
