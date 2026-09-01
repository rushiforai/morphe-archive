package defpackage;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class lz5 implements InvocationHandler {
    public final /* synthetic */ int a;

    public /* synthetic */ lz5(int i) {
        this.a = i;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0016 A[Catch: all -> 0x001b, TRY_LEAVE, TryCatch #1 {, blocks: (B:3:0x0001, B:12:0x0016, B:10:0x0011, B:7:0x000d), top: B:22:0x0001, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized defpackage.oz5 b(android.content.Context r4) {
        /*
            r3 = this;
            monitor-enter(r3)
            java.lang.Class<oz5> r0 = defpackage.oz5.class
            java.util.Set r1 = defpackage.ec2.a     // Catch: java.lang.Throwable -> L1b
            boolean r1 = r1.contains(r0)     // Catch: java.lang.Throwable -> L1b
            r2 = 0
            if (r1 == 0) goto Ld
            goto L14
        Ld:
            oz5 r2 = defpackage.oz5.I     // Catch: java.lang.Throwable -> L10
            goto L14
        L10:
            r1 = move-exception
            defpackage.ec2.a(r0, r1)     // Catch: java.lang.Throwable -> L1b
        L14:
            if (r2 != 0) goto L1d
            oz5 r2 = r3.a(r4)     // Catch: java.lang.Throwable -> L1b
            goto L1d
        L1b:
            r4 = move-exception
            goto L1f
        L1d:
            monitor-exit(r3)
            return r2
        L1f:
            monitor-exit(r3)     // Catch: java.lang.Throwable -> L1b
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lz5.b(android.content.Context):oz5");
    }

    @Override // java.lang.reflect.InvocationHandler
    public final Object invoke(Object obj, Method method, Object[] objArr) {
        switch (this.a) {
            case 0:
                if (!ec2.a.contains(this)) {
                    try {
                        obj.getClass();
                        method.getClass();
                    } catch (Throwable th) {
                        ec2.a(this, th);
                    }
                }
                break;
            default:
                obj.getClass();
                method.getClass();
                break;
        }
        return null;
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:57:0x024a  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0256  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.oz5 a(android.content.Context r46) {
        /*
            Method dump skipped, instruction units count: 713
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lz5.a(android.content.Context):oz5");
    }
}
