package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import com.facebook.ads.internal.protocol.AdPlacementType;
import java.util.Arrays;
import java.util.Map;
import javax.annotation.Nullable;

/* loaded from: assets/audience_network/classes.dex */
public final class LM extends AbstractC1710ep {
    public static byte[] A02;

    @Nullable
    public final LK A00;
    public final InterfaceC2224nG A01;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 20);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{-89, -90, -77, -77, -86, -73};
    }

    public LM(C0958Hi c0958Hi, AbstractC1711eq abstractC1711eq, C1539c2 c1539c2, InterfaceC2224nG interfaceC2224nG, LK lk2) {
        super(c0958Hi, abstractC1711eq, c1539c2);
        this.A01 = interfaceC2224nG;
        this.A00 = lk2;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1710ep
    public final void A0A(Map<String, String> map) {
        if (this.A00 != null && !TextUtils.isEmpty(this.A00.A7z())) {
            this.A02.A0F().A3h();
            AbstractC1813gU.A02(this.A00.A0a(), AbstractC2401qD.A00(A00(0, 6, 49)));
            this.A01.AC7(this.A00.A7z(), map);
            if (C2203mv.A19(this.A02)) {
                String string = AdPlacementType.MEDIUM_RECTANGLE.toString();
                C2328oz c2328ozA00 = C2328oz.A00(this.A02);
                String placementType = this.A00.A7z();
                c2328ozA00.A0E(string, placementType);
            }
        }
    }
}
