package com.amplitude;

import java.util.Iterator;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* renamed from: com.amplitude.u0, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0520u0 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AbstractC0525v0 f20770a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0520u0(AbstractC0525v0 abstractC0525v0, Continuation continuation) {
        super(2, continuation);
        this.f20770a = abstractC0525v0;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new C0520u0(this.f20770a, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new C0520u0(this.f20770a, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        Iterator it = this.f20770a.f20790d.entrySet().iterator();
        while (it.hasNext()) {
            ((AbstractC0489o0) ((Map.Entry) it.next()).getValue()).a();
            it.remove();
        }
        return Unit.f71706a;
    }
}
