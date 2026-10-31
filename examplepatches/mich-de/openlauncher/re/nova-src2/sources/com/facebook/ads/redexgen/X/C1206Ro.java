package com.facebook.ads.redexgen.X;

import java.io.IOException;

/* renamed from: com.facebook.ads.redexgen.X.Ro, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1206Ro implements VF {
    public static String[] A03 = {"hCZczwbChjUsCUwxRw6prGp4a38eJSZM", "lUxYycgrJvFaPUBvx4GBEhYiK4m9kyuX", "K7biVkji8c2abFRUzoZE35M16Nr30sHx", "hTaSJqeXWqACDI8Tl6AegleljrjoWV5D", "4GC", "suRSw9BBhIrTo6orh3wdvsggGiK", "dvp9xbjmJkXWLC3W6qrOil1Xu4dhPnSh", "oqp"};
    public boolean A00;
    public final VF A01;
    public final /* synthetic */ C8t A02;

    public C1206Ro(C8t c8t, VF vf2) {
        this.A02 = c8t;
        this.A01 = vf2;
    }

    public final void A00() {
        this.A00 = false;
    }

    @Override // com.facebook.ads.redexgen.X.VF
    public final boolean ABM() {
        return !this.A02.A03() && this.A01.ABM();
    }

    @Override // com.facebook.ads.redexgen.X.VF
    public final void ADI() throws IOException {
        this.A01.ADI();
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x002f  */
    @Override // com.facebook.ads.redexgen.X.VF
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int AIc(C1140Oo c1140Oo, T2 t22, int i5) {
        if (this.A02.A03()) {
            return -3;
        }
        if (this.A00) {
            t22.A02(4);
            return -4;
        }
        int iAIc = this.A01.AIc(c1140Oo, t22, i5);
        if (iAIc == -5) {
            VC vc = (VC) AbstractC1062Ln.A01(c1140Oo.A00);
            int result = vc.A08;
            if (result == 0) {
                int result2 = vc.A09;
                if (result2 != 0) {
                    int i11 = this.A02.A01 != 0 ? 0 : vc.A08;
                    int encoderPadding = this.A02.A00 == Long.MIN_VALUE ? vc.A09 : 0;
                    String[] strArr = A03;
                    String str = strArr[4];
                    String str2 = strArr[7];
                    int length = str.length();
                    int result3 = str2.length();
                    if (length != result3) {
                        throw new RuntimeException();
                    }
                    String[] strArr2 = A03;
                    strArr2[0] = "WpZbgUFarAhkaO4qnIOIScSSR6ujkzkK";
                    strArr2[6] = "iA8VkZH4E7gleQVLcFVju57gueYFZ33h";
                    c1140Oo.A00 = vc.A07().A0d(i11).A0e(encoderPadding).A14();
                }
            }
            return -5;
        }
        if (this.A02.A00 != Long.MIN_VALUE && ((iAIc == -4 && t22.A01 >= this.A02.A00) || (iAIc == -3 && this.A02.A7i() == Long.MIN_VALUE && !t22.A04))) {
            t22.A0A();
            t22.A02(4);
            this.A00 = true;
            String[] strArr3 = A03;
            String str3 = strArr3[4];
            String str4 = strArr3[7];
            int length2 = str3.length();
            int result4 = str4.length();
            if (length2 != result4) {
                A03[5] = "E04rMJY30HIlU2cAr5Aw7XTbX1n";
                return -4;
            }
            String[] strArr4 = A03;
            strArr4[2] = "yIpeBBrJ1qAZRfAnlHEP2FJkUi25hvbC";
            strArr4[1] = "1ozWe3aBUM1ISpzViZAE5MteBltu21sg";
            return -4;
        }
        return iAIc;
    }

    @Override // com.facebook.ads.redexgen.X.VF
    public final int ALK(long j11) {
        if (this.A02.A03()) {
            return -3;
        }
        return this.A01.ALK(j11);
    }
}
