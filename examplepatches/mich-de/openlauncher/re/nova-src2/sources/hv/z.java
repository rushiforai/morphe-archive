package hv;

import b.c9;
import kotlin.KotlinNothingValueException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class z extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f60700t;

    /* renamed from: u, reason: collision with root package name */
    public int f60701u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ b0 f60702v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ z(b0 b0Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f60700t = i5;
        this.f60702v = b0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f60700t) {
            case 0:
                return new z(this.f60702v, continuation, 0);
            case 1:
                return new z(this.f60702v, continuation, 1);
            case 2:
                return new z(this.f60702v, continuation, 2);
            case 3:
                return new z(this.f60702v, continuation, 3);
            default:
                return new z(this.f60702v, continuation, 4);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f60700t) {
            case 0:
                ((z) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
                break;
            case 1:
                ((z) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
                break;
            case 2:
                ((z) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
                break;
            case 3:
                ((z) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
                break;
            default:
                ((z) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
                break;
        }
        return CoroutineSingletons.f71806a;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f60700t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f60701u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    b0 b0Var = this.f60702v;
                    w70.g2 g2Var = b0Var.f60141a;
                    y yVar = new y(b0Var, 0);
                    this.f60701u = 1;
                    if (g2Var.collect(yVar, this) == coroutineSingletons) {
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
                int i11 = this.f60701u;
                if (i11 != 0) {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    throw c9.o(obj);
                }
                ResultKt.b(obj);
                b0 b0Var2 = this.f60702v;
                w70.i2 i2Var = b0Var2.f60154p;
                y yVar2 = new y(b0Var2, 1);
                this.f60701u = 1;
                i2Var.collect(yVar2, this);
                return coroutineSingletons2;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f60701u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    b0 b0Var3 = this.f60702v;
                    w70.g2 g2Var2 = b0Var3.f60141a;
                    y yVar3 = new y(b0Var3, 2);
                    this.f60701u = 1;
                    if (g2Var2.collect(yVar3, this) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                throw new KotlinNothingValueException();
            case 3:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i13 = this.f60701u;
                if (i13 == 0) {
                    ResultKt.b(obj);
                    b0 b0Var4 = this.f60702v;
                    w70.g2 g2Var3 = b0Var4.f60142b;
                    y yVar4 = new y(b0Var4, 3);
                    this.f60701u = 1;
                    if (g2Var3.collect(yVar4, this) == coroutineSingletons4) {
                        return coroutineSingletons4;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                throw new KotlinNothingValueException();
            default:
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                int i14 = this.f60701u;
                if (i14 == 0) {
                    ResultKt.b(obj);
                    b0 b0Var5 = this.f60702v;
                    w70.q1 q1Var = b0Var5.f60143c;
                    y yVar5 = new y(b0Var5, 4);
                    this.f60701u = 1;
                    if (q1Var.collect(yVar5, this) == coroutineSingletons5) {
                        return coroutineSingletons5;
                    }
                } else {
                    if (i14 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                throw new KotlinNothingValueException();
        }
    }
}
