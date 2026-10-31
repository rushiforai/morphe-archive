package w70;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.functions.Function5;

/* loaded from: classes.dex */
public final class i1 extends SuspendLambda implements Function3 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f93930t = 0;

    /* renamed from: u, reason: collision with root package name */
    public int f93931u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ n f93932v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object[] f93933w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ Object f93934x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i1(Continuation continuation, Function5 function5) {
        super(3, continuation);
        this.f93934x = function5;
    }

    /* JADX WARN: Type inference failed for: r1v0, types: [java.lang.Object, kotlin.jvm.functions.Function5] */
    /* JADX WARN: Type inference failed for: r1v1, types: [java.lang.Object, kotlin.jvm.functions.Function3] */
    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        n nVar = (n) obj;
        Object[] objArr = (Object[]) obj2;
        Continuation continuation = (Continuation) obj3;
        switch (this.f93930t) {
            case 0:
                i1 i1Var = new i1(continuation, (Function5) this.f93934x);
                i1Var.f93932v = nVar;
                i1Var.f93933w = objArr;
                return i1Var.invokeSuspend(Unit.f71706a);
            default:
                i1 i1Var2 = new i1((Function3) this.f93934x, continuation);
                i1Var2.f93932v = nVar;
                i1Var2.f93933w = objArr;
                return i1Var2.invokeSuspend(Unit.f71706a);
        }
    }

    /* JADX WARN: Type inference failed for: r3v3, types: [java.lang.Object, kotlin.jvm.functions.Function3] */
    /* JADX WARN: Type inference failed for: r5v0, types: [java.lang.Object, kotlin.jvm.functions.Function5] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        n nVar;
        i1 i1Var;
        n nVar2;
        switch (this.f93930t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f93931u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    nVar = this.f93932v;
                    Object[] objArr = this.f93933w;
                    Object obj2 = objArr[0];
                    Object obj3 = objArr[1];
                    Object obj4 = objArr[2];
                    Object obj5 = objArr[3];
                    this.f93932v = nVar;
                    this.f93931u = 1;
                    i1Var = this;
                    obj = this.f93934x.invoke(obj2, obj3, obj4, obj5, i1Var);
                    if (obj == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        if (i5 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    }
                    nVar = this.f93932v;
                    ResultKt.b(obj);
                    i1Var = this;
                }
                i1Var.f93932v = null;
                i1Var.f93931u = 2;
                if (nVar.emit(obj, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f93931u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    nVar2 = this.f93932v;
                    Object[] objArr2 = this.f93933w;
                    Object obj6 = objArr2[0];
                    Object obj7 = objArr2[1];
                    this.f93932v = nVar2;
                    this.f93931u = 1;
                    obj = this.f93934x.invoke(obj6, obj7, this);
                    if (obj == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        if (i11 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    }
                    nVar2 = this.f93932v;
                    ResultKt.b(obj);
                }
                this.f93932v = null;
                this.f93931u = 2;
                if (nVar2.emit(obj, this) == coroutineSingletons2) {
                    return coroutineSingletons2;
                }
                return Unit.f71706a;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i1(Function3 function3, Continuation continuation) {
        super(3, continuation);
        this.f93934x = function3;
    }
}
