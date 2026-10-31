package hy;

import g0.l0;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;
import p1.y2;
import t70.j0;
import w70.t1;

/* loaded from: classes4.dex */
public final class t extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f61038t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ i0.i f61039u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ boolean f61040v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ float f61041w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ l0 f61042x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ y2 f61043y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t(i0.i iVar, boolean z11, float f11, l0 l0Var, y2 y2Var, Continuation continuation) {
        super(2, continuation);
        this.f61039u = iVar;
        this.f61040v = z11;
        this.f61041w = f11;
        this.f61042x = l0Var;
        this.f61043y = y2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new t(this.f61039u, this.f61040v, this.f61041w, this.f61042x, this.f61043y, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((t) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f61038t;
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
        t1 t1Var = this.f61039u.f61087a;
        s sVar = new s(longRef, this.f61040v, this.f61041w, this.f61042x, this.f61043y);
        this.f61038t = 1;
        t1Var.collect(sVar, this);
        return coroutineSingletons;
    }
}
