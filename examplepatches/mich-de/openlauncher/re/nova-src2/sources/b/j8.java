package b;

import ads_mobile_sdk.au0;
import ads_mobile_sdk.gn1;
import java.util.Collections;
import java.util.Map;

/* loaded from: classes2.dex */
public final class j8 extends au0 {
    public j8() {
        super(ads_mobile_sdk.qa.DEFAULT_INSTANCE);
    }

    public final void c(String str, String str2) {
        b();
        ads_mobile_sdk.qa qaVar = (ads_mobile_sdk.qa) this.f1095b;
        gn1 gn1Var = qaVar.extras_;
        if (!gn1Var.f4009a) {
            qaVar.extras_ = gn1Var.b();
        }
        qaVar.extras_.put(str, str2);
    }

    public final Map d() {
        return Collections.unmodifiableMap(Collections.unmodifiableMap(((ads_mobile_sdk.qa) this.f1095b).extras_));
    }
}
