package gx;

import cw.y1;
import kotlin.KotlinNothingValueException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import w70.g2;
import w70.u1;

/* loaded from: classes4.dex */
public final class j extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f58095t;

    /* renamed from: u, reason: collision with root package name */
    public int f58096u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ b0 f58097v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j(int i5, b0 b0Var, Continuation continuation) {
        super(2, continuation);
        this.f58095t = i5;
        this.f58097v = b0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f58095t) {
            case 0:
                return new j(0, this.f58097v, continuation);
            case 1:
                return new j(1, this.f58097v, continuation);
            default:
                return new j(2, this.f58097v, continuation);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f58095t) {
            case 0:
                ((j) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
                return CoroutineSingletons.f71806a;
            case 1:
                return ((j) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
            default:
                ((j) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
                return CoroutineSingletons.f71806a;
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f58095t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f58096u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    b0 b0Var = this.f58097v;
                    g2 g2Var = b0Var.f58027b;
                    i iVar = new i(b0Var, 0);
                    this.f58096u = 1;
                    if (g2Var.collect(iVar, this) == coroutineSingletons) {
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
                int i11 = this.f58096u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    b0 b0Var2 = this.f58097v;
                    w70.m mVarK = u1.k(new y1(b0Var2.f58030e, 2));
                    i iVar2 = new i(b0Var2, 1);
                    this.f58096u = 1;
                    if (mVarK.collect(iVar2, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f58096u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    b0 b0Var3 = this.f58097v;
                    g2 g2Var2 = b0Var3.f58030e;
                    i iVar3 = new i(b0Var3, 2);
                    this.f58096u = 1;
                    if (g2Var2.collect(iVar3, this) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                throw new KotlinNothingValueException();
        }
    }
}
