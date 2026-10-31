package com.amplitude;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* renamed from: com.amplitude.e4, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0432e4 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ G3 f20555a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f20556b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0432e4(G3 g32, String str, Continuation continuation) {
        super(2, continuation);
        this.f20555a = g32;
        this.f20556b = str;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new C0432e4(this.f20555a, this.f20556b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C0432e4(this.f20555a, this.f20556b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        this.f20555a.f20714a.a(this.f20556b);
        return Unit.f71706a;
    }
}
