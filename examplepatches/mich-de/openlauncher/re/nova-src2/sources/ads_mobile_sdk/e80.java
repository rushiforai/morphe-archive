package ads_mobile_sdk;

import a60.d;
import android.net.Uri;
import android.os.Bundle;
import b.o2;
import com.google.gson.Gson;
import hn.o;
import java.util.ArrayList;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import t70.m0;

/* loaded from: classes2.dex */
public final class e80 extends w.b {

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f2772a;

    /* renamed from: b, reason: collision with root package name */
    public final o2 f2773b;

    /* renamed from: c, reason: collision with root package name */
    public final jr0 f2774c;

    /* renamed from: e, reason: collision with root package name */
    public final Object f2775e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f2776f;

    /* renamed from: g, reason: collision with root package name */
    public t70.g2 f2777g;

    /* renamed from: h, reason: collision with root package name */
    public long f2778h;

    /* renamed from: i, reason: collision with root package name */
    public long f2779i;

    /* renamed from: m, reason: collision with root package name */
    public final com.google.gson.m f2780m;
    public final List n;

    public e80(t70.j0 backgroundScope, o2 clock, jr0 flags, n53 signalCache) {
        com.google.gson.m mVar;
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(signalCache, "signalCache");
        this.f2772a = backgroundScope;
        this.f2773b = clock;
        this.f2774c = flags;
        this.f2775e = new Object();
        Duration.f72038b.getClass();
        this.f2778h = 0L;
        this.f2779i = 0L;
        try {
            mVar = (com.google.gson.m) new Gson().fromJson((String) flags.a("gads:pact_active_exp_id:enabled", "[]", u.a$7), com.google.gson.m.class);
        } catch (Exception e3) {
            zi3.a(e3);
            mVar = null;
        }
        this.f2780m = mVar == null ? new com.google.gson.m() : mVar;
        jr0 jr0Var = this.f2774c;
        jr0Var.getClass();
        this.n = (List) jr0Var.a("gads:pact_navigation_event_to_request_channel", ul.b.P("1"), jn.a$20);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Unit a(e80 e80Var, ContinuationImpl continuationImpl) {
        y70 y70Var;
        Unit unit;
        e80Var.getClass();
        if (continuationImpl instanceof y70) {
            y70Var = (y70) continuationImpl;
            int i5 = y70Var.f11953d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                y70Var.f11953d = i5 - Integer.MIN_VALUE;
            } else {
                y70Var = new y70(e80Var, continuationImpl);
            }
        }
        Object obj = y70Var.f11951b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = y70Var.f11953d;
        if (i11 != 0) {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            throw null;
        }
        ResultKt.b(obj);
        synchronized (e80Var.f2775e) {
            try {
                if (!e80Var.f2776f) {
                    Duration.Companion companion = Duration.f72038b;
                    e80Var.f2773b.getClass();
                    if (Duration.c(DurationKt.h(System.currentTimeMillis(), DurationUnit.f72045d), e80Var.f2779i) <= 0) {
                        Intrinsics.m("session");
                        throw null;
                    }
                }
                unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return unit;
    }

    @Override // w.b
    public final void extraCallback(String callbackName) {
        Intrinsics.g(callbackName, "callbackName");
        synchronized (this.f2775e) {
        }
    }

    @Override // w.b
    public final void extraCallbackWithResult(String callbackName) {
        Intrinsics.g(callbackName, "callbackName");
        synchronized (this.f2775e) {
        }
    }

    @Override // w.b
    public final void onActivityResized(Bundle extras) {
        Intrinsics.g(extras, "extras");
        try {
            synchronized (this.f2775e) {
            }
        } catch (Throwable unused) {
        }
    }

    @Override // w.b
    public final void onMessageChannelReady() {
        synchronized (this.f2775e) {
            this.f2776f = false;
            Unit unit = Unit.f71706a;
        }
    }

    @Override // w.b
    public final void onNavigationEvent(int i5) {
        long j11;
        synchronized (this.f2775e) {
            try {
                this.f2776f = false;
                Duration.Companion companion = Duration.f72038b;
                this.f2773b.getClass();
                this.f2778h = DurationKt.h(System.currentTimeMillis(), DurationUnit.f72045d);
                if (this.n.contains(String.valueOf(i5))) {
                    long j12 = this.f2778h;
                    jr0 jr0Var = this.f2774c;
                    jr0Var.getClass();
                    if (((Boolean) jr0Var.a("gads:pact_polling_forever:enabled", Boolean.FALSE, jn.a$10)).booleanValue()) {
                        companion.getClass();
                        j11 = Duration.f72039c;
                    } else {
                        jr0 jr0Var2 = this.f2774c;
                        jr0Var2.getClass();
                        j11 = ((Duration) jr0Var2.a("gads:pact_polling_duration_ms", new Duration(DurationKt.g(60, DurationUnit.f72046e)), u.a$1)).f72041a;
                    }
                    this.f2779i = Duration.m(j12, j11);
                    t70.g2 g2Var = this.f2777g;
                    if (g2Var == null || g2Var.isCompleted()) {
                        t70.j0 j0Var = this.f2772a;
                        d dVar = new d(this, null, 2);
                        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                        Intrinsics.g(j0Var, "<this>");
                        Intrinsics.g(context, "context");
                        this.f2777g = m0.t(j0Var, context, null, new ar.a(dVar, null), 2);
                    }
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // w.b
    public final void onPostMessage(String message) {
        com.google.gson.r rVar;
        Intrinsics.g(message, "message");
        try {
            rVar = (com.google.gson.r) new Gson().fromJson(message, com.google.gson.r.class);
        } catch (Exception e3) {
            th3 th3VarA = ji3.a();
            th3VarA.a(e3);
            ArrayList arrayList = th3VarA.e().f1803s;
            String message2 = e3.getMessage();
            if (message2 == null) {
                message2 = e3.getClass().getName();
            }
            arrayList.add(message2);
            rVar = null;
        }
        if (rVar == null || d62.a(rVar, "gpa", -1) != 0) {
            synchronized (this.f2775e) {
            }
            return;
        }
        synchronized (this.f2775e) {
            this.f2776f = true;
            Unit unit = Unit.f71706a;
        }
        d62.a(rVar, "paw_id", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        synchronized (this.f2775e) {
            o oVar = new o(false);
            Object obj = this.f2780m;
            if (obj == null) {
                obj = com.google.gson.q.f34794a;
            }
            oVar.put("eids", obj);
            oVar.put("gsppack", new com.google.gson.s(Boolean.TRUE));
            String strValueOf = String.valueOf(Duration.h(this.f2778h));
            oVar.put("fpt", strValueOf == null ? com.google.gson.q.f34794a : new com.google.gson.s(strValueOf));
            Intrinsics.m("session");
            throw null;
        }
    }

    @Override // w.b
    public final void onRelationshipValidationResult(Uri requestedOrigin) {
        Intrinsics.g(requestedOrigin, "requestedOrigin");
        synchronized (this.f2775e) {
        }
    }
}
