package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class HE implements InterfaceC2162mG {
    public final /* synthetic */ String[] A00;

    public HE(String[] strArr) {
        this.A00 = strArr;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2162mG
    public final boolean A3W(String str) {
        for (String str2 : this.A00) {
            if (str2.equals(str)) {
                return false;
            }
        }
        return true;
    }
}
