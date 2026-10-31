package ads_mobile_sdk;

import b.fb;
import b.t2;
import b.w6;
import bn.x0;
import cw.u0;
import f1.v;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.ContinuationInterceptor;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.c0;
import t70.m0;
import w70.q1;
import w70.u1;
import w70.v0;
import w70.x;

/* loaded from: classes.dex */
public abstract class wo2 {

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f11340a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.j0 f11341b;

    /* renamed from: c, reason: collision with root package name */
    public final mi3 f11342c;

    /* renamed from: d, reason: collision with root package name */
    public final jr0 f11343d;

    /* renamed from: e, reason: collision with root package name */
    public final kz2 f11344e;

    /* renamed from: f, reason: collision with root package name */
    public final String f11345f;

    /* renamed from: g, reason: collision with root package name */
    public final qw2 f11346g;

    /* renamed from: h, reason: collision with root package name */
    public final ni.q f11347h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f11348i;

    /* renamed from: j, reason: collision with root package name */
    public final b41 f11349j;

    /* renamed from: k, reason: collision with root package name */
    public final b71 f11350k;

    /* renamed from: l, reason: collision with root package name */
    public final q1 f11351l;

    /* renamed from: m, reason: collision with root package name */
    public final xj f11352m;

    public wo2(t70.j0 loadScope, t70.j0 backgroundScope, mi3 traceMetaSet, jr0 flags, kz2 rootTraceCreator, String requestId, qw2 requestType, ni.k kVar, boolean z11, b41 initializationConfigWrapper, b71 inspectorAdLifecycleMonitor, q1 cancellationChannel, xj appState) {
        Intrinsics.g(loadScope, "loadScope");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(initializationConfigWrapper, "initializationConfigWrapper");
        Intrinsics.g(inspectorAdLifecycleMonitor, "inspectorAdLifecycleMonitor");
        Intrinsics.g(cancellationChannel, "cancellationChannel");
        Intrinsics.g(appState, "appState");
        this.f11340a = loadScope;
        this.f11341b = backgroundScope;
        this.f11342c = traceMetaSet;
        this.f11343d = flags;
        this.f11344e = rootTraceCreator;
        this.f11345f = requestId;
        this.f11346g = requestType;
        this.f11347h = kVar;
        this.f11348i = z11;
        this.f11349j = initializationConfigWrapper;
        this.f11350k = inspectorAdLifecycleMonitor;
        this.f11351l = cancellationChannel;
        this.f11352m = appState;
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x00a7, code lost:
    
        if (r0.collect(r10, r1) == r2) goto L32;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(wo2 wo2Var, fb fbVar, ContinuationImpl continuationImpl) {
        ko2 ko2Var;
        wo2 wo2Var2;
        CoroutineContext coroutineContext;
        t70.j0 j0Var = wo2Var.f11341b;
        if (continuationImpl instanceof ko2) {
            ko2Var = (ko2) continuationImpl;
            int i5 = ko2Var.f5907f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ko2Var.f5907f = i5 - Integer.MIN_VALUE;
            } else {
                ko2Var = new ko2(wo2Var, continuationImpl);
            }
        }
        Object obj = ko2Var.f5905d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ko2Var.f5907f;
        if (i11 == 0) {
            ResultKt.b(obj);
            CoroutineContext.Element element = j0Var.getCoroutineContext().get(ContinuationInterceptor.f71801cp);
            c0 c0Var = element instanceof c0 ? (c0) element : null;
            CoroutineContext coroutineContextF0 = c0Var != null ? c0Var.f0(1, "Publisher Callback") : null;
            if (coroutineContextF0 == null) {
                coroutineContextF0 = j0Var.getCoroutineContext();
            }
            CoroutineContext coroutineContextPlus = coroutineContextF0.plus(t70.c2.f88780b);
            ko2Var.f5902a = wo2Var;
            ko2Var.f5903b = fbVar;
            ko2Var.f5904c = coroutineContextPlus;
            ko2Var.f5907f = 1;
            Object objA = wo2Var.a(ko2Var);
            if (objA != coroutineSingletons) {
                wo2Var2 = wo2Var;
                coroutineContext = coroutineContextPlus;
                obj = objA;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        coroutineContext = ko2Var.f5904c;
        fbVar = ko2Var.f5903b;
        wo2Var2 = ko2Var.f5902a;
        ResultKt.b(obj);
        w70.z zVar = new w70.z(new x((w70.m) obj, new v(coroutineContext, fbVar, (Continuation) null)), new qo2(wo2Var2, coroutineContext, fbVar, null));
        v0 v0Var = new v0(2, coroutineContext, fbVar);
        ko2Var.f5902a = null;
        ko2Var.f5903b = null;
        ko2Var.f5904c = null;
        ko2Var.f5907f = 2;
    }

    public abstract Object b(Continuation continuation);

    public Object c(ContinuationImpl continuationImpl) {
        return Unit.f71706a;
    }

    public final w6 a(w6 w6Var, ni.q baseRequest) {
        Intrinsics.g(baseRequest, "baseRequest");
        mi3 mi3Var = this.f11342c;
        return (w6) ((w6) ((w6) ((w6) ((w6) ((w6) ((w6) ((w6) ((w6) ((w6) w6Var.a(mi3Var.f7224a)).a(mi3Var.f7225b)).a(this.f11346g)).a(baseRequest)).a(this.f11348i)).a(this.f11350k)).a(new ts2())).b(false)).c(false)).a(new i8(this.f11343d));
    }

    public final void a(fb fbVar) {
        Continuation continuation = null;
        b00.q qVar = new b00.q(this, fbVar, continuation, 1);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        t70.j0 j0Var = this.f11340a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        t70.g2 g2VarT = m0.t(j0Var, context, null, new ar.a(qVar, null), 2);
        b00.e eVar = new b00.e(this, g2VarT, continuation, 1);
        t70.j0 j0Var2 = this.f11341b;
        Intrinsics.g(j0Var2, "<this>");
        g2VarT.w(new du2(m0.t(j0Var2, context, null, new ar.a(eVar, null), 2), 1));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(wo2 wo2Var, ContinuationImpl continuationImpl) throws Throwable {
        ao2 ao2Var;
        if (continuationImpl instanceof ao2) {
            ao2Var = (ao2) continuationImpl;
            int i5 = ao2Var.f1045c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ao2Var.f1045c = i5 - Integer.MIN_VALUE;
            } else {
                ao2Var = new ao2(wo2Var, continuationImpl);
            }
        }
        Object objY = ao2Var.f1043a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ao2Var.f1045c;
        if (i11 == 0) {
            ResultKt.b(objY);
            ao2Var.f1045c = 1;
            objY = m0.y(wo2Var.f11340a.getCoroutineContext(), new androidx.room.q(wo2Var, (Continuation) null, 2), ao2Var);
            if (objY != coroutineSingletons) {
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
            return objY;
        }
        ResultKt.b(objY);
        ao2Var.f1045c = 2;
        Object objO = u1.o((w70.m) objY, ao2Var);
        return objO == coroutineSingletons ? coroutineSingletons : objO;
    }

    /* JADX WARN: Code restructure failed: missing block: B:55:0x0118, code lost:
    
        if (r2.c(r0) == r1) goto L56;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:54:0x010e  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x012b  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0138  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0141  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        io2 io2Var;
        String str;
        wo2 wo2Var;
        String str2;
        Throwable exception;
        wo2 wo2Var2;
        th3 th3Var;
        qu0 qu0Var;
        if (continuationImpl instanceof io2) {
            io2Var = (io2) continuationImpl;
            int i5 = io2Var.f4901e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                io2Var.f4901e = i5 - Integer.MIN_VALUE;
            } else {
                io2Var = new io2(this, continuationImpl);
            }
        }
        Object objB = io2Var.f4899c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = io2Var.f4901e;
        String str3 = null;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        Object[] objArr3 = 0;
        if (i11 == 0) {
            ResultKt.b(objB);
            x7.u uVarA = this.f11349j.a();
            if (uVarA == null || (str = (String) uVarA.f95208a) == null) {
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            if (this.f11347h != null && !rw0.f9329h.f(str)) {
                if (str.equals("webview_api_for_ads_application_id")) {
                    str2 = "InitializationConfig.WEBVIEW_APIS_FOR_ADS_APPLICATION_ID was provided as your application ID. This ID should be used if WebView APIs are the only integration point with the SDK. To make standard ad requests, you must provide your application ID of the form ca-app-pub-################~##########.";
                } else {
                    str2 = "An invalid application ID was provided during initialization, it should be of the form ca-app-pub-################~##########.";
                }
                zi3.a((pu0) new tu0(str2, wd1.f11213a), false);
                return new n8.q(new xo2(new ni.v(ni.u.f78327c, str2, null)), 3);
            }
            jr0 jr0Var = this.f11343d;
            jr0Var.getClass();
            Boolean bool = Boolean.FALSE;
            jn jnVar = jn.a$10;
            if (((Boolean) jr0Var.a("gads:pre_request_webview_capping_check:enabled", bool, jnVar)).booleanValue()) {
                ql1 ql1Var = this.f11352m.f11732a;
                jr0 jr0Var2 = ql1Var.f8724a;
                jr0Var2.getClass();
                if (((Boolean) jr0Var2.a("gads:webview_capping:enabled", bool, jnVar)).booleanValue() && ql1Var.f8725b.get() >= 5) {
                    av0 av0Var = av0.f1140c;
                    zi3.a((pu0) av0Var, false);
                    return new n8.q(new xo2(new ni.v(av0Var.f8388b.a(), t2.y(av0Var), null)), 3);
                }
            }
            try {
                io2Var.f4897a = this;
                io2Var.f4901e = 1;
                objB = b(io2Var);
                if (objB != coroutineSingletons) {
                    wo2Var = this;
                }
            } catch (Throwable th2) {
                th = th2;
                wo2Var = this;
                mu0.b("Ad failed to load", th);
                if (!(th instanceof kq2)) {
                }
                exception = th;
                wo2Var2 = wo2Var;
                Intrinsics.g(exception, "exception");
                th3Var = ji3.b().f4777a;
                if (th3Var != null) {
                }
                if (exception instanceof kq2) {
                }
                wo2Var2.getClass();
                return new n8.q(new xo2(new ni.v(qu0Var.f8812d.a(), t2.y(qu0Var), null)), 3);
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            exception = io2Var.f4898b;
            wo2Var2 = io2Var.f4897a;
            ResultKt.b(objB);
            Intrinsics.g(exception, "exception");
            th3Var = ji3.b().f4777a;
            if (th3Var != null) {
                th3Var.e().f1799m = false;
                th3Var.a(exception);
            }
            if (exception instanceof kq2) {
                qu0Var = new qu0(exception, wd1.f11223k, str3, 4);
            } else {
                qu0Var = new qu0(exception, objArr3 == true ? 1 : 0, objArr2 == true ? 1 : 0, 6);
            }
            wo2Var2.getClass();
            return new n8.q(new xo2(new ni.v(qu0Var.f8812d.a(), t2.y(qu0Var), null)), 3);
        }
        wo2Var = io2Var.f4897a;
        try {
            ResultKt.b(objB);
        } catch (Throwable th3) {
            th = th3;
            mu0.b("Ad failed to load", th);
            if (!(th instanceof kq2)) {
                io2Var.f4897a = wo2Var;
                io2Var.f4898b = th;
                io2Var.f4901e = 2;
            }
            exception = th;
            wo2Var2 = wo2Var;
            Intrinsics.g(exception, "exception");
            th3Var = ji3.b().f4777a;
            if (th3Var != null) {
            }
            if (exception instanceof kq2) {
            }
            wo2Var2.getClass();
            return new n8.q(new xo2(new ni.v(qu0Var.f8812d.a(), t2.y(qu0Var), null)), 3);
        }
        return new w70.z(new u0(1, (w70.m) objB, wo2Var), new x0((Object) wo2Var, (Continuation) (objArr == true ? 1 : 0), 1));
    }

    public Object a(b.ja jaVar, fo2 fo2Var) {
        return Unit.f71706a;
    }
}
