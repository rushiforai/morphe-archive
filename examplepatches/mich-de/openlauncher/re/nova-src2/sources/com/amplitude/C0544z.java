package com.amplitude;

import io.flutter.plugin.common.BinaryMessenger;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* renamed from: com.amplitude.z, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0544z extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ BinaryMessenger f20830a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ BinaryMessenger.BinaryMessageHandler f20831b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0544z(BinaryMessenger binaryMessenger, BinaryMessenger.BinaryMessageHandler binaryMessageHandler, Continuation continuation) {
        super(2, continuation);
        this.f20830a = binaryMessenger;
        this.f20831b = binaryMessageHandler;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new C0544z(this.f20830a, this.f20831b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C0544z(this.f20830a, this.f20831b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        this.f20830a.setMessageHandler("com.amplitude.sessionreplay", this.f20831b);
        return Unit.f71706a;
    }
}
