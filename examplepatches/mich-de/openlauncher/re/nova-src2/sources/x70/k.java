package x70;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;
import t70.j0;

/* loaded from: classes.dex */
public final class k extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f95240t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f95241u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ l f95242v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ w70.n f95243w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(l lVar, w70.n nVar, Continuation continuation) {
        super(2, continuation);
        this.f95242v = lVar;
        this.f95243w = nVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        k kVar = new k(this.f95242v, this.f95243w, continuation);
        kVar.f95241u = obj;
        return kVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((k) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f95240t;
        if (i5 == 0) {
            ResultKt.b(obj);
            j0 j0Var = (j0) this.f95241u;
            Ref.ObjectRef objectRef = new Ref.ObjectRef();
            l lVar = this.f95242v;
            w70.m mVar = lVar.f95229d;
            j jVar = new j(objectRef, j0Var, lVar, this.f95243w);
            this.f95240t = 1;
            if (mVar.collect(jVar, this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }
}
