package fr;

import com.stripe.android.core.StripeError;
import com.stripe.android.core.exception.APIConnectionException;
import com.stripe.android.core.exception.APIException;
import com.stripe.android.core.model.StripeModel;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public abstract class h0 {
    public static final APIException a(dr.a aVar, u0 u0Var) throws APIException {
        JSONObject jSONObjectD = u.d(u0Var);
        aVar.getClass();
        StripeError stripeErrorB = dr.a.b(jSONObjectD);
        m0 m0Var = u0Var.f55710f;
        return new APIException(u0Var.f55705a, 24, stripeErrorB, m0Var != null ? m0Var.f55664a : null, null, null);
    }

    public static final APIConnectionException b(t0 t0Var, Throwable th2) {
        return new APIConnectionException("Failed to execute " + t0Var, th2);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object c(cw.r rVar, dr.a aVar, i iVar, ContinuationImpl continuationImpl) {
        e0 e0Var;
        Object objA;
        if (continuationImpl instanceof e0) {
            e0Var = (e0) continuationImpl;
            int i5 = e0Var.f55603w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                e0Var.f55603w = i5 - Integer.MIN_VALUE;
            } else {
                e0Var = new e0(continuationImpl);
            }
        }
        Object objR = e0Var.f55602v;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = e0Var.f55603w;
        try {
            if (i11 == 0) {
                ResultKt.b(objR);
                int i12 = Result.f71687b;
                e0Var.f55600t = aVar;
                e0Var.f55601u = iVar;
                e0Var.f55603w = 1;
                objR = rVar.r(iVar, e0Var);
                if (objR == obj) {
                    return obj;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                iVar = e0Var.f55601u;
                aVar = e0Var.f55600t;
                ResultKt.b(objR);
            }
            objA = (u0) objR;
            int i13 = Result.f71687b;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            return ResultKt.a(b(iVar, thA));
        }
        u0 u0Var = (u0) objA;
        return u0Var.f55709e ? ResultKt.a(a(aVar, u0Var)) : Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object d(cw.r rVar, dr.a aVar, i iVar, dr.b bVar, ContinuationImpl continuationImpl) throws APIConnectionException, APIException {
        f0 f0Var;
        Object objA;
        if (continuationImpl instanceof f0) {
            f0Var = (f0) continuationImpl;
            int i5 = f0Var.f55610x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                f0Var.f55610x = i5 - Integer.MIN_VALUE;
            } else {
                f0Var = new f0(continuationImpl);
            }
        }
        Object objR = f0Var.f55609w;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = f0Var.f55610x;
        try {
            if (i11 == 0) {
                ResultKt.b(objR);
                int i12 = Result.f71687b;
                f0Var.f55606t = aVar;
                f0Var.f55607u = iVar;
                f0Var.f55608v = bVar;
                f0Var.f55610x = 1;
                objR = rVar.r(iVar, f0Var);
                if (objR == obj) {
                    return obj;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                bVar = f0Var.f55608v;
                iVar = f0Var.f55607u;
                aVar = f0Var.f55606t;
                ResultKt.b(objR);
            }
            objA = (u0) objR;
            int i13 = Result.f71687b;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            throw b(iVar, thA);
        }
        u0 u0Var = (u0) objA;
        if (u0Var.f55709e) {
            throw a(aVar, u0Var);
        }
        StripeModel stripeModelS = bVar.s(u.d(u0Var));
        if (stripeModelS != null) {
            return stripeModelS;
        }
        throw new APIException(0, 23, null, null, bVar + " returns null for " + u.d(u0Var), null);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object e(cw.r rVar, dr.a aVar, i iVar, dr.b bVar, ContinuationImpl continuationImpl) throws APIException {
        g0 g0Var;
        Object objA;
        Object objA2;
        if (continuationImpl instanceof g0) {
            g0Var = (g0) continuationImpl;
            int i5 = g0Var.f55627x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                g0Var.f55627x = i5 - Integer.MIN_VALUE;
            } else {
                g0Var = new g0(continuationImpl);
            }
        }
        Object objR = g0Var.f55626w;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = g0Var.f55627x;
        try {
            if (i11 == 0) {
                ResultKt.b(objR);
                int i12 = Result.f71687b;
                g0Var.f55623t = aVar;
                g0Var.f55624u = iVar;
                g0Var.f55625v = bVar;
                g0Var.f55627x = 1;
                objR = rVar.r(iVar, g0Var);
                if (objR == obj) {
                    return obj;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                bVar = g0Var.f55625v;
                iVar = g0Var.f55624u;
                aVar = g0Var.f55623t;
                ResultKt.b(objR);
            }
            objA = (u0) objR;
            int i13 = Result.f71687b;
        } catch (Throwable th2) {
            int i14 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            return ResultKt.a(b(iVar, thA));
        }
        u0 u0Var = (u0) objA;
        if (u0Var.f55709e) {
            return ResultKt.a(a(aVar, u0Var));
        }
        try {
            objA2 = bVar.s(u.d(u0Var));
        } catch (Throwable th3) {
            int i15 = Result.f71687b;
            objA2 = ResultKt.a(th3);
        }
        if (objA2 instanceof Result.Failure) {
            objA2 = null;
        }
        StripeModel stripeModel = (StripeModel) objA2;
        if (stripeModel != null) {
            return stripeModel;
        }
        return ResultKt.a(new APIException(0, 23, null, null, bVar + " returns null for " + u.d(u0Var), null));
    }
}
