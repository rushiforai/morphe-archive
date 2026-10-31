package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.06, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AnonymousClass06 extends AnonymousClass08 {
    public static byte[] A00;
    public static String[] A01 = {"Yw1Nq8K0UrbKoLJ9J74LN473TvohxVx2", "EJiOOK72k6DndTP1RC5cyuAHWZhQciAS", "R7SMS6aYTdi6jmFrn", "d2iHTisYFyhKDvNXugePomkoo0yKPI4q", "mjRwUhISjmLTECmFZkqx9Kc9az4qDuWf", "cSWeMH8OSgg2X7i7FplIZ87HhO3QHY3N", b.f42142b, "oEyGnsin16kOVk0kZ"};

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 48);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A00 = new byte[]{-118, -62, -74, -73, -63, -116, -58, -53, -65, -68, -55, -81, -79, -92, -91, -88, -73};
    }

    static {
        A04();
    }

    public static final boolean A05(String str, int i5, String str2, int i11, int i12, boolean z11) {
        C1h.A09(str, A03(0, 6, 30));
        C1h.A09(str2, A03(6, 5, 39));
        if (z11) {
            return str.regionMatches(z11, i5, str2, i11, i12);
        }
        return str.regionMatches(i5, str2, i11, i12);
    }

    public static final boolean A06(String str, String str2, boolean z11) {
        C1h.A09(str, A03(0, 6, 30));
        C1h.A09(str2, A03(11, 6, 15));
        if (!z11) {
            return str.startsWith(str2);
        }
        int length = str2.length();
        String[] strArr = A01;
        if (strArr[0].charAt(5) == strArr[5].charAt(5)) {
            throw new RuntimeException();
        }
        A01[3] = "QYZ9aV5zdwfBvmJPTZaYDiVf3VRgHrZj";
        return A05(str, 0, str2, 0, length, z11);
    }

    public static /* synthetic */ boolean A07(String str, String str2, boolean z11, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            z11 = false;
        }
        return A06(str, str2, z11);
    }
}
