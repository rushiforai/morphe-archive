package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.internal.adreportingconfig.AdReportingReason;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.ga, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1819ga {
    public static byte[] A01;
    public static String[] A02 = {"9okEwBsJnxm4XP2uMdCs1TTs0ipxbCrx", "KwR5WWC5sufK43WzM862skA54ooPALBv", "gy93sI55ZIYYvh5J8OUT9qm2p9", "dxYBmhUa98SUIpbIHX6MiqZ5bWUPty4B", "67xZp2aOxtSOd7RgrTL8HL2Ne7", "07dtCbgrw0W8dRsWClXlOnRD4KzojNVd", "fNc2y58JlCy0XZUWB5ryiRvO0DobwJiD", "gLrzPSgUGRY8V9c6gRfYWq9AMfEa3UYZ"};
    public static final String[] A03;
    public final InterfaceC1825gg A00;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 96);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A01 = new byte[]{-90, -45, -25, -8, -15, -90, -25, -22, -90, -25, -7, -90, -11, -20, -20, -21, -12, -7, -17, -4, -21, -90, -11, -8, -90, -17, -12, -25, -10, -10, -8, -11, -10, -8, -17, -25, -6, -21, -69, -34, -102, -30, -29, -34, -34, -33, -24, -88, -86, -51, -119, -37, -50, -39, -40, -37, -35, -50, -51, -105, 33, 62, 69, 73, -7, 78, 76, -7, 78, 71, 61, 62, 75, 76, 77, 58, 71, 61, -7, 80, 65, 58, 77, -7, 66, 76, -7, 65, 58, 73, 73, 62, 71, 66, 71, 64, 7, -7, 48, 65, 82, -7, 61, 72, 71, 0, 77, -7, 82, 72, 78, -7, 80, 58, 71, 77, -7, 77, 72, -7, 76, 62, 62, -7, 77, 65, 66, 76, 24, -54, -25, -18, -14, -94, -9, -11, -94, -9, -16, -26, -25, -12, -11, -10, -29, -16, -26, -94, -7, -22, -29, -10, -94, -21, -11, -94, -22, -29, -14, -14, -25, -16, -21, -16, -23, -80, -94, -39, -22, -5, -94, -21, -11, -94, -10, -22, -21, -11, -94, -21, -16, -29, -14, -14, -12, -15, -14, -12, -21, -29, -10, -25, -63, -61, -28, -33, -32, -101, -68, -33, 8, 28, 41, 28, 34, 32, -37, 28, 31, -37, 43, 45, 32, 33, 32, 45, 32, 41, 30, 32, 46, -72, -39, -118, -46, -45, -50, -49, -118, -53, -50, -118, -39, -38, -34, -45, -39, -40, -35, 19, 52, -27, 55, 42, 53, 52, 55, 57, -27, 38, 41, -27, 52, 53, 57, 46, 52, 51, 56, -37, -18, -7, -8, -5, -3, -87, -54, -19, -18, 0, 0, -69, 1, 0, 18, 0, 13, -69, -4, -1, 14, -69, 7, 4, 6, 0, -69, 15, 3, 4, 14, -56, -39, -22, -111, -46, -34, -111, -70, -111, -28, -42, -42, -38, -33, -40, -111, -27, -39, -38, -28, -111, -46, -43, -80, 0, 22, 28, 25, -57, 26, 28, 9, 20, 16, 26, 26, 16, 22, 21, -57, 16, 26, -57, 21, 22, 30, -57, 9, 12, 16, 21, 14, -57, 25, 12, 29, 16, 12, 30, 12, 11, -43, -4, -2, -17, -14, -19, -15, -10, -3, -9, -15, -13, 1, -19, 3, 0, -9, -44, -39, -38, -35, -43, -29, -42, -33, -48, -39, -42, -46, -43, -38, -33, -40, 39, 44, 45, 48, 40, 54, 41, 50, 35, 51, 52, 56, 45, 51, 50, 55, 20, 23, 28, 23, 33, 22, 19, 18, 13, 18, 19, 33, 17, 32, 23, 30, 34, 23, 29, 28, 25, 28, 33, 28, 38, 27, 24, 23, 18, 27, 28, 23, 24, 18, 20, 23, 33, 36, 41, 36, 46, 35, 32, 31, 26, 45, 32, 43, 42, 45, 47, 26, 28, 31, -36, -35, -40, -39, -45, -43, -40, 49, 50, 45, 46, 40, 42, 45, 40, 45, 46, 60, 44, 59, 50, 57, 61, 50, 56, 55, 40, 41, 36, 37, 31, 33, 36, 31, 38, 47, 44, 44, 47, 55, 31, 53, 48, 31, 40, 37, 33, 36, 41, 46, 39, -26, -25, -30, -29, -35, -33, -30, -35, -19, -18, -14, -25, -19, -20, -15, 68, 57, 75, 76, 55, 77, 72, 60, 57, 76, 61, 60, 55, 76, 65, 69, 61, 75, 76, 57, 69, 72, -28, -40, -27, -40, -34, -36, -42, -40, -37, -42, -25, -23, -36, -35, -36, -23, -36, -27, -38, -36, -22, 61, 49, 62, 49, 55, 53, 47, 49, 52, 47, 64, 66, 53, 54, 53, 66, 53, 62, 51, 53, 67, 47, 69, 66, 57, -11, -4, -13, -13, -16, -15, -11, -22, -16, -17, -32, -11, -26, -7, -11, 74, 75, 79, 68, 74, 73, 58, 81, 60, 71, 80, 64, 53, 40, 51, 50, 53, 55, 34, 36, 39, -38, -51, -40, -41, -38, -36, -57, -55, -52, -57, -52, -51, -37, -53, -38, -47, -40, -36, -47, -41, -42, 22, 9, 20, 19, 22, 24, 3, 5, 8, 3, 10, 19, 16, 16, 19, 27, 3, 25, 20, 3, 12, 9, 5, 8, 13, 18, 11, 7, -6, 5, 4, 7, 9, -12, -10, -7, -12, 4, 5, 9, -2, 4, 3, 8, -41, -54, -43, -44, -41, -39, -50, -45, -52, 75, 60, 77, 51, 53, 65, 51, 61, 51, 71, 57, 57, 61, 66, 59, 51, 72, 60, 61, 71};
    }

    static {
        A06();
        A03 = new String[]{A02(455, 7, 20), A02(462, 19, 105), A02(481, 25, 96), A02(PglCryptUtils.DECRYPT_FAILED, 15, 30), A02(616, 9, 99), A02(625, 21, 8), A02(646, 27, 68), A02(673, 17, 53), A02(543, 21, 23), A02(421, 16, 83), A02(437, 18, 91), A02(TTAdConstant.MATE_IS_NULL_CODE, 20, 78), A02(699, 20, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), A02(355, 14, 46), A02(564, 25, 112)};
    }

    public C1819ga(InterfaceC1825gg interfaceC1825gg) {
        this.A00 = interfaceC1825gg;
    }

    private String A00() {
        return A03(A02(481, 25, 96), A02(60, 69, Sdk.SDKError.Reason.TPAT_ERROR_VALUE));
    }

    private String A01() {
        return A03(A02(646, 27, 68), A02(Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, 64, 34));
    }

    private String A03(String str, String str2) {
        String strA9r = this.A00.A9r(str, str2);
        if (strA9r == null) {
            return str2;
        }
        String value = A02(589, 4, 39);
        return strA9r.equals(value) ? str2 : strA9r;
    }

    public static List<C1823ge> A04(String str) throws JSONException {
        if (TextUtils.isEmpty(str) || str.equalsIgnoreCase(A02(589, 4, 39))) {
            return new ArrayList();
        }
        JSONArray jSONArray = new JSONArray(str);
        List<AdReportingReason> children = new ArrayList<>();
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            JSONObject jSONObject = (JSONObject) jSONArray.get(i5);
            C1823ge c1823ge = new C1823ge(jSONObject.getInt(A02(604, 12, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE)), jSONObject.getString(A02(593, 11, 33)), jSONObject.optString(A02(369, 16, 17)));
            Iterator<C1823ge> it = A04(jSONObject.optString(A02(385, 16, 100))).iterator();
            while (it.hasNext()) {
                c1823ge.A06(it.next());
            }
            children.add(c1823ge);
            if (A02[0].charAt(8) == 'D') {
                throw new RuntimeException();
            }
            A02[1] = "UoOnH9Hv65m0hYQCpY1Dh";
        }
        return children;
    }

    public static Map<String, String> A05(String str) {
        if (str == null || str.isEmpty() || str.equals(A02(353, 2, 65))) {
            return null;
        }
        HashMap map = new HashMap();
        try {
            JSONObject jSONObject = new JSONObject(str);
            for (String str2 : A03) {
                if (!jSONObject.has(str2)) {
                    return null;
                }
                map.put(str2, jSONObject.getString(str2));
            }
            if (A04(jSONObject.getString(A02(673, 17, 53))).size() == 0) {
                A08(AbstractC2126lf.A28, new C2127lg(A02(239, 20, 101)));
                return null;
            }
            if (A04(jSONObject.getString(A02(PglCryptUtils.DECRYPT_FAILED, 15, 30))).size() == 0) {
                A08(AbstractC2126lf.A25, new C2127lg(A02(Sdk.SDKError.Reason.AD_LOAD_FAIL_RETRY_AFTER_VALUE, 18, 10)));
                return null;
            }
            return map;
        } catch (JSONException e3) {
            A08(AbstractC2126lf.A27, new C2127lg(e3));
            return null;
        }
    }

    private final void A07() {
        JW jwA6r = this.A00.A6r();
        jwA6r.A00(A02(521, 22, 120), 0L);
        jwA6r.A02();
    }

    public static void A08(int i5, C2127lg c2127lg) {
        C0957Hh sdkContext = AbstractC2094l9.A00();
        if (sdkContext != null) {
            sdkContext.A08().ABz(A02(690, 9, 5), i5, c2127lg);
        }
    }

    public final long A09() {
        return this.A00.A92(A02(521, 22, 120), 0L);
    }

    public final C1823ge A0A() {
        C1823ge c1823ge = new C1823ge(A00());
        try {
            for (C1823ge hideAdParent : A04(A03(A02(PglCryptUtils.DECRYPT_FAILED, 15, 30), A02(0, 0, 94)))) {
                c1823ge.A06(hideAdParent);
            }
        } catch (JSONException e3) {
            A07();
            A08(AbstractC2126lf.A26, new C2127lg(e3));
        }
        return c1823ge;
    }

    public final C1823ge A0B() {
        C1823ge c1823ge = new C1823ge(A01());
        try {
            for (C1823ge reportAdParent : A04(A03(A02(673, 17, 53), A02(0, 0, 94)))) {
                c1823ge.A06(reportAdParent);
            }
        } catch (JSONException e3) {
            A07();
            A08(AbstractC2126lf.A29, new C2127lg(e3));
        }
        return c1823ge;
    }

    public final String A0C() {
        return A03(A02(355, 14, 46), A02(0, 0, 94));
    }

    public final String A0D() {
        return A03(A02(TTAdConstant.MATE_IS_NULL_CODE, 20, 78), A02(Sdk.SDKError.Reason.JSON_PARAMS_ENCODE_ERROR_VALUE, 38, 71));
    }

    public final String A0E() {
        return A03(A02(421, 16, 83), A02(38, 10, 26));
    }

    public final String A0F() {
        return A03(A02(437, 18, 91), A02(48, 12, 9));
    }

    public final String A0G() {
        return A03(A02(462, 19, 105), A02(268, 23, 59));
    }

    public final String A0H() {
        return A03(A02(455, 7, 20), A02(193, 7, 27));
    }

    public final String A0I() {
        return A03(A02(564, 25, 112), A02(0, 0, 94));
    }

    public final String A0J() {
        return A03(A02(543, 21, 23), A02(200, 21, 91));
    }

    public final String A0K() {
        return A03(A02(625, 21, 8), A02(0, 38, 38));
    }

    public final String A0L() {
        return A03(A02(616, 9, 99), A02(259, 9, 41));
    }

    public final String A0M() {
        return A03(A02(699, 20, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), A02(291, 24, 17));
    }

    public final void A0N(String str) {
        Map<String, String> mapA05 = A05(str);
        if (mapA05 == null || mapA05.size() != A03.length) {
            return;
        }
        JW jwA6r = this.A00.A6r();
        for (String str2 : A03) {
            jwA6r.A01(str2, mapA05.get(str2));
        }
        jwA6r.A00(A02(521, 22, 120), System.currentTimeMillis());
        jwA6r.A02();
    }

    public final boolean A0O(Context context, boolean z11) {
        return (z11 || C2203mv.A2k(context)) && ((A09() > 0L ? 1 : (A09() == 0L ? 0 : -1)) > 0);
    }
}
