package b;

import ads_mobile_sdk.d33;
import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class f9 extends c3.b implements ka {
    @Override // b.ka
    public final Object a(d33 d33Var, Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            d33 d33Var2 = d33Var;
            b0.b0 b0Var = new b0.b0(str, value, (Continuation) null, d33Var2, 10);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            t70.m0.t(j0Var, context, null, new ar.a(b0Var, null), 2);
            d33Var = d33Var2;
        }
        return Unit.f71706a;
    }

    @Override // b.ka
    public final Object b(Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            ads_mobile_sdk.i2 i2Var = new ads_mobile_sdk.i2(str, value, null, 9);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            t70.m0.t(j0Var, context, null, new ar.a(i2Var, null), 2);
        }
        return Unit.f71706a;
    }

    @Override // b.ka
    public final Unit f() {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            ads_mobile_sdk.i2 i2Var = new ads_mobile_sdk.i2(str, value, null, 12);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            t70.m0.t(j0Var, context, null, new ar.a(i2Var, null), 2);
        }
        return Unit.f71706a;
    }

    @Override // b.ka
    public final Object a(Map map, Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            Map map2 = map;
            b0.b0 b0Var = new b0.b0(str, value, (Continuation) null, map2, 12);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            t70.m0.t(j0Var, context, null, new ar.a(b0Var, null), 2);
            map = map2;
        }
        return Unit.f71706a;
    }

    @Override // b.ka
    public final Object a(ni.q qVar, Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            ni.q qVar2 = qVar;
            androidx.room.q qVar3 = new androidx.room.q(str, value, (Continuation) null, qVar2, 10);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            t70.m0.t(j0Var, context, null, new ar.a(qVar3, null), 2);
            qVar = qVar2;
        }
        return Unit.f71706a;
    }
}
