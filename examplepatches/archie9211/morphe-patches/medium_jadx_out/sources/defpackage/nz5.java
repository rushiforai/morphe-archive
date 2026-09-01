package defpackage;

import j$.util.concurrent.ConcurrentHashMap;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nz5 implements iz5 {
    public static nz5 m;
    public final Object a;
    public final Class b;
    public final Class c;
    public final Class d;
    public final Class e;
    public final Class f;
    public final Method g;
    public final Method h;
    public final Method i;
    public final Method j;
    public final uz5 k;
    public static final z46 l = new z46();
    public static final AtomicBoolean n = new AtomicBoolean(false);
    public static final ConcurrentHashMap o = new ConcurrentHashMap();
    public static final ConcurrentHashMap p = new ConcurrentHashMap();
    public static final ConcurrentHashMap q = new ConcurrentHashMap();

    public nz5(Object obj, Class cls, Class cls2, Class cls3, Class cls4, Class cls5, Method method, Method method2, Method method3, Method method4, uz5 uz5Var) {
        this.a = obj;
        this.b = cls;
        this.c = cls2;
        this.d = cls3;
        this.e = cls4;
        this.f = cls5;
        this.g = method;
        this.h = method2;
        this.i = method3;
        this.j = method4;
        this.k = uz5Var;
    }

    public static final ConcurrentHashMap b() {
        if (ec2.a.contains(nz5.class)) {
            return null;
        }
        try {
            return o;
        } catch (Throwable th) {
            ec2.a(nz5.class, th);
            return null;
        }
    }

    public static final ConcurrentHashMap c() {
        if (ec2.a.contains(nz5.class)) {
            return null;
        }
        try {
            return q;
        } catch (Throwable th) {
            ec2.a(nz5.class, th);
            return null;
        }
    }

    public static final ConcurrentHashMap d() {
        if (ec2.a.contains(nz5.class)) {
            return null;
        }
        try {
            return p;
        } catch (Throwable th) {
            ec2.a(nz5.class, th);
            return null;
        }
    }

    public static final String e() {
        if (ec2.a.contains(nz5.class)) {
            return null;
        }
        return "nz5";
    }

    @Override // defpackage.iz5
    public final void a(wz5 wz5Var, Runnable runnable) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            wz5Var.getClass();
            f(new ss(this, wz5Var, runnable, 10));
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final void f(Runnable runnable) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            if (n.get()) {
                runnable.run();
            } else {
                h(runnable);
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final Object g() {
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            return this.a;
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }

    public final void h(Runnable runnable) {
        Method methodV;
        Class cls = this.b;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            Class clsR = xz5.R("com.android.billingclient.api.BillingClientStateListener");
            if (clsR == null || (methodV = xz5.V(cls, "startConnection", clsR)) == null) {
                return;
            }
            xz5.a0(cls, g(), methodV, Proxy.newProxyInstance(clsR.getClassLoader(), new Class[]{clsR}, new jz5(runnable)));
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }
}
