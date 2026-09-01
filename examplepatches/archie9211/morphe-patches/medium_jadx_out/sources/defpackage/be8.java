package defpackage;

import android.os.Looper;
import android.os.NetworkOnMainThreadException;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class be8 implements cf4 {
    public final String a;
    public final ew8 b;
    public final w5d c;
    public final w5d d;
    public final w5d e;
    public final q42 f;

    public be8(String str, ew8 ew8Var, w5d w5dVar, w5d w5dVar2, w5d w5dVar3, q42 q42Var) {
        this.a = str;
        this.b = ew8Var;
        this.c = w5dVar;
        this.d = w5dVar2;
        this.e = w5dVar3;
        this.f = q42Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0052 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0012  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.String d(java.lang.String r3, java.lang.String r4) {
        /*
            r0 = 0
            if (r4 == 0) goto Lc
            java.lang.String r1 = "text/plain"
            r2 = 0
            boolean r1 = defpackage.tuc.N(r4, r1, r2)
            if (r1 == 0) goto L53
        Lc:
            boolean r1 = defpackage.muc.b0(r3)
            if (r1 == 0) goto L14
        L12:
            r1 = r0
            goto L50
        L14:
            r1 = 35
            java.lang.String r3 = defpackage.muc.w0(r3, r1)
            r1 = 63
            java.lang.String r3 = defpackage.muc.w0(r3, r1)
            r1 = 47
            java.lang.String r3 = defpackage.muc.t0(r1, r3, r3)
            r1 = 46
            java.lang.String r2 = ""
            java.lang.String r3 = defpackage.muc.t0(r1, r3, r2)
            boolean r1 = defpackage.muc.b0(r3)
            if (r1 == 0) goto L35
            goto L12
        L35:
            java.util.Locale r1 = java.util.Locale.ROOT
            java.lang.String r3 = r3.toLowerCase(r1)
            r3.getClass()
            dh7 r1 = defpackage.r08.a
            java.lang.Object r1 = r1.get(r3)
            java.lang.String r1 = (java.lang.String) r1
            if (r1 != 0) goto L50
            android.webkit.MimeTypeMap r1 = android.webkit.MimeTypeMap.getSingleton()
            java.lang.String r1 = r1.getMimeTypeFromExtension(r3)
        L50:
            if (r1 == 0) goto L53
            return r1
        L53:
            if (r4 == 0) goto L5c
            r3 = 59
            java.lang.String r3 = defpackage.muc.u0(r4, r3)
            return r3
        L5c:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.be8.d(java.lang.String, java.lang.String):java.lang.String");
    }

    /* JADX WARN: Code restructure failed: missing block: B:72:0x0177, code lost:
    
        if (r0 == r8) goto L73;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00a6 A[Catch: Exception -> 0x003d, TryCatch #2 {Exception -> 0x003d, blocks: (B:15:0x0038, B:74:0x017a, B:22:0x004c, B:69:0x015e, B:71:0x0162, B:58:0x0117, B:60:0x011d, B:66:0x0144, B:41:0x009f, B:43:0x00a6, B:45:0x00b4, B:52:0x00e8, B:54:0x00f4, B:48:0x00ca, B:50:0x00d4, B:63:0x013b, B:64:0x0142), top: B:86:0x002a }] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x015d  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x015e A[Catch: Exception -> 0x003d, PHI: r0 r1
      0x015e: PHI (r0v26 java.lang.Object) = (r0v19 java.lang.Object), (r0v2 java.lang.Object) binds: [B:67:0x015b, B:22:0x004c] A[DONT_GENERATE, DONT_INLINE]
      0x015e: PHI (r1v10 rya) = (r1v8 rya), (r1v16 rya) binds: [B:67:0x015b, B:22:0x004c] A[DONT_GENERATE, DONT_INLINE], TryCatch #2 {Exception -> 0x003d, blocks: (B:15:0x0038, B:74:0x017a, B:22:0x004c, B:69:0x015e, B:71:0x0162, B:58:0x0117, B:60:0x011d, B:66:0x0144, B:41:0x009f, B:43:0x00a6, B:45:0x00b4, B:52:0x00e8, B:54:0x00f4, B:48:0x00ca, B:50:0x00d4, B:63:0x013b, B:64:0x0142), top: B:86:0x002a }] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0162 A[Catch: Exception -> 0x003d, TryCatch #2 {Exception -> 0x003d, blocks: (B:15:0x0038, B:74:0x017a, B:22:0x004c, B:69:0x015e, B:71:0x0162, B:58:0x0117, B:60:0x011d, B:66:0x0144, B:41:0x009f, B:43:0x00a6, B:45:0x00b4, B:52:0x00e8, B:54:0x00f4, B:48:0x00ca, B:50:0x00d4, B:63:0x013b, B:64:0x0142), top: B:86:0x002a }] */
    /* JADX WARN: Removed duplicated region for block: B:89:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /* JADX WARN: Type inference failed for: r1v12 */
    /* JADX WARN: Type inference failed for: r1v3, types: [int] */
    @Override // defpackage.cf4
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.n92 r16) throws java.lang.Exception {
        /*
            Method dump skipped, instruction units count: 394
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.be8.a(n92):java.lang.Object");
    }

    public final Object b(ke8 ke8Var, b55 b55Var, yd8 yd8Var) {
        if (this.b.i.getReadEnabled() && g76.L(Looper.myLooper(), Looper.getMainLooper())) {
            throw new NetworkOnMainThreadException();
        }
        z31 z31Var = (z31) this.c.getValue();
        return z31.a(z31Var.a, ke8Var, new xd8(b55Var, null, 0), yd8Var);
    }

    public final ch4 c() {
        ch4 ch4Var;
        gva gvaVar = (gva) this.d.getValue();
        return (gvaVar == null || (ch4Var = gvaVar.b) == null) ? this.b.f : ch4Var;
    }

    public final ke8 e() {
        q84 q84Var = sx5.b;
        ew8 ew8Var = this.b;
        ce8 ce8Var = (ce8) k40.c0(ew8Var, q84Var);
        ce8Var.getClass();
        w16 w16Var = new w16(ce8Var);
        j31 j31Var = ew8Var.h;
        boolean readEnabled = j31Var.getReadEnabled();
        boolean z = ew8Var.i.getReadEnabled() && this.f.a();
        if (!z && readEnabled) {
            w16Var.c("only-if-cached, max-stale=2147483647");
        } else if (!z || readEnabled) {
            if (!z && !readEnabled) {
                w16Var.c("no-cache, only-if-cached");
            }
        } else if (j31Var.getWriteEnabled()) {
            w16Var.c("no-cache");
        } else {
            w16Var.c("no-cache, no-store");
        }
        String str = (String) k40.c0(ew8Var, sx5.a);
        ce8 ce8Var2 = new ce8(ei7.W(w16Var.a));
        if (k40.c0(ew8Var, sx5.c) == null) {
            return new ke8(this.a, str, ce8Var2, ew8Var.j);
        }
        rd6.m();
        return null;
    }

    public final og4 f(fva fvaVar) {
        gg3 gg3Var = fvaVar.a;
        if (gg3Var.b) {
            ygf.f("snapshot is closed");
            return null;
        }
        g59 g59Var = (g59) gg3Var.a.c.get(1);
        ch4 ch4VarC = c();
        String str = this.b.e;
        if (str == null) {
            str = this.a;
        }
        return gx1.w(g59Var, ch4VarC, str, fvaVar, 16);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object g(defpackage.qkc r5, defpackage.p92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.zd8
            if (r0 == 0) goto L13
            r0 = r6
            zd8 r0 = (defpackage.zd8) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            zd8 r0 = new zd8
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L30
            if (r2 != r3) goto L29
            kz0 r5 = r0.b
            defpackage.br7.v(r6)
            goto L47
        L29:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L30:
            defpackage.br7.v(r6)
            kz0 r6 = new kz0
            r6.<init>()
            r0.b = r6
            r0.e = r3
            zz0 r5 = r5.a
            r5.S(r6)
            c1e r5 = defpackage.c1e.a
            if (r5 != r1) goto L46
            return r1
        L46:
            r5 = r6
        L47:
            ch4 r4 = r4.c()
            lkc r4 = defpackage.gx1.x(r5, r4)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.be8.g(qkc, p92):java.lang.Object");
    }

    public final ne8 h(fva fvaVar) throws Throwable {
        Throwable th;
        ne8 ne8VarR0;
        try {
            ch4 ch4VarC = c();
            gg3 gg3Var = fvaVar.a;
            if (gg3Var.b) {
                throw new IllegalStateException("snapshot is closed");
            }
            yua yuaVarI = wo7.i(ch4VarC.g0((g59) gg3Var.a.c.get(0)));
            try {
                ne8VarR0 = flb.r0(yuaVarI);
                try {
                    yuaVarI.close();
                    th = null;
                } catch (Throwable th2) {
                    th = th2;
                }
            } catch (Throwable th3) {
                try {
                    yuaVarI.close();
                } catch (Throwable th4) {
                    kyd.D(th3, th4);
                }
                th = th3;
                ne8VarR0 = null;
            }
            if (th == null) {
                return ne8VarR0;
            }
            throw th;
        } catch (IOException unused) {
            return null;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:97:0x01ef, code lost:
    
        if (defpackage.c1e.a == r6) goto L98;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:120:0x0219  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x017c A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:144:0x0209 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:146:0x0213 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:152:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001d  */
    /* JADX WARN: Type inference failed for: r0v13 */
    /* JADX WARN: Type inference failed for: r0v14, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v22, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r0v23 */
    /* JADX WARN: Type inference failed for: r11v4, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r11v5 */
    /* JADX WARN: Type inference failed for: r11v6 */
    /* JADX WARN: Type inference failed for: r11v7 */
    /* JADX WARN: Type inference failed for: r11v8 */
    /* JADX WARN: Type inference failed for: r9v1, types: [fva] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object i(defpackage.fva r23, defpackage.ne8 r24, defpackage.ne8 r25, defpackage.p92 r26) {
        /*
            Method dump skipped, instruction units count: 538
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.be8.i(fva, ne8, ne8, p92):java.lang.Object");
    }
}
