package l1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;

/* loaded from: classes2.dex */
public final class v6 extends SuspendLambda implements Function3 {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ long f74132t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ x6 f74133u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v6(x6 x6Var, Continuation continuation) {
        super(3, continuation);
        this.f74133u = x6Var;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        long j11 = ((h2.b) obj2).f59016a;
        v6 v6Var = new v6(this.f74133u, (Continuation) obj3);
        v6Var.f74132t = j11;
        return v6Var.invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        long j11 = this.f74132t;
        x6 x6Var = this.f74133u;
        x6Var.f74254m.p((x6Var.f74248g ? x6Var.f74247f.m() - h2.b.d(j11) : h2.b.d(j11)) - x6Var.f74253l.m());
        return Unit.f71706a;
    }
}
