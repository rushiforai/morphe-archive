package com.amplitude;

import io.flutter.plugin.common.BinaryMessenger;
import java.nio.ByteBuffer;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* renamed from: com.amplitude.y, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0539y extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ BinaryMessenger f20816a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ByteBuffer f20817b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0539y(BinaryMessenger binaryMessenger, ByteBuffer byteBuffer, Continuation continuation) {
        super(2, continuation);
        this.f20816a = binaryMessenger;
        this.f20817b = byteBuffer;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new C0539y(this.f20816a, this.f20817b, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C0539y(this.f20816a, this.f20817b, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        this.f20816a.send("com.amplitude.sessionreplay", this.f20817b);
        return Unit.f71706a;
    }
}
