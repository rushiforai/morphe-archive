package gy;

import g0.t2;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.g2;

/* loaded from: classes4.dex */
public final class a0 extends RestrictedSuspendLambda implements Function2 {
    public final /* synthetic */ p1.e1 A;

    /* renamed from: t, reason: collision with root package name */
    public int f58214t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f58215u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ t70.j0 f58216v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ long f58217w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ boolean f58218x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ float f58219y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ long f58220z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a0(t70.j0 j0Var, long j11, boolean z11, float f11, long j12, p1.e1 e1Var, Continuation continuation) {
        super(2, continuation);
        this.f58216v = j0Var;
        this.f58217w = j11;
        this.f58218x = z11;
        this.f58219y = f11;
        this.f58220z = j12;
        this.A = e1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        a0 a0Var = new a0(this.f58216v, this.f58217w, this.f58218x, this.f58219y, this.f58220z, this.A, continuation);
        a0Var.f58215u = obj;
        return a0Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((a0) create((v2.b) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        v2.b bVar;
        t70.r1 r1Var;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f58214t;
        if (i5 == 0) {
            ResultKt.b(obj);
            bVar = (v2.b) this.f58215u;
            this.f58215u = bVar;
            this.f58214t = 1;
            obj = t2.c(bVar, this, 2);
            if (obj != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i5 != 1) {
            if (i5 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            r1Var = (t70.r1) this.f58215u;
            ResultKt.b(obj);
            r1Var.c(null);
            return Unit.f71706a;
        }
        bVar = (v2.b) this.f58215u;
        ResultKt.b(obj);
        p1.e1 e1Var = this.A;
        g2 g2VarT = t70.m0.t(this.f58216v, null, null, new z(this.f58217w, this.f58218x, (v2.t) obj, this.f58219y, this.f58220z, e1Var, null), 3);
        this.f58215u = g2VarT;
        this.f58214t = 2;
        g0.h0 h0Var = t2.f56708a;
        if (t2.i(bVar, v2.n.f91981b, this) != coroutineSingletons) {
            r1Var = g2VarT;
            r1Var.c(null);
            return Unit.f71706a;
        }
        return coroutineSingletons;
    }
}
