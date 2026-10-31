package ads_mobile_sdk;

import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.Continuation;

/* loaded from: classes.dex */
public final class i71 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final uk f4656a;

    public i71(uk ukVar) {
        this.f4656a = ukVar;
    }

    @Override // b.gb
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        String str = (String) map.get("disabled");
        this.f4656a.f10382a.set(!(str != null && Boolean.parseBoolean(str)));
        return Unit.f71706a;
    }

    @Override // b.gb
    public final int b() {
        return 18;
    }
}
