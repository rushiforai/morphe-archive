package com.amplitude;

import android.webkit.WebView;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class C4 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f20201a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ I4 f20202b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ WebView f20203c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C4(I4 i42, WebView webView, Continuation continuation) {
        super(2, continuation);
        this.f20202b = i42;
        this.f20203c = webView;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new C4(this.f20202b, this.f20203c, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C4(this.f20202b, this.f20203c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f20201a;
        if (i5 == 0) {
            ResultKt.b(obj);
            I4 i42 = this.f20202b;
            WebView webView = this.f20203c;
            this.f20201a = 1;
            if (i42.a(webView, this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }
}
