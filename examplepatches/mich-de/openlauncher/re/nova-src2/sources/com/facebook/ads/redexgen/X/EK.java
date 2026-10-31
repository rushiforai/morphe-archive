package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public class EK extends AbstractRunnableC2319oq {
    public static String[] A02 = {"Fj7ESBBHPWyhzyUNUk9wEjKRlPGygZq6", "g67PsAoMqwfun9TNnEbbzF", "ENY3IRolQVjzW6bOv01IlQss7AzYYleq", "lKe2IwDytTZQvLz9quvLHuHucWWBwqoV", "WQbtnwrxyiBq4td5zJal7T60bQiBpmyU", "auXHRtsZPOgWBl50NZbeME", "yShIWIrCkTd3QxIv8pUvWeL4xOPKp5Tc", "YCUt31fLQHTMLH9kvQyheIeoTbhWxfAZ"};
    public final /* synthetic */ EE A00;
    public final /* synthetic */ boolean A01;

    public EK(EE ee2, boolean z11) {
        this.A00 = ee2;
        this.A01 = z11;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        AbstractC2452r2 abstractC2452r2A0B = this.A00.A0o.A0B();
        if (abstractC2452r2A0B != null) {
            boolean z11 = this.A01;
            if (A02[7].charAt(13) == 'O') {
                throw new RuntimeException();
            }
            A02[7] = "DQswTiUUYNmJPIt0t5S9h3Ak4jFcSKAR";
            abstractC2452r2A0B.setPageDetailsVisible((z11 || abstractC2452r2A0B.A0E()) ? false : true);
            abstractC2452r2A0B.setToolbarActionMode(this.A00.getCloseButtonStyle());
        }
    }
}
