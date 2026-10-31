package ads_mobile_sdk;

import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class nt2 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final b.c7 f7675a;

    public nt2(b.c7 refreshListener) {
        Intrinsics.g(refreshListener, "refreshListener");
        this.f7675a = refreshListener;
    }

    @Override // b.gb
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        Object objB;
        String str = (String) map.get("action");
        boolean zEquals = "pause".equals(str);
        b.c7 c7Var = this.f7675a;
        if (!zEquals) {
            return ("resume".equals(str) && (objB = c7Var.b(true, continuation)) == CoroutineSingletons.f71806a) ? objB : Unit.f71706a;
        }
        Object objA = c7Var.a(true, continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    @Override // b.gb
    public final int b() {
        return 7;
    }
}
