package b;

import ads_mobile_sdk.au0;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes2.dex */
public final class t6 extends au0 {
    public t6() {
        super(ads_mobile_sdk.oa.DEFAULT_INSTANCE);
    }

    public final void c(ArrayList arrayList) {
        b();
        ads_mobile_sdk.oa oaVar = (ads_mobile_sdk.oa) this.f1095b;
        e9 e9Var = oaVar.initializationData_;
        if (!((ads_mobile_sdk.j) e9Var).f5068a) {
            oaVar.initializationData_ = k9.n(e9Var);
        }
        y2.a(arrayList, oaVar.initializationData_);
    }

    public final List d() {
        return Collections.unmodifiableList(((ads_mobile_sdk.oa) this.f1095b).initializationData_);
    }
}
