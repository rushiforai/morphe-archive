package gy;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class z extends SuspendLambda implements Function2 {
    public final /* synthetic */ p1.e1 A;

    /* renamed from: t, reason: collision with root package name */
    public long f58616t;

    /* renamed from: u, reason: collision with root package name */
    public int f58617u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ long f58618v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ boolean f58619w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ v2.t f58620x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ float f58621y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ long f58622z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z(long j11, boolean z11, v2.t tVar, float f11, long j12, p1.e1 e1Var, Continuation continuation) {
        super(2, continuation);
        this.f58618v = j11;
        this.f58619w = z11;
        this.f58620x = tVar;
        this.f58621y = f11;
        this.f58622z = j12;
        this.A = e1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new z(this.f58618v, this.f58619w, this.f58620x, this.f58621y, this.f58622z, this.A, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((z) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0020  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0048  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:14:0x002e -> B:16:0x0031). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        long j11;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f58617u;
        if (i5 == 0) {
            ResultKt.b(obj);
            j11 = this.f58618v;
            if (this.f58619w) {
            }
            return Unit.f71706a;
        }
        if (i5 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        j11 = this.f58616t;
        ResultKt.b(obj);
        ((Function0) this.A.getValue()).invoke();
        float f11 = j11;
        j11 = (long) (f11 - (this.f58621y * f11));
        long j12 = this.f58622z;
        if (j11 < j12) {
            j11 = j12;
        }
        if (this.f58619w || !this.f58620x.f91993d) {
            return Unit.f71706a;
        }
        this.f58616t = j11;
        this.f58617u = 1;
        if (t70.t0.b(j11, this) == coroutineSingletons) {
            return coroutineSingletons;
        }
        ((Function0) this.A.getValue()).invoke();
        float f112 = j11;
        j11 = (long) (f112 - (this.f58621y * f112));
        long j122 = this.f58622z;
        if (j11 < j122) {
        }
        if (this.f58619w) {
        }
        return Unit.f71706a;
    }
}
