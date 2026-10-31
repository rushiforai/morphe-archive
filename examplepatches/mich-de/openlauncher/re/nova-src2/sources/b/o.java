package b;

import ads_mobile_sdk.d33;
import ads_mobile_sdk.pu0;
import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class o extends c3.b implements r0 {
    @Override // b.r0
    public final Object a(pu0 pu0Var, ni.g0 g0Var, Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            pu0 pu0Var2 = pu0Var;
            ni.g0 g0Var2 = g0Var;
            androidx.room.p pVar = new androidx.room.p(str, value, (Continuation) null, pu0Var2, g0Var2);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            t70.m0.t(j0Var, context, null, new ar.a(pVar, null), 2);
            pu0Var = pu0Var2;
            g0Var = g0Var2;
        }
        return Unit.f71706a;
    }

    @Override // b.r0
    public final Object a(d33 d33Var, ads_mobile_sdk.z1 z1Var, ni.g0 g0Var, Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            d33 d33Var2 = d33Var;
            ads_mobile_sdk.z1 z1Var2 = z1Var;
            ni.g0 g0Var2 = g0Var;
            c0.b1 b1Var = new c0.b1(str, value, (Continuation) null, d33Var2, z1Var2, g0Var2);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            t70.m0.t(j0Var, context, null, new ar.a(b1Var, null), 2);
            d33Var = d33Var2;
            z1Var = z1Var2;
            g0Var = g0Var2;
        }
        return Unit.f71706a;
    }
}
