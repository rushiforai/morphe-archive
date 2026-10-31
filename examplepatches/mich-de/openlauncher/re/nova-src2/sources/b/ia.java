package b;

import ads_mobile_sdk.au0;
import java.util.Collections;
import java.util.List;
import java.util.Set;

/* loaded from: classes2.dex */
public final class ia extends au0 {
    public ia() {
        super(ads_mobile_sdk.ta.DEFAULT_INSTANCE);
    }

    public final void c(Set set) {
        b();
        ads_mobile_sdk.ta taVar = (ads_mobile_sdk.ta) this.f1095b;
        e9 e9Var = taVar.initializedAdapterClasses_;
        if (!((ads_mobile_sdk.j) e9Var).f5068a) {
            taVar.initializedAdapterClasses_ = k9.n(e9Var);
        }
        y2.a(set, taVar.initializedAdapterClasses_);
    }

    public final List d() {
        return Collections.unmodifiableList(((ads_mobile_sdk.ta) this.f1095b).initializedAdapterClasses_);
    }
}
