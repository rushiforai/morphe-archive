package g0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class e2 extends SuspendLambda implements Function2 {
    public final /* synthetic */ long A;

    /* renamed from: t, reason: collision with root package name */
    public h2 f56505t;

    /* renamed from: u, reason: collision with root package name */
    public Ref.LongRef f56506u;

    /* renamed from: v, reason: collision with root package name */
    public long f56507v;

    /* renamed from: w, reason: collision with root package name */
    public int f56508w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f56509x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ h2 f56510y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ Ref.LongRef f56511z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e2(h2 h2Var, Ref.LongRef longRef, long j11, Continuation continuation) {
        super(2, continuation);
        this.f56510y = h2Var;
        this.f56511z = longRef;
        this.A = j11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        e2 e2Var = new e2(this.f56510y, this.f56511z, this.A, continuation);
        e2Var.f56509x = obj;
        return e2Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((e2) create((f2) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        h2 h2Var;
        Ref.LongRef longRef;
        long j11;
        h2 h2Var2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f56508w;
        if (i5 == 0) {
            ResultKt.b(obj);
            f2 f2Var = (f2) this.f56509x;
            h2Var = this.f56510y;
            d2 d2Var = new d2(h2Var, f2Var);
            m0 m0Var = h2Var.f56559c;
            longRef = this.f56511z;
            long j12 = longRef.f71862a;
            d1 d1Var = h2Var.f56560d;
            d1 d1Var2 = d1.f56494b;
            long j13 = this.A;
            float fD = h2Var.d(d1Var == d1Var2 ? y3.r.d(j13) : y3.r.e(j13));
            this.f56509x = h2Var;
            this.f56505t = h2Var;
            this.f56506u = longRef;
            this.f56507v = j12;
            this.f56508w = 1;
            obj = m0Var.a(d2Var, fD, this);
            if (obj == coroutineSingletons) {
                return coroutineSingletons;
            }
            j11 = j12;
            h2Var2 = h2Var;
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            j11 = this.f56507v;
            longRef = this.f56506u;
            h2Var = this.f56505t;
            h2Var2 = (h2) this.f56509x;
            ResultKt.b(obj);
        }
        float fD2 = h2Var2.d(((Number) obj).floatValue());
        longRef.f71862a = h2Var.f56560d == d1.f56494b ? y3.r.b(j11, fD2, 0.0f, 2) : y3.r.b(j11, 0.0f, fD2, 1);
        return Unit.f71706a;
    }
}
