package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.Xi, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1347Xi {
    public static byte[] A04;
    public static String[] A05 = {"5MT7ScDMTu4Kz6rKF1fGuf9zFpYiveuh", "kzhumRUCvaQsG6jbotrlDYayYQLZOZq", "YkImouxSvKMnfyvFoNahzU7d4AtGE0DU", "eUmFqcEIQLyyjl0TdxJ9YsMJmstg4hEy", "hZI1nSqDyEZIVIBxeut1UL", "JyHSV39gOBEmKbLjDalvdkucWHbe9J4", "XbGRfso0AY4sJAdhQgnQNxQD59WIblHw", "BFVyfzQKkbi4"};
    public final long A00;
    public final EnumC1346Xh A01;
    public final String A02;
    public final boolean A03;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A05;
            if (strArr[6].charAt(2) == strArr[0].charAt(2)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A05;
            strArr2[1] = "UILnh12lFwIP53F4cN811FzPN5g65zz";
            strArr2[5] = "zCxp2xLqqJVxklBUSXhREkK7dcTEPVw";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 72);
            i13++;
        }
    }

    public static void A01() {
        A04 = new byte[]{92, 80, 91, 90, 92, 113, 94, 82, 90, 92, 64, 90, 93, 76, 74};
    }

    static {
        A01();
    }

    public C1347Xi(long j11, boolean z11, String str, EnumC1346Xh enumC1346Xh) {
        C1h.A09(str, A00(0, 9, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
        C1h.A09(enumC1346Xh, A00(9, 6, 103));
        this.A00 = j11;
        this.A03 = z11;
        this.A02 = str;
        this.A01 = enumC1346Xh;
    }
}
