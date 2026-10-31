package ads_mobile_sdk;

import b.b0;
import c80.d;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

/* loaded from: classes2.dex */
public final class ja extends c3.b implements b0 {

    /* renamed from: c, reason: collision with root package name */
    public final d f5193c;

    /* renamed from: d, reason: collision with root package name */
    public Boolean f5194d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ja(t70.j0 uiScope, Map listeners) {
        super(uiScope, listeners);
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(listeners, "listeners");
        this.f5193c = new d();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.b0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(qo3 qo3Var, Continuation continuation) {
        ga gaVar;
        d dVar;
        ja jaVar;
        if (continuation instanceof ga) {
            gaVar = (ga) continuation;
            int i5 = gaVar.f3746f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gaVar.f3746f = i5 - Integer.MIN_VALUE;
            } else {
                gaVar = new ga(this, (ContinuationImpl) continuation);
            }
        }
        Object obj = gaVar.f3744d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gaVar.f3746f;
        if (i11 == 0) {
            ResultKt.b(obj);
            gaVar.f3741a = this;
            gaVar.f3742b = qo3Var;
            dVar = this.f5193c;
            gaVar.f3743c = dVar;
            gaVar.f3746f = 1;
            if (dVar.e(gaVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            jaVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = gaVar.f3743c;
            qo3 qo3Var2 = gaVar.f3742b;
            jaVar = gaVar.f3741a;
            ResultKt.b(obj);
            dVar = dVar2;
            qo3Var = qo3Var2;
        }
        Continuation continuation2 = null;
        try {
            boolean z11 = qo3Var.f8763b;
            if (z11 && !Intrinsics.b(jaVar.f5194d, Boolean.TRUE)) {
                for (Map.Entry entry : ((Map) jaVar.f19223b).entrySet()) {
                    String str = (String) entry.getKey();
                    Object value = entry.getValue();
                    t70.j0 j0Var = (t70.j0) jaVar.f19222a;
                    r10.r rVar = new r10.r(str, value, continuation2, 1);
                    EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var, "<this>");
                    Intrinsics.g(context, "context");
                    m0.t(j0Var, context, null, new ar.a(rVar, null), 2);
                }
            } else if (!z11 && !Intrinsics.b(jaVar.f5194d, Boolean.FALSE)) {
                for (Map.Entry entry2 : ((Map) jaVar.f19223b).entrySet()) {
                    String str2 = (String) entry2.getKey();
                    Object value2 = entry2.getValue();
                    t70.j0 j0Var2 = (t70.j0) jaVar.f19222a;
                    i2 i2Var = new i2(str2, value2, continuation2, 1);
                    EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var2, "<this>");
                    Intrinsics.g(context2, "context");
                    m0.t(j0Var2, context2, null, new ar.a(i2Var, null), 2);
                }
            }
            jaVar.f5194d = Boolean.valueOf(z11);
            Unit unit = Unit.f71706a;
            dVar.g(null);
            return unit;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }
}
