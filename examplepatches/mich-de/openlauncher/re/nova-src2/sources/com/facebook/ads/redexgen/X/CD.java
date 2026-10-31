package com.facebook.ads.redexgen.X;

import android.graphics.Rect;
import android.view.View;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class CD extends AbstractC1957it {
    public static byte[] A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{33, 59, 58, 28, 43, 45, 58, 74, 91, 72, 95, 84, 78, 56, 63, 42, 63, 46, 58, 37, 41, 59};
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1957it
    public final void A02(Rect rect, View view, C7O c7o, C1975jB c1975jB) {
        C1h.A09(rect, A00(0, 7, 49));
        C1h.A09(view, A00(18, 4, 51));
        C1h.A09(c7o, A00(7, 6, 69));
        C1h.A09(c1975jB, A00(13, 5, 52));
        int iA1C = c7o.A1C(view);
        AbstractC1948ik adapter = c7o.getAdapter();
        int itemCount = adapter != null ? adapter.A0B() : 0;
        int position = AbstractC2383pv.A0K;
        if (iA1C != 0) {
            position /= 2;
        }
        rect.left = position;
        rect.right = iA1C == itemCount + (-1) ? AbstractC2383pv.A0K : AbstractC2383pv.A0K / 2;
    }
}
