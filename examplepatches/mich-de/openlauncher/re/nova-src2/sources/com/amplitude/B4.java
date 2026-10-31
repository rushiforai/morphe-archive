package com.amplitude;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class B4 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public c80.a f20189a;

    /* renamed from: b, reason: collision with root package name */
    public I4 f20190b;

    /* renamed from: c, reason: collision with root package name */
    public int f20191c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ I4 f20192d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public B4(I4 i42, Continuation continuation) {
        super(2, continuation);
        this.f20192d = i42;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new B4(this.f20192d, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new B4(this.f20192d, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        I4 i42;
        Object obj2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f20191c;
        if (i5 == 0) {
            ResultKt.b(obj);
            I4 i43 = this.f20192d;
            c80.a aVar = i43.f20278j;
            this.f20189a = aVar;
            this.f20190b = i43;
            this.f20191c = 1;
            c80.d dVar = (c80.d) aVar;
            if (dVar.e(this) == coroutineSingletons) {
                return coroutineSingletons;
            }
            i42 = i43;
            obj2 = dVar;
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i42 = this.f20190b;
            Object obj3 = this.f20189a;
            ResultKt.b(obj);
            obj2 = obj3;
        }
        try {
            i42.f20279k = null;
            i42.f20280l = false;
            z4 z4Var = i42.f20276h;
            m7.k kVar = z4Var.f20837a;
            if (kVar != null) {
                ((n7.r) kVar).b().close();
            }
            z4Var.f20837a = null;
            z4Var.f20838b = null;
            z4Var.f20839c = null;
            return Unit.f71706a;
        } finally {
            ((c80.d) obj2).g(null);
        }
    }
}
