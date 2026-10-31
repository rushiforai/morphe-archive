package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.iE, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC1918iE {
    A07(A01(52, 12, 91)),
    A06(A01(41, 11, 27)),
    A05(A01(32, 9, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE));

    public static byte[] A01;
    public static final C1919iF A02;
    public static final /* synthetic */ InterfaceC05640p A03;
    public final String A00;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 32);
        }
        return new String(bArrCopyOfRange);
    }

    public static InterfaceC05640p<EnumC1918iE> A02() {
        return A03;
    }

    public static void A03() {
        A01 = new byte[]{116, 114, -125, -128, -122, -124, 118, 125, -124, -64, -56, -65, -57, -68, -46, -68, -64, -76, -70, -72, -57, -67, -62, -69, -64, -71, -45, -67, -63, -75, -69, -71, -2, -4, 13, 10, 16, 14, 0, 7, 14, -88, -80, -89, -81, -92, -102, -92, -88, -100, -94, -96, -18, -28, -23, -30, -25, -32, -38, -28, -24, -36, -30, -32};
    }

    static {
        A03();
        A03 = C1q.A01(A04);
        A02 = new C1919iF(null);
    }

    EnumC1918iE(String str) {
        this.A00 = str;
    }

    @JvmStatic
    public static final EnumC1918iE A00(String str) {
        return A02.A02(str);
    }

    public final String A05() {
        return this.A00;
    }
}
