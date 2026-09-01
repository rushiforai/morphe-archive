package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class veg {
    public final dfg a;
    public final wjc b;
    public final String c;
    public final mof d;
    public final a98 e = new a98();
    public final int f;
    public final int g;
    public final int h;
    public final int i;

    public veg(dfg dfgVar, wjc wjcVar, String str, int i, int i2, int i3, int i4, mof mofVar) {
        this.a = dfgVar;
        this.b = wjcVar;
        this.c = str;
        this.f = i;
        this.g = i2;
        this.h = i3;
        this.i = i4;
        this.d = mofVar;
    }

    public static /* synthetic */ ycg c(veg vegVar) {
        return new ycg(new kaf(vegVar, null, 9));
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0092, code lost:
    
        if (r8.Q(r7, (java.lang.String) r10, r0) == r1) goto L24;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.emf r8, java.lang.String r9, defpackage.p92 r10) throws javax.crypto.BadPaddingException, javax.crypto.NoSuchPaddingException, javax.crypto.IllegalBlockSizeException, java.security.NoSuchAlgorithmException, java.security.InvalidKeyException {
        /*
            r7 = this;
            boolean r0 = r10 instanceof defpackage.teg
            if (r0 == 0) goto L13
            r0 = r10
            teg r0 = (defpackage.teg) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            teg r0 = new teg
            r0.<init>(r7, r10)
        L18:
            java.lang.Object r10 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 0
            r4 = 2
            r5 = 1
            if (r2 == 0) goto L39
            if (r2 == r5) goto L31
            if (r2 != r4) goto L2b
            defpackage.br7.v(r10)
            goto L95
        L2b:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r3
        L31:
            java.lang.String r7 = r0.f
            dfg r8 = r0.b
            defpackage.br7.v(r10)
            goto L86
        L39:
            defpackage.br7.v(r10)
            java.lang.String r9 = java.lang.String.valueOf(r9)
            dfg r10 = r7.a
            r0.b = r10
            java.lang.String r2 = r7.c
            java.lang.String r9 = r2.concat(r9)
            r0.f = r9
            r0.e = r5
            byte[] r8 = r8.d()
            java.lang.String r2 = "AES/GCM/NoPadding"
            javax.crypto.Cipher r2 = javax.crypto.Cipher.getInstance(r2)
            wjc r7 = r7.b
            javax.crypto.SecretKey r7 = r7.n()
            r2.init(r5, r7)
            byte[] r7 = r2.getIV()
            byte[] r8 = r2.doFinal(r8)
            r7.getClass()
            r8.getClass()
            int r2 = r7.length
            int r5 = r8.length
            int r6 = r2 + r5
            byte[] r7 = java.util.Arrays.copyOf(r7, r6)
            r6 = 0
            java.lang.System.arraycopy(r8, r6, r7, r2, r5)
            r8 = 8
            java.lang.String r7 = android.util.Base64.encodeToString(r7, r8)
            if (r7 == r1) goto L98
            r8 = r10
            r10 = r7
            r7 = r9
        L86:
            java.lang.String r10 = (java.lang.String) r10
            r0.b = r3
            r0.f = r3
            r0.e = r4
            java.lang.Object r7 = r8.Q(r7, r10, r0)
            if (r7 != r1) goto L95
            goto L98
        L95:
            c1e r7 = defpackage.c1e.a
            return r7
        L98:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.veg.a(emf, java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(java.lang.String r12, defpackage.p92 r13) throws com.google.android.recaptcha.internal.zzfx {
        /*
            Method dump skipped, instruction units count: 224
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.veg.b(java.lang.String, p92):java.lang.Object");
    }
}
