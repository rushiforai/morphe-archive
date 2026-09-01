package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wcg {
    public final b55 a;
    public final Integer b;
    public final int c;

    public wcg(int i, b55 b55Var, Integer num) {
        this.c = i;
        this.a = b55Var;
        this.b = num;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.fdg r10, defpackage.n92 r11) {
        /*
            r9 = this;
            d87 r0 = defpackage.d87.T0
            boolean r1 = r11 instanceof defpackage.tcg
            if (r1 == 0) goto L15
            r1 = r11
            tcg r1 = (defpackage.tcg) r1
            int r2 = r1.d
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L15
            int r2 = r2 - r3
            r1.d = r2
            goto L1a
        L15:
            tcg r1 = new tcg
            r1.<init>(r9, r11)
        L1a:
            java.lang.Object r11 = r1.b
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r1.d
            r4 = 0
            r5 = 8
            r6 = 1
            if (r3 == 0) goto L3a
            if (r3 != r6) goto L34
            xbg r9 = r1.e
            defpackage.br7.v(r11)     // Catch: java.lang.Exception -> L2e kotlinx.coroutines.TimeoutCancellationException -> L30 com.google.android.recaptcha.internal.zzfx -> L32 java.lang.Throwable -> L6c
            goto L57
        L2e:
            r10 = move-exception
            goto L6f
        L30:
            r10 = move-exception
            goto L7f
        L32:
            r10 = move-exception
            goto L8f
        L34:
            java.lang.String r9 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r9)
            return r4
        L3a:
            defpackage.br7.v(r11)
            xbg r11 = new xbg
            y3b r3 = r10.b
            int r3 = r9.c
            java.lang.Integer r7 = r9.b
            r11.<init>(r10, r3, r7)
            b55 r9 = r9.a     // Catch: java.lang.Exception -> L63 kotlinx.coroutines.TimeoutCancellationException -> L66 com.google.android.recaptcha.internal.zzfx -> L69 java.lang.Throwable -> L6c
            r1.e = r11     // Catch: java.lang.Exception -> L63 kotlinx.coroutines.TimeoutCancellationException -> L66 com.google.android.recaptcha.internal.zzfx -> L69 java.lang.Throwable -> L6c
            r1.d = r6     // Catch: java.lang.Exception -> L63 kotlinx.coroutines.TimeoutCancellationException -> L66 com.google.android.recaptcha.internal.zzfx -> L69 java.lang.Throwable -> L6c
            java.lang.Object r9 = r9.invoke(r11, r1)     // Catch: java.lang.Exception -> L63 kotlinx.coroutines.TimeoutCancellationException -> L66 com.google.android.recaptcha.internal.zzfx -> L69 java.lang.Throwable -> L6c
            if (r9 == r2) goto L62
            r8 = r11
            r11 = r9
            r9 = r8
        L57:
            fdg r10 = r9.a     // Catch: java.lang.Exception -> L2e kotlinx.coroutines.TimeoutCancellationException -> L30 com.google.android.recaptcha.internal.zzfx -> L32 java.lang.Throwable -> L6c
            r1 = 3
            jqf r1 = r9.b(r1)     // Catch: java.lang.Exception -> L2e kotlinx.coroutines.TimeoutCancellationException -> L30 com.google.android.recaptcha.internal.zzfx -> L32 java.lang.Throwable -> L6c
            r10.b(r1, r4)     // Catch: java.lang.Exception -> L2e kotlinx.coroutines.TimeoutCancellationException -> L30 com.google.android.recaptcha.internal.zzfx -> L32 java.lang.Throwable -> L6c
            return r11
        L62:
            return r2
        L63:
            r9 = move-exception
            r10 = r9
            goto L6e
        L66:
            r9 = move-exception
            r10 = r9
            goto L7e
        L69:
            r9 = move-exception
            r10 = r9
            goto L8e
        L6c:
            r9 = move-exception
            throw r9
        L6e:
            r9 = r11
        L6f:
            com.google.android.recaptcha.internal.zzfx r11 = new com.google.android.recaptcha.internal.zzfx
            d87 r1 = defpackage.d87.e
            java.lang.String r10 = r10.getMessage()
            r11.<init>(r0, r1, r10, r5)
            r9.a(r11)
            throw r11
        L7e:
            r9 = r11
        L7f:
            com.google.android.recaptcha.internal.zzfx r11 = new com.google.android.recaptcha.internal.zzfx
            d87 r1 = defpackage.d87.f
            java.lang.String r10 = r10.getMessage()
            r11.<init>(r0, r1, r10, r5)
            r9.a(r11)
            throw r11
        L8e:
            r9 = r11
        L8f:
            r9.a(r10)
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wcg.a(fdg, n92):java.lang.Object");
    }
}
