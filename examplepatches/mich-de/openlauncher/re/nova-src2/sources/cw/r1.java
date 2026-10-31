package cw;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function4;

/* loaded from: classes4.dex */
public final class r1 extends SuspendLambda implements Function4 {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ kw.e3 f48284t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ String f48285u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ boolean f48286v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f48287w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r1(p1.e1 e1Var, Continuation continuation) {
        super(4, continuation);
        this.f48287w = e1Var;
    }

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        boolean zBooleanValue = ((Boolean) obj3).booleanValue();
        r1 r1Var = new r1(this.f48287w, (Continuation) obj4);
        r1Var.f48284t = (kw.e3) obj;
        r1Var.f48285u = (String) obj2;
        r1Var.f48286v = zBooleanValue;
        return r1Var.invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        return Boolean.valueOf((this.f48284t instanceof kw.g3) && !this.f48286v && !((Boolean) this.f48287w.getValue()).booleanValue() && this.f48285u.length() == 16);
    }
}
