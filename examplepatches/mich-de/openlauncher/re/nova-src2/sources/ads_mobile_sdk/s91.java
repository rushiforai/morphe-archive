package ads_mobile_sdk;

import android.content.Context;
import com.google.gson.Gson;
import java.util.Optional;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import ni.x;
import t70.e0;
import t70.k0;
import t70.m0;
import t70.q1;

/* loaded from: classes2.dex */
public final class s91 extends et0 {
    public final w81 E;
    public final x F;
    public final g0 G;
    public final tx0 H;
    public int I;

    /* JADX WARN: Illegal instructions before constructor call */
    public s91(w81 w81Var, tx0 webView, x listener, g0 activityTracker, Context applicationContext, t70.j0 uiScope, CoroutineContext uiContext, t70.j0 backgroundScope, jr0 flags, ci3 traceLogger, String afmaVersion, rw0 gmaUtil, uk ukVar) {
        Intrinsics.g(webView, "webView");
        Intrinsics.g(listener, "listener");
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(afmaVersion, "afmaVersion");
        Intrinsics.g(gmaUtil, "gmaUtil");
        Optional optionalEmpty = Optional.empty();
        Intrinsics.f(optionalEmpty, "empty(...)");
        super(applicationContext, uiScope, uiContext, backgroundScope, flags, traceLogger, afmaVersion, gmaUtil, ukVar, optionalEmpty);
        this.E = w81Var;
        this.F = listener;
        this.G = activityTracker;
        this.H = webView;
        this.I = -1;
        this.f2984q = webView;
        this.f2988u = true;
    }

    @Override // ads_mobile_sdk.et0
    public final void a(int i5) {
        this.I = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // ads_mobile_sdk.et0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) {
        n91 n91Var;
        s91 s91Var;
        if (continuationImpl instanceof n91) {
            n91Var = (n91) continuationImpl;
            int i5 = n91Var.f7457d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                n91Var.f7457d = i5 - Integer.MIN_VALUE;
            } else {
                n91Var = new n91(this, continuationImpl);
            }
        }
        Object obj = n91Var.f7455b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = n91Var.f7457d;
        Continuation continuation = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            n91Var.f7454a = this;
            n91Var.f7457d = 1;
            this.H.o = null;
            if (Unit.f71706a == coroutineSingletons) {
                return coroutineSingletons;
            }
            s91Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            s91Var = n91Var.f7454a;
            ResultKt.b(obj);
        }
        if (!s91Var.n.get()) {
            return Unit.f71706a;
        }
        b.i8 i8Var = rw0.f9327f;
        m0.t(k0.a(t70.c2.f88780b.plus(n91Var.getContext()).minusKey(ti3.f9938b).minusKey(e0.f88787a).minusKey(q1.f88853a)), null, null, new m91(s91Var, continuation, 0), 3);
        return Unit.f71706a;
    }

    @Override // ads_mobile_sdk.et0
    public final Object e(ct0 ct0Var) {
        b.i8 i8Var = rw0.f9327f;
        m0.t(k0.a(t70.c2.f88780b.plus(ct0Var.getContext()).minusKey(ti3.f9938b).minusKey(e0.f88787a).minusKey(q1.f88853a)), null, null, new m91(this, null, 1), 3);
        return Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0081, code lost:
    
        if (r6 == r1) goto L25;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object f(ContinuationImpl continuationImpl) throws Throwable {
        q91 q91Var;
        Gson gson;
        s91 s91Var;
        if (continuationImpl instanceof q91) {
            q91Var = (q91) continuationImpl;
            int i5 = q91Var.f8534e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                q91Var.f8534e = i5 - Integer.MIN_VALUE;
            } else {
                q91Var = new q91(this, continuationImpl);
            }
        }
        Object objT = q91Var.f8532c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = q91Var.f8534e;
        if (i11 == 0) {
            ResultKt.b(objT);
            gson = new Gson();
            q91Var.f8530a = this;
            q91Var.f8531b = gson;
            q91Var.f8534e = 1;
            objT = this.E.t(q91Var);
            if (objT != coroutineSingletons) {
                s91Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objT);
            return Unit.f71706a;
        }
        gson = q91Var.f8531b;
        s91Var = q91Var.f8530a;
        ResultKt.b(objT);
        String json = gson.toJson(objT);
        tx0 tx0Var = s91Var.H;
        Intrinsics.d(json);
        q91Var.f8530a = null;
        q91Var.f8531b = null;
        q91Var.f8534e = 2;
        tx0Var.getClass();
        Object objA = tx0Var.a("window.inspectorInfo(" + json + ");", q91Var);
        if (objA != coroutineSingletons) {
            objA = Unit.f71706a;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object g(ContinuationImpl continuationImpl) {
        r91 r91Var;
        s91 s91Var;
        if (continuationImpl instanceof r91) {
            r91Var = (r91) continuationImpl;
            int i5 = r91Var.f8985d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                r91Var.f8985d = i5 - Integer.MIN_VALUE;
            } else {
                r91Var = new r91(this, continuationImpl);
            }
        }
        Object obj = r91Var.f8983b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = r91Var.f8985d;
        if (i11 == 0) {
            ResultKt.b(obj);
            r91Var.f8982a = this;
            r91Var.f8985d = 1;
            if (f(r91Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            s91Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            s91Var = r91Var.f8982a;
            ResultKt.b(obj);
        }
        Context contextB = s91Var.G.b();
        if (contextB == null) {
            contextB = s91Var.f2970a;
        }
        return Boolean.valueOf(s91Var.a(contextB));
    }

    @Override // ads_mobile_sdk.et0
    public final tx0 j() {
        return this.H;
    }

    @Override // ads_mobile_sdk.et0
    public final int k() {
        return this.I;
    }

    @Override // ads_mobile_sdk.et0, b.f4
    public final Object a(ni.s sVar, Continuation continuation) {
        b.i8 i8Var = rw0.f9327f;
        m0.t(k0.a(t70.c2.f88780b.plus(continuation.getContext()).minusKey(ti3.f9938b).minusKey(e0.f88787a).minusKey(q1.f88853a)), null, null, new androidx.room.c(this, null, 11), 3);
        return Unit.f71706a;
    }
}
