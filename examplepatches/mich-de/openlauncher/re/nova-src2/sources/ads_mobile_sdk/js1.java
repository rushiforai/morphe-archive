package ads_mobile_sdk;

import android.graphics.Rect;
import b.r5;
import b0.b0;
import c80.d;
import java.util.Optional;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.optionals.OptionalsKt;
import t70.m0;

/* loaded from: classes.dex */
public final class js1 implements r5 {

    /* renamed from: a, reason: collision with root package name */
    public final bq1 f5374a;

    /* renamed from: b, reason: collision with root package name */
    public final Optional f5375b;

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f5376c;

    /* renamed from: d, reason: collision with root package name */
    public final d f5377d;

    /* renamed from: e, reason: collision with root package name */
    public Rect f5378e;

    public js1(bq1 mraidAfmaDispatcher, Optional optionalWebView, t70.j0 uiScope) {
        Intrinsics.g(mraidAfmaDispatcher, "mraidAfmaDispatcher");
        Intrinsics.g(optionalWebView, "optionalWebView");
        Intrinsics.g(uiScope, "uiScope");
        this.f5374a = mraidAfmaDispatcher;
        this.f5375b = optionalWebView;
        this.f5376c = uiScope;
        this.f5377d = new d();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(js1 js1Var, ContinuationImpl continuationImpl) {
        gs1 gs1Var;
        d dVar;
        if (continuationImpl instanceof gs1) {
            gs1Var = (gs1) continuationImpl;
            int i5 = gs1Var.f4051e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gs1Var.f4051e = i5 - Integer.MIN_VALUE;
            } else {
                gs1Var = new gs1(js1Var, continuationImpl);
            }
        }
        Object obj = gs1Var.f4049c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gs1Var.f4051e;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = js1Var.f5377d;
            gs1Var.f4047a = js1Var;
            gs1Var.f4048b = dVar;
            gs1Var.f4051e = 1;
            if (dVar.e(gs1Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = gs1Var.f4048b;
            js1 js1Var2 = gs1Var.f4047a;
            ResultKt.b(obj);
            dVar = dVar2;
            js1Var = js1Var2;
        }
        try {
            return js1Var.f5378e;
        } finally {
            dVar.g(null);
        }
    }

    @Override // b.r5
    public final Object b(qo3 qo3Var, Continuation continuation) {
        return a(this, qo3Var, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(js1 js1Var, qo3 qo3Var, ContinuationImpl continuationImpl) {
        hs1 hs1Var;
        js1 js1Var2;
        d dVar;
        if (continuationImpl instanceof hs1) {
            hs1Var = (hs1) continuationImpl;
            int i5 = hs1Var.f4513f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hs1Var.f4513f = i5 - Integer.MIN_VALUE;
            } else {
                hs1Var = new hs1(js1Var, continuationImpl);
            }
        }
        Object obj = hs1Var.f4511d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hs1Var.f4513f;
        if (i11 == 0) {
            ResultKt.b(obj);
            d dVar2 = js1Var.f5377d;
            hs1Var.f4508a = js1Var;
            hs1Var.f4509b = qo3Var;
            hs1Var.f4510c = dVar2;
            hs1Var.f4513f = 1;
            if (dVar2.e(hs1Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            js1Var2 = js1Var;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = hs1Var.f4510c;
            qo3Var = hs1Var.f4509b;
            js1 js1Var3 = hs1Var.f4508a;
            ResultKt.b(obj);
            js1Var2 = js1Var3;
        }
        Continuation continuation = null;
        try {
            tx0 tx0Var = (tx0) OptionalsKt.b(js1Var2.f5375b);
            if (tx0Var != null) {
                Rect rect = qo3Var.f8765d;
                if (!rect.equals(js1Var2.f5378e)) {
                    js1Var2.f5378e = rect;
                    m0.t(js1Var2.f5376c, null, null, new b0(js1Var2, tx0Var, rect, continuation, 5), 3);
                }
            }
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }
}
