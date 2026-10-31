package y40;

import android.content.Context;
import io.branch.search.internal.A5;
import io.branch.search.internal.C3077b6;
import io.branch.search.internal.C3099cb;
import io.branch.search.internal.C3119de;
import io.branch.search.internal.C3158g2;
import io.branch.search.internal.C3172h;
import io.branch.search.internal.C3309p1;
import io.branch.search.internal.C3411v2;
import io.branch.search.internal.C3413v4;
import io.branch.search.internal.C3473yd;
import io.branch.search.internal.EnumC3131e9;
import io.branch.search.internal.F4;
import io.branch.search.internal.G2;
import io.branch.search.internal.InterfaceC3133eb;
import io.branch.search.internal.InterfaceC3227k4;
import io.branch.search.internal.InterfaceC3377t2;
import io.branch.search.internal.M4;
import io.branch.search.internal.Y2;
import io.branch.search.internal.Z2;
import io.branch.search.internal.multiprocess.LifecycleNotifier;
import io.branch.search.internal.multiprocess.ProcessLifecycleObserver;
import io.branch.search.internal.util.CorosKt;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes4.dex */
public final class o {

    /* renamed from: b, reason: collision with root package name */
    public static volatile boolean f96679b;

    /* renamed from: d, reason: collision with root package name */
    public static /* synthetic */ C3411v2 f96681d;

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ o f96678a = new o();

    /* renamed from: c, reason: collision with root package name */
    public static final ReentrantLock f96680c = new ReentrantLock();

    /* renamed from: e, reason: collision with root package name */
    public static final t70.s f96682e = m0.b();

    public static p a() {
        if (f96679b) {
            ReentrantLock reentrantLock = f96680c;
            reentrantLock.lock();
            try {
                C3411v2 c3411v2 = null;
                if (f96679b) {
                    C3411v2 c3411v22 = f96681d;
                    if (c3411v22 == null) {
                        Intrinsics.m("singleton");
                        throw null;
                    }
                    c3411v2 = c3411v22;
                }
                if (c3411v2 != null) {
                    return c3411v2;
                }
            } finally {
                reentrantLock.unlock();
            }
        }
        return new C3099cb(f96682e, 30000L, CorosKt.getBNCScope());
    }

    public static void b(m.w wVar) {
        InterfaceC3227k4 c3413v4;
        if (((InterfaceC3133eb) wVar.f75379c).d() && ((InterfaceC3133eb) wVar.f75379c).f()) {
            return;
        }
        if (f96679b) {
            C3309p1.d(EnumC3131e9.Init, "Already called BranchNavigatorClient.init for this process. Got " + ((F4) wVar.f75378b) + ' ' + wVar);
            return;
        }
        ReentrantLock reentrantLock = f96680c;
        reentrantLock.lock();
        try {
            if (!f96679b) {
                InterfaceC3133eb interfaceC3133eb = (InterfaceC3133eb) wVar.f75379c;
                Continuation continuation = null;
                if (!interfaceC3133eb.c()) {
                    Z2.a aVar = Z2.Companion;
                    M4 m42 = new M4((F4) wVar.f75378b);
                    aVar.getClass();
                    if (Z2.f63802f == null) {
                        Z2 z22 = new Z2(interfaceC3133eb, m42, null);
                        z22.f63806d = Thread.getDefaultUncaughtExceptionHandler();
                        Thread.setDefaultUncaughtExceptionHandler(z22);
                        Z2.f63802f = z22;
                    }
                }
                F4 f42 = (F4) wVar.f75378b;
                Context context = f42.f62438a;
                C3077b6 c3077b6 = new C3077b6(context, CorosKt.getBNCScope());
                if (((InterfaceC3133eb) wVar.f75379c).b()) {
                    InterfaceC3227k4 a52 = new A5();
                    m0.t(CorosKt.getBNCScope(), a80.d.f488c, null, new u6.a(a52, continuation, 7), 2);
                    c3413v4 = a52;
                } else {
                    c3413v4 = new C3413v4(context, c3077b6, a80.d.f488c);
                }
                C3158g2 c3158g2 = new C3158g2();
                Intrinsics.g(context, "context");
                Y2.a aVar2 = Y2.Companion;
                Y2.b bVar = Y2.b.RemoteConfig;
                aVar2.getClass();
                LifecycleNotifier lifecycleNotifier = new LifecycleNotifier(c3413v4, c3158g2, new G2(Y2.a.a(context, bVar)).a().f65371l0 ? new C3172h(f42) : new ProcessLifecycleObserver(), CorosKt.getBNCScope(), f42);
                InterfaceC3377t2 c3119de = ((InterfaceC3133eb) wVar.f75379c).b() ? new C3119de(c3413v4, c3077b6, lifecycleNotifier) : new C3473yd(context, c3413v4, c3077b6, lifecycleNotifier);
                F4 f43 = (F4) wVar.f75378b;
                ((InterfaceC3133eb) wVar.f75379c).b();
                f96681d = new C3411v2(f43, c3413v4, false, c3158g2, c3119de, (InterfaceC3133eb) wVar.f75379c, CorosKt.getBNCScope());
                f96679b = true;
                t70.s sVar = f96682e;
                C3411v2 c3411v2 = f96681d;
                if (c3411v2 == null) {
                    Intrinsics.m("singleton");
                    throw null;
                }
                sVar.X(c3411v2);
            }
            Unit unit = Unit.f71706a;
            reentrantLock.unlock();
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }
}
