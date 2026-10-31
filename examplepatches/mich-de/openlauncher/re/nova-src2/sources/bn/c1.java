package bn;

import com.google.firebase.crashlytics.internal.common.CrashlyticsAppQualitySessionsSubscriber;
import java.util.Map;
import java.util.Objects;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes3.dex */
public final class c1 {

    /* renamed from: a, reason: collision with root package name */
    public final en.k f18149a;

    /* renamed from: b, reason: collision with root package name */
    public final t0 f18150b;

    /* renamed from: c, reason: collision with root package name */
    public final o0 f18151c;

    /* renamed from: d, reason: collision with root package name */
    public final h1 f18152d;

    /* renamed from: e, reason: collision with root package name */
    public final t5.g f18153e;

    /* renamed from: f, reason: collision with root package name */
    public final b0 f18154f;

    /* renamed from: g, reason: collision with root package name */
    public final CoroutineContext f18155g;

    /* renamed from: h, reason: collision with root package name */
    public g0 f18156h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f18157i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f18158j;

    /* renamed from: k, reason: collision with root package name */
    public String f18159k;

    public c1(en.k sessionsSettings, t0 sessionGenerator, o0 sessionFirelogPublisher, h1 timeProvider, t5.g sessionDataStore, b0 processDataManager, CoroutineContext backgroundDispatcher) {
        Intrinsics.g(sessionsSettings, "sessionsSettings");
        Intrinsics.g(sessionGenerator, "sessionGenerator");
        Intrinsics.g(sessionFirelogPublisher, "sessionFirelogPublisher");
        Intrinsics.g(timeProvider, "timeProvider");
        Intrinsics.g(sessionDataStore, "sessionDataStore");
        Intrinsics.g(processDataManager, "processDataManager");
        Intrinsics.g(backgroundDispatcher, "backgroundDispatcher");
        this.f18149a = sessionsSettings;
        this.f18150b = sessionGenerator;
        this.f18151c = sessionFirelogPublisher;
        this.f18152d = timeProvider;
        this.f18153e = sessionDataStore;
        this.f18154f = processDataManager;
        this.f18155g = backgroundDispatcher;
        z0 z0Var = z0.f18318a;
        this.f18159k = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        t70.m0.t(t70.k0.a(backgroundDispatcher), null, null, new y0(this, null, 0), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(c1 c1Var, String str, z0 z0Var, Continuation continuation) {
        b1 b1Var;
        if (continuation instanceof b1) {
            b1Var = (b1) continuation;
            int i5 = b1Var.f18138x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b1Var.f18138x = i5 - Integer.MIN_VALUE;
            } else {
                b1Var = new b1(c1Var, continuation);
            }
        }
        Object objB = b1Var.f18136v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b1Var.f18138x;
        if (i11 == 0) {
            ResultKt.b(objB);
            if (Intrinsics.b(c1Var.f18159k, str)) {
                return Unit.f71706a;
            }
            c1Var.f18159k = str;
            cn.c cVar = cn.c.f20140a;
            b1Var.f18134t = str;
            b1Var.f18135u = z0Var;
            b1Var.f18138x = 1;
            objB = cVar.b(b1Var);
            if (objB == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            z0Var = b1Var.f18135u;
            str = b1Var.f18134t;
            ResultKt.b(objB);
        }
        for (CrashlyticsAppQualitySessionsSubscriber crashlyticsAppQualitySessionsSubscriber : ((Map) objB).values()) {
            crashlyticsAppQualitySessionsSubscriber.onSessionChanged(new cn.e(str));
            int iOrdinal = z0Var.ordinal();
            if (iOrdinal == 0) {
                Objects.toString(crashlyticsAppQualitySessionsSubscriber.getSessionSubscriberName());
            } else {
                if (iOrdinal != 1) {
                    throw new NoWhenBranchMatchedException();
                }
                Objects.toString(crashlyticsAppQualitySessionsSubscriber.getSessionSubscriberName());
            }
        }
        return Unit.f71706a;
    }

    public final void b() {
        this.f18157i = false;
        if (this.f18156h == null) {
            return;
        }
        this.f18154f.a();
        t70.m0.t(t70.k0.a(this.f18155g), null, null, new y0(this, null, 1), 3);
    }

    public final void c() {
        this.f18157i = true;
        g0 g0Var = this.f18156h;
        if (g0Var == null) {
            this.f18158j = true;
            return;
        }
        Continuation continuation = null;
        if (g0Var == null) {
            Intrinsics.m("localSessionData");
            throw null;
        }
        this.f18154f.a();
        if (e(g0Var) || d(g0Var)) {
            t70.m0.t(t70.k0.a(this.f18155g), null, null, new ar.a(this, g0Var, continuation, 23), 3);
        }
    }

    public final boolean d(g0 g0Var) {
        Map map = g0Var.f18196c;
        boolean z11 = true;
        b0 b0Var = this.f18154f;
        if (map == null) {
            b0Var.a();
            return true;
        }
        b0Var.getClass();
        z zVar = (z) map.get(b0Var.a());
        if (zVar != null && zVar.f18316a == b0Var.f18130c && Intrinsics.b(zVar.f18317b, (String) b0Var.f18131d.getValue())) {
            z11 = false;
        }
        if (z11) {
            b0Var.a();
        }
        return z11;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0035  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x004a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean e(g0 g0Var) {
        long jG;
        g1 g1Var = g0Var.f18195b;
        l0 l0Var = g0Var.f18194a;
        if (g1Var == null) {
            String str = l0Var.f18242a;
            return false;
        }
        g1 g1VarA = ((i1) this.f18152d).a();
        Duration.Companion companion = Duration.f72038b;
        long jH = DurationKt.h(g1VarA.f18197a - g1Var.f18197a, DurationUnit.f72045d);
        en.k kVar = this.f18149a;
        Duration durationB = kVar.f52841a.b();
        if (durationB != null) {
            jG = durationB.f72041a;
            if (jG <= 0 || Duration.k(jG)) {
                Duration durationB2 = kVar.f52842b.b();
                if (durationB2 != null) {
                    jG = durationB2.f72041a;
                    if (jG <= 0 || Duration.k(jG)) {
                        jG = DurationKt.g(30, DurationUnit.f72047f);
                    }
                }
            }
        }
        boolean z11 = Duration.c(jH, jG) > 0;
        if (z11) {
            String str2 = l0Var.f18242a;
        }
        return z11;
    }
}
