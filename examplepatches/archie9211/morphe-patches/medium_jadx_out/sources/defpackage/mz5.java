package defpackage;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mz5 implements InvocationHandler {
    public final /* synthetic */ int a;
    public final Object b;
    public final /* synthetic */ iz5 c;

    public /* synthetic */ mz5(iz5 iz5Var, Object obj, int i) {
        this.a = i;
        this.c = iz5Var;
        this.b = obj;
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x007a A[Catch: all -> 0x002f, Exception -> 0x0041, TryCatch #2 {Exception -> 0x0041, blocks: (B:22:0x004b, B:29:0x005d, B:36:0x006f, B:38:0x007a, B:42:0x0081, B:45:0x008d, B:35:0x006b, B:28:0x0059), top: B:56:0x004b }] */
    /* JADX WARN: Removed duplicated region for block: B:39:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0067 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0081 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0080 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void a(java.lang.Object r7, java.lang.reflect.Method r8, java.lang.Object[] r9) {
        /*
            r6 = this;
            java.lang.String r0 = "productId"
            java.lang.Class<nz5> r1 = defpackage.nz5.class
            iz5 r2 = r6.c
            nz5 r2 = (defpackage.nz5) r2
            java.util.Set r3 = defpackage.ec2.a
            boolean r3 = r3.contains(r6)
            if (r3 == 0) goto L12
            goto La3
        L12:
            r7.getClass()     // Catch: java.lang.Throwable -> L2f
            r8.getClass()     // Catch: java.lang.Throwable -> L2f
            java.lang.String r7 = r8.getName()     // Catch: java.lang.Throwable -> L2f
            java.lang.String r8 = "onSkuDetailsResponse"
            boolean r7 = defpackage.g76.L(r7, r8)     // Catch: java.lang.Throwable -> L2f
            if (r7 != 0) goto L26
            goto La3
        L26:
            r7 = 0
            if (r9 == 0) goto L32
            r8 = 1
            java.lang.Object r8 = defpackage.k80.y0(r8, r9)     // Catch: java.lang.Throwable -> L2f
            goto L33
        L2f:
            r7 = move-exception
            goto La4
        L32:
            r8 = r7
        L33:
            if (r8 == 0) goto La3
            boolean r9 = r8 instanceof java.util.List     // Catch: java.lang.Throwable -> L2f
            if (r9 != 0) goto L3b
            goto La3
        L3b:
            java.util.List r8 = (java.util.List) r8     // Catch: java.lang.Throwable -> L2f
            java.util.Iterator r8 = r8.iterator()     // Catch: java.lang.Throwable -> L2f
        L41:
            boolean r9 = r8.hasNext()     // Catch: java.lang.Throwable -> L2f
            if (r9 == 0) goto L9c
            java.lang.Object r9 = r8.next()     // Catch: java.lang.Throwable -> L2f
            java.util.Set r3 = defpackage.ec2.a     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L41
            boolean r3 = r3.contains(r1)     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L41
            if (r3 == 0) goto L55
        L53:
            r3 = r7
            goto L5d
        L55:
            java.lang.Class r3 = r2.c     // Catch: java.lang.Throwable -> L58
            goto L5d
        L58:
            r3 = move-exception
            defpackage.ec2.a(r1, r3)     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L41
            goto L53
        L5d:
            java.util.Set r4 = defpackage.ec2.a     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L41
            boolean r4 = r4.contains(r1)     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L41
            if (r4 == 0) goto L67
        L65:
            r4 = r7
            goto L6f
        L67:
            java.lang.reflect.Method r4 = r2.g     // Catch: java.lang.Throwable -> L6a
            goto L6f
        L6a:
            r4 = move-exception
            defpackage.ec2.a(r1, r4)     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L41
            goto L65
        L6f:
            r5 = 0
            java.lang.Object[] r5 = new java.lang.Object[r5]     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L41
            java.lang.Object r9 = defpackage.xz5.a0(r3, r9, r4, r5)     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L41
            boolean r3 = r9 instanceof java.lang.String     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L41
            if (r3 == 0) goto L7d
            java.lang.String r9 = (java.lang.String) r9     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L41
            goto L7e
        L7d:
            r9 = r7
        L7e:
            if (r9 != 0) goto L81
            goto L41
        L81:
            org.json.JSONObject r3 = new org.json.JSONObject     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L41
            r3.<init>(r9)     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L41
            boolean r9 = r3.has(r0)     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L41
            if (r9 != 0) goto L8d
            goto L41
        L8d:
            java.lang.String r9 = r3.getString(r0)     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L41
            j$.util.concurrent.ConcurrentHashMap r4 = defpackage.nz5.c()     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L41
            r9.getClass()     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L41
            r4.put(r9, r3)     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L41
            goto L41
        L9c:
            java.lang.Object r7 = r6.b     // Catch: java.lang.Throwable -> L2f
            java.lang.Runnable r7 = (java.lang.Runnable) r7     // Catch: java.lang.Throwable -> L2f
            r7.run()     // Catch: java.lang.Throwable -> L2f
        La3:
            return
        La4:
            defpackage.ec2.a(r6, r7)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mz5.a(java.lang.Object, java.lang.reflect.Method, java.lang.Object[]):void");
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    @Override // java.lang.reflect.InvocationHandler
    public final Object invoke(Object obj, Method method, Object[] objArr) {
        switch (this.a) {
            case 0:
                if (!ec2.a.contains(this)) {
                    try {
                        a(obj, method, objArr);
                    } catch (Throwable th) {
                        ec2.a(this, th);
                        return null;
                    }
                    break;
                }
                break;
            default:
                Object[] objArr2 = (Object[]) this.b;
                oz5 oz5Var = (oz5) this.c;
                obj.getClass();
                method.getClass();
                String name = method.getName();
                if (name != null) {
                    switch (name.hashCode()) {
                        case -1642587947:
                            if (name.equals("onPurchaseHistoryResponse") && !ec2.a.contains(oz5.class)) {
                                try {
                                    oz5Var.j(objArr2, objArr);
                                } catch (Throwable th2) {
                                    ec2.a(oz5.class, th2);
                                }
                            }
                            break;
                        case -1599362358:
                            if (name.equals("onQueryPurchasesResponse") && !ec2.a.contains(oz5.class)) {
                                try {
                                    oz5Var.k(objArr2, objArr);
                                } catch (Throwable th3) {
                                    ec2.a(oz5.class, th3);
                                }
                            }
                            break;
                        case -79406125:
                            if (name.equals("onBillingSetupFinished") && !ec2.a.contains(oz5.class)) {
                                try {
                                    oz5Var.h(objArr2, objArr);
                                } catch (Throwable th4) {
                                    ec2.a(oz5.class, th4);
                                }
                            }
                            break;
                        case 1227540564:
                            if (name.equals("onBillingServiceDisconnected")) {
                                Set set = ec2.a;
                                if (!set.contains(oz5.class)) {
                                    try {
                                        if (!set.contains(oz5Var)) {
                                            try {
                                                oz5.H.set(false);
                                            } catch (Throwable th5) {
                                                ec2.a(oz5Var, th5);
                                            }
                                        }
                                    } catch (Throwable th6) {
                                        ec2.a(oz5.class, th6);
                                    }
                                }
                            }
                            break;
                        case 1940131955:
                            if (name.equals("onProductDetailsResponse") && !ec2.a.contains(oz5.class)) {
                                try {
                                    oz5Var.i(objArr2, objArr);
                                } catch (Throwable th7) {
                                    ec2.a(oz5.class, th7);
                                }
                            }
                            break;
                    }
                }
                break;
        }
        return null;
    }
}
