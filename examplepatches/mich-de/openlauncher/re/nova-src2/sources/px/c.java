package px;

import android.app.Application;
import android.content.Context;
import cy.d0;
import dx.n0;
import dx.p0;
import e20.i0;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import p10.p1;
import t70.k0;
import t70.m0;
import t70.y0;
import w70.m;
import w70.o1;
import w70.s0;
import w70.t1;
import w70.u1;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: c, reason: collision with root package name */
    public static volatile boolean f83112c;

    /* renamed from: d, reason: collision with root package name */
    public static volatile boolean f83113d;

    /* renamed from: e, reason: collision with root package name */
    public static volatile mh.c f83114e;

    /* renamed from: a, reason: collision with root package name */
    public static final c f83110a = new c();

    /* renamed from: b, reason: collision with root package name */
    public static final y70.d f83111b = k0.a(CoroutineContext.Element.DefaultImpls.d(m0.d(), y0.f88884a));

    /* renamed from: f, reason: collision with root package name */
    public static final t1 f83115f = u1.b(0, 4, null, 5);

    /* renamed from: g, reason: collision with root package name */
    public static final a f83116g = new a();

    public static mh.c a() {
        return f83114e;
    }

    public static boolean f() {
        return f83112c;
    }

    public final synchronized void b(Application application) {
        j10.d.b(application);
        c(application);
        f83112c = true;
    }

    public final synchronized void c(Application application) {
        if (f83113d) {
            return;
        }
        y70.d dVar = f83111b;
        d0 d0Var = d0.f48442a;
        m[] mVarArr = {new i0(u1.l(d0.f48451j, 1), 4), f83115f};
        int i5 = s0.f94008a;
        e eVar = new e(dVar, new x70.m(kotlin.collections.c.m0(mVarArr), EmptyCoroutineContext.f71803a, -2, v70.a.f92141a));
        mh.c cVar = new mh.c(application);
        f83114e = cVar;
        AtomicReference atomicReference = n0.f49747a;
        n0.a(application, eVar.f83125b, (o1) cVar.f76325d, new dx.d0(d.f83117b, d.f83118c, d.f83119d, p0.f49755b));
        application.registerActivityLifecycleCallbacks(f83116g);
        f83113d = true;
    }

    public final void d(Context context) {
        zy.c cVar = zy.c.f98823a;
        if (zy.c.c("rewarded_ads_enabled")) {
            Context applicationContext = context.getApplicationContext();
            Intrinsics.e(applicationContext, "null cannot be cast to non-null type android.app.Application");
            c((Application) applicationContext);
            int i5 = 2;
            m0.t(f83111b, a80.d.f488c, null, new p1(i5, null, i5), 2);
        }
    }

    public final boolean e(Context context) {
        if (f83112c) {
            return true;
        }
        zy.c cVar = zy.c.f98823a;
        if (!zy.c.c("new_ad_sdk_enabled")) {
            return false;
        }
        Context applicationContext = context.getApplicationContext();
        Intrinsics.e(applicationContext, "null cannot be cast to non-null type android.app.Application");
        b((Application) applicationContext);
        return true;
    }
}
