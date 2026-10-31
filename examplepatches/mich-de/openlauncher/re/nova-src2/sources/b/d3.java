package b;

import ads_mobile_sdk.mu0;
import ads_mobile_sdk.tx0;
import java.util.Map;
import kotlin.Unit;
import kotlin.coroutines.Continuation;

/* loaded from: classes2.dex */
public final class d3 implements gb {
    @Override // b.gb
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        cz.b bVar = mu0.f7335a;
        mu0.b("Received log message: " + map.get("string"), null);
        return Unit.f71706a;
    }

    @Override // b.gb
    public final int b() {
        return 29;
    }
}
