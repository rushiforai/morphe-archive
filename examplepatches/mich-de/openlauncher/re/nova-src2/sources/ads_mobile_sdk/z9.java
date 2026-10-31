package ads_mobile_sdk;

import b.b0;
import b.ba;
import c80.d;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes.dex */
public final class z9 extends c3.b implements b0, ba {

    /* renamed from: c, reason: collision with root package name */
    public final d f12483c;

    /* renamed from: d, reason: collision with root package name */
    public qo3 f12484d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z9(t70.j0 uiScope, Map listeners) {
        super(uiScope, listeners);
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(listeners, "listeners");
        this.f12483c = new d();
    }

    @Override // b.b0
    public final Object a(qo3 qo3Var, Continuation continuation) {
        return a(this, qo3Var, (ContinuationImpl) continuation);
    }

    @Override // b.ba
    public final Object c(qo3 qo3Var, SuspendLambda suspendLambda) {
        Object objA = a(this, qo3Var, suspendLambda);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(z9 z9Var, qo3 qo3Var, ContinuationImpl continuationImpl) {
        x9 x9Var;
        d dVar;
        if (continuationImpl instanceof x9) {
            x9Var = (x9) continuationImpl;
            int i5 = x9Var.f11645f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                x9Var.f11645f = i5 - Integer.MIN_VALUE;
            } else {
                x9Var = new x9(z9Var, continuationImpl);
            }
        }
        Object obj = x9Var.f11643d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = x9Var.f11645f;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = z9Var.f12483c;
            x9Var.f11640a = z9Var;
            x9Var.f11641b = qo3Var;
            x9Var.f11642c = dVar;
            x9Var.f11645f = 1;
            if (dVar.e(x9Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = x9Var.f11642c;
            qo3Var = x9Var.f11641b;
            z9 z9Var2 = x9Var.f11640a;
            ResultKt.b(obj);
            dVar = dVar2;
            z9Var = z9Var2;
        }
        qo3 qo3Var2 = qo3Var;
        Continuation continuation = null;
        try {
            qo3 qo3Var3 = z9Var.f12484d;
            if (qo3Var3 != null && Intrinsics.b(qo3Var2, qo3Var3)) {
                Unit unit = Unit.f71706a;
                dVar.g(null);
                return unit;
            }
            z9Var.f12484d = qo3Var2;
            for (Map.Entry entry : ((Map) z9Var.f19223b).entrySet()) {
                String str = (String) entry.getKey();
                Object value = entry.getValue();
                t70.j0 j0Var = (t70.j0) z9Var.f19222a;
                y9 y9Var = new y9(str, value, continuation, qo3Var2, 0);
                EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                Intrinsics.g(j0Var, "<this>");
                Intrinsics.g(context, "context");
                m0.t(j0Var, context, null, new ar.a(y9Var, null), 2);
            }
            Unit unit2 = Unit.f71706a;
            dVar.g(null);
            return unit2;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }
}
