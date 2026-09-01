package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class t67 implements m45 {
    public final x67 a;
    public final m45 b;
    public volatile Object c;

    public t67(x67 x67Var, m45 m45Var) {
        if (x67Var == null) {
            a(0);
            throw null;
        }
        this.c = w67.NOT_COMPUTED;
        this.a = x67Var;
        this.b = m45Var;
    }

    public static /* synthetic */ void a(int i) {
        String str = (i == 2 || i == 3) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i == 2 || i == 3) ? 2 : 3];
        if (i == 1) {
            objArr[0] = "computable";
        } else if (i == 2 || i == 3) {
            objArr[0] = "kotlin/reflect/jvm/internal/impl/storage/LockBasedStorageManager$LockBasedLazyValue";
        } else {
            objArr[0] = "storageManager";
        }
        if (i == 2) {
            objArr[1] = "recursionDetected";
        } else if (i != 3) {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/storage/LockBasedStorageManager$LockBasedLazyValue";
        } else {
            objArr[1] = "renderDebugInformation";
        }
        if (i != 2 && i != 3) {
            objArr[2] = "<init>";
        }
        String str2 = String.format(str, objArr);
        if (i != 2 && i != 3) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    public sv0 g(boolean z) {
        sv0 sv0VarD = this.a.d("in a lazy value", null);
        if (sv0VarD != null) {
            return sv0VarD;
        }
        a(2);
        throw null;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0038 A[Catch: all -> 0x0022, TryCatch #0 {all -> 0x0022, blocks: (B:7:0x0011, B:9:0x0017, B:14:0x0024, B:16:0x0028, B:18:0x0035, B:19:0x0038, B:21:0x003c, B:23:0x0045, B:24:0x0048, B:28:0x0057, B:30:0x005d, B:32:0x0063, B:33:0x006a, B:34:0x0071, B:35:0x0072, B:36:0x0078, B:25:0x004a), top: B:39:0x0011, inners: #1 }] */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0048 A[Catch: all -> 0x0022, TRY_LEAVE, TryCatch #0 {all -> 0x0022, blocks: (B:7:0x0011, B:9:0x0017, B:14:0x0024, B:16:0x0028, B:18:0x0035, B:19:0x0038, B:21:0x003c, B:23:0x0045, B:24:0x0048, B:28:0x0057, B:30:0x005d, B:32:0x0063, B:33:0x006a, B:34:0x0071, B:35:0x0072, B:36:0x0078, B:25:0x004a), top: B:39:0x0011, inners: #1 }] */
    @Override // defpackage.m45
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object invoke() throws java.lang.Throwable {
        /*
            r4 = this;
            java.lang.Object r0 = r4.c
            boolean r1 = r0 instanceof defpackage.w67
            if (r1 != 0) goto La
            defpackage.gsa.s0(r0)
            return r0
        La:
            x67 r0 = r4.a
            dec r0 = r0.a
            r0.lock()
            java.lang.Object r0 = r4.c     // Catch: java.lang.Throwable -> L22
            boolean r1 = r0 instanceof defpackage.w67     // Catch: java.lang.Throwable -> L22
            if (r1 != 0) goto L24
            defpackage.gsa.s0(r0)     // Catch: java.lang.Throwable -> L22
        L1a:
            x67 r4 = r4.a
            dec r4 = r4.a
            r4.unlock()
            return r0
        L22:
            r0 = move-exception
            goto L79
        L24:
            w67 r1 = defpackage.w67.COMPUTING     // Catch: java.lang.Throwable -> L22
            if (r0 != r1) goto L38
            w67 r2 = defpackage.w67.RECURSION_WAS_DETECTED     // Catch: java.lang.Throwable -> L22
            r4.c = r2     // Catch: java.lang.Throwable -> L22
            r2 = 1
            sv0 r2 = r4.g(r2)     // Catch: java.lang.Throwable -> L22
            boolean r3 = r2.b     // Catch: java.lang.Throwable -> L22
            if (r3 != 0) goto L38
            java.lang.Object r0 = r2.c     // Catch: java.lang.Throwable -> L22
            goto L1a
        L38:
            w67 r2 = defpackage.w67.RECURSION_WAS_DETECTED     // Catch: java.lang.Throwable -> L22
            if (r0 != r2) goto L48
            r0 = 0
            sv0 r0 = r4.g(r0)     // Catch: java.lang.Throwable -> L22
            boolean r2 = r0.b     // Catch: java.lang.Throwable -> L22
            if (r2 != 0) goto L48
            java.lang.Object r0 = r0.c     // Catch: java.lang.Throwable -> L22
            goto L1a
        L48:
            r4.c = r1     // Catch: java.lang.Throwable -> L22
            m45 r0 = r4.b     // Catch: java.lang.Throwable -> L56
            java.lang.Object r0 = r0.invoke()     // Catch: java.lang.Throwable -> L56
            r4.d(r0)     // Catch: java.lang.Throwable -> L56
            r4.c = r0     // Catch: java.lang.Throwable -> L56
            goto L1a
        L56:
            r0 = move-exception
            boolean r1 = defpackage.guc.M(r0)     // Catch: java.lang.Throwable -> L22
            if (r1 != 0) goto L72
            java.lang.Object r1 = r4.c     // Catch: java.lang.Throwable -> L22
            w67 r2 = defpackage.w67.COMPUTING     // Catch: java.lang.Throwable -> L22
            if (r1 != r2) goto L6a
            b9f r1 = new b9f     // Catch: java.lang.Throwable -> L22
            r1.<init>(r0)     // Catch: java.lang.Throwable -> L22
            r4.c = r1     // Catch: java.lang.Throwable -> L22
        L6a:
            x67 r1 = r4.a     // Catch: java.lang.Throwable -> L22
            xsa r1 = r1.b     // Catch: java.lang.Throwable -> L22
            r1.getClass()     // Catch: java.lang.Throwable -> L22
            throw r0     // Catch: java.lang.Throwable -> L22
        L72:
            w67 r1 = defpackage.w67.NOT_COMPUTED     // Catch: java.lang.Throwable -> L22
            r4.c = r1     // Catch: java.lang.Throwable -> L22
            java.lang.RuntimeException r0 = (java.lang.RuntimeException) r0     // Catch: java.lang.Throwable -> L22
            throw r0     // Catch: java.lang.Throwable -> L22
        L79:
            x67 r4 = r4.a
            dec r4 = r4.a
            r4.unlock()
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.t67.invoke():java.lang.Object");
    }

    public void d(Object obj) {
    }
}
