package com.google.android.gms.internal.play_billing;

import java.security.AccessController;
import java.security.PrivilegedActionException;
import sun.misc.Unsafe;

/* loaded from: classes3.dex */
public final class c1 extends a.a {

    /* renamed from: c, reason: collision with root package name */
    public static final Unsafe f33359c;

    /* renamed from: d, reason: collision with root package name */
    public static final long f33360d;

    /* renamed from: e, reason: collision with root package name */
    public static final long f33361e;

    /* renamed from: f, reason: collision with root package name */
    public static final long f33362f;

    /* renamed from: g, reason: collision with root package name */
    public static final long f33363g;

    /* renamed from: h, reason: collision with root package name */
    public static final long f33364h;

    static {
        Unsafe unsafe;
        try {
            try {
                unsafe = Unsafe.getUnsafe();
            } catch (PrivilegedActionException e3) {
                throw new RuntimeException("Could not initialize intrinsics", e3.getCause());
            }
        } catch (SecurityException unused) {
            unsafe = (Unsafe) AccessController.doPrivileged(new h1());
        }
        try {
            f33361e = unsafe.objectFieldOffset(e1.class.getDeclaredField("c"));
            f33360d = unsafe.objectFieldOffset(e1.class.getDeclaredField("b"));
            f33362f = unsafe.objectFieldOffset(e1.class.getDeclaredField("a"));
            f33363g = unsafe.objectFieldOffset(d1.class.getDeclaredField("a"));
            f33364h = unsafe.objectFieldOffset(d1.class.getDeclaredField("b"));
            f33359c = unsafe;
        } catch (NoSuchFieldException e11) {
            throw new RuntimeException(e11);
        }
    }

    @Override // a.a
    public final y0 d0(q1 q1Var) {
        y0 y0Var;
        y0 y0Var2 = y0.f33655d;
        do {
            y0Var = q1Var.f33383b;
            if (y0Var2 == y0Var) {
                break;
            }
        } while (!h0(q1Var, y0Var, y0Var2));
        return y0Var;
    }

    @Override // a.a
    public final d1 e0(q1 q1Var) {
        d1 d1Var;
        d1 d1Var2 = d1.f33370c;
        do {
            d1Var = q1Var.f33384c;
            if (d1Var2 == d1Var) {
                break;
            }
        } while (!j0(q1Var, d1Var, d1Var2));
        return d1Var;
    }

    @Override // a.a
    public final void f0(d1 d1Var, d1 d1Var2) {
        f33359c.putObject(d1Var, f33364h, d1Var2);
    }

    @Override // a.a
    public final void g0(d1 d1Var, Thread thread) {
        f33359c.putObject(d1Var, f33363g, thread);
    }

    @Override // a.a
    public final boolean h0(q1 q1Var, y0 y0Var, y0 y0Var2) {
        return g1.a(f33359c, q1Var, f33360d, y0Var, y0Var2);
    }

    @Override // a.a
    public final boolean i0(e1 e1Var, Object obj, Object obj2) {
        return g1.a(f33359c, e1Var, f33362f, obj, obj2);
    }

    @Override // a.a
    public final boolean j0(e1 e1Var, d1 d1Var, d1 d1Var2) {
        return g1.a(f33359c, e1Var, f33361e, d1Var, d1Var2);
    }
}
