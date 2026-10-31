package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.iy, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1962iy {
    public static byte[] A07;
    public static String[] A08 = {"McrfnU83e0TuM99VVQQBOscB2", "MpWofvD5qytZN6kIOTpxgIN7U4PDlVX", "8DO0JWJv7", "NaUXJhMyPUEJiv0pnlqq699ey", "9AgAA7TTpQEIkBuPA0HGC7A8S4qRxzys", "Ri1ue4v1IHDZNB99XJS0NvqXAiXvn8iu", "aKFYs8AbkOzldPJGKPCZMgpMzSHJ3GV5", "Lsgmp0EWogT5YOLW1MDFJ8TKvZJymVL5"};
    public final int A00;
    public final int A01;
    public final C1735fE A02;
    public final ViewOnClickListenerC0884El A03;
    public final InterfaceC1917iD A04;
    public final String A05;
    public final String A06;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE);
            String[] strArr = A08;
            if (strArr[7].charAt(31) != strArr[6].charAt(31)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A08;
            strArr2[0] = "alN9uYQjHcPeItpKdPdlrG9B7";
            strArr2[3] = "raclBDWe08UExqVWzl2FT0lbm";
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A07 = new byte[]{5, 7, 20, 2, 5, 8, 18, 3, 1, 18, 4, 9, 14, 4, 98, 117, 96, 67, 116, 117, 117, 110, 111, 88, 92, 80, 86, 84, 100, 67, 93};
    }

    static {
        A01();
    }

    public C1962iy(int i5, int i11, String str, ViewOnClickListenerC0884El viewOnClickListenerC0884El, C1735fE c1735fE, InterfaceC1917iD interfaceC1917iD, String str2) {
        C1h.A09(str, A00(23, 8, 77));
        C1h.A09(viewOnClickListenerC0884El, A00(14, 9, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE));
        this.A01 = i5;
        this.A00 = i11;
        this.A05 = str;
        this.A03 = viewOnClickListenerC0884El;
        this.A02 = c1735fE;
        this.A04 = interfaceC1917iD;
        this.A06 = str2;
    }

    public final int A02() {
        return this.A01;
    }

    public final C1735fE A03() {
        return this.A02;
    }

    public final ViewOnClickListenerC0884El A04() {
        return this.A03;
    }

    public final InterfaceC1917iD A05() {
        return this.A04;
    }

    public final String A06() {
        return this.A05;
    }

    public final String A07() {
        return this.A06;
    }

    public final Map<String, String> A08() {
        HashMap map = new HashMap();
        map.put(A00(7, 7, 28), String.valueOf(this.A01));
        map.put(A00(0, 7, 26), String.valueOf(this.A00));
        return map;
    }
}
