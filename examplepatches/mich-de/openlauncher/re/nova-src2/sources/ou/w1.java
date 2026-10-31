package ou;

import b.c9;
import kotlin.KotlinNothingValueException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class w1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f81000t;

    /* renamed from: u, reason: collision with root package name */
    public int f81001u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ g2 f81002v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ w1(g2 g2Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f81000t = i5;
        this.f81002v = g2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f81000t) {
            case 0:
                return new w1(this.f81002v, continuation, 0);
            case 1:
                return new w1(this.f81002v, continuation, 1);
            default:
                return new w1(this.f81002v, continuation, 2);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f81000t) {
            case 0:
                ((w1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
                break;
            case 1:
                ((w1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
                break;
            default:
                ((w1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
                break;
        }
        return CoroutineSingletons.f71806a;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f81000t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f81001u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    g2 g2Var = this.f81002v;
                    w70.g2 g2Var2 = g2Var.f80887g;
                    v1 v1Var = new v1(g2Var);
                    this.f81001u = 1;
                    if (g2Var2.collect(v1Var, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                throw new KotlinNothingValueException();
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f81001u;
                if (i11 != 0) {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    throw c9.o(obj);
                }
                ResultKt.b(obj);
                g2 g2Var3 = this.f81002v;
                uw.c cVar = g2Var3.o;
                x1 x1Var = new x1(g2Var3, 0);
                this.f81001u = 1;
                cVar.collect(x1Var, this);
                return coroutineSingletons2;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f81001u;
                if (i12 != 0) {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    throw c9.o(obj);
                }
                ResultKt.b(obj);
                g2 g2Var4 = this.f81002v;
                uw.c cVar2 = g2Var4.f80889i.f80805c;
                x1 x1Var2 = new x1(g2Var4, 1);
                this.f81001u = 1;
                cVar2.collect(x1Var2, this);
                return coroutineSingletons3;
        }
    }
}
