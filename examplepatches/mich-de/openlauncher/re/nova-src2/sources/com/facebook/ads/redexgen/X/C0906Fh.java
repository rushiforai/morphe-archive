package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.Fh, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0906Fh implements InterfaceC2369ph {
    public static String[] A02 = {"loUGRX1wFwfO8pi8DgxPrGsPJe85sO42", "t9Fx4", "3oarn8HbUVUj6u6EULIVhfy23k9jn", b.f42142b, "MOoTM", "MayuUyWiOMYLrKJeDUJbe9Zh46", "X9niQtR04keYRbnSLMpJZHmvyyUcrdIf", "5gFPyDfRsmHweMwy7A1yA2IFiPZ"};
    public final /* synthetic */ int A00;
    public final /* synthetic */ AbstractC0905Fg A01;

    public C0906Fh(AbstractC0905Fg abstractC0905Fg, int i5) {
        this.A01 = abstractC0905Fg;
        this.A00 = i5;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AET() {
        this.A01.A05 = false;
        this.A01.A0h();
        this.A01.A0H.setToolbarActionMode(this.A01.getCloseButtonStyle());
        if (this.A01.A09) {
            C1814gV c1814gV = this.A01.A08;
            if (A02[2].length() == 15) {
                throw new RuntimeException();
            }
            String[] strArr = A02;
            strArr[7] = "KtnVXPQG8pyake3V1oVxr2XzOzf";
            strArr[3] = b.f42142b;
            if (c1814gV != null) {
                this.A01.A08.A06();
                this.A01.A0C.A5C(new FG().A7L());
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AGb(float f11) {
        this.A01.A0H.setProgress(100.0f * (1.0f - (f11 / this.A00)));
    }
}
