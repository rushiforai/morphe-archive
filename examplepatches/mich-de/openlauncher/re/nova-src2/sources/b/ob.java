package b;

import ads_mobile_sdk.au0;
import ads_mobile_sdk.vr0;
import java.util.Collections;
import java.util.Map;
import java.util.Objects;

/* loaded from: classes2.dex */
public final class ob extends au0 {
    public final void c(String str) {
        Objects.requireNonNull(str);
        b();
        ((vr0) this.f1095b).q().remove(str);
    }

    public final void d(String str, ads_mobile_sdk.g6 g6Var) {
        Objects.requireNonNull(str);
        b();
        ((vr0) this.f1095b).q().put(str, g6Var);
    }

    public final Map e() {
        return Collections.unmodifiableMap(Collections.unmodifiableMap(((vr0) this.f1095b).adResponseLists_));
    }
}
