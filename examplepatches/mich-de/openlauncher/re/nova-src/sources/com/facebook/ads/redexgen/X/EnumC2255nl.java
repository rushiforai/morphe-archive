package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.nl, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC2255nl {
    A06(-1, 100, 1, 0),
    A07(-1, 120, 2, 1),
    A08(-1, 300, 3, 2),
    A09(-1, Sdk.SDKError.Reason.CONCURRENT_PLAYBACK_UNSUPPORTED_VALUE, 4, 3),
    A0A(-1, 50, 5, 4),
    A0B(-1, -1, 6, 5);

    public static byte[] A04;
    public final int A00;
    public final int A01;
    public final int A02;
    public final int A03;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 57);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A04 = new byte[]{-110, -113, -109, -111, -110, -98, -87, 123, 122, 122, -63, -66, -62, -64, -63, -51, -40, -86, -85, -87, -65, -68, -64, -66, -65, -53, -42, -86, -89, -89, -47, -50, -46, -48, -47, -35, -24, -67, -71, -71, -121, -124, -120, -122, -121, -109, -98, 116, 111, -72, -85, -87, -70, -59, -86, -65, -76, -89, -77, -81, -87};
    }

    static {
        A02();
    }

    EnumC2255nl(int i5, int i11, int i12, int i13) {
        this.A03 = i5;
        this.A01 = i11;
        this.A02 = i12;
        this.A00 = i13;
    }

    @Nullable
    public static EnumC2255nl A00(int i5) {
        for (EnumC2255nl enumC2255nl : values()) {
            if (enumC2255nl.A00 == i5) {
                return enumC2255nl;
            }
        }
        return null;
    }

    public final int A04() {
        return this.A01;
    }

    public final int A05() {
        return this.A02;
    }

    public final int A06() {
        return this.A03;
    }
}
