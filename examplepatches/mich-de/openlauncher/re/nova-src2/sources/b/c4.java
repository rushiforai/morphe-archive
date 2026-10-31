package b;

import ads_mobile_sdk.au0;
import ads_mobile_sdk.kv0;
import ads_mobile_sdk.mm1;
import ads_mobile_sdk.wm1;
import java.util.ArrayList;
import java.util.RandomAccess;

/* loaded from: classes2.dex */
public final class c4 extends au0 {
    public c4() {
        super(kv0.DEFAULT_INSTANCE);
    }

    public final void c(ArrayList arrayList) {
        b();
        kv0 kv0Var = (kv0) this.f1095b;
        RandomAccess randomAccess = kv0Var.experimentId_;
        if (!((ads_mobile_sdk.j) randomAccess).f5068a) {
            wm1 wm1Var = (wm1) randomAccess;
            kv0Var.experimentId_ = wm1Var.a(wm1Var.f11337c * 2);
        }
        y2.a(arrayList, kv0Var.experimentId_);
    }

    public final void d(int i5) {
        b();
        ((kv0) this.f1095b).targetVersion_ = i5;
    }

    public final void e() {
        b();
        kv0 kv0Var = (kv0) this.f1095b;
        kv0Var.getClass();
        kv0Var.os_ = mm1.OS_ANDROID.getNumber();
    }
}
