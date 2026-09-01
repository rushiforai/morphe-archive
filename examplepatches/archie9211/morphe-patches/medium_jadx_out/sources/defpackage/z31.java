package defpackage;

import com.medium.android.explore.ui.vAWg.OphtYB;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class z31 {
    public final u31 a;

    public /* synthetic */ z31(u31 u31Var) {
        this.a = u31Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.Object a(defpackage.u31 r8, defpackage.ke8 r9, defpackage.xd8 r10, defpackage.p92 r11) {
        /*
            boolean r0 = r11 instanceof defpackage.y31
            if (r0 == 0) goto L13
            r0 = r11
            y31 r0 = (defpackage.y31) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            y31 r0 = new y31
            r0.<init>(r11)
        L18:
            java.lang.Object r11 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 3
            r4 = 2
            r5 = 1
            r6 = 0
            if (r2 == 0) goto L4c
            if (r2 == r5) goto L42
            if (r2 == r4) goto L3c
            if (r2 != r3) goto L36
            java.lang.Object r8 = r0.c
            java.io.Closeable r8 = (java.io.Closeable) r8
            defpackage.br7.v(r11)     // Catch: java.lang.Throwable -> L33
            goto La1
        L33:
            r9 = move-exception
            goto La9
        L36:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r6
        L3c:
            b55 r8 = r0.b
            defpackage.br7.v(r11)
            goto L89
        L42:
            java.lang.Object r8 = r0.c
            u31 r8 = (defpackage.u31) r8
            b55 r10 = r0.b
            defpackage.br7.v(r11)
            goto L5c
        L4c:
            defpackage.br7.v(r11)
            r0.b = r10
            r0.c = r8
            r0.e = r5
            kbb r11 = defpackage.br7.x(r9, r0)
            if (r11 != r1) goto L5c
            goto L9f
        L5c:
            kbb r11 = (defpackage.kbb) r11
            cva r8 = r8.a(r11)
            r0.b = r10
            r0.c = r6
            r0.e = r4
            x51 r9 = new x51
            n92 r11 = defpackage.pwd.Q(r0)
            r9.<init>(r5, r11)
            r9.s()
            s2 r11 = new s2
            r2 = 15
            r11.<init>(r8, r2, r9)
            r8.c(r11)
            r9.v(r11)
            java.lang.Object r11 = r9.q()
            if (r11 != r1) goto L88
            goto L9f
        L88:
            r8 = r10
        L89:
            r9 = r11
            java.io.Closeable r9 = (java.io.Closeable) r9
            r10 = r9
            adb r10 = (defpackage.adb) r10     // Catch: java.lang.Throwable -> La5
            ne8 r10 = defpackage.br7.w(r10)     // Catch: java.lang.Throwable -> La5
            r0.b = r6     // Catch: java.lang.Throwable -> La5
            r0.c = r9     // Catch: java.lang.Throwable -> La5
            r0.e = r3     // Catch: java.lang.Throwable -> La5
            java.lang.Object r11 = r8.invoke(r10, r0)     // Catch: java.lang.Throwable -> La5
            if (r11 != r1) goto La0
        L9f:
            return r1
        La0:
            r8 = r9
        La1:
            defpackage.k50.X(r8, r6)
            return r11
        La5:
            r8 = move-exception
            r7 = r9
            r9 = r8
            r8 = r7
        La9:
            throw r9     // Catch: java.lang.Throwable -> Laa
        Laa:
            r10 = move-exception
            defpackage.k50.X(r8, r9)
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.z31.a(u31, ke8, xd8, p92):java.lang.Object");
    }

    public final boolean equals(Object obj) {
        if (obj instanceof z31) {
            return g76.L(this.a, ((z31) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return OphtYB.bdKBQ + this.a + ')';
    }
}
