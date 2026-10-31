package com.google.android.gms.internal.measurement;

import android.os.Build;
import android.os.Trace;
import android.util.Log;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import java.util.ArrayDeque;
import java.util.UUID;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public abstract class jg {

    /* renamed from: a, reason: collision with root package name */
    public static final AtomicReference f32692a;

    /* renamed from: b, reason: collision with root package name */
    public static final k1 f32693b;

    /* renamed from: c, reason: collision with root package name */
    public static final WeakHashMap f32694c;

    /* renamed from: d, reason: collision with root package name */
    public static final b.a3 f32695d;

    static {
        xk.d1.l(5, "androidx.fragment.app.FragmentViewLifecycleOwner.handleLifecycleEvent", "com.google.android.libraries.logging.logger.transmitters.clearcut", "com.google.android.libraries.performance.primes.transmitter.clearcut", "com.google.android.libraries.performance.primes.metrics.crash.CrashMetricServiceImpl", "com.google.android.libraries.performance.primes.metrics.crash.applicationexit.ApplicationExitMetricServiceImpl");
        f32692a = new AtomicReference(xk.z2.f96074j);
        f32693b = new k1(15);
        f32694c = new WeakHashMap();
        f32695d = new b.a3(4);
        new ArrayDeque();
        new ArrayDeque();
    }

    public static zg a() {
        yg ygVarC = c();
        zg zgVar = ygVarC.f33266b;
        if (zgVar != null && zgVar != pg.f32968g) {
            return zgVar;
        }
        zzvr zzvrVar = ng.f32857g;
        UUID uuidB = kg.f32741c.b();
        String strA = dg.a(uuidB);
        xk.d1 d1Var = (xk.d1) f32692a.get();
        if (!d1Var.isEmpty()) {
            d1Var.forEach(new mg(0));
        }
        return new ng(uuidB, strA, ng.f32857g, ygVarC);
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0072  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static zg b(yg ygVar, zg zgVar) {
        boolean zEquals;
        ygVar.getClass();
        zg zgVar2 = ygVar.f33266b;
        if (zgVar2 != zgVar) {
            if (zgVar2 == null) {
                if (Build.VERSION.SDK_INT >= 29) {
                    zEquals = Trace.isEnabled();
                } else {
                    se.f33068a.getClass();
                    f32693b.getClass();
                    String str = "false";
                    try {
                        str = (String) te.f33085a.invoke(null, "tiktok_systrace", "false");
                    } catch (Exception e3) {
                        Log.e("SystemProperties", "get error", e3);
                    }
                    zEquals = str.equals(InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
                }
                ygVar.f33265a = zEquals;
            }
            if (ygVar.f33265a) {
                if (zgVar2 != null) {
                    if (zgVar != null) {
                        if (((dg) zgVar2).f32473a == zgVar && !lb.l(zgVar2)) {
                            Trace.endSection();
                        } else if (zgVar2 == ((dg) zgVar).f32473a && !lb.l(zgVar)) {
                            lb.n(zgVar);
                        }
                    }
                    lb.j(zgVar2);
                    if (zgVar != null) {
                    }
                } else if (zgVar != null) {
                    lb.h(zgVar);
                }
            }
            if (zgVar2 != zgVar) {
                ygVar.f33266b = zgVar;
                return zgVar2;
            }
        }
        return zgVar;
    }

    public static yg c() {
        return (yg) f32695d.get();
    }
}
