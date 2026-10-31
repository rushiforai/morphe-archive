package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.5S, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public class C5S extends BE {
    public static String[] A01 = {"VAJC8KkWwqBqP3YwPNPz0NB60U8Olmo", "sA7DIJGglYvgKomICt76UbdXzKEqRpve", "h2nKVi9zPVfn2wD9Ir4CKZM7YhywkQyu", "WKOc6Sdcu3c48zXF1aNVIMK0U72SoTEh", "nrQhJNm4TxNo77xZMvgmcdDyAmHqPcmt", b.f42142b, "IHqZlhhRYbPSLzQbzg1xyxr9D04qbAtw", "CvsOMcHfi"};
    public final /* synthetic */ C0793Ay A00;

    public C5S(C0793Ay c0793Ay) {
        this.A00 = c0793Ay;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final void A03(BF bf2) {
        if (!(this.A00.A03 && this.A00.A02) && this.A00.A05) {
            C0793Ay c0793Ay = this.A00;
            if (A01[0].length() != 31) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[1] = "YbXbINP51Um1naXbvhIyq9xAwyGqqlhl";
            strArr[4] = "VREvpJF2sJdVGNOELCpg29sYr4Eq09Rh";
            if (!c0793Ay.A04) {
                return;
            }
            this.A00.A05 = false;
            if (!this.A00.A0G(EnumC1637dc.A04) && !this.A00.A06) {
                if (!this.A00.A0G(EnumC1637dc.A03)) {
                    return;
                }
                this.A00.A03();
                this.A00.A06(true, true);
                return;
            }
            this.A00.A06 = false;
            this.A00.A07.postDelayed(new B0(this), this.A00.A00);
        }
    }
}
