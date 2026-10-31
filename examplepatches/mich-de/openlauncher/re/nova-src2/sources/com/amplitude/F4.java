package com.amplitude;

import android.webkit.WebView;
import java.util.concurrent.CancellationException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class F4 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f20237a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ I4 f20238b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ WebView f20239c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public F4(I4 i42, WebView webView, Continuation continuation) {
        super(2, continuation);
        this.f20238b = i42;
        this.f20239c = webView;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new F4(this.f20238b, this.f20239c, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new F4(this.f20238b, this.f20239c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        I4 i42;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f20237a;
        try {
            try {
            } catch (Exception e3) {
                if (e3 instanceof CancellationException) {
                    throw e3;
                }
                K3 k32 = this.f20238b.f20698b;
                if (k32 != null) {
                    k32.a(e3, new D4(e3));
                }
                i42 = this.f20238b;
            }
            if (i5 == 0) {
                ResultKt.b(obj);
                if (!((c80.d) this.f20238b.f20278j).f()) {
                    K3 k33 = this.f20238b.f20698b;
                    if (k33 != null) {
                        k33.c(E4.f20226a);
                    }
                    return Unit.f71706a;
                }
                C4 c42 = new C4(this.f20238b, this.f20239c, null);
                this.f20237a = 1;
                if (t70.p2.b(500L, c42, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            i42 = this.f20238b;
            ((c80.d) i42.f20278j).g(null);
            return Unit.f71706a;
        } catch (Throwable th2) {
            ((c80.d) this.f20238b.f20278j).g(null);
            throw th2;
        }
    }
}
