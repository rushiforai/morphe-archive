package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vk3 extends uib implements b55 {
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ k0 e;
    public final /* synthetic */ ek5 f;
    public final /* synthetic */ ek5 g;
    public final /* synthetic */ l23 h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vk3(k0 k0Var, ek5 ek5Var, ek5 ek5Var2, l23 l23Var, n92 n92Var) {
        super(2, n92Var);
        this.e = k0Var;
        this.f = ek5Var;
        this.g = ek5Var2;
        this.h = l23Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        vk3 vk3Var = new vk3(this.e, this.f, this.g, this.h, n92Var);
        vk3Var.d = obj;
        return vk3Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((vk3) create((u4d) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0059 A[Catch: CancellationException -> 0x001a, TryCatch #0 {CancellationException -> 0x001a, blocks: (B:8:0x0016, B:33:0x007c, B:35:0x0084, B:37:0x0091, B:39:0x009d, B:40:0x00a0, B:41:0x00a3, B:42:0x00a9, B:15:0x0027, B:27:0x0055, B:29:0x0059, B:18:0x002f, B:24:0x0046, B:21:0x003b), top: B:47:0x000a }] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0084 A[Catch: CancellationException -> 0x001a, TryCatch #0 {CancellationException -> 0x001a, blocks: (B:8:0x0016, B:33:0x007c, B:35:0x0084, B:37:0x0091, B:39:0x009d, B:40:0x00a0, B:41:0x00a3, B:42:0x00a9, B:15:0x0027, B:27:0x0055, B:29:0x0059, B:18:0x002f, B:24:0x0046, B:21:0x003b), top: B:47:0x000a }] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00a9 A[Catch: CancellationException -> 0x001a, TRY_LEAVE, TryCatch #0 {CancellationException -> 0x001a, blocks: (B:8:0x0016, B:33:0x007c, B:35:0x0084, B:37:0x0091, B:39:0x009d, B:40:0x00a0, B:41:0x00a3, B:42:0x00a9, B:15:0x0027, B:27:0x0055, B:29:0x0059, B:18:0x002f, B:24:0x0046, B:21:0x003b), top: B:47:0x000a }] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r9) throws android.app.PendingIntent.CanceledException {
        /*
            r8 = this;
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r8.c
            r2 = 0
            ek5 r3 = r8.g
            r4 = 3
            r5 = 2
            r6 = 1
            if (r1 == 0) goto L33
            if (r1 == r6) goto L2b
            if (r1 == r5) goto L23
            if (r1 != r4) goto L1d
            java.lang.Object r0 = r8.d
            u4d r0 = (defpackage.u4d) r0
            defpackage.br7.v(r9)     // Catch: java.util.concurrent.CancellationException -> L1a
            goto L7c
        L1a:
            r8 = move-exception
            goto Laf
        L1d:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r2
        L23:
            java.lang.Object r1 = r8.d
            u4d r1 = (defpackage.u4d) r1
            defpackage.br7.v(r9)     // Catch: java.util.concurrent.CancellationException -> L1a
            goto L55
        L2b:
            java.lang.Object r1 = r8.d
            u4d r1 = (defpackage.u4d) r1
            defpackage.br7.v(r9)     // Catch: java.util.concurrent.CancellationException -> L1a
            goto L46
        L33:
            defpackage.br7.v(r9)
            java.lang.Object r9 = r8.d
            r1 = r9
            u4d r1 = (defpackage.u4d) r1
            r8.d = r1     // Catch: java.util.concurrent.CancellationException -> L1a
            r8.c = r6     // Catch: java.util.concurrent.CancellationException -> L1a
            java.lang.Object r9 = defpackage.qfd.b(r1, r2, r8, r5)     // Catch: java.util.concurrent.CancellationException -> L1a
            if (r9 != r0) goto L46
            goto L7a
        L46:
            rb9 r9 = (defpackage.rb9) r9     // Catch: java.util.concurrent.CancellationException -> L1a
            long r6 = r9.a     // Catch: java.util.concurrent.CancellationException -> L1a
            r8.d = r1     // Catch: java.util.concurrent.CancellationException -> L1a
            r8.c = r5     // Catch: java.util.concurrent.CancellationException -> L1a
            java.lang.Object r9 = defpackage.yk3.b(r1, r6, r8)     // Catch: java.util.concurrent.CancellationException -> L1a
            if (r9 != r0) goto L55
            goto L7a
        L55:
            rb9 r9 = (defpackage.rb9) r9     // Catch: java.util.concurrent.CancellationException -> L1a
            if (r9 == 0) goto Lac
            k0 r2 = r8.e     // Catch: java.util.concurrent.CancellationException -> L1a
            long r5 = r9.c     // Catch: java.util.concurrent.CancellationException -> L1a
            ip8 r7 = new ip8     // Catch: java.util.concurrent.CancellationException -> L1a
            r7.<init>(r5)     // Catch: java.util.concurrent.CancellationException -> L1a
            r2.invoke(r7)     // Catch: java.util.concurrent.CancellationException -> L1a
            long r5 = r9.a     // Catch: java.util.concurrent.CancellationException -> L1a
            l23 r9 = r8.h     // Catch: java.util.concurrent.CancellationException -> L1a
            s0 r2 = new s0     // Catch: java.util.concurrent.CancellationException -> L1a
            r7 = 25
            r2.<init>(r7, r9)     // Catch: java.util.concurrent.CancellationException -> L1a
            r8.d = r1     // Catch: java.util.concurrent.CancellationException -> L1a
            r8.c = r4     // Catch: java.util.concurrent.CancellationException -> L1a
            java.lang.Object r9 = defpackage.yk3.e(r1, r5, r2, r8)     // Catch: java.util.concurrent.CancellationException -> L1a
            if (r9 != r0) goto L7b
        L7a:
            return r0
        L7b:
            r0 = r1
        L7c:
            java.lang.Boolean r9 = (java.lang.Boolean) r9     // Catch: java.util.concurrent.CancellationException -> L1a
            boolean r9 = r9.booleanValue()     // Catch: java.util.concurrent.CancellationException -> L1a
            if (r9 == 0) goto La9
            w4d r9 = r0.e     // Catch: java.util.concurrent.CancellationException -> L1a
            lb9 r9 = r9.s     // Catch: java.util.concurrent.CancellationException -> L1a
            java.util.List r9 = r9.a     // Catch: java.util.concurrent.CancellationException -> L1a
            int r0 = r9.size()     // Catch: java.util.concurrent.CancellationException -> L1a
            r1 = 0
        L8f:
            if (r1 >= r0) goto La3
            java.lang.Object r2 = r9.get(r1)     // Catch: java.util.concurrent.CancellationException -> L1a
            rb9 r2 = (defpackage.rb9) r2     // Catch: java.util.concurrent.CancellationException -> L1a
            boolean r4 = defpackage.mq7.w(r2)     // Catch: java.util.concurrent.CancellationException -> L1a
            if (r4 == 0) goto La0
            r2.a()     // Catch: java.util.concurrent.CancellationException -> L1a
        La0:
            int r1 = r1 + 1
            goto L8f
        La3:
            ek5 r8 = r8.f     // Catch: java.util.concurrent.CancellationException -> L1a
            r8.invoke()     // Catch: java.util.concurrent.CancellationException -> L1a
            goto Lac
        La9:
            r3.invoke()     // Catch: java.util.concurrent.CancellationException -> L1a
        Lac:
            c1e r8 = defpackage.c1e.a
            return r8
        Laf:
            r3.invoke()
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vk3.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
