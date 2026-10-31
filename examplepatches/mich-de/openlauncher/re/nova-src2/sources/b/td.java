package b;

import ads_mobile_sdk.au0;
import ads_mobile_sdk.ax;
import ads_mobile_sdk.jb1;
import ads_mobile_sdk.yw;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.RandomAccess;

/* loaded from: classes.dex */
public final class td extends au0 {
    public final void c(ArrayList arrayList) {
        b();
        ax axVar = (ax) this.f1095b;
        RandomAccess randomAccess = axVar.allowedApis_;
        if (!((ads_mobile_sdk.j) randomAccess).f5068a) {
            jb1 jb1Var = (jb1) randomAccess;
            axVar.allowedApis_ = jb1Var.a(jb1Var.f5204c * 2);
        }
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            yw ywVar = (yw) it.next();
            ((jb1) axVar.allowedApis_).b(ywVar.getNumber());
        }
    }

    public final com.google.android.gms.internal.measurement.v1 d() {
        ax axVar = (ax) this.f1095b;
        axVar.getClass();
        return new com.google.android.gms.internal.measurement.v1(1, axVar.allowedApis_, ax.allowedApis_converter_);
    }
}
