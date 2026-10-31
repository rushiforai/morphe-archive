package ads_mobile_sdk;

import b.ba;
import b.r5;
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

/* loaded from: classes2.dex */
public final class is3 extends c3.b implements r5, ba {

    /* renamed from: c, reason: collision with root package name */
    public final d f4930c;

    /* renamed from: d, reason: collision with root package name */
    public qo3 f4931d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public is3(t70.j0 uiScope, Map listeners) {
        super(uiScope, listeners);
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(listeners, "listeners");
        this.f4930c = new d();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(is3 is3Var, qo3 qo3Var, ContinuationImpl continuationImpl) {
        gs3 gs3Var;
        d dVar;
        if (continuationImpl instanceof gs3) {
            gs3Var = (gs3) continuationImpl;
            int i5 = gs3Var.f4057f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gs3Var.f4057f = i5 - Integer.MIN_VALUE;
            } else {
                gs3Var = new gs3(is3Var, continuationImpl);
            }
        }
        Object obj = gs3Var.f4055d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gs3Var.f4057f;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = is3Var.f4930c;
            gs3Var.f4052a = is3Var;
            gs3Var.f4053b = qo3Var;
            gs3Var.f4054c = dVar;
            gs3Var.f4057f = 1;
            if (dVar.e(gs3Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = gs3Var.f4054c;
            qo3Var = gs3Var.f4053b;
            is3 is3Var2 = gs3Var.f4052a;
            ResultKt.b(obj);
            dVar = dVar2;
            is3Var = is3Var2;
        }
        qo3 qo3Var2 = qo3Var;
        Continuation continuation = null;
        try {
            qo3 qo3Var3 = is3Var.f4931d;
            if (qo3Var3 != null && Intrinsics.b(qo3Var2, qo3Var3)) {
                Unit unit = Unit.f71706a;
                dVar.g(null);
                return unit;
            }
            is3Var.f4931d = qo3Var2;
            for (Map.Entry entry : ((Map) is3Var.f19223b).entrySet()) {
                String str = (String) entry.getKey();
                Object value = entry.getValue();
                t70.j0 j0Var = (t70.j0) is3Var.f19222a;
                y9 y9Var = new y9(str, value, continuation, qo3Var2, 1);
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

    @Override // b.r5
    public final Object b(qo3 qo3Var, Continuation continuation) {
        return a(this, qo3Var, (ContinuationImpl) continuation);
    }

    @Override // b.ba
    public final Object c(qo3 qo3Var, SuspendLambda suspendLambda) {
        Object objA = a(this, qo3Var, suspendLambda);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }
}
