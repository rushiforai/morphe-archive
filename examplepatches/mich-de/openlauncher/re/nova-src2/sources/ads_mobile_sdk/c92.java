package ads_mobile_sdk;

import android.content.Context;
import b.b9;
import b.p0;
import java.util.Optional;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes2.dex */
public final class c92 extends kt0 {
    public final Optional Q;
    public sq3 R;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c92(Context applicationContext, t70.j0 uiScope, CoroutineContext uiContext, t70.j0 backgroundScope, jr0 flags, ci3 traceLogger, String afmaVersion, Optional adWebViewContainer, qw2 requestType, z1 adConfiguration, g0 activityTracker, y2 adEventEmitter, b9 omidMonitor, rw0 gmaUtil, p0 backButtonStateDelegate) {
        super(applicationContext, uiScope, uiContext, backgroundScope, flags, traceLogger, afmaVersion, requestType, adConfiguration, activityTracker, adEventEmitter, omidMonitor, gmaUtil, backButtonStateDelegate);
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(afmaVersion, "afmaVersion");
        Intrinsics.g(adWebViewContainer, "adWebViewContainer");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(adEventEmitter, "adEventEmitter");
        Intrinsics.g(omidMonitor, "omidMonitor");
        Intrinsics.g(gmaUtil, "gmaUtil");
        Intrinsics.g(backButtonStateDelegate, "backButtonStateDelegate");
        this.Q = adWebViewContainer;
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x0060, code lost:
    
        if (t70.m0.y(r5.f2972c, new e20.c(r5, null, 10), r0) == r1) goto L23;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(c92 c92Var, ContinuationImpl continuationImpl) {
        y82 y82Var;
        if (continuationImpl instanceof y82) {
            y82Var = (y82) continuationImpl;
            int i5 = y82Var.f11965d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                y82Var.f11965d = i5 - Integer.MIN_VALUE;
            } else {
                y82Var = new y82(c92Var, continuationImpl);
            }
        }
        Object objB = y82Var.f11963b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = y82Var.f11965d;
        if (i11 == 0) {
            ResultKt.b(objB);
            y82Var.f11962a = c92Var;
            y82Var.f11965d = 1;
            objB = kt0.b(c92Var, y82Var);
            if (objB != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objB);
            return Boolean.TRUE;
        }
        c92Var = y82Var.f11962a;
        ResultKt.b(objB);
        if (!((Boolean) objB).booleanValue()) {
            return Boolean.FALSE;
        }
        y82Var.f11962a = null;
        y82Var.f11965d = 2;
    }

    @Override // ads_mobile_sdk.et0
    public final Object c(SuspendLambda suspendLambda) {
        return a(this, (ContinuationImpl) suspendLambda);
    }

    @Override // ads_mobile_sdk.kt0, ads_mobile_sdk.et0, b.f4
    public final Object a(ni.s sVar, Continuation continuation) {
        return a(this, sVar, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x005e, code lost:
    
        if (super.a(r7, r0) == r1) goto L21;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(c92 c92Var, ni.s sVar, ContinuationImpl continuationImpl) {
        a92 a92Var;
        if (continuationImpl instanceof a92) {
            a92Var = (a92) continuationImpl;
            int i5 = a92Var.f909e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                a92Var.f909e = i5 - Integer.MIN_VALUE;
            } else {
                a92Var = new a92(c92Var, continuationImpl);
            }
        }
        Object obj = a92Var.f907c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = a92Var.f909e;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            a92Var.f905a = c92Var;
            a92Var.f906b = sVar;
            a92Var.f909e = 1;
            if (m0.y(c92Var.f2972c, new e20.c(c92Var, continuation, 10), a92Var) != coroutineSingletons) {
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
        sVar = a92Var.f906b;
        c92Var = a92Var.f905a;
        ResultKt.b(obj);
        a92Var.f905a = null;
        a92Var.f906b = null;
        a92Var.f909e = 2;
    }
}
