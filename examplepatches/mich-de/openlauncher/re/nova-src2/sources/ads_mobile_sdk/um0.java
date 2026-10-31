package ads_mobile_sdk;

import a70.d;
import android.content.Context;
import android.os.Bundle;
import b.k9;
import java.lang.reflect.Method;
import java.util.concurrent.CancellationException;
import kotlin.LazyKt;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;

/* loaded from: classes.dex */
public final class um0 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f10406a;

    /* renamed from: b, reason: collision with root package name */
    public final ci3 f10407b;

    /* renamed from: c, reason: collision with root package name */
    public final kz2 f10408c;

    /* renamed from: d, reason: collision with root package name */
    public final jr0 f10409d;

    /* renamed from: e, reason: collision with root package name */
    public final d f10410e;

    /* renamed from: f, reason: collision with root package name */
    public final c80.d f10411f;

    /* renamed from: g, reason: collision with root package name */
    public String f10412g;

    public um0(Context applicationContext, ci3 traceLogger, kz2 rootTraceCreator, jr0 flags) {
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(flags, "flags");
        this.f10406a = applicationContext;
        this.f10407b = traceLogger;
        this.f10408c = rootTraceCreator;
        this.f10409d = flags;
        this.f10410e = LazyKt.a(new a3.e(this, 10));
        this.f10411f = new c80.d();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(um0 um0Var, ContinuationImpl continuationImpl) {
        tm0 tm0Var;
        c80.d dVar;
        if (continuationImpl instanceof tm0) {
            tm0Var = (tm0) continuationImpl;
            int i5 = tm0Var.f10004e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                tm0Var.f10004e = i5 - Integer.MIN_VALUE;
            } else {
                tm0Var = new tm0(um0Var, continuationImpl);
            }
        }
        Object obj = tm0Var.f10002c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = tm0Var.f10004e;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = um0Var.f10411f;
            tm0Var.f10000a = um0Var;
            tm0Var.f10001b = dVar;
            tm0Var.f10004e = 1;
            if (dVar.e(tm0Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            c80.d dVar2 = tm0Var.f10001b;
            um0 um0Var2 = tm0Var.f10000a;
            ResultKt.b(obj);
            dVar = dVar2;
            um0Var = um0Var2;
        }
        try {
            String string = um0Var.f10412g;
            if (string == null) {
                Object objA = um0Var.a("getGmpAppId");
                string = objA != null ? objA.toString() : null;
                um0Var.f10412g = string;
            }
            return string;
        } finally {
            dVar.g(null);
        }
    }

    public final Object a(String str) {
        d dVar = this.f10410e;
        try {
            if (dVar.getValue() != null) {
                return Class.forName(this.f10409d.Q()).getMethod(str, null).invoke(dVar.getValue(), null);
            }
            return null;
        } catch (Exception e3) {
            zi3.a(4, "Exception while calling Firebase Analytics SDK method", e3);
            this.f10407b.a("FirebaseAnalyticsAdapter.invokeMethod ".concat(str), (Throwable) e3);
            return null;
        }
    }

    public static Unit a(um0 um0Var, rm0 rm0Var, Bundle bundle, String str) {
        kz2 kz2Var = um0Var.f10408c;
        ci3 ci3Var = um0Var.f10407b;
        jr0 jr0Var = um0Var.f10409d;
        d dVar = um0Var.f10410e;
        EmptyList emptyList = EmptyList.f71733a;
        mi3 mi3VarI = k9.i();
        th3 th3VarC = ji3.c();
        wv0 wv0Var = wv0.CUI_NAME_LOG_EVENT_TO_FIREBASE_ANALYTICS;
        if (th3VarC == null) {
            em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3VarI);
            try {
                try {
                    if (dVar.getValue() != null) {
                        Method method = Class.forName(jr0Var.Q()).getMethod("logEvent", String.class, String.class, Bundle.class);
                        String str2 = rm0Var.f9234a;
                        Bundle bundle2 = bundle.getBundle(str2);
                        if (bundle2 == null) {
                            bundle2 = new Bundle();
                        }
                        bundle2.putLong("_aeid", Long.parseLong(str));
                        rm0 rm0Var2 = rm0.f9230b;
                        if (str2.equals("_ac")) {
                            bundle2.putInt("_r", 1);
                        }
                        method.invoke(dVar.getValue(), "am", str2, bundle2);
                    }
                } catch (Exception e3) {
                    zi3.a(4, "Exception while calling Firebase Analytics SDK logEvent method", e3);
                    ci3Var.a("FirebaseAnalyticsAdapter.invokeMethod logEvent for " + rm0Var, (Throwable) e3);
                }
                Unit unit = Unit.f71706a;
                em2VarA.close();
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
        } else {
            th3 th3VarA = ji3.a(wv0Var, emptyList, true);
            try {
                try {
                    if (dVar.getValue() != null) {
                        Method method2 = Class.forName(jr0Var.Q()).getMethod("logEvent", String.class, String.class, Bundle.class);
                        String str3 = rm0Var.f9234a;
                        Bundle bundle3 = bundle.getBundle(str3);
                        if (bundle3 == null) {
                            bundle3 = new Bundle();
                        }
                        bundle3.putLong("_aeid", Long.parseLong(str));
                        rm0 rm0Var3 = rm0.f9230b;
                        if (str3.equals("_ac")) {
                            bundle3.putInt("_r", 1);
                        }
                        method2.invoke(dVar.getValue(), "am", str3, bundle3);
                    }
                } catch (Exception e11) {
                    zi3.a(4, "Exception while calling Firebase Analytics SDK logEvent method", e11);
                    ci3Var.a("FirebaseAnalyticsAdapter.invokeMethod logEvent for " + rm0Var, (Throwable) e11);
                }
                Unit unit2 = Unit.f71706a;
                th3VarA.close();
            } catch (Throwable th3) {
                try {
                    th3VarA.b(th3);
                    if (!(th3 instanceof b.a4)) {
                        if (!(th3 instanceof TimeoutCancellationException) && !(th3 instanceof CancellationException)) {
                            th3VarA.a(th3);
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
        }
        return Unit.f71706a;
    }
}
