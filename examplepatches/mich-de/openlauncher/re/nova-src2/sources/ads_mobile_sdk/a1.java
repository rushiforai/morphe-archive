package ads_mobile_sdk;

import b.p0;
import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a1 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final p0 f795a;

    public a1(p0 backButtonStateDelegate) {
        Intrinsics.g(backButtonStateDelegate, "backButtonStateDelegate");
        this.f795a = backButtonStateDelegate;
    }

    @Override // b.gb
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        String str = (String) map.get("disabled");
        this.f795a.f10382a.set(!(str != null && Boolean.parseBoolean(str)));
        return Unit.f71706a;
    }

    @Override // b.gb
    public final int b() {
        return 18;
    }
}
