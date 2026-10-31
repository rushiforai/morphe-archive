package gy;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class c0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f58251t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f58252u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ long f58253v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ boolean f58254w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ float f58255x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ long f58256y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ p1.e1 f58257z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c0(long j11, boolean z11, float f11, long j12, p1.e1 e1Var, Continuation continuation) {
        super(2, continuation);
        this.f58253v = j11;
        this.f58254w = z11;
        this.f58255x = f11;
        this.f58256y = j12;
        this.f58257z = e1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        c0 c0Var = new c0(this.f58253v, this.f58254w, this.f58255x, this.f58256y, this.f58257z, continuation);
        c0Var.f58252u = obj;
        return c0Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((c0) create((v2.x) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f58251t;
        if (i5 == 0) {
            ResultKt.b(obj);
            b0 b0Var = new b0((v2.x) this.f58252u, this.f58253v, this.f58254w, this.f58255x, this.f58256y, this.f58257z, null);
            this.f58251t = 1;
            if (t70.k0.d(b0Var, this) == coroutineSingletons) {
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
