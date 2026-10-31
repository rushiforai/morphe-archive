package jr;

import com.stripe.android.core.exception.StripeException;
import com.stripe.android.customersheet.CustomerSheet$Configuration;
import hv.g3;
import java.io.Serializable;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes4.dex */
public final class t0 implements f {

    /* renamed from: a, reason: collision with root package name */
    public final q.c f69739a;

    /* renamed from: b, reason: collision with root package name */
    public final fl.l f69740b;

    /* renamed from: c, reason: collision with root package name */
    public final iu.f f69741c;

    /* renamed from: d, reason: collision with root package name */
    public final CoroutineContext f69742d;

    public t0(bs.a googlePayRepositoryFactory, mu.a isFinancialConnectionsAvailable, bt.f lpmRepository, fl.l eventReporter, iu.f errorReporter, CoroutineContext workContext) {
        Intrinsics.g(googlePayRepositoryFactory, "googlePayRepositoryFactory");
        Intrinsics.g(isFinancialConnectionsAvailable, "isFinancialConnectionsAvailable");
        Intrinsics.g(lpmRepository, "lpmRepository");
        Intrinsics.g(eventReporter, "eventReporter");
        Intrinsics.g(errorReporter, "errorReporter");
        Intrinsics.g(workContext, "workContext");
        q.c cVarA = qq.c.a(or.a.f80619a);
        qq.c.a(or.a.f80622d);
        this.f69739a = cVarA;
        this.f69740b = eventReporter;
        this.f69741c = errorReporter;
        this.f69742d = workContext;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0074 A[Catch: all -> 0x0059, TryCatch #2 {all -> 0x0059, blocks: (B:28:0x0051, B:37:0x006f, B:39:0x0074, B:40:0x007a), top: B:66:0x0051 }] */
    /* JADX WARN: Removed duplicated region for block: B:62:0x007b A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r7v1 */
    /* JADX WARN: Type inference failed for: r7v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Serializable a(CustomerSheet$Configuration customerSheet$Configuration, ContinuationImpl continuationImpl) {
        r0 r0Var;
        Object objB;
        t0 t0Var;
        CustomerSheet$Configuration customerSheet$Configuration2;
        if (continuationImpl instanceof r0) {
            r0Var = (r0) continuationImpl;
            int i5 = r0Var.f69733x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                r0Var.f69733x = i5 - Integer.MIN_VALUE;
            } else {
                r0Var = new r0(this, continuationImpl);
            }
        }
        Object obj = r0Var.f69731v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = r0Var.f69733x;
        if (i11 == 0) {
            ResultKt.b(obj);
            try {
                int i12 = Result.f71687b;
                r0Var.f69729t = this;
                r0Var.f69730u = customerSheet$Configuration;
                r0Var.f69733x = 1;
                objB = b(r0Var);
                if (objB == coroutineSingletons) {
                    return coroutineSingletons;
                }
                t0Var = this;
                customerSheet$Configuration2 = customerSheet$Configuration;
                ResultKt.b(objB);
                if (objB != null) {
                }
            } catch (Throwable th2) {
                th = th2;
                customerSheet$Configuration = this;
            }
        } else if (i11 != 1) {
            try {
                if (i11 == 2) {
                    t0 t0Var2 = r0Var.f69729t;
                    ResultKt.b(obj);
                    if (obj == null) {
                        throw null;
                    }
                    throw new ClassCastException();
                }
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                t0 t0Var3 = r0Var.f69729t;
                ResultKt.b(obj);
                t0Var3.getClass();
                throw null;
            } catch (Throwable th3) {
                th = th3;
            }
        } else {
            CustomerSheet$Configuration customerSheet$Configuration3 = r0Var.f69730u;
            t0Var = r0Var.f69729t;
            try {
                ResultKt.b(obj);
                objB = ((Result) obj).f71688a;
                customerSheet$Configuration2 = customerSheet$Configuration3;
                ResultKt.b(objB);
                if (objB != null) {
                    r0Var.f69729t = t0Var;
                    r0Var.f69730u = customerSheet$Configuration2;
                    r0Var.f69733x = 2;
                    throw null;
                }
                try {
                    throw new ClassCastException();
                } catch (Throwable th4) {
                    th = th4;
                }
            } catch (Throwable th5) {
                th = th5;
            }
        }
        customerSheet$Configuration = t0Var;
        int i13 = Result.f71687b;
        Object objA = ResultKt.a(th);
        Throwable thA = Result.a(objA);
        if (thA != null) {
            fl.l lVar = customerSheet$Configuration.f69740b;
            lVar.getClass();
            lVar.m(new kr.c(thA));
            return ResultKt.a(thA);
        }
        Pair pair = (Pair) objA;
        if (pair.f71683a != null) {
            throw new ClassCastException();
        }
        if (pair.f71684b != null) {
            throw new ClassCastException();
        }
        customerSheet$Configuration.f69740b.getClass();
        Intrinsics.g(null, "customerSheetSession");
        throw null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) {
        s0 s0Var;
        Object objB;
        t0 t0Var;
        if (continuationImpl instanceof s0) {
            s0Var = (s0) continuationImpl;
            int i5 = s0Var.f69737w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                s0Var.f69737w = i5 - Integer.MIN_VALUE;
            } else {
                s0Var = new s0(this, continuationImpl);
            }
        }
        Object obj = s0Var.f69735u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = s0Var.f69737w;
        if (i11 == 0) {
            ResultKt.b(obj);
            Duration.Companion companion = Duration.f72038b;
            long jG = DurationKt.g(5, DurationUnit.f72046e);
            g3 g3Var = new g3(19);
            s0Var.f69734t = this;
            s0Var.f69737w = 1;
            objB = qq.c.b(this.f69739a, jG, g3Var, s0Var);
            if (objB == coroutineSingletons) {
                return coroutineSingletons;
            }
            t0Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            t0Var = s0Var.f69734t;
            ResultKt.b(obj);
            objB = ((Result) obj).f71688a;
        }
        Throwable thA = Result.a(objB);
        if (thA != null) {
            iu.f fVar = t0Var.f69741c;
            iu.c cVar = iu.c.f68056g;
            int i12 = StripeException.f42562e;
            t2.c.L(fVar, cVar, p6.u.i(thA), null, 4);
        }
        return objB;
    }
}
