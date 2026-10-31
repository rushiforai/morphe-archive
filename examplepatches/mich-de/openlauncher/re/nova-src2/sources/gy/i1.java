package gy;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;

/* loaded from: classes4.dex */
public final class i1 extends SuspendLambda implements Function3 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f58367t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ float f58368u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Object f58369v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i1(Object obj, Continuation continuation, int i5) {
        super(3, continuation);
        this.f58367t = i5;
        this.f58369v = obj;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        int i5 = this.f58367t;
        float fFloatValue = ((Number) obj2).floatValue();
        Continuation continuation = (Continuation) obj3;
        switch (i5) {
            case 0:
                i1 i1Var = new i1((p1.e1) this.f58369v, continuation, 0);
                i1Var.f58368u = fFloatValue;
                return i1Var.invokeSuspend(Unit.f71706a);
            case 1:
                i1 i1Var2 = new i1((p1.e1) this.f58369v, continuation, 1);
                i1Var2.f58368u = fFloatValue;
                return i1Var2.invokeSuspend(Unit.f71706a);
            default:
                i1 i1Var3 = new i1((Function1) this.f58369v, continuation, 2);
                i1Var3.f58368u = fFloatValue;
                return i1Var3.invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f58367t;
        Object obj2 = this.f58369v;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                ((Function1) ((p1.e1) obj2).getValue()).invoke(new Float(this.f58368u));
                break;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                ((Function1) ((p1.e1) obj2).getValue()).invoke(new Float(this.f58368u));
                break;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                ((Function1) obj2).invoke(new Float(this.f58368u));
                break;
        }
        return Unit.f71706a;
    }
}
