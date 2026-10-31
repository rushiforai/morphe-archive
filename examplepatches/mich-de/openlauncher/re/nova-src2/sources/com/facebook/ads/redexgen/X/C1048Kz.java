package com.facebook.ads.redexgen.X;

import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.Kz, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1048Kz extends AbstractC1734fD implements Serializable {
    public static byte[] A0F = null;
    public static String[] A0G = {"Y1a5U13ty71QFnyeZB3YxisAAvg7l3fM", "vP", "roZ2Db2w31DgWTY1oGehTdyGNewX8eXS", "I2NTYMYLYsNyCs0logd6ULXXnbjyHCad", "3brQnbpmNBxYuH5lF741sBi9dGi0pOZr", "3fAMLw4w5Yud0wL2utfDbR4mKZlWQuB2", "wSrWvvXZ9ekOd4qM7VWdouqMZx6NVgDc", "r9"};
    public static final long serialVersionUID = 3751287062553772011L;
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public int A04;
    public boolean A06;
    public boolean A09;
    public boolean A0A;
    public final List<LA> A0E;
    public final ArrayList<Integer> A0D = new ArrayList<>();
    public boolean A0B = false;
    public boolean A08 = false;
    public boolean A07 = false;
    public String A05 = A02(Sdk.SDKError.Reason.AD_EXPIRED_ON_PLAY_VALUE, 2, 99);
    public final String A0C = UUID.randomUUID().toString();

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0F, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A0G;
            if (strArr[1].length() != strArr[7].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0G;
            strArr2[0] = "ksKrUe0otL7CQDvNz8iG7T5OcxZuVq1Y";
            strArr2[4] = "xaZ8PqWmutKQFInRkVw3BesrM2XhV7TN";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 107);
            i13++;
        }
    }

    public static void A03() {
        A0F = new byte[]{-17, -14, 1, -7, -2, -9, -1, 4, -11, 6, -9, 8, -9, 3, 9, 70, 75, 68, 76, 81, 72, 71, 66, 68, 71, 86, 66, 70, 82, 88, 81, 87, 76, 81, 74, 82, 87, 78, 77, 72, 74, 77, 92, 72, 86, 74, 97, 72, 77, 94, 91, 74, 93, 82, 88, 87, 74, 79, 72, 80, 85, 76, 75, 70, 72, 75, 90, 70, 93, 72, 89, 80, 76, 85, 91, -40, -35, -42, -34, -29, -34, -29, -36, -44, -37, -28, -25, -40, -38, -44, -21, -34, -38, -20, -44, -23, -34, -30, -38, -24, 61, 70, 60, 55, 59, 57, 74, 60, 55, 57, 77, 76, 71, 55, 59, 68, 71, 75, 61, 55, 76, 65, 69, 61, -36, -43, -30, -40, -32, -39, -45, -22, -35, -40, -39, -29, -45, -28, -32, -43, -19, -42, -43, -41, -33, -45, -39, -26, -26, -29, -26, -36, -31, -41, -40, -21, -46, -25, -30, -46, -27, -40, -29, -30, -27, -25, -46, -33, -30, -44, -41, -40, -41, 10, -3, 8, 7, 10, 12, -9, -2, 1, 10, 11, 12, -9, -3, -5, 8, 5, -9, 7, 6, 4, 17, 50, 37, 48, 47, 50, 52, 31, 38, 41, 50, 51, 52, 31, 41, 45, 48, 50, 37, 51, 51, 41, 47, 46, 31, 47, 46, 44, 57, 88, 77, 84, 92, 68, 88, 74, 72, 84, 83, 73, 68, 70, 73, 68, 84, 83, 68, 70, 73, 68, 87, 74, 85, 84, 87, 89, 78, 83, 76, 41, 30, 37, 45, 21, 41, 27, 25, 37, 36, 26, 21, 23, 26, 21, 37, 36, 21, 44, 31, 26, 27, 37, 21, 38, 34, 23, 47, 24, 23, 25, 33, 21, 27, 40, 40, 37, 40, 39, 36, 32, 29, 40, 19, 26, 35, 38, 23, 25, 19, 42, 29, 25, 43, 73, 75};
    }

    static {
        A03();
    }

    public C1048Kz(List<LA> list) {
        this.A0E = list;
    }

    public static C1048Kz A00(JSONObject jSONObject, C0958Hi c0958Hi) throws JSONException {
        return A01(jSONObject, c0958Hi, false);
    }

    public static C1048Kz A01(JSONObject jSONObject, C0958Hi c0958Hi, boolean z11) throws JSONException {
        JSONArray jSONArray = jSONObject.getJSONArray(A02(0, 3, 35));
        ArrayList arrayList = new ArrayList(jSONArray.length());
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            if (z11) {
                arrayList.add(C07167i.A00(jSONArray.getJSONObject(i5), c0958Hi));
            } else {
                arrayList.add(C07147g.A00(jSONArray.getJSONObject(i5), c0958Hi));
            }
        }
        C1048Kz c1048Kz = new C1048Kz(arrayList);
        JSONObject chainingParams = jSONObject.getJSONObject(A02(3, 12, 43));
        c1048Kz.A05 = chainingParams.toString();
        c1048Kz.A01 = chainingParams.optInt(A02(15, 17, 120), arrayList.size());
        c1048Kz.A04 = chainingParams.optInt(A02(32, 24, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE), 0);
        c1048Kz.A02 = chainingParams.optInt(A02(100, 24, 109), 0);
        c1048Kz.A03 = chainingParams.optInt(A02(151, 22, 8), 0);
        c1048Kz.A0A = chainingParams.optBoolean(A02(253, 38, 75), true);
        c1048Kz.A09 = chainingParams.optBoolean(A02(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 30, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), true);
        c1048Kz.A06 = chainingParams.optBoolean(A02(Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE, 27, 9), true);
        c1048Kz.A00 = chainingParams.optInt(A02(56, 19, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE), 2);
        c1048Kz.A25(chainingParams);
        c1048Kz.A0B = chainingParams.optBoolean(A02(291, 16, 73), false);
        c1048Kz.A08 = chainingParams.optBoolean(A02(195, 28, 85), false);
        c1048Kz.A07 = chainingParams.optBoolean(A02(TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173, 22, 45), false);
        JSONArray jSONArrayOptJSONArray = chainingParams.optJSONArray(A02(75, 25, 10));
        if (jSONArrayOptJSONArray != null) {
            for (int i11 = 0; i11 < jSONArrayOptJSONArray.length(); i11++) {
                c1048Kz.A0D.add(Integer.valueOf(jSONArrayOptJSONArray.optInt(i11, 0)));
            }
        }
        return c1048Kz;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1734fD
    public final int A1L() {
        return 2;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1734fD
    public final int A1M() {
        return this.A04 + this.A02;
    }

    public final int A2u() {
        return this.A00;
    }

    public final int A2v() {
        return this.A01;
    }

    public final int A2w() {
        return this.A02;
    }

    public final int A2x() {
        return this.A03;
    }

    public final LA A2y() {
        if (!this.A0E.isEmpty()) {
            LA la2 = this.A0E.get(0);
            if (A0G[3].charAt(30) != 'a') {
                throw new RuntimeException();
            }
            String[] strArr = A0G;
            strArr[0] = "kalcuJUd13OWB3p352R0B2fkOk5TQQvY";
            strArr[4] = "xCP6b54EQCdUXuQWfLaOcoZzurPDdDGU";
            return la2;
        }
        return null;
    }

    public final LA A2z(int i5) {
        return this.A0E.get(i5);
    }

    public final String A30() {
        return this.A0C;
    }

    public final String A31() {
        return this.A05;
    }

    public final String A32() {
        LA firstAdDataBundle = A2y();
        if (firstAdDataBundle != null) {
            return firstAdDataBundle.A37();
        }
        return null;
    }

    public final ArrayList<Integer> A33() {
        return this.A0D;
    }

    public final void A34(int i5) {
        this.A0E.remove(i5);
        this.A01--;
    }

    public final boolean A35() {
        return this.A00 == 0;
    }

    public final boolean A36() {
        return this.A06;
    }

    public final boolean A37() {
        return this.A07;
    }

    public final boolean A38() {
        return this.A08;
    }

    public final boolean A39() {
        return this.A09;
    }

    public final boolean A3A() {
        return this.A0A;
    }

    public final boolean A3B() {
        return this.A0B;
    }

    public final boolean A3C(int i5) {
        return i5 >= 0 && i5 < this.A0E.size();
    }
}
