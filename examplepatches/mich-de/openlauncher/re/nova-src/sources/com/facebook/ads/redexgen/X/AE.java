package com.facebook.ads.redexgen.X;

import com.facebook.ads.sync.SyncModifiableBundle;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public abstract class AE implements Yk {
    public final EnumC1390Zc A00;
    public final AbstractC06494t A01;

    public AE(AbstractC06494t abstractC06494t, EnumC1390Zc enumC1390Zc) {
        this.A01 = abstractC06494t;
        this.A00 = enumC1390Zc;
    }

    @Override // com.facebook.ads.redexgen.X.Yk
    public void A4e(Map<InterfaceC1421a7, YU> map, Map<SyncModifiableBundle, EnumC1390Zc> map2) {
        map2.put(null, this.A00);
    }
}
