package ads_mobile_sdk;

import android.content.Context;
import b.b9;
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
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;

/* loaded from: classes.dex */
public final class qn0 extends cs0 implements p1 {
    public final y2 M;
    public final kz2 N;
    public final mi3 O;

    /* JADX WARN: Illegal instructions before constructor call */
    public qn0(Context applicationContext, t70.j0 uiScope, CoroutineContext uiContext, t70.j0 backgroundScope, jr0 flags, ci3 traceLogger, k8 adSpamClient, String afmaVersion, y2 adEventEmitter, b.sb adActivityLifecycleEventEmitter, jy0 fullscreenWebViewContainer, kz2 rootTraceCreator, mi3 traceMetaSet, qw2 requestType, z1 adConfiguration, b9 omidMonitor, rw0 gmaUtil, p0 backButtonStateDelegate) {
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
        this.M = adEventEmitter;
        this.N = rootTraceCreator;
        this.O = traceMetaSet;
        this.f2984q = fullscreenWebViewContainer;
        a(fullscreenWebViewContainer);
        new AtomicBoolean(false);
    }

    @Override // ads_mobile_sdk.et0, b.j2
    public final void a(pu puVar) {
        ln0 ln0Var = new ln0(this, null, 0);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        t70.j0 j0Var = this.f2973d;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        m0.t(j0Var, context, null, new ar.a(ln0Var, null), 2);
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
        kn0 kn0Var;
        qn0 qn0Var;
        if (continuationImpl instanceof kn0) {
            kn0Var = (kn0) continuationImpl;
            int i5 = kn0Var.f5896d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kn0Var.f5896d = i5 - Integer.MIN_VALUE;
            } else {
                kn0Var = new kn0(this, continuationImpl);
            }
        }
        Object obj = kn0Var.f5894b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kn0Var.f5896d;
        if (i11 == 0) {
            ResultKt.b(obj);
            kn0Var.f5893a = this;
            kn0Var.f5896d = 1;
            j().o = null;
            if (Unit.f71706a != coroutineSingletons) {
                qn0Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            qn0Var = kn0Var.f5893a;
            ResultKt.b(obj);
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            qn0Var = kn0Var.f5893a;
            ResultKt.b(obj);
            y2 y2Var = qn0Var.M;
            kn0Var.f5893a = null;
            kn0Var.f5896d = 3;
        }
        jr0 jr0Var = qn0Var.f2974e;
        jr0Var.getClass();
        if (!((Boolean) jr0Var.a("gad:interstitial_notify_publisher_without_delay", Boolean.FALSE, jn.a$10)).booleanValue()) {
            kn0Var.f5893a = qn0Var;
            kn0Var.f5896d = 2;
            if (qn0Var.d(kn0Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        y2 y2Var2 = qn0Var.M;
        kn0Var.f5893a = null;
        kn0Var.f5896d = 3;
    }

    @Override // ads_mobile_sdk.et0
    public final Unit d(Continuation continuation) {
        if (!this.n.get()) {
            return Unit.f71706a;
        }
        Object objG = this.M.g(continuation);
        return objG == CoroutineSingletons.f71806a ? (Unit) objG : Unit.f71706a;
    }

    @Override // b.j2
    public final Unit a(ContinuationImpl continuationImpl) {
        Unit unitD = d(continuationImpl);
        return unitD == CoroutineSingletons.f71806a ? unitD : Unit.f71706a;
    }

    @Override // b.p1
    public final void d() {
        kz2 kz2Var = this.N;
        wv0 wv0Var = wv0.CUI_NAME_ADSHOW_WITH_VIEW;
        List listP = ul.b.P(this.E.toString());
        mi3 mi3Var = this.O;
        Continuation continuation = null;
        if (ji3.b().f4777a == null) {
            em2 em2VarA = kz2.a(kz2Var, wv0Var, listP, mi3Var);
            try {
                this.n.set(true);
                ((tx0) this.H.getValue()).o = this;
                m0.u(EmptyCoroutineContext.f71803a, new a60.a(this, continuation, 12));
                a$1();
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
                this.n.set(true);
                ((tx0) this.H.getValue()).o = this;
                m0.u(EmptyCoroutineContext.f71803a, new a60.a(this, continuation, 12));
                a$1();
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

    @Override // b.p1
    public final void a(Context context, boolean z11, boolean z12) {
        Intrinsics.g(context, "context");
        kz2 kz2Var = this.N;
        wv0 wv0Var = wv0.CUI_NAME_ADSHOW;
        List listP = ul.b.P(this.E.toString());
        mi3 mi3Var = this.O;
        Continuation continuation = null;
        if (ji3.b().f4777a == null) {
            em2 em2VarA = kz2.a(kz2Var, wv0Var, listP, mi3Var);
            try {
                mu0.a("show() is not supported for cross-process ad. Use getView() instead.", (Exception) null);
                zi3.a(this.f2973d, new ln0(this, continuation, 1));
                zi3.a(6, "show() is not supported for cross-process ad.", null);
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
                mu0.a("show() is not supported for cross-process ad. Use getView() instead.", (Exception) null);
                zi3.a(this.f2973d, new ln0(this, continuation, 1));
                zi3.a(6, "show() is not supported for cross-process ad.", null);
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
