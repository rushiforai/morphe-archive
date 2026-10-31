package uy;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class w extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ a0 f91763t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ s f91764u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f91765v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(a0 a0Var, s sVar, Ref.ObjectRef objectRef, Continuation continuation) {
        super(2, continuation);
        this.f91763t = a0Var;
        this.f91764u = sVar;
        this.f91765v = objectRef;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new w(this.f91763t, this.f91764u, this.f91765v, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((w) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        a0 a0Var = this.f91763t;
        if (Intrinsics.b(a0Var.f91679b.getTag(), this.f91764u)) {
            a0Var.f91679b.C((CharSequence) this.f91765v.f71863a);
        }
        return Unit.f71706a;
    }
}
