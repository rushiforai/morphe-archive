package gy;

import androidx.compose.runtime.snapshots.SnapshotStateList;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class l1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f58424t;

    /* renamed from: u, reason: collision with root package name */
    public int f58425u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ i0.i f58426v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ SnapshotStateList f58427w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l1(i0.i iVar, SnapshotStateList snapshotStateList, Continuation continuation, int i5) {
        super(2, continuation);
        this.f58424t = i5;
        this.f58426v = iVar;
        this.f58427w = snapshotStateList;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f58424t) {
            case 0:
                return new l1(this.f58426v, this.f58427w, continuation, 0);
            case 1:
                return new l1(this.f58426v, this.f58427w, continuation, 1);
            default:
                return new l1(this.f58426v, this.f58427w, continuation, 2);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f58424t) {
        }
        return ((l1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        switch (this.f58424t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f58425u;
                if (i5 != 0) {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return Unit.f71706a;
                }
                ResultKt.b(obj);
                w70.t1 t1Var = this.f58426v.f61087a;
                f1.e1 e1Var = new f1.e1(this.f58427w, 1);
                this.f58425u = 1;
                t1Var.collect(e1Var, this);
                return coroutineSingletons;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f58425u;
                if (i11 != 0) {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return Unit.f71706a;
                }
                ResultKt.b(obj);
                w70.t1 t1Var2 = this.f58426v.f61087a;
                f1.e1 e1Var2 = new f1.e1(this.f58427w, 2);
                this.f58425u = 1;
                t1Var2.collect(e1Var2, this);
                return coroutineSingletons2;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f58425u;
                if (i12 != 0) {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return Unit.f71706a;
                }
                ResultKt.b(obj);
                w70.t1 t1Var3 = this.f58426v.f61087a;
                f1.e1 e1Var3 = new f1.e1(this.f58427w, 4);
                this.f58425u = 1;
                t1Var3.collect(e1Var3, this);
                return coroutineSingletons3;
        }
    }
}
