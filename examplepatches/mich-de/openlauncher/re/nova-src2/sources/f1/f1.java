package f1;

import androidx.compose.runtime.snapshots.SnapshotStateList;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class f1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f53523t;

    /* renamed from: u, reason: collision with root package name */
    public int f53524u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ i0.i f53525v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ SnapshotStateList f53526w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ f1(i0.i iVar, SnapshotStateList snapshotStateList, Continuation continuation, int i5) {
        super(2, continuation);
        this.f53523t = i5;
        this.f53525v = iVar;
        this.f53526w = snapshotStateList;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f53523t) {
            case 0:
                return new f1(this.f53525v, this.f53526w, continuation, 0);
            default:
                return new f1(this.f53525v, this.f53526w, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f53523t) {
        }
        return ((f1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        switch (this.f53523t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f53524u;
                if (i5 != 0) {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return Unit.f71706a;
                }
                ResultKt.b(obj);
                w70.t1 t1Var = this.f53525v.f61087a;
                e1 e1Var = new e1(this.f53526w, 0);
                this.f53524u = 1;
                t1Var.collect(e1Var, this);
                return coroutineSingletons;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f53524u;
                if (i11 != 0) {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return Unit.f71706a;
                }
                ResultKt.b(obj);
                w70.t1 t1Var2 = this.f53525v.f61087a;
                e1 e1Var2 = new e1(this.f53526w, 3);
                this.f53524u = 1;
                t1Var2.collect(e1Var2, this);
                return coroutineSingletons2;
        }
    }
}
