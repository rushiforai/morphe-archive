package com.google.android.gms.internal.play_billing;

import com.amplitude.android.plugins.AndroidContextPlugin;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public abstract class e1 extends r1 implements n1 {

    /* renamed from: d, reason: collision with root package name */
    public static final Object f33378d = new Object();

    /* renamed from: e, reason: collision with root package name */
    public static final m1 f33379e = new m1(q1.class);

    /* renamed from: f, reason: collision with root package name */
    public static final boolean f33380f;

    /* renamed from: g, reason: collision with root package name */
    public static final a.a f33381g;

    /* renamed from: a, reason: collision with root package name */
    public volatile Object f33382a;

    /* renamed from: b, reason: collision with root package name */
    public volatile y0 f33383b;

    /* renamed from: c, reason: collision with root package name */
    public volatile d1 f33384c;

    static {
        boolean z11;
        a.a b1Var;
        Throwable th2;
        Throwable th3;
        try {
            z11 = Boolean.parseBoolean(System.getProperty("guava.concurrent.generate_cancellation_cause", "false"));
        } catch (SecurityException unused) {
            z11 = false;
        }
        f33380f = z11;
        String property = System.getProperty("java.runtime.name", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        Throwable th4 = null;
        if (property == null || property.contains(AndroidContextPlugin.PLATFORM)) {
            try {
                b1Var = new c1(7);
            } catch (Error | Exception e3) {
                try {
                    b1Var = new a1(7);
                } catch (Error | Exception e11) {
                    th4 = e11;
                    b1Var = new b1(7);
                }
                th2 = th4;
                th3 = e3;
            }
        } else {
            try {
                b1Var = new a1(7);
            } catch (NoClassDefFoundError unused2) {
                b1Var = new b1(7);
            }
        }
        th2 = null;
        th3 = null;
        f33381g = b1Var;
        if (th2 != null) {
            m1 m1Var = f33379e;
            Logger loggerA = m1Var.a();
            Level level = Level.SEVERE;
            loggerA.logp(level, "com.google.common.util.concurrent.AbstractFutureState", "<clinit>", "UnsafeAtomicHelper is broken!", th3);
            m1Var.a().logp(level, "com.google.common.util.concurrent.AbstractFutureState", "<clinit>", "AtomicReferenceFieldUpdaterAtomicHelper is broken!", th2);
        }
    }

    public final void d(d1 d1Var) {
        d1Var.f33371a = null;
        while (true) {
            d1 d1Var2 = this.f33384c;
            if (d1Var2 != d1.f33370c) {
                d1 d1Var3 = null;
                while (d1Var2 != null) {
                    d1 d1Var4 = d1Var2.f33372b;
                    if (d1Var2.f33371a != null) {
                        d1Var3 = d1Var2;
                    } else if (d1Var3 != null) {
                        d1Var3.f33372b = d1Var4;
                        if (d1Var3.f33371a == null) {
                            break;
                        }
                    } else if (!f33381g.j0(this, d1Var2, d1Var4)) {
                        break;
                    }
                    d1Var2 = d1Var4;
                }
                return;
            }
            return;
        }
    }
}
