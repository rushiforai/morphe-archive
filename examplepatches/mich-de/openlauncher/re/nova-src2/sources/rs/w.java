package rs;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;

/* loaded from: classes4.dex */
public final class w extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ boolean f86309t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ boolean f86310u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ g2.s f86311v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w(boolean z11, boolean z12, g2.s sVar, Continuation continuation) {
        super(2, continuation);
        this.f86309t = z11;
        this.f86310u = z12;
        this.f86311v = sVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new w(this.f86309t, this.f86310u, this.f86311v, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((w) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        if (this.f86309t && !this.f86310u) {
            g2.s.c(this.f86311v);
        }
        return Unit.f71706a;
    }
}
