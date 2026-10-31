package gy;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class b0 extends SuspendLambda implements Function2 {
    public final /* synthetic */ p1.e1 A;

    /* renamed from: t, reason: collision with root package name */
    public int f58230t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f58231u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ v2.x f58232v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ long f58233w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ boolean f58234x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ float f58235y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ long f58236z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b0(v2.x xVar, long j11, boolean z11, float f11, long j12, p1.e1 e1Var, Continuation continuation) {
        super(2, continuation);
        this.f58232v = xVar;
        this.f58233w = j11;
        this.f58234x = z11;
        this.f58235y = f11;
        this.f58236z = j12;
        this.A = e1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        b0 b0Var = new b0(this.f58232v, this.f58233w, this.f58234x, this.f58235y, this.f58236z, this.A, continuation);
        b0Var.f58231u = obj;
        return b0Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((b0) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f58230t;
        if (i5 == 0) {
            ResultKt.b(obj);
            a0 a0Var = new a0((t70.j0) this.f58231u, this.f58233w, this.f58234x, this.f58235y, this.f58236z, this.A, null);
            this.f58230t = 1;
            if (((v2.l0) this.f58232v).B(a0Var, this) == coroutineSingletons) {
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
