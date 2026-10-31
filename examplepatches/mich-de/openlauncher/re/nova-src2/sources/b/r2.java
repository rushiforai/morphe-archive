package b;

import ads_mobile_sdk.au0;
import ads_mobile_sdk.vr0;
import java.util.Collections;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes.dex */
public final class r2 extends au0 {
    public final void c(String str) {
        Objects.requireNonNull(str);
        b();
        ((ads_mobile_sdk.g1) this.f1095b).s().remove(str);
    }

    public final void d(String str, vr0 vr0Var) {
        Objects.requireNonNull(str);
        b();
        ((ads_mobile_sdk.g1) this.f1095b).s().put(str, vr0Var);
    }

    public final Map e() {
        return Collections.unmodifiableMap(Collections.unmodifiableMap(((ads_mobile_sdk.g1) this.f1095b).pools_));
    }
}
