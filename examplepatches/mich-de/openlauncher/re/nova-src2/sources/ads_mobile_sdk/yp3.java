package ads_mobile_sdk;

import android.content.Context;
import b.e6;
import b.x7;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes2.dex */
public final class yp3 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f12238a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.j0 f12239b;

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f12240c;

    /* renamed from: d, reason: collision with root package name */
    public final CoroutineContext f12241d;

    /* renamed from: e, reason: collision with root package name */
    public final kz2 f12242e;

    /* renamed from: f, reason: collision with root package name */
    public final k8 f12243f;

    /* renamed from: g, reason: collision with root package name */
    public final ci3 f12244g;

    /* renamed from: h, reason: collision with root package name */
    public final rw0 f12245h;

    /* renamed from: i, reason: collision with root package name */
    public final b.y3 f12246i;

    /* renamed from: j, reason: collision with root package name */
    public final p01 f12247j;

    /* renamed from: k, reason: collision with root package name */
    public final ie1 f12248k;

    /* renamed from: l, reason: collision with root package name */
    public final jr0 f12249l;

    /* renamed from: m, reason: collision with root package name */
    public final x7 f12250m;
    public final e6 n;
    public final iq3 o;

    /* renamed from: p, reason: collision with root package name */
    public final xj f12251p;

    /* renamed from: q, reason: collision with root package name */
    public final hf2 f12252q;

    /* renamed from: r, reason: collision with root package name */
    public w81 f12253r;

    public yp3(Context context, CoroutineContext backgroundContext, t70.j0 backgroundScope, t70.j0 uiScope, CoroutineContext uiContext, kz2 rootTraceCreator, k8 adSpamClient, ci3 traceLogger, rw0 gmaUtil, b.y3 userAgentProvider, p01 htmlUtil, ie1 bridgeFactory, jr0 flags, x7 webViewCompatWrapper, e6 httpClient, iq3 webViewInitializationTask, xj appState, hf2 phantomReferences) {
        Intrinsics.g(context, "context");
        Intrinsics.g(backgroundContext, "backgroundContext");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(adSpamClient, "adSpamClient");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(gmaUtil, "gmaUtil");
        Intrinsics.g(userAgentProvider, "userAgentProvider");
        Intrinsics.g(htmlUtil, "htmlUtil");
        Intrinsics.g(bridgeFactory, "bridgeFactory");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(webViewCompatWrapper, "webViewCompatWrapper");
        Intrinsics.g(httpClient, "httpClient");
        Intrinsics.g(webViewInitializationTask, "webViewInitializationTask");
        Intrinsics.g(appState, "appState");
        Intrinsics.g(phantomReferences, "phantomReferences");
        this.f12238a = context;
        this.f12239b = backgroundScope;
        this.f12240c = uiScope;
        this.f12241d = uiContext;
        this.f12242e = rootTraceCreator;
        this.f12243f = adSpamClient;
        this.f12244g = traceLogger;
        this.f12245h = gmaUtil;
        this.f12246i = userAgentProvider;
        this.f12247j = htmlUtil;
        this.f12248k = bridgeFactory;
        this.f12249l = flags;
        this.f12250m = webViewCompatWrapper;
        this.n = httpClient;
        this.o = webViewInitializationTask;
        this.f12251p = appState;
        this.f12252q = phantomReferences;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:31:0x010f A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Type inference failed for: r10v2, types: [b.u7] */
    /* JADX WARN: Type inference failed for: r10v4, types: [b.u7] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(fs3 fs3Var, mi3 mi3Var, x60 x60Var, zk1 zk1Var, boolean z11, eg2 eg2Var, m31 m31Var, boolean z12, ContinuationImpl continuationImpl) throws Throwable {
        up3 up3Var;
        x60 x60Var2;
        zk1 zk1Var2;
        eg2 eg2Var2;
        m31 m31Var2;
        fs3 fs3Var2;
        boolean z13;
        mi3 mi3Var2;
        boolean z14;
        yp3 yp3Var;
        String str;
        boolean z15;
        x60 x60Var3;
        zk1 zk1Var3;
        eg2 eg2Var3;
        m31 m31Var3;
        if (continuationImpl instanceof up3) {
            up3Var = (up3) continuationImpl;
            int i5 = up3Var.f10451m;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                up3Var.f10451m = i5 - Integer.MIN_VALUE;
            } else {
                up3Var = new up3(this, continuationImpl);
            }
        }
        Object obj = up3Var.f10449k;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = up3Var.f10451m;
        if (i11 == 0) {
            ResultKt.b(obj);
            up3Var.f10439a = this;
            up3Var.f10440b = fs3Var;
            up3Var.f10441c = mi3Var;
            x60Var2 = x60Var;
            up3Var.f10442d = x60Var2;
            zk1Var2 = zk1Var;
            up3Var.f10443e = zk1Var2;
            eg2Var2 = eg2Var;
            up3Var.f10444f = eg2Var2;
            m31Var2 = m31Var;
            up3Var.f10445g = m31Var2;
            up3Var.f10447i = z11;
            up3Var.f10448j = z12;
            up3Var.f10451m = 1;
            Object objA = this.f12246i.a(up3Var);
            if (objA != coroutineSingletons) {
                fs3Var2 = fs3Var;
                obj = objA;
                z13 = z11;
                mi3Var2 = mi3Var;
                z14 = z12;
                yp3Var = this;
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            z14 = up3Var.f10448j;
            boolean z16 = up3Var.f10447i;
            String str2 = up3Var.f10446h;
            m31 m31Var4 = up3Var.f10445g;
            eg2 eg2Var4 = up3Var.f10444f;
            ?? r102 = up3Var.f10443e;
            x60 x60Var4 = up3Var.f10442d;
            mi3Var2 = up3Var.f10441c;
            fs3Var2 = up3Var.f10440b;
            yp3Var = up3Var.f10439a;
            ResultKt.b(obj);
            z15 = z16;
            str = str2;
            m31Var3 = m31Var4;
            eg2Var3 = eg2Var4;
            zk1Var3 = r102;
            x60Var3 = x60Var4;
            boolean z17 = z14;
            mi3 mi3Var3 = mi3Var2;
            fs3 fs3Var3 = fs3Var2;
            CoroutineContext coroutineContext = yp3Var.f12241d;
            vp3 vp3Var = new vp3(yp3Var, z17, zk1Var3, mi3Var3, eg2Var3, m31Var3, z15, x60Var3, str, fs3Var3, null);
            up3Var.f10439a = null;
            up3Var.f10440b = null;
            up3Var.f10441c = null;
            up3Var.f10442d = null;
            up3Var.f10443e = null;
            up3Var.f10444f = null;
            up3Var.f10445g = null;
            up3Var.f10446h = null;
            up3Var.f10451m = 3;
            Object objY = m0.y(coroutineContext, vp3Var, up3Var);
            return objY != coroutineSingletons ? coroutineSingletons : objY;
        }
        z14 = up3Var.f10448j;
        z13 = up3Var.f10447i;
        m31 m31Var5 = up3Var.f10445g;
        eg2 eg2Var5 = up3Var.f10444f;
        ?? r103 = up3Var.f10443e;
        x60 x60Var5 = up3Var.f10442d;
        mi3Var2 = up3Var.f10441c;
        fs3Var2 = up3Var.f10440b;
        yp3Var = up3Var.f10439a;
        ResultKt.b(obj);
        m31Var2 = m31Var5;
        x60Var2 = x60Var5;
        eg2Var2 = eg2Var5;
        zk1Var2 = r103;
        String str3 = (String) obj;
        iq3 iq3Var = yp3Var.o;
        up3Var.f10439a = yp3Var;
        up3Var.f10440b = fs3Var2;
        up3Var.f10441c = mi3Var2;
        up3Var.f10442d = x60Var2;
        up3Var.f10443e = zk1Var2;
        up3Var.f10444f = eg2Var2;
        up3Var.f10445g = m31Var2;
        up3Var.f10446h = str3;
        up3Var.f10447i = z13;
        up3Var.f10448j = z14;
        up3Var.f10451m = 2;
        if (iq3Var.a(up3Var) != coroutineSingletons) {
            str = str3;
            z15 = z13;
            x60Var3 = x60Var2;
            zk1Var3 = zk1Var2;
            eg2Var3 = eg2Var2;
            m31Var3 = m31Var2;
            boolean z172 = z14;
            mi3 mi3Var32 = mi3Var2;
            fs3 fs3Var32 = fs3Var2;
            CoroutineContext coroutineContext2 = yp3Var.f12241d;
            vp3 vp3Var2 = new vp3(yp3Var, z172, zk1Var3, mi3Var32, eg2Var3, m31Var3, z15, x60Var3, str, fs3Var32, null);
            up3Var.f10439a = null;
            up3Var.f10440b = null;
            up3Var.f10441c = null;
            up3Var.f10442d = null;
            up3Var.f10443e = null;
            up3Var.f10444f = null;
            up3Var.f10445g = null;
            up3Var.f10446h = null;
            up3Var.f10451m = 3;
            Object objY2 = m0.y(coroutineContext2, vp3Var2, up3Var);
            if (objY2 != coroutineSingletons) {
            }
        }
    }

    public final Object a(fs3 fs3Var, zk1 zk1Var, boolean z11, eg2 eg2Var, boolean z12, ContinuationImpl continuationImpl) {
        return a(fs3Var, new mi3(new ur2(), new fh1(), new tu2(), new s8()), null, zk1Var, z11, eg2Var, null, z12, continuationImpl);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(fs3 fs3Var, mi3 mi3Var, x60 x60Var, eg2 eg2Var, m31 m31Var, ContinuationImpl continuationImpl) throws Throwable {
        wp3 wp3Var;
        yp3 yp3Var;
        if (continuationImpl instanceof wp3) {
            wp3Var = (wp3) continuationImpl;
            int i5 = wp3Var.f11361d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                wp3Var.f11361d = i5 - Integer.MIN_VALUE;
            } else {
                wp3Var = new wp3(this, continuationImpl);
            }
        }
        wp3 wp3Var2 = wp3Var;
        Object objA = wp3Var2.f11359b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = wp3Var2.f11361d;
        if (i11 == 0) {
            ResultKt.b(objA);
            wp3Var2.f11358a = this;
            wp3Var2.f11361d = 1;
            objA = a(fs3Var, mi3Var, x60Var, null, false, eg2Var, m31Var, false, wp3Var2);
            if (objA != coroutineSingletons) {
                yp3Var = this;
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            return objA;
        }
        yp3 yp3Var2 = wp3Var2.f11358a;
        ResultKt.b(objA);
        yp3Var = yp3Var2;
        b.a1 a1Var = (b.a1) objA;
        if (a1Var instanceof pu0) {
            return a1Var;
        }
        if (a1Var instanceof xu0) {
            tx0 tx0Var = (tx0) ((xu0) a1Var).f11834b;
            CoroutineContext coroutineContext = yp3Var.f12241d;
            qr0 qr0Var = new qr0(tx0Var, null, 5);
            wp3Var2.f11358a = null;
            wp3Var2.f11361d = 2;
            Object objY = m0.y(coroutineContext, qr0Var, wp3Var2);
            return objY == coroutineSingletons ? coroutineSingletons : objY;
        }
        throw new NoWhenBranchMatchedException();
    }
}
