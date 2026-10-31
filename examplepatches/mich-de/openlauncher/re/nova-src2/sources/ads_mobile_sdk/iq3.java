package ads_mobile_sdk;

import a70.d;
import b.e9;
import b.f6;
import b.k9;
import b.l9;
import b.x7;
import c3.c1;
import java.util.Collections;
import java.util.List;
import kotlin.LazyKt;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;
import t70.s1;

/* loaded from: classes2.dex */
public final class iq3 extends c61 {

    /* renamed from: c, reason: collision with root package name */
    public final x7 f4903c;

    /* renamed from: d, reason: collision with root package name */
    public final aw f4904d;

    /* renamed from: e, reason: collision with root package name */
    public final jr0 f4905e;

    /* renamed from: f, reason: collision with root package name */
    public final t70.j0 f4906f;

    /* renamed from: g, reason: collision with root package name */
    public final t70.j0 f4907g;

    /* renamed from: h, reason: collision with root package name */
    public final kz2 f4908h;

    /* renamed from: i, reason: collision with root package name */
    public final rg0 f4909i;

    /* renamed from: j, reason: collision with root package name */
    public final b.y3 f4910j;

    /* renamed from: k, reason: collision with root package name */
    public final s1 f4911k;

    /* renamed from: l, reason: collision with root package name */
    public final d f4912l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public iq3(x7 webViewCompatWrapper, aw concurrencyObjects, jr0 flags, t70.j0 backgroundScope, t70.j0 webViewInitializationScope, kz2 rootTraceCreator, rg0 rg0Var, b.y3 userAgentProvider) {
        super((wv0) null, 1);
        Intrinsics.g(webViewCompatWrapper, "webViewCompatWrapper");
        Intrinsics.g(concurrencyObjects, "concurrencyObjects");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(webViewInitializationScope, "webViewInitializationScope");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(userAgentProvider, "userAgentProvider");
        this.f4903c = webViewCompatWrapper;
        this.f4904d = concurrencyObjects;
        this.f4905e = flags;
        this.f4906f = backgroundScope;
        this.f4907g = webViewInitializationScope;
        this.f4908h = rootTraceCreator;
        this.f4909i = rg0Var;
        this.f4910j = userAgentProvider;
        this.f4911k = m0.c();
        this.f4912l = LazyKt.a(new c1(this, 4));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(iq3 iq3Var, ContinuationImpl continuationImpl) {
        fq3 fq3Var;
        jn jnVar = jn.a$10;
        aw awVar = iq3Var.f4904d;
        jr0 jr0Var = iq3Var.f4905e;
        if (continuationImpl instanceof fq3) {
            fq3Var = (fq3) continuationImpl;
            int i5 = fq3Var.f3475d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fq3Var.f3475d = i5 - Integer.MIN_VALUE;
            } else {
                fq3Var = new fq3(iq3Var, continuationImpl);
            }
        }
        Object objS = fq3Var.f3473b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fq3Var.f3475d;
        if (i11 == 0) {
            ResultKt.b(objS);
            fq3Var.f3472a = iq3Var;
            fq3Var.f3475d = 1;
            t70.m mVar = new t70.m(1, IntrinsicsKt.b(fq3Var));
            mVar.t();
            try {
                x7 x7Var = iq3Var.f4903c;
                jr0Var.getClass();
                x7Var.a(((Boolean) jr0Var.a("gads:webview_initialization_executor:enabled", Boolean.FALSE, jnVar)).booleanValue() ? awVar.f1160i : awVar.f1155d, ((Boolean) jr0Var.a("gads:run_ui_thread_webview_startup_tasks", Boolean.TRUE, jnVar)).booleanValue(), new gq3(mVar));
            } catch (Exception e3) {
                int i12 = Result.f71687b;
                mVar.resumeWith(new qu0(e3, null, null, 6));
            }
            objS = mVar.s();
            CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
            if (objS == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objS);
                return Unit.f71706a;
            }
            iq3Var = fq3Var.f3472a;
            ResultKt.b(objS);
        }
        b.a1 a1Var = (b.a1) objS;
        if (a1Var instanceof xu0) {
            f6 f6Var = (f6) ((xu0) a1Var).f11834b;
            cc2 cc2VarE = ji3.a().e();
            l9 l9VarO = rp3.o();
            Intrinsics.f(l9VarO, "newBuilder(...)");
            Long totalTimeInUiThreadMillis = f6Var.getTotalTimeInUiThreadMillis();
            if (totalTimeInUiThreadMillis != null) {
                long jLongValue = totalTimeInUiThreadMillis.longValue();
                l9VarO.b();
                ((rp3) l9VarO.f1095b).totalTimeInUiThreadMs_ = jLongValue;
            }
            Long maxTimePerTaskInUiThreadMillis = f6Var.getMaxTimePerTaskInUiThreadMillis();
            if (maxTimePerTaskInUiThreadMillis != null) {
                long jLongValue2 = maxTimePerTaskInUiThreadMillis.longValue();
                l9VarO.b();
                ((rp3) l9VarO.f1095b).maxTimePerTaskInUiThreadMs_ = jLongValue2;
            }
            List listB = f6Var.b();
            if (listB != null) {
                Intrinsics.f(Collections.unmodifiableList(((rp3) l9VarO.f1095b).uiThreadBlockingStartupLocations_), "getUiThreadBlockingStartupLocationsList(...)");
                l9VarO.b();
                rp3 rp3Var = (rp3) l9VarO.f1095b;
                e9 e9Var = rp3Var.uiThreadBlockingStartupLocations_;
                if (!((j) e9Var).f5068a) {
                    rp3Var.uiThreadBlockingStartupLocations_ = k9.n(e9Var);
                }
                b.y2.a(listB, rp3Var.uiThreadBlockingStartupLocations_);
            }
            List listA = f6Var.a();
            if (listA != null) {
                Intrinsics.f(Collections.unmodifiableList(((rp3) l9VarO.f1095b).nonUiThreadBlockingStartupLocations_), "getNonUiThreadBlockingStartupLocationsList(...)");
                l9VarO.b();
                rp3 rp3Var2 = (rp3) l9VarO.f1095b;
                e9 e9Var2 = rp3Var2.nonUiThreadBlockingStartupLocations_;
                if (!((j) e9Var2).f5068a) {
                    rp3Var2.nonUiThreadBlockingStartupLocations_ = k9.n(e9Var2);
                }
                b.y2.a(listA, rp3Var2.nonUiThreadBlockingStartupLocations_);
            }
            cc2VarE.G = (rp3) l9VarO.a();
            jr0 jr0Var2 = iq3Var.f4905e;
            jr0Var2.getClass();
            if (((Boolean) jr0Var2.a("init_profile_after_webview_startup:enabled", Boolean.FALSE, jnVar)).booleanValue()) {
                bs3 bs3Var = (bs3) iq3Var.f4909i.get();
                fq3Var.f3472a = null;
                fq3Var.f3475d = 2;
                bs3Var.getClass();
                if (bs3.d(bs3Var, fq3Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
        } else if (a1Var instanceof pu0) {
            Throwable thB = ((pu0) a1Var).b();
            if (thB == null) {
                thB = new Exception("WebView Startup Failed");
            }
            th3 th3VarA = ji3.a();
            th3VarA.e().f1799m = false;
            th3VarA.a(thB);
        }
        return Unit.f71706a;
    }

    @Override // ads_mobile_sdk.c61
    public final Object h(Continuation continuation) {
        if (((Boolean) this.f4912l.getValue()).booleanValue()) {
            jr0 jr0Var = this.f4905e;
            jr0Var.getClass();
            t70.j0 j0Var = ((Boolean) jr0Var.a("gads:webview_initialization_executor:enabled", Boolean.FALSE, jn.a$10)).booleanValue() ? this.f4907g : this.f4906f;
            androidx.room.q qVar = new androidx.room.q(this, (Continuation) null, 3);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(qVar, null), 2);
        } else {
            this.f4911k.j0();
        }
        return new xu0(Unit.f71706a);
    }

    public final Object a(ContinuationImpl continuationImpl) {
        if (((Boolean) this.f4912l.getValue()).booleanValue()) {
            Object objK = this.f4911k.K(continuationImpl);
            return objK == CoroutineSingletons.f71806a ? objK : Unit.f71706a;
        }
        Object objB = this.f4910j.b(continuationImpl);
        return objB == CoroutineSingletons.f71806a ? objB : Unit.f71706a;
    }
}
