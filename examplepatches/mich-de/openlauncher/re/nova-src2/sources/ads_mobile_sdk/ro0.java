package ads_mobile_sdk;

import a60.d;
import android.content.Context;
import android.view.View;
import b.b9;
import b.k9;
import b.p0;
import b.p1;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;

/* loaded from: classes.dex */
public final class ro0 extends cs0 implements p1 {
    public final k8 M;
    public final y2 N;
    public final kz2 O;
    public final mi3 P;
    public final AtomicBoolean Q;

    /* JADX WARN: Illegal instructions before constructor call */
    public ro0(Context applicationContext, t70.j0 uiScope, CoroutineContext uiContext, t70.j0 backgroundScope, jr0 flags, ci3 traceLogger, k8 adSpamClient, String afmaVersion, y2 adEventEmitter, b.sb adActivityLifecycleEventEmitter, jy0 fullscreenWebViewContainer, kz2 rootTraceCreator, mi3 traceMetaSet, qw2 requestType, z1 adConfiguration, b9 omidMonitor, rw0 gmaUtil, p0 backButtonStateDelegate) {
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(adSpamClient, "adSpamClient");
        Intrinsics.g(afmaVersion, "afmaVersion");
        Intrinsics.g(adEventEmitter, "adEventEmitter");
        Intrinsics.g(adActivityLifecycleEventEmitter, "adActivityLifecycleEventEmitter");
        Intrinsics.g(fullscreenWebViewContainer, "fullscreenWebViewContainer");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(omidMonitor, "omidMonitor");
        Intrinsics.g(gmaUtil, "gmaUtil");
        Intrinsics.g(backButtonStateDelegate, "backButtonStateDelegate");
        Optional optionalOf = Optional.of(adActivityLifecycleEventEmitter);
        Intrinsics.f(optionalOf, "of(...)");
        super(applicationContext, uiScope, uiContext, backgroundScope, flags, traceLogger, afmaVersion, requestType, adConfiguration, omidMonitor, gmaUtil, backButtonStateDelegate, optionalOf);
        this.M = adSpamClient;
        this.N = adEventEmitter;
        this.O = rootTraceCreator;
        this.P = traceMetaSet;
        this.f2984q = fullscreenWebViewContainer;
        a(fullscreenWebViewContainer);
        this.Q = new AtomicBoolean(false);
    }

    @Override // ads_mobile_sdk.et0, b.f4
    public final Object a(ni.s sVar, Continuation continuation) {
        Object objA = this.N.a(sVar, continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x0081, code lost:
    
        if (r10.a(r0) != r1) goto L30;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // ads_mobile_sdk.et0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) {
        po0 po0Var;
        ro0 ro0Var;
        if (continuationImpl instanceof po0) {
            po0Var = (po0) continuationImpl;
            int i5 = po0Var.f8344d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                po0Var.f8344d = i5 - Integer.MIN_VALUE;
            } else {
                po0Var = new po0(this, continuationImpl);
            }
        }
        Object obj = po0Var.f8342b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = po0Var.f8344d;
        if (i11 == 0) {
            ResultKt.b(obj);
            po0Var.f8341a = this;
            po0Var.f8344d = 1;
            j().o = null;
            if (Unit.f71706a != coroutineSingletons) {
                ro0Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ro0Var = po0Var.f8341a;
            ResultKt.b(obj);
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            ro0Var = po0Var.f8341a;
            ResultKt.b(obj);
            y2 y2Var = ro0Var.N;
            po0Var.f8341a = null;
            po0Var.f8344d = 3;
        }
        jr0 jr0Var = ro0Var.f2974e;
        jr0Var.getClass();
        if (!((Boolean) jr0Var.a("gad:interstitial_notify_publisher_without_delay", Boolean.FALSE, jn.a$10)).booleanValue()) {
            po0Var.f8341a = ro0Var;
            po0Var.f8344d = 2;
            if (ro0Var.d(po0Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        y2 y2Var2 = ro0Var.N;
        po0Var.f8341a = null;
        po0Var.f8344d = 3;
    }

    @Override // ads_mobile_sdk.et0
    public final Unit d(Continuation continuation) {
        Object objG;
        if (this.n.get() && (objG = this.N.g(continuation)) == CoroutineSingletons.f71806a) {
            return (Unit) objG;
        }
        return Unit.f71706a;
    }

    @Override // ads_mobile_sdk.et0
    public final Object e(ct0 ct0Var) {
        Object objA = a(new ni.s(ni.r.f78316b, "There was an internal error when attempting to show fullscreen content.", null), ct0Var);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    public final boolean p() {
        boolean zD = k9.D(this.f2970a);
        t70.j0 j0Var = this.f2973d;
        Continuation continuation = null;
        if (zD) {
            mu0.a("Fullscreen ads that show when your app is in the background are a violation of AdMob policies and may lead to blocked ad serving. To learn more, visit  https://goo.gle/admob-interstitial-policies", (Exception) null);
            zi3.a(j0Var, new d(this, continuation, 10));
            zi3.a(6, "Application process is in background", null);
            return false;
        }
        if (!this.Q.getAndSet(true)) {
            return true;
        }
        mu0.a("This ad has already been shown.", (Exception) null);
        zi3.a(j0Var, new a60.a(this, continuation, 15));
        zi3.a(6, "The ad has already been shown", null);
        return false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0054, code lost:
    
        if (r6.o(r0) == r1) goto L22;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // ads_mobile_sdk.cs0, ads_mobile_sdk.et0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(View view, Continuation continuation) {
        qo0 qo0Var;
        ro0 ro0Var;
        if (continuation instanceof qo0) {
            qo0Var = (qo0) continuation;
            int i5 = qo0Var.f8752d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qo0Var.f8752d = i5 - Integer.MIN_VALUE;
            } else {
                qo0Var = new qo0(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = qo0Var.f8750b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qo0Var.f8752d;
        if (i11 == 0) {
            ResultKt.b(obj);
            qo0Var.f8749a = this;
            qo0Var.f8752d = 1;
            if (super.a(view, qo0Var) != coroutineSingletons) {
                ro0Var = this;
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
        ro0Var = qo0Var.f8749a;
        ResultKt.b(obj);
        y2 y2Var = ro0Var.N;
        qo0Var.f8749a = null;
        qo0Var.f8752d = 2;
    }

    @Override // b.p1
    public final void a(Context context, boolean z11, boolean z12) {
        jn jnVar = jn.a$10;
        Intrinsics.g(context, "context");
        kz2 kz2Var = this.O;
        wv0 wv0Var = wv0.CUI_NAME_ADSHOW;
        List listP = ul.b.P(this.E.toString());
        mi3 mi3Var = this.P;
        if (ji3.b().f4777a == null) {
            em2 em2VarA = kz2.a(kz2Var, wv0Var, listP, mi3Var);
            try {
                k8 k8Var = this.M;
                StackTraceElement[] stackTrace = new Exception().getStackTrace();
                Intrinsics.f(stackTrace, "getStackTrace(...)");
                k8Var.b(kotlin.collections.c.b1(stackTrace));
                if (!p()) {
                    em2VarA.close();
                    return;
                }
                jr0 jr0Var = this.f2974e;
                jr0Var.getClass();
                Boolean bool = Boolean.TRUE;
                if (((Boolean) jr0Var.a("gads:default_to_immersive:enabled", bool, jnVar)).booleanValue()) {
                    jr0 jr0Var2 = this.f2974e;
                    jr0Var2.getClass();
                    if (!((Boolean) jr0Var2.a("gads:override_pub_immersive_setting:enabled", bool, jnVar)).booleanValue() && z12) {
                        this.f2988u = z11;
                    } else {
                        this.f2988u = true;
                    }
                } else {
                    this.f2988u = z11;
                }
                a(context);
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
                                if (!(th2 instanceof dv0)) {
                                    throw new iu0(th2);
                                }
                                throw th2;
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
            th3 th3VarA = ji3.a(wv0Var, EmptyList.f71733a, true);
            try {
                k8 k8Var2 = this.M;
                StackTraceElement[] stackTrace2 = new Exception().getStackTrace();
                Intrinsics.f(stackTrace2, "getStackTrace(...)");
                k8Var2.b(kotlin.collections.c.b1(stackTrace2));
                if (!p()) {
                    th3VarA.close();
                    return;
                }
                jr0 jr0Var3 = this.f2974e;
                jr0Var3.getClass();
                Boolean bool2 = Boolean.TRUE;
                if (((Boolean) jr0Var3.a("gads:default_to_immersive:enabled", bool2, jnVar)).booleanValue()) {
                    jr0 jr0Var4 = this.f2974e;
                    jr0Var4.getClass();
                    if (!((Boolean) jr0Var4.a("gads:override_pub_immersive_setting:enabled", bool2, jnVar)).booleanValue() && z12) {
                        this.f2988u = z11;
                    } else {
                        this.f2988u = true;
                    }
                } else {
                    this.f2988u = z11;
                }
                a(context);
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
                                if (!(th3 instanceof dv0)) {
                                    throw new iu0(th3);
                                }
                                throw th3;
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
    }
}
