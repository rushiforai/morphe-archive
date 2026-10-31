package p10;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class f2 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f81765t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ h2 f81766u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f81767v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f2(h2 h2Var, Ref.ObjectRef objectRef, Continuation continuation) {
        super(2, continuation);
        this.f81766u = h2Var;
        this.f81767v = objectRef;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        f2 f2Var = new f2(this.f81766u, this.f81767v, continuation);
        f2Var.f81765t = obj;
        return f2Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((f2) create((y5.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        y5.b bVar = (y5.b) this.f81765t;
        h2 h2Var = this.f81766u;
        long jLongValue = ((Number) h2Var.f81788c.invoke(h2Var.f81787b.invoke())).longValue();
        y5.f fVar = h2.f81785e;
        Long l9 = (Long) bVar.b(fVar);
        y5.f fVar2 = h2.f81784d;
        Integer num = (Integer) bVar.b(fVar2);
        boolean z11 = false;
        int iIntValue = num != null ? num.intValue() : 0;
        int iA = h2.a(h2Var, iIntValue, l9, jLongValue);
        boolean z12 = l9 == null || jLongValue > l9.longValue();
        if (l9 != null && jLongValue > l9.longValue() + 1 && iIntValue > 1) {
            z11 = true;
        }
        if (z12) {
            bVar.e(fVar, new Long(jLongValue));
            bVar.e(fVar2, new Integer(iA));
        }
        this.f81767v.f71863a = new i2(iA, z12, z11);
        return Unit.f71706a;
    }
}
