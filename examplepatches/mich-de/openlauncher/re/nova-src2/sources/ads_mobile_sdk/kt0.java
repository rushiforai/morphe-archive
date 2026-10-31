package ads_mobile_sdk;

import android.content.Context;
import android.view.View;
import b.b9;
import b.p0;
import java.util.Optional;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes.dex */
public abstract class kt0 extends cs0 {
    public final g0 M;
    public final y2 N;
    public boolean O;
    public boolean P;

    /* JADX WARN: Illegal instructions before constructor call */
    public kt0(Context applicationContext, t70.j0 uiScope, CoroutineContext uiContext, t70.j0 backgroundScope, jr0 flags, ci3 traceLogger, String afmaVersion, qw2 requestType, z1 adConfiguration, g0 activityTracker, y2 adEventEmitter, b9 omidMonitor, rw0 gmaUtil, p0 backButtonStateDelegate) {
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(afmaVersion, "afmaVersion");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(adEventEmitter, "adEventEmitter");
        Intrinsics.g(omidMonitor, "omidMonitor");
        Intrinsics.g(gmaUtil, "gmaUtil");
        Intrinsics.g(backButtonStateDelegate, "backButtonStateDelegate");
        Optional optionalEmpty = Optional.empty();
        Intrinsics.f(optionalEmpty, "empty(...)");
        super(applicationContext, uiScope, uiContext, backgroundScope, flags, traceLogger, afmaVersion, requestType, adConfiguration, omidMonitor, gmaUtil, backButtonStateDelegate, optionalEmpty);
        this.M = activityTracker;
        this.N = adEventEmitter;
        this.O = true;
        this.P = true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x006a, code lost:
    
        if (r7.d(r0) == r1) goto L23;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(kt0 kt0Var, ContinuationImpl continuationImpl) {
        ft0 ft0Var;
        if (continuationImpl instanceof ft0) {
            ft0Var = (ft0) continuationImpl;
            int i5 = ft0Var.f3502d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ft0Var.f3502d = i5 - Integer.MIN_VALUE;
            } else {
                ft0Var = new ft0(kt0Var, continuationImpl);
            }
        }
        Object obj = ft0Var.f3500b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ft0Var.f3502d;
        if (i11 == 0) {
            ResultKt.b(obj);
            ft0Var.f3499a = kt0Var;
            ft0Var.f3502d = 1;
            kt0Var.j().o = null;
            if (Unit.f71706a != coroutineSingletons) {
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
        kt0Var = ft0Var.f3499a;
        ResultKt.b(obj);
        jr0 jr0Var = kt0Var.f2974e;
        jr0Var.getClass();
        if (((Boolean) jr0Var.a("gad:interstitial_notify_publisher_without_delay", Boolean.FALSE, jn.a$10)).booleanValue()) {
            return Unit.f71706a;
        }
        ft0Var.f3499a = null;
        ft0Var.f3502d = 2;
    }

    @Override // ads_mobile_sdk.et0
    public Object b(ContinuationImpl continuationImpl) {
        return a(this, continuationImpl);
    }

    @Override // ads_mobile_sdk.et0
    public final Unit d(Continuation continuation) {
        if (this.P && this.n.get()) {
            ht0 ht0Var = new ht0(this, null, 1);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            t70.j0 j0Var = this.f2973d;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(ht0Var, null), 2);
        }
        return Unit.f71706a;
    }

    @Override // ads_mobile_sdk.et0
    public final Object e(ct0 ct0Var) {
        Object objA = a(new ni.s(ni.r.f78316b, "There was an internal error when attempting to show fullscreen content.", null), ct0Var);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    @Override // ads_mobile_sdk.et0, b.f4
    public final void onStop() {
        n();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(kt0 kt0Var, ContinuationImpl continuationImpl) {
        gt0 gt0Var;
        if (continuationImpl instanceof gt0) {
            gt0Var = (gt0) continuationImpl;
            int i5 = gt0Var.f4061d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gt0Var.f4061d = i5 - Integer.MIN_VALUE;
            } else {
                gt0Var = new gt0(kt0Var, continuationImpl);
            }
        }
        Object objA = gt0Var.f4059b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gt0Var.f4061d;
        if (i11 == 0) {
            ResultKt.b(objA);
            gt0Var.f4058a = kt0Var;
            gt0Var.f4061d = 1;
            objA = et0.a(kt0Var, gt0Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            kt0Var = gt0Var.f4058a;
            ResultKt.b(objA);
        }
        if (!((Boolean) objA).booleanValue()) {
            return Boolean.FALSE;
        }
        t70.j0 j0Var = kt0Var.f2973d;
        ht0 ht0Var = new ht0(kt0Var, null, 0);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        m0.t(j0Var, context, null, new ar.a(ht0Var, null), 2);
        return Boolean.TRUE;
    }

    @Override // ads_mobile_sdk.et0, b.f4
    public Object a(ni.s sVar, Continuation continuation) {
        if (this.P) {
            Object objA = this.N.a(sVar, continuation);
            return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
        }
        return Unit.f71706a;
    }

    @Override // ads_mobile_sdk.cs0, ads_mobile_sdk.et0
    public Object a(View view, Continuation continuation) {
        return a(this, view, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x006f, code lost:
    
        if (r6.o(r0) == r1) goto L30;
     */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(kt0 kt0Var, View view, ContinuationImpl continuationImpl) {
        jt0 jt0Var;
        if (continuationImpl instanceof jt0) {
            jt0Var = (jt0) continuationImpl;
            int i5 = jt0Var.f5385d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jt0Var.f5385d = i5 - Integer.MIN_VALUE;
            } else {
                jt0Var = new jt0(kt0Var, continuationImpl);
            }
        }
        Object obj = jt0Var.f5383b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jt0Var.f5385d;
        if (i11 == 0) {
            ResultKt.b(obj);
            jt0Var.f5382a = kt0Var;
            jt0Var.f5385d = 1;
            if (super.a(view, jt0Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            kt0Var = jt0Var.f5382a;
            ResultKt.b(obj);
        } else {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            kt0Var = jt0Var.f5382a;
            ResultKt.b(obj);
            if (kt0Var.P) {
                return Unit.f71706a;
            }
            y2 y2Var = kt0Var.N;
            jt0Var.f5382a = null;
            jt0Var.f5385d = 3;
        }
        if (kt0Var.O) {
            y2 y2Var2 = kt0Var.N;
            jt0Var.f5382a = kt0Var;
            jt0Var.f5385d = 2;
            if (y2Var2.n(jt0Var) != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (kt0Var.P) {
        }
    }
}
