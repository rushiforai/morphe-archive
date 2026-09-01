package defpackage;

import java.io.Serializable;
import java.lang.reflect.InvocationHandler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kz5 implements InvocationHandler {
    public final /* synthetic */ int a;
    public final Serializable b;
    public final Object c;
    public final /* synthetic */ Object d;

    /* JADX WARN: Type inference failed for: r2v2, types: [java.io.Serializable, java.lang.Object[]] */
    public kz5(kjb kjbVar, Class cls) {
        this.a = 1;
        this.d = kjbVar;
        this.c = cls;
        this.b = new Object[0];
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x008c A[Catch: all -> 0x0038, Exception -> 0x0050, TryCatch #0 {Exception -> 0x0050, blocks: (B:23:0x005c, B:30:0x006f, B:37:0x0081, B:39:0x008c, B:43:0x0093, B:46:0x009f, B:48:0x00ad, B:49:0x00b5, B:36:0x007d, B:29:0x006b), top: B:73:0x005c }] */
    /* JADX WARN: Removed duplicated region for block: B:40:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0079 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0093 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0092 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void a(java.lang.Object r9, java.lang.reflect.Method r10, java.lang.Object[] r11) {
        /*
            Method dump skipped, instruction units count: 241
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kz5.a(java.lang.Object, java.lang.reflect.Method, java.lang.Object[]):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:56:0x006a A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // java.lang.reflect.InvocationHandler
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invoke(java.lang.Object r8, java.lang.reflect.Method r9, java.lang.Object[] r10) {
        /*
            r7 = this;
            int r0 = r7.a
            switch(r0) {
                case 0: goto L8d;
                default: goto L5;
            }
        L5:
            java.lang.Object r0 = r7.c
            java.lang.Class r0 = (java.lang.Class) r0
            java.lang.Class r1 = r9.getDeclaringClass()
            java.lang.Class<java.lang.Object> r2 = java.lang.Object.class
            if (r1 != r2) goto L17
            java.lang.Object r7 = r9.invoke(r7, r10)
            goto L8a
        L17:
            if (r10 == 0) goto L1b
        L19:
            r4 = r10
            goto L20
        L1b:
            java.io.Serializable r10 = r7.b
            java.lang.Object[] r10 = (java.lang.Object[]) r10
            goto L19
        L20:
            wz7 r10 = defpackage.da9.b
            boolean r1 = r10.q(r9)
            if (r1 == 0) goto L2d
            java.lang.Object r7 = r10.p(r0, r8, r9, r4)
            goto L8a
        L2d:
            java.lang.Object r7 = r7.d
            kjb r7 = (defpackage.kjb) r7
        L31:
            j$.util.concurrent.ConcurrentHashMap r10 = r7.a
            java.lang.Object r10 = r10.get(r9)
            boolean r1 = r10 instanceof defpackage.ot5
            if (r1 == 0) goto L3e
            ot5 r10 = (defpackage.ot5) r10
            goto L7a
        L3e:
            if (r10 != 0) goto L65
            java.lang.Object r1 = new java.lang.Object
            r1.<init>()
            monitor-enter(r1)
            j$.util.concurrent.ConcurrentHashMap r10 = r7.a     // Catch: java.lang.Throwable -> L59
            java.lang.Object r10 = r10.putIfAbsent(r9, r1)     // Catch: java.lang.Throwable -> L59
            if (r10 != 0) goto L64
            ot5 r10 = defpackage.ot5.b(r7, r0, r9)     // Catch: java.lang.Throwable -> L5c
            j$.util.concurrent.ConcurrentHashMap r7 = r7.a     // Catch: java.lang.Throwable -> L59
            r7.put(r9, r10)     // Catch: java.lang.Throwable -> L59
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L59
            goto L7a
        L59:
            r0 = move-exception
            r7 = r0
            goto L67
        L5c:
            r0 = move-exception
            r8 = r0
            j$.util.concurrent.ConcurrentHashMap r7 = r7.a     // Catch: java.lang.Throwable -> L59
            r7.remove(r9)     // Catch: java.lang.Throwable -> L59
            throw r8     // Catch: java.lang.Throwable -> L59
        L64:
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L59
        L65:
            r1 = r10
            goto L69
        L67:
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L59
            throw r7
        L69:
            monitor-enter(r1)
            j$.util.concurrent.ConcurrentHashMap r10 = r7.a     // Catch: java.lang.Throwable -> L74
            java.lang.Object r10 = r10.get(r9)     // Catch: java.lang.Throwable -> L74
            if (r10 != 0) goto L77
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L74
            goto L31
        L74:
            r0 = move-exception
            r7 = r0
            goto L8b
        L77:
            ot5 r10 = (defpackage.ot5) r10     // Catch: java.lang.Throwable -> L74
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L74
        L7a:
            sp8 r1 = new sp8
            ybb r2 = r10.a
            u31 r5 = r10.b
            y92 r6 = r10.c
            r3 = r8
            r1.<init>(r2, r3, r4, r5, r6)
            java.lang.Object r7 = r10.a(r1, r4)
        L8a:
            return r7
        L8b:
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L74
            throw r7
        L8d:
            r3 = r8
            java.util.Set r8 = defpackage.ec2.a
            boolean r8 = r8.contains(r7)
            r1 = 0
            if (r8 == 0) goto L98
            goto La3
        L98:
            r7.a(r3, r9, r10)     // Catch: java.lang.Throwable -> L9e
            c1e r1 = defpackage.c1e.a     // Catch: java.lang.Throwable -> L9e
            goto La3
        L9e:
            r0 = move-exception
            r8 = r0
            defpackage.ec2.a(r7, r8)
        La3:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kz5.invoke(java.lang.Object, java.lang.reflect.Method, java.lang.Object[]):java.lang.Object");
    }

    public kz5(nz5 nz5Var, wz5 wz5Var, Runnable runnable) {
        this.a = 0;
        wz5Var.getClass();
        this.d = nz5Var;
        this.b = wz5Var;
        this.c = runnable;
    }
}
