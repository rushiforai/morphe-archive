package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: assets/audience_network/classes.dex */
public final class HL implements InterfaceC1641dg {
    public static byte[] A01;
    public static String[] A02 = {"EcOoOPxvgIM5VM8gU5MNIX90mja3CaI7", "nhJ", "HCYDUCxXnFbS3htlRPDiG7BoiyzyMxIV", "Fv3YAwH75PiBj9X6AN971g", "yIx", b.f42142b, "9xkhFmOksAfwag3lVFNPfz", "xjMRz"};
    public final C2095lA A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 90);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        String[] strArr = A02;
        if (strArr[1].length() != strArr[4].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A02;
        strArr2[0] = "mKsg4hxQhHaV0fiKABuoeRg1A6SJU8YP";
        strArr2[2] = "TgUrCFxQKf96ICwhyLjRHk1rYV6JKdAm";
        A01 = new byte[]{-91, -111, -94, -120, -18, 29, 22, 22, 13, 20, -12, 35, 28, 28, 19, 26, -24, -50, -3, 12, 34, -16, 33, 16, 25, 31, 10, -37, -22, -29, -29, -38, -31, 57, 72, 65, 65, 56, 63, 50, 63, 66, 58, 58, 56, 55, 23, 38, 31, 31, 22, 29, 16, 29, 32, 24, 24, 26, 31, 24, 16, 30, 32, 21, 22};
    }

    static {
        A01();
    }

    public HL(C2095lA c2095lA) {
        this.A00 = c2095lA;
    }

    private void A02(int i5, String str, JSONObject jSONObject, boolean z11, int i11) throws JSONException {
        C2127lg c2127lg = new C2127lg(A00(4, 6, 78));
        c2127lg.A07(jSONObject);
        c2127lg.A05(1);
        c2127lg.A09(z11);
        c2127lg.A04(i11);
        try {
            jSONObject.put(A00(33, 13, Sdk.SDKError.Reason.TPAT_ERROR_VALUE), C2120lZ.A0H(this.A00));
        } catch (JSONException unused) {
        }
        try {
            jSONObject.put(A00(46, 19, 87), i11);
        } catch (JSONException unused2) {
        }
        this.A00.A08().AC0(A00(27, 6, 27), i5 + 4000, c2127lg);
        C2095lA c2095lA = this.A00;
        String[] strArr = A02;
        if (strArr[1].length() != strArr[4].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A02;
        strArr2[5] = b.f42142b;
        strArr2[7] = "Bzrm1";
        if (c2095lA.A05().AB6()) {
            String str2 = A00(10, 8, 84) + str + A00(0, 1, 35) + i5 + A00(1, 3, 14) + jSONObject.toString();
        }
    }

    public static boolean A03(EnumC1643di enumC1643di) {
        for (EnumC1643di enumC1643di2 : HD.A06) {
            if (enumC1643di2.equals(enumC1643di)) {
                String[] strArr = A02;
                if (strArr[5].length() == strArr[7].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A02;
                strArr2[0] = "Wnbl1SxbPUMoFXuq6aB18pNeXqZWWzDi";
                strArr2[2] = "Lc0ARXxjXBXBpMD71LOao0gY4EKFysHu";
                return true;
            }
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1641dg
    public final void AC1(EnumC1643di enumC1643di, JSONObject jSONObject, int i5) throws JSONException {
        A02(enumC1643di.A03(), enumC1643di.toString(), jSONObject, A03(enumC1643di), i5);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1641dg
    public final void ACh(int i5, JSONObject jSONObject, int i11) throws JSONException {
        A02(i5, A00(18, 9, 81) + i5, jSONObject, false, i11);
    }
}
