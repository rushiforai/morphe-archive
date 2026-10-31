package p10;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class y0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f81974t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ z0 f81975u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ long f81976v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Ref.IntRef f81977w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y0(z0 z0Var, long j11, Ref.IntRef intRef, Continuation continuation) {
        super(2, continuation);
        this.f81975u = z0Var;
        this.f81976v = j11;
        this.f81977w = intRef;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        y0 y0Var = new y0(this.f81975u, this.f81976v, this.f81977w, continuation);
        y0Var.f81974t = obj;
        return y0Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((y0) create((y5.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        y5.b bVar = (y5.b) this.f81974t;
        long j11 = this.f81976v;
        int iC = z0.c(bVar, j11) + 1;
        bVar.d(z0.f81981i, new Long(j11));
        bVar.d(z0.f81982j, new Integer(iC));
        int iIntValue = ((Number) this.f81975u.f81988f.invoke()).intValue() - iC;
        if (iIntValue < 0) {
            iIntValue = 0;
        }
        this.f81977w.f71861a = iIntValue;
        return Unit.f71706a;
    }
}
