package com.facebook.ads.redexgen.X;

import com.facebook.ads.sync.SyncModifiableBundle;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public abstract class AD implements Yk {
    public final AK A00;
    public final YU A01;

    public AD(AK ak2, YU yu2) {
        this.A00 = ak2;
        this.A01 = yu2;
    }

    @Override // com.facebook.ads.redexgen.X.Yk
    public void A4e(Map<InterfaceC1421a7, YU> map, Map<SyncModifiableBundle, EnumC1390Zc> map2) {
        map.put(this.A00, this.A01);
    }
}
