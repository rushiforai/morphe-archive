package ads_mobile_sdk;

import android.app.Activity;
import android.content.Context;
import android.os.IBinder;
import android.view.View;
import android.view.Window;
import b.ed;
import b.s5;
import b30.d;
import com.amplitude.eventbridge.EventBridgeChannel;
import java.util.Collections;
import java.util.Map;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;
import t70.p2;

/* loaded from: classes2.dex */
public final class mg2 implements b.va {

    /* renamed from: a, reason: collision with root package name */
    public final z1 f7204a;

    /* renamed from: b, reason: collision with root package name */
    public final rg2 f7205b;

    /* renamed from: c, reason: collision with root package name */
    public final jr0 f7206c;

    /* renamed from: d, reason: collision with root package name */
    public final kz2 f7207d;

    /* renamed from: e, reason: collision with root package name */
    public final j01 f7208e;

    /* renamed from: f, reason: collision with root package name */
    public final ci3 f7209f;

    /* renamed from: g, reason: collision with root package name */
    public final t70.j0 f7210g;

    /* renamed from: h, reason: collision with root package name */
    public final g0 f7211h;

    public mg2(Context context, z1 adConfiguration, rg2 playPrewarmManager, jr0 flags, kz2 rootTraceCreator, j01 hsdpDeepLinkServiceWrapper, ci3 traceLogger, t70.j0 backgroundScope, g0 activityTracker) {
        Intrinsics.g(context, "context");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(playPrewarmManager, "playPrewarmManager");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(hsdpDeepLinkServiceWrapper, "hsdpDeepLinkServiceWrapper");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(activityTracker, "activityTracker");
        this.f7204a = adConfiguration;
        this.f7205b = playPrewarmManager;
        this.f7206c = flags;
        this.f7207d = rootTraceCreator;
        this.f7208e = hsdpDeepLinkServiceWrapper;
        this.f7209f = traceLogger;
        this.f7210g = backgroundScope;
        this.f7211h = activityTracker;
    }

    /* JADX WARN: Can't wrap try/catch for region: R(6:22|(1:57)(2:26|(8:28|(1:30)(1:31)|32|(1:34)|35|(2:47|(1:49)(4:50|(1:52)|53|54))(4:37|(1:44)(1:43)|(0)|(0)(0))|90|91)(2:55|56))|(1:62)(1:61)|94|63|(1:65)(1:66)) */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x0132, code lost:
    
        r13 = e;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:47:0x009c  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00a5  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x013b  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0142  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0186  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x018e  */
    /* JADX WARN: Type inference failed for: r8v2, types: [java.lang.Object, java.util.Map] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(mg2 mg2Var, boolean z11, ContinuationImpl continuationImpl) {
        jg2 jg2Var;
        mk.p pVar;
        int i5;
        mg2 mg2Var2;
        int i11;
        IBinder windowToken;
        Window window;
        View decorView;
        jn jnVar = jn.a$10;
        if (continuationImpl instanceof jg2) {
            jg2Var = (jg2) continuationImpl;
            int i12 = jg2Var.f5238e;
            if ((i12 & Integer.MIN_VALUE) != 0) {
                jg2Var.f5238e = i12 - Integer.MIN_VALUE;
            } else {
                jg2Var = new jg2(mg2Var, continuationImpl);
            }
        }
        Object obj = jg2Var.f5236c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i13 = jg2Var.f5238e;
        boolean z12 = false;
        if (i13 == 0) {
            ResultKt.b(obj);
            ug2 ug2Var = mg2Var.f7204a.f12408v0;
            if (ug2Var == null) {
                return Unit.f71706a;
            }
            String str = ug2Var.f10331e;
            if (z11 && str.length() > 0) {
                Map map = Collections.EMPTY_MAP;
                if (map == null) {
                    throw new NullPointerException("Null extraQueryParams");
                }
                String str2 = ug2Var.f10333g.length() > 0 ? ug2Var.f10333g : null;
                Map map2 = map;
                if (!ug2Var.f10334h.isEmpty()) {
                    map2 = ug2Var.f10334h;
                }
                jr0 jr0Var = mg2Var.f7206c;
                jr0Var.getClass();
                if (((Boolean) jr0Var.a("gads:hsdp_service_pass_activity_token:enabled", Boolean.FALSE, jnVar)).booleanValue()) {
                    Activity activityB = mg2Var.f7211h.b();
                    windowToken = (activityB == null || (window = activityB.getWindow()) == null || (decorView = window.getDecorView()) == null) ? null : decorView.getWindowToken();
                    if (windowToken == null) {
                    }
                    if (str2 != null) {
                    }
                } else {
                    windowToken = null;
                    if (str2 != null) {
                        StringBuilder sb2 = new StringBuilder();
                        if (str2 == null) {
                            sb2.append(" referrer");
                        }
                        throw new IllegalStateException("Missing required properties:".concat(sb2.toString()));
                    }
                    pVar = new mk.p(str, str2, map2, windowToken);
                }
                return Unit.f71706a;
            }
            pVar = null;
            i5 = (!z11 || str.length() <= 0) ? 2 : 3;
            j01 j01Var = mg2Var.f7208e;
            jg2Var.f5234a = mg2Var;
            jg2Var.f5235b = i5;
            jg2Var.f5238e = 1;
            jr0 jr0Var2 = j01Var.f5075b;
            jr0Var2.getClass();
            Duration.Companion companion = Duration.f72038b;
            if (p2.d(Duration.h(((Duration) jr0Var2.a("gads:hsdp_prewarm_timeout:ms", ed.k(60, DurationUnit.f72046e, "gads:hsdp_prewarm_timeout:ms"), u.a$1)).f72041a), new b00.e(j01Var, pVar, z12 ? 1 : 0, 7), jg2Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            int i14 = i5;
            mg2Var2 = mg2Var;
            i11 = i14;
        } else {
            if (i13 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i11 = jg2Var.f5235b;
            mg2Var2 = jg2Var.f5234a;
            try {
                ResultKt.b(obj);
            } catch (Exception e3) {
                e = e3;
                mg2 mg2Var3 = mg2Var2;
                i5 = i11;
                mg2Var = mg2Var3;
                th3 th3Var = ji3.b().f4777a;
                cc2 cc2VarE = th3Var != null ? th3Var.e() : null;
                if (cc2VarE != null) {
                    s5 s5VarO = n01.o();
                    s5VarO.c(i5);
                    String message = e.getMessage();
                    if (message == null) {
                        message = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                    s5VarO.b();
                    ((n01) s5VarO.f1095b).b(message);
                    cc2VarE.I = (n01) s5VarO.a();
                }
                th3 th3VarA = ji3.a();
                th3VarA.e().f1799m = false;
                th3VarA.a(e);
                jr0 jr0Var3 = mg2Var.f7206c;
                jr0Var3.getClass();
                if (((Boolean) jr0Var3.a("gads:hsdp_unsampled_crash_reporting:enabled", Boolean.FALSE, jnVar)).booleanValue()) {
                    mg2Var.f7209f.a("HsdpService.prewarm", (Throwable) e);
                } else {
                    mg2Var.f7209f.a("HsdpServiceUnsampled.prewarm", e);
                }
                return Unit.f71706a;
            }
        }
        th3 th3Var2 = ji3.b().f4777a;
        cc2 cc2VarE2 = th3Var2 != null ? th3Var2.e() : null;
        if (cc2VarE2 != null) {
            s5 s5VarO2 = n01.o();
            s5VarO2.c(i11);
            cc2VarE2.I = (n01) s5VarO2.a();
        }
        return Unit.f71706a;
    }

    @Override // b.va
    public final Object i(Continuation continuation) {
        ug2 ug2Var = this.f7204a.f12408v0;
        if (ug2Var == null) {
            return Unit.f71706a;
        }
        if (a()) {
            if (!a(1)) {
                return Unit.f71706a;
            }
            de2 de2Var = new de2(this, a(2), null);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            t70.j0 j0Var = this.f7210g;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(de2Var, null), 2);
            return Unit.f71706a;
        }
        jr0 jr0Var = this.f7206c;
        jr0Var.getClass();
        if (((Boolean) jr0Var.a("gads:play_prewarm:enabled", Boolean.TRUE, jn.a$10)).booleanValue() && ug2Var.f10327a) {
            String str = ug2Var.f10328b;
            rg2 rg2Var = this.f7205b;
            t70.j0 j0Var2 = rg2Var.f9169a;
            c3.a4 a4Var = new c3.a4(rg2Var, str, null);
            EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var2, "<this>");
            Intrinsics.g(context2, "context");
            m0.t(j0Var2, context2, null, new ar.a(a4Var, null), 2);
            Unit unit = Unit.f71706a;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            return unit;
        }
        return Unit.f71706a;
    }

    @Override // b.va
    public final Object q(Continuation continuation) {
        ug2 ug2Var = this.f7204a.f12408v0;
        if (ug2Var == null) {
            return Unit.f71706a;
        }
        if (a()) {
            if (!a(4)) {
                return Unit.f71706a;
            }
            d dVar = new d(this, a(8), null);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            t70.j0 j0Var = this.f7210g;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(dVar, null), 2);
            return Unit.f71706a;
        }
        if (!a(256)) {
            return Unit.f71706a;
        }
        String str = a(EventBridgeChannel.QUEUE_CAPACITY) ? ug2Var.f10328b : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        rg2 rg2Var = this.f7205b;
        t70.j0 j0Var2 = rg2Var.f9169a;
        c3.a4 a4Var = new c3.a4(rg2Var, str, null);
        EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
        Intrinsics.g(j0Var2, "<this>");
        Intrinsics.g(context2, "context");
        m0.t(j0Var2, context2, null, new ar.a(a4Var, null), 2);
        Unit unit = Unit.f71706a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return unit;
    }

    public final boolean a(int i5) {
        ug2 ug2Var = this.f7204a.f12408v0;
        return (i5 & (ug2Var != null ? ug2Var.f10332f : 0)) != 0;
    }

    public final boolean a() {
        ug2 ug2Var;
        jr0 jr0Var = this.f7206c;
        jr0Var.getClass();
        return ((Boolean) jr0Var.a("gads:hsdp_service:enabled", Boolean.FALSE, jn.a$10)).booleanValue() && (ug2Var = this.f7204a.f12408v0) != null && ug2Var.f10330d;
    }

    @Override // b.va
    public final Object a(Continuation continuation) {
        cc2 cc2VarE;
        jn jnVar = jn.a$10;
        ug2 ug2Var = this.f7204a.f12408v0;
        if (ug2Var == null) {
            return Unit.f71706a;
        }
        String str = ug2Var.f10331e;
        if (a()) {
            jr0 jr0Var = this.f7206c;
            jr0Var.getClass();
            if (((Boolean) jr0Var.a("gads:hsdp_service_end_session:enabled", Boolean.FALSE, jnVar)).booleanValue() && str.length() > 0) {
                kz2 kz2Var = this.f7207d;
                wv0 wv0Var = wv0.CUI_NAME_HSDP_SERVICE;
                EmptyList emptyList = EmptyList.f71733a;
                mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
                th3 th3Var = ji3.b().f4777a;
                String str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                if (th3Var == null) {
                    em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                    try {
                        try {
                            th3 th3Var2 = ji3.b().f4777a;
                            cc2 cc2VarE2 = th3Var2 != null ? th3Var2.e() : null;
                            if (cc2VarE2 != null) {
                                s5 s5VarO = n01.o();
                                s5VarO.c(5);
                                cc2VarE2.I = (n01) s5VarO.a();
                            }
                            this.f7208e.a(str);
                        } catch (Throwable th2) {
                            try {
                                em2VarA.b(th2);
                                if (!(th2 instanceof b.a4)) {
                                    if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                                        em2VarA.a(th2);
                                    }
                                    if (!(th2 instanceof TimeoutCancellationException)) {
                                        if (!(th2 instanceof CancellationException)) {
                                            if (th2 instanceof dv0) {
                                                throw th2;
                                            }
                                            throw new iu0(th2);
                                        }
                                        throw new du0(th2);
                                    }
                                    throw new lw0(th2);
                                }
                                throw th2;
                            } finally {
                            }
                        }
                    } catch (Exception e3) {
                        th3 th3Var3 = ji3.b().f4777a;
                        cc2VarE = th3Var3 != null ? th3Var3.e() : null;
                        if (cc2VarE != null) {
                            s5 s5VarO2 = n01.o();
                            s5VarO2.c(5);
                            String message = e3.getMessage();
                            if (message != null) {
                                str2 = message;
                            }
                            s5VarO2.b();
                            ((n01) s5VarO2.f1095b).b(str2);
                            cc2VarE.I = (n01) s5VarO2.a();
                        }
                        th3 th3VarA = ji3.a();
                        th3VarA.e().f1799m = false;
                        th3VarA.a(e3);
                        jr0 jr0Var2 = this.f7206c;
                        jr0Var2.getClass();
                        if (((Boolean) jr0Var2.a("gads:hsdp_unsampled_crash_reporting:enabled", Boolean.FALSE, jnVar)).booleanValue()) {
                            this.f7209f.a("HsdpServiceUnsampled.endSession", e3);
                        } else {
                            this.f7209f.a("HsdpService.endSession", (Throwable) e3);
                        }
                    }
                    Unit unit = Unit.f71706a;
                    em2VarA.close();
                } else {
                    th3 th3VarA2 = ji3.a(wv0Var, emptyList, true);
                    try {
                        try {
                            th3 th3Var4 = ji3.b().f4777a;
                            cc2 cc2VarE3 = th3Var4 != null ? th3Var4.e() : null;
                            if (cc2VarE3 != null) {
                                s5 s5VarO3 = n01.o();
                                s5VarO3.c(5);
                                cc2VarE3.I = (n01) s5VarO3.a();
                            }
                            this.f7208e.a(str);
                        } catch (Throwable th3) {
                            try {
                                th3VarA2.b(th3);
                                if (!(th3 instanceof b.a4)) {
                                    if (!(th3 instanceof TimeoutCancellationException) && !(th3 instanceof CancellationException)) {
                                        th3VarA2.a(th3);
                                    }
                                    if (!(th3 instanceof TimeoutCancellationException)) {
                                        if (!(th3 instanceof CancellationException)) {
                                            if (th3 instanceof dv0) {
                                                throw th3;
                                            }
                                            throw new iu0(th3);
                                        }
                                        throw new du0(th3);
                                    }
                                    throw new lw0(th3);
                                }
                                throw th3;
                            } finally {
                            }
                        }
                    } catch (Exception e11) {
                        th3 th3Var5 = ji3.b().f4777a;
                        cc2VarE = th3Var5 != null ? th3Var5.e() : null;
                        if (cc2VarE != null) {
                            s5 s5VarO4 = n01.o();
                            s5VarO4.c(5);
                            String message2 = e11.getMessage();
                            if (message2 != null) {
                                str2 = message2;
                            }
                            s5VarO4.b();
                            ((n01) s5VarO4.f1095b).b(str2);
                            cc2VarE.I = (n01) s5VarO4.a();
                        }
                        th3 th3VarA3 = ji3.a();
                        th3VarA3.e().f1799m = false;
                        th3VarA3.a(e11);
                        jr0 jr0Var3 = this.f7206c;
                        jr0Var3.getClass();
                        if (((Boolean) jr0Var3.a("gads:hsdp_unsampled_crash_reporting:enabled", Boolean.FALSE, jnVar)).booleanValue()) {
                            this.f7209f.a("HsdpServiceUnsampled.endSession", e11);
                        } else {
                            this.f7209f.a("HsdpService.endSession", (Throwable) e11);
                        }
                    }
                    Unit unit2 = Unit.f71706a;
                    th3VarA2.close();
                }
            }
        }
        return Unit.f71706a;
    }
}
