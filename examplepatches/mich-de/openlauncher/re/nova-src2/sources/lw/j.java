package lw;

import f1.b3;
import f1.c3;
import f1.d3;
import f1.k2;
import f1.y;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import p1.s2;

/* loaded from: classes4.dex */
public final class j extends SuspendLambda implements Function1 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f75140t;

    /* renamed from: u, reason: collision with root package name */
    public int f75141u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ l f75142v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j(l lVar, Continuation continuation, int i5) {
        super(1, continuation);
        this.f75140t = i5;
        this.f75142v = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Continuation continuation) {
        switch (this.f75140t) {
            case 0:
                return new j(this.f75142v, continuation, 0);
            case 1:
                return new j(this.f75142v, continuation, 1);
            default:
                return new j(this.f75142v, continuation, 2);
        }
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Continuation continuation = (Continuation) obj;
        switch (this.f75140t) {
        }
        return ((j) create(continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f75140t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f75141u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    c3 c3Var = this.f75142v.f75147a;
                    this.f75141u = 1;
                    if (c3Var.b(this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 1:
                Object obj2 = CoroutineSingletons.f71806a;
                int i11 = this.f75141u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    c3 c3Var2 = this.f75142v.f75147a;
                    this.f75141u = 1;
                    y yVar = c3Var2.f53424b;
                    y yVar2 = c3Var2.f53424b;
                    k2 k2VarG = yVar.g();
                    d3 d3Var = d3.f53457b;
                    boolean zContainsKey = k2VarG.f53702a.containsKey(d3Var);
                    if (b3.f53402a[((d3) ((s2) yVar2.f54114d).getValue()).ordinal()] == 1) {
                        k2 k2VarG2 = yVar2.g();
                        d3 d3Var2 = d3.f53458c;
                        if (k2VarG2.f53702a.containsKey(d3Var2)) {
                            d3Var = d3Var2;
                        }
                    } else if (!zContainsKey) {
                        d3Var = d3.f53456a;
                    }
                    Object objA = c3.a(c3Var2, d3Var, this);
                    if (objA != obj2) {
                        objA = Unit.f71706a;
                    }
                    if (objA == obj2) {
                        return obj2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i12 = this.f75141u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    this.f75141u = 1;
                    if (this.f75142v.b(this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
