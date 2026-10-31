package gy;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;
import p1.y2;

/* loaded from: classes4.dex */
public final class r1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f58522t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ i0.i f58523u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ boolean f58524v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ float f58525w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ g0.l0 f58526x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ y2 f58527y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r1(i0.i iVar, boolean z11, float f11, g0.l0 l0Var, y2 y2Var, Continuation continuation) {
        super(2, continuation);
        this.f58523u = iVar;
        this.f58524v = z11;
        this.f58525w = f11;
        this.f58526x = l0Var;
        this.f58527y = y2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new r1(this.f58523u, this.f58524v, this.f58525w, this.f58526x, this.f58527y, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((r1) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f58522t;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        ResultKt.b(obj);
        Ref.LongRef longRef = new Ref.LongRef();
        longRef.f71862a = 9205357640488583168L;
        w70.t1 t1Var = this.f58523u.f61087a;
        q1 q1Var = new q1(longRef, this.f58524v, this.f58525w, this.f58526x, this.f58527y);
        this.f58522t = 1;
        t1Var.collect(q1Var, this);
        return coroutineSingletons;
    }
}
