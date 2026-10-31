package com.facebook.ads.redexgen.X;

import android.graphics.Rect;
import android.view.View;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class CN extends AbstractC1957it {
    public static byte[] A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 93);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{36, 42, 41, 7, 26, 24, 41, -39, -54, -37, -50, -41, -35, 33, 34, 15, 34, 19, -8, -21, -25, -7};
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1957it
    public final void A02(Rect rect, View view, C7O c7o, C1975jB c1975jB) {
        C1h.A09(rect, A00(0, 7, 88));
        C1h.A09(view, A00(18, 4, 37));
        C1h.A09(c7o, A00(7, 6, 12));
        C1h.A09(c1975jB, A00(13, 5, 81));
        int position = c7o.A1C(view);
        int position2 = position % 2 == 0 ? 1 : 0;
        if (position2 != 0) {
            int position3 = C2250ng.A0M;
            rect.right = position3 / 2;
        } else {
            int position4 = C2250ng.A0M;
            rect.left = position4 / 2;
        }
        int position5 = C2250ng.A0M;
        rect.bottom = position5;
    }
}
