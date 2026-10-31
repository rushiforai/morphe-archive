package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class CC extends AbstractC1965j1 {
    public static byte[] A01;
    public final /* synthetic */ C2141lu A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 98);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{82, 69, 67, 89, 67, 76, 69, 82, 54, 73, 69, 87};
    }

    public CC(C2141lu c2141lu) {
        this.A00 = c2141lu;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1965j1
    public final void A0Q(C7O c7o, int i5, int i11) {
        AbstractC1948ik adapter;
        int iA0B;
        C1h.A09(c7o, A00(0, 12, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
        if (i5 == 0 || (adapter = c7o.getAdapter()) == null || (iA0B = adapter.A0B()) <= 1) {
            return;
        }
        int iComputeHorizontalScrollRange = c7o.computeHorizontalScrollRange();
        int itemCount = c7o.computeHorizontalScrollExtent();
        int currentScroll = iComputeHorizontalScrollRange - itemCount;
        if (currentScroll <= 0) {
            return;
        }
        int itemCount2 = c7o.computeHorizontalScrollOffset();
        float f11 = itemCount2 / currentScroll;
        int itemCount3 = iA0B - 1;
        int maxScroll = AbstractC05580j.A00(f11 * itemCount3);
        C2648uC c2648uC = this.A00.A0B;
        if (c2648uC != null) {
            c2648uC.setCurrentPosition(maxScroll);
        }
    }
}
