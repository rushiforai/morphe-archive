package b;

import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class y7 extends c3.b implements m9 {
    @Override // b.m9
    public final Object c(Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            ads_mobile_sdk.i2 i2Var = new ads_mobile_sdk.i2(str, value, null, 10);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            t70.m0.t(j0Var, context, null, new ar.a(i2Var, null), 2);
        }
        return Unit.f71706a;
    }

    @Override // b.m9
    public final Unit d(Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            ads_mobile_sdk.i2 i2Var = new ads_mobile_sdk.i2(str, value, null, 6);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            t70.m0.t(j0Var, context, null, new ar.a(i2Var, null), 2);
        }
        return Unit.f71706a;
    }

    @Override // b.m9
    public final Unit h(Continuation continuation) {
        for (Map.Entry entry : ((Map) this.f19223b).entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            t70.j0 j0Var = (t70.j0) this.f19222a;
            ads_mobile_sdk.i2 i2Var = new ads_mobile_sdk.i2(str, value, null, 7);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            t70.m0.t(j0Var, context, null, new ar.a(i2Var, null), 2);
        }
        return Unit.f71706a;
    }
}
