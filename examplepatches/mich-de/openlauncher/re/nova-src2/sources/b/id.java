package b;

import ads_mobile_sdk.a70;
import ads_mobile_sdk.au0;
import ads_mobile_sdk.gn1;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes2.dex */
public final class id extends au0 {
    public final void c(Map map) {
        b();
        a70 a70Var = (a70) this.f1095b;
        gn1 gn1Var = a70Var.concatenatedSignalsMap_;
        if (!gn1Var.f4009a) {
            a70Var.concatenatedSignalsMap_ = gn1Var.b();
        }
        a70Var.concatenatedSignalsMap_.putAll(map);
    }

    public final Map d() {
        return Collections.unmodifiableMap(Collections.unmodifiableMap(((a70) this.f1095b).concatenatedSignalsMap_));
    }
}
