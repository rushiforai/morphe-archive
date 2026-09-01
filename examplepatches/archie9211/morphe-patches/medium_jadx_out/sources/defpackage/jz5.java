package defpackage;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jz5 implements InvocationHandler {
    public final Runnable a;

    public jz5(Runnable runnable) {
        this.a = runnable;
    }

    @Override // java.lang.reflect.InvocationHandler
    public final Object invoke(Object obj, Method method, Object[] objArr) {
        AtomicBoolean atomicBoolean;
        Method methodV;
        AtomicBoolean atomicBoolean2;
        Set set = ec2.a;
        if (!set.contains(this)) {
            try {
                obj.getClass();
                method.getClass();
                if (g76.L(method.getName(), "onBillingSetupFinished")) {
                    Object objY0 = objArr != null ? k80.y0(0, objArr) : null;
                    Class clsR = xz5.R("com.android.billingclient.api.BillingResult");
                    if (clsR != null && (methodV = xz5.V(clsR, "getResponseCode", new Class[0])) != null && g76.L(xz5.a0(clsR, objY0, methodV, new Object[0]), 0)) {
                        z46 z46Var = nz5.l;
                        if (set.contains(nz5.class)) {
                            atomicBoolean2 = null;
                            atomicBoolean2.set(true);
                            this.a.run();
                        } else {
                            try {
                                atomicBoolean2 = nz5.n;
                            } catch (Throwable th) {
                                ec2.a(nz5.class, th);
                                atomicBoolean2 = null;
                            }
                            atomicBoolean2.set(true);
                            this.a.run();
                        }
                    }
                } else {
                    String name = method.getName();
                    name.getClass();
                    if (tuc.F(name, "onBillingServiceDisconnected", false)) {
                        z46 z46Var2 = nz5.l;
                        if (set.contains(nz5.class)) {
                            atomicBoolean = null;
                            atomicBoolean.set(false);
                        } else {
                            try {
                                atomicBoolean = nz5.n;
                            } catch (Throwable th2) {
                                ec2.a(nz5.class, th2);
                                atomicBoolean = null;
                            }
                            atomicBoolean.set(false);
                        }
                    }
                }
            } catch (Throwable th3) {
                ec2.a(this, th3);
                return null;
            }
        }
        return null;
    }
}
