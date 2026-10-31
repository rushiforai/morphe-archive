package g0;

import java.util.ArrayList;
import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class x1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f56761t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ long f56762u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f56763v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x1(long j11, Continuation continuation) {
        super(2, continuation);
        this.f56761t = 0;
        this.f56762u = j11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f56761t) {
            case 0:
                x1 x1Var = new x1(this.f56762u, continuation);
                x1Var.f56763v = obj;
                return x1Var;
            case 1:
                x1 x1Var2 = new x1((p10.o0) this.f56763v, continuation, 1);
                x1Var2.f56762u = ((Number) obj).longValue();
                return x1Var2;
            default:
                x1 x1Var3 = new x1((p10.c2) this.f56763v, continuation, 2);
                x1Var3.f56762u = ((Number) obj).longValue();
                return x1Var3;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f56761t) {
            case 0:
                return ((x1) create((f2) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 1:
                return ((x1) create(Long.valueOf(((Number) obj).longValue()), (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            default:
                return ((x1) create(Long.valueOf(((Number) obj).longValue()), (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Object value;
        switch (this.f56761t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                f2 f2Var = (f2) this.f56763v;
                long j11 = this.f56762u;
                h2 h2Var = f2Var.f56522a;
                h2Var.c(h2Var.f56567k, j11, 1);
                break;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                long j12 = this.f56762u;
                w70.i2 i2Var = ((p10.o0) this.f56763v).f81862f;
                do {
                    value = i2Var.getValue();
                } while (!i2Var.i(value, p10.m0.a((p10.m0) value, j12, 0L, 0L, 0, 0L, 0, null, 254)));
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                long j13 = this.f56762u;
                p10.c2 c2Var = (p10.c2) this.f56763v;
                w70.i2 i2Var2 = c2Var.f81734k;
                p10.a2 a2Var = (p10.a2) i2Var2.getValue();
                List<p10.t0> list = c2Var.f81726c;
                ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
                for (p10.t0 t0Var : list) {
                    arrayList.add(new p10.u0(t0Var, j13 >= t0Var.f81916c));
                }
                p10.a2 a2VarA = p10.a2.a(a2Var, j13, false, 0L, false, 0L, 0L, 0, arrayList, 0, false, 0, null, 3966);
                i2Var2.getClass();
                i2Var2.k(null, a2VarA);
                break;
        }
        return Unit.f71706a;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ x1(Object obj, Continuation continuation, int i5) {
        super(2, continuation);
        this.f56761t = i5;
        this.f56763v = obj;
    }
}
