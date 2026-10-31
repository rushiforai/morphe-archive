package w70;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;

/* loaded from: classes.dex */
public final class e2 extends SuspendLambda implements Function3 {

    /* renamed from: t, reason: collision with root package name */
    public int f93889t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ n f93890u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ int f93891v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ f2 f93892w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e2(f2 f2Var, Continuation continuation) {
        super(3, continuation);
        this.f93892w = f2Var;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        int iIntValue = ((Number) obj2).intValue();
        e2 e2Var = new e2(this.f93892w, (Continuation) obj3);
        e2Var.f93890u = (n) obj;
        e2Var.f93891v = iIntValue;
        return e2Var.invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0045, code lost:
    
        if (r1.emit(r9, r8) == r0) goto L32;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x007f, code lost:
    
        if (r1.emit(r9, r8) != r0) goto L33;
     */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0064 A[PHI: r1
      0x0064: PHI (r1v3 w70.n) = (r1v2 w70.n), (r1v6 w70.n) binds: [B:25:0x0061, B:13:0x0024] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0074 A[PHI: r1
      0x0074: PHI (r1v4 w70.n) = (r1v3 w70.n), (r1v7 w70.n) binds: [B:28:0x0071, B:12:0x001e] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        n nVar;
        w1 w1Var;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f93889t;
        if (i5 == 0) {
            ResultKt.b(obj);
            nVar = this.f93890u;
            if (this.f93891v > 0) {
                w1 w1Var2 = w1.f94061a;
                this.f93889t = 1;
            } else {
                long j11 = this.f93892w.f93899a;
                this.f93890u = nVar;
                this.f93889t = 2;
                if (t70.t0.b(j11, this) != coroutineSingletons) {
                    w1Var = w1.f94062b;
                    this.f93890u = nVar;
                    this.f93889t = 3;
                    if (nVar.emit(w1Var, this) != coroutineSingletons) {
                    }
                }
            }
            return coroutineSingletons;
        }
        if (i5 != 1) {
            if (i5 == 2) {
                nVar = this.f93890u;
                ResultKt.b(obj);
                w1Var = w1.f94062b;
                this.f93890u = nVar;
                this.f93889t = 3;
                if (nVar.emit(w1Var, this) != coroutineSingletons) {
                    this.f93890u = nVar;
                    this.f93889t = 4;
                    if (t70.t0.b(Long.MAX_VALUE, this) != coroutineSingletons) {
                    }
                }
                return coroutineSingletons;
            }
            if (i5 == 3) {
                nVar = this.f93890u;
                ResultKt.b(obj);
                this.f93890u = nVar;
                this.f93889t = 4;
                if (t70.t0.b(Long.MAX_VALUE, this) != coroutineSingletons) {
                    w1 w1Var3 = w1.f94063c;
                    this.f93890u = null;
                    this.f93889t = 5;
                }
                return coroutineSingletons;
            }
            if (i5 == 4) {
                nVar = this.f93890u;
                ResultKt.b(obj);
                w1 w1Var32 = w1.f94063c;
                this.f93890u = null;
                this.f93889t = 5;
            } else if (i5 != 5) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
        ResultKt.b(obj);
        return Unit.f71706a;
    }
}
