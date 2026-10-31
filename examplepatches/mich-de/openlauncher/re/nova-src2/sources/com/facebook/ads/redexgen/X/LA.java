package com.facebook.ads.redexgen.X;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.internal.adapters.datamodels.AdInfo;
import com.vungle.ads.internal.protos.Sdk;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: assets/audience_network/classes.dex */
public abstract class LA extends AbstractC1734fD implements Serializable {
    public static JSONObject A0W = null;
    public static byte[] A0X = null;
    public static String[] A0Y = {"1gqRR9im7tmNjhPy8NnQpjCX4rd8Ielc", "ZkOx7RNEMabKvQ7fgN15WIbWDw11JZFu", "ifeh8sROmLFDdOYqa0sy0eFfj5RHH1gU", "fnDzwAhU6GMUs0cCq2fTQuWEzv5lBJki", "OVtNfYqIZ80xqW4zrHdkYxbTKYgYXHc", "chIpxbYwiAOd1RIHlv8aEwW7ihQHRwI", "GnSiEcQE", "uApEYGhuY9oy1RN675k2bDQ9FUD4oA7y"};
    public static final LinkedHashMap<String, String> A0Z;
    public static final long serialVersionUID = -5352540727250859603L;
    public int A00;
    public int A01;
    public int A02;
    public int A03;
    public int A04;
    public C1731fA A07;
    public C1750fT A08;
    public C1753fW A09;
    public C1756fZ A0A;
    public C1765fi A0B;
    public String A0C;
    public String A0D;
    public boolean A0G;
    public final List<C1735fE> A0U;
    public boolean A0E = false;
    public boolean A0H = false;
    public boolean A0Q = false;
    public boolean A0P = false;
    public boolean A0M = false;
    public boolean A0N = false;
    public boolean A0O = false;
    public final Map<String, String> A0V = new HashMap();
    public boolean A0F = false;
    public int A06 = 1;
    public boolean A0J = false;
    public boolean A0I = false;
    public boolean A0K = true;
    public boolean A0L = false;
    public int A05 = 5000;
    public boolean A0T = false;
    public boolean A0S = false;
    public boolean A0R = false;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0X, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 60);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A08() {
        String[] strArr = A0Y;
        if (strArr[2].charAt(14) == strArr[1].charAt(14)) {
            throw new RuntimeException();
        }
        A0Y[5] = "bfB1pGz3pHLReaUGKuLSmGsyYLYBAtW";
        A0X = new byte[]{40, 45, 22, 42, 33, 38, 32, 42, 44, 58, 22, 37, 32, 39, 34, 22, 60, 59, 37, 118, 121, 72, 123, 120, 112, 120, 72, 99, 110, 103, 114, 81, 94, 89, 93, 81, 68, 85, 111, 83, 66, 85, 84, 89, 68, 111, 92, 89, 94, 85, 111, 81, 69, 68, 95, 111, 83, 92, 95, 67, 85, 111, 93, 89, 92, 92, 89, 89, 77, 76, 87, 91, 84, 81, 91, 83, 103, 91, 87, 77, 86, 76, 92, 87, 79, 86, 103, 76, 81, 85, 93, 37, 49, 48, 43, 39, 40, 45, 39, 47, 27, 39, 48, 37, 27, 48, 45, 41, 33, 2, 22, 23, 12, 0, 15, 10, 0, 8, 60, 5, 15, 2, 21, 12, 17, 34, 32, 34, 41, 36, 30, 32, 50, 50, 36, 53, 50, 9, 11, 24, 5, 31, 25, 15, 6, 102, 109, 100, 108, 107, 90, 100, 97, 118, 90, 99, 119, 96, 116, 112, 96, 107, 102, 124, 81, 93, 95, 28, 84, 83, 81, 87, 80, 93, 93, 89, 28, 83, 86, 65, 28, 91, 92, 70, 87, 64, 65, 70, 91, 70, 91, 83, 94, 28, 84, 91, 92, 91, 65, 90, 109, 83, 81, 70, 91, 68, 91, 70, 75, 36, 53, 34, 35, 46, 51, 24, 43, 46, 41, 34, 24, 46, 41, 33, 40, 24, 51, 34, 63, 51, 87, 64, 7, 16, 15, 60, 2, 19, 19, 60, 1, 12, 22, 13, 7, 60, 22, 17, 15, 16, 34, 38, 112, 37, 27, 35, 52, 27, 43, 50, 33, 54, 40, 37, 61, 27, 55, 33, 39, 49, 54, 33, 27, 48, 43, 47, 33, 42, 84, 93, 64, 81, 87, 86, 109, 92, 70, 86, 109, 68, 0, 109, 87, 92, 83, 80, 94, 87, 86, 75, 65, 77, 76, 76, 75, 86, 81, 68, 73, 73, 122, 87, 64, 67, 64, 87, 87, 64, 87, 117, 114, 104, 121, 110, 111, 104, 117, 104, 117, 125, 112, 43, 37, 37, 48, 31, 46, 37, 56, 52, 31, 52, 47, 31, 36, 37, 51, 52, 41, 46, 33, 52, 41, 47, 46, 31, 47, 46, 35, 44, 41, 35, 43, 36, 41, 38, 44, 59, 43, 41, 56, 45, 104, 101, 125, 107, 113, 112, 2, 24, 8, 51, 14, 13, 15, 7, 51, 28, 30, 9, 31, 31, 51, 31, 25, 28, 28, 30, 9, 31, 31, 5, 3, 2, 51, 9, 2, 13, 14, 0, 9, 8, 8, 18, 2, 57, 5, 10, 15, 5, 13, 57, 0, 15, 10, 18, 3, 20, 15, 8, 1, 57, 3, 8, 7, 4, 10, 3, 2, 116, 110, 126, 69, 114, 115, 126, AbstractJsonLexerKt.TC_INVALID, 69, 117, 116, 69, 123, 116, 99, 69, 121, 118, 115, 121, 113, 69, AbstractJsonLexerKt.TC_INVALID, 116, 123, 120, 118, AbstractJsonLexerKt.TC_INVALID, 126, 39, 50, 37, 36, 62, 36, 35, 50, 57, 35, 8, 49, 56, 37, 52, 50, 51, 8, 57, 35, 51, 8, 39, 59, 54, 46, 36, 54, 41, 52, 50, 52, 39, 47, 50, 3, 20, 2, 20, 5, 46, 18, 3, 20, 16, 5, 24, 7, 20, 46, 18, 5, 16, 46, 29, 24, 2, 5, 20, 31, 20, 3, 46, 30, 31, 46, 18, 29, 24, 18, 26, 46, 20, 31, 16, 19, 29, 20, 21, 9, 30, 12, 26, 9, 31, 30, 31, 36, 13, 18, 31, 30, 20, 54, 45, 42, 48, 41, 33, 26, 41, 42, 34, 26, 36, 43, 60, 26, 44, 36, 39, 26, 38, 41, 44, 38, 46, 26, 42, 43, 38, 32, 19, 8, 15, 23, 63, 1, 4, 63, 3, 8, 15, 9, 3, 5, 63, 22, 82, 89, 66, 69, 93, 117, 73, 88, 79, 78, 67, 94, 117, 70, 67, 68, 79, 125, 102, 97, 121, 81, 109, 124, 107, 106, 103, 122, 81, 98, 103, 96, 107, 81, 97, 96, 81, 124, 109, 81, 125, 123, 109, 109, 107, 125, 125, 81, 125, 109, 124, 107, 107, 96, 31, 4, 3, 27, 51, 15, 30, 9, 8, 5, 24, 51, 0, 5, 2, 9, 51, 26, 94, 51, 13, 2, 5, 1, 13, 24, 5, 3, 2, 77, 86, 81, 73, 97, 93, 76, 91, 90, 87, 74, 97, 82, 87, 80, 91, 97, 72, 12, 97, 77, 74, 95, 74, 87, 93, 119, 108, 107, 115, 91, 104, 107, 101, 96, 97, 118, 91, 106, 112, 96, 106, 113, 118, 110, 70, 119, 124, 97, 109, 70, 122, 109, 120, 70, 118, 119, 70, 124, 119, 125, 122, 120, 107, 125, 107, 118, 107, 115, 122, 43, 48, 48, 51, 61, 62, 45, 0, 62, 60, 43, 0, 62, 44, 0, 60, 43, 62, 60, 59, 37};
    }

    static {
        A08();
        A0Z = new LinkedHashMap<>(10, 0.75f, false);
    }

    public LA(List<C1735fE> list) {
        this.A0U = list;
    }

    public static String A05(String str) {
        return A0Z.get(str);
    }

    private HashMap<String, String> A06(JSONObject jSONObject) {
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject(A04(232, 18, 95));
        HashMap<String, String> map = new HashMap<>();
        if (jSONObjectOptJSONObject == null) {
            return map;
        }
        Iterator<String> nameItr = jSONObjectOptJSONObject.keys();
        while (nameItr.hasNext()) {
            try {
                String next = nameItr.next();
                map.put(next, jSONObjectOptJSONObject.getString(next));
            } catch (JSONException unused) {
            }
        }
        return map;
    }

    public static List<C1735fE> A07(JSONObject jSONObject, C0958Hi c0958Hi, InterfaceC1748fR interfaceC1748fR) {
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray(A04(Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE, 8, 86));
        if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() > 0) {
            return AbstractC1743fM.A01(jSONArrayOptJSONArray, jSONObject, c0958Hi, interfaceC1748fR);
        }
        List<AdInfo> adInfoList = new ArrayList<>();
        C1735fE c1735fEA00 = C1735fE.A00(jSONObject);
        interfaceC1748fR.A4O(c1735fEA00, jSONObject);
        adInfoList.add(c1735fEA00);
        return adInfoList;
    }

    private void A09(int i5) {
        this.A00 = i5;
    }

    private final void A0A(int i5) {
        this.A04 = i5;
    }

    private void A0B(C1731fA c1731fA) {
        this.A07 = c1731fA;
    }

    private final void A0C(C1750fT c1750fT) {
        this.A08 = c1750fT;
    }

    private void A0D(C1753fW c1753fW) {
        this.A09 = c1753fW;
    }

    private final void A0E(C1756fZ c1756fZ) {
        this.A0A = c1756fZ;
    }

    private void A0F(C1765fi c1765fi) {
        this.A0B = c1765fi;
    }

    private void A0G(String str) {
        this.A0C = str;
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

    public final int A2y() {
        return this.A04;
    }

    public final int A2z() {
        return this.A05;
    }

    public final int A30() {
        return this.A06;
    }

    public final C1731fA A31() {
        return this.A07;
    }

    public final C1735fE A32() {
        return this.A0U.get(0);
    }

    public final C1750fT A33() {
        return this.A08;
    }

    public final C1753fW A34() {
        return this.A09;
    }

    public final C1756fZ A35() {
        return this.A0A;
    }

    public final C1765fi A36() {
        return this.A0B;
    }

    public final String A37() {
        return this.A0C;
    }

    public final String A38(String str) {
        return this.A0V.get(str);
    }

    public final List<C1735fE> A39() {
        return Collections.unmodifiableList(this.A0U);
    }

    /* JADX WARN: Removed duplicated region for block: B:6:0x000f A[ORIG_RETURN, RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0010  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A3A(InterfaceC2459r9 interfaceC2459r9) {
        char c11;
        String strA1c = A1c();
        switch (strA1c.hashCode()) {
            case -1364000502:
                String[] strArr = A0Y;
                if (strArr[2].charAt(14) == strArr[1].charAt(14)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0Y;
                strArr2[3] = "ynfghRupyY8lJ5WDqUPqAC0JO3E4ojqs";
                strArr2[0] = "OEwRxUcpVPGJQFz3LRrAkRkf0LWdVsmf";
                if (strA1c.equals(A04(547, 14, 71))) {
                    c11 = 1;
                }
                switch (c11) {
                    case 0:
                        interfaceC2459r9.A5C(A04(164, 45, 14));
                        break;
                    case 1:
                        break;
                    default:
                        return;
                }
                interfaceC2459r9.A5C(EnumC1658dy.A08.A03());
            case 604727084:
                if (strA1c.equals(A04(Sdk.SDKError.Reason.SILENT_MODE_MONITOR_ERROR_VALUE, 12, 32))) {
                    c11 = 0;
                }
                switch (c11) {
                }
                interfaceC2459r9.A5C(EnumC1658dy.A08.A03());
        }
        c11 = 65535;
        switch (c11) {
        }
        interfaceC2459r9.A5C(EnumC1658dy.A08.A03());
    }

    public final void A3B(JSONObject jSONObject) {
        String strA04;
        JSONObject layoutObject;
        A0C(C1750fT.A00(jSONObject.optJSONObject(A04(303, 16, 25))));
        A0W = jSONObject.optJSONObject(A04(Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, 12, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE));
        C1755fY c1755fYA06 = new C1755fY().A06(jSONObject.optString(A04(754, 5, 35)));
        String strA042 = A04(299, 4, 30);
        if (jSONObject.optJSONObject(strA042) != null) {
            strA04 = jSONObject.optJSONObject(strA042).optString(A04(777, 3, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE));
        } else {
            strA04 = A04(0, 0, 70);
        }
        A0E(c1755fYA06.A05(strA04).A04(jSONObject.optString(A04(0, 19, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE))).A07(AbstractC1757fa.A03(jSONObject)).A08());
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject(A04(372, 6, 56));
        if (jSONObjectOptJSONObject != null) {
            String strA043 = A04(495, 8, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE);
            if (A0Y[5].length() != 31) {
                throw new RuntimeException();
            }
            String[] strArr = A0Y;
            strArr[2] = "L9OC0yGJthGch16tOTqUcqcE9MnsMaz6";
            strArr[1] = "n6CgIEssquLp46jPM2UWfBhL1rINMjIc";
            layoutObject = jSONObjectOptJSONObject.optJSONObject(strA043);
        } else {
            layoutObject = null;
        }
        A0B(new C1731fA(C1744fN.A01(layoutObject), C1744fN.A01(jSONObjectOptJSONObject != null ? jSONObjectOptJSONObject.optJSONObject(A04(363, 9, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE)) : null)));
        A0F(AbstractC1757fa.A01(jSONObject));
        A0D(AbstractC1757fa.A00(jSONObject));
        A09(jSONObject.optInt(A04(19, 12, 43), 0));
        A0A(jSONObject.optInt(A04(145, 19, 57), -1));
        this.A0V.putAll(A06(jSONObject));
        this.A03 = jSONObject.optInt(A04(91, 18, 120), 0);
        this.A01 = jSONObject.optInt(A04(109, 16, 95), 1);
        this.A0Q = jSONObject.optBoolean(A04(759, 18, 99), false);
        this.A0P = jSONObject.optBoolean(A04(715, 15, 56), false);
        this.A0M = jSONObject.optBoolean(A04(730, 24, 37), false);
        this.A0N = jSONObject.optBoolean(A04(607, 16, 22), false);
        this.A05 = jSONObject.optInt(A04(31, 36, 12), 5000);
        this.A0D = jSONObject.optString(A04(Sdk.SDKError.Reason.INVALID_JSON_BID_PAYLOAD_VALUE, 21, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE));
        this.A0O = jSONObject.optBoolean(A04(623, 37, 50), false);
        this.A0H = jSONObject.optBoolean(A04(561, 29, Sdk.SDKError.Reason.TPAT_ERROR_VALUE), false);
        this.A0G = jSONObject.optBoolean(A04(331, 32, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE), false);
        this.A0F = jSONObject.optBoolean(A04(278, 21, 14), false);
        this.A06 = Math.max(1, jSONObject.optInt(A04(468, 27, 107), 1));
        this.A0J = jSONObject.optBoolean(A04(TTAdConstant.IMAGE_URL_CODE, 27, 90), false);
        this.A0I = jSONObject.optBoolean(A04(378, 34, 80), false);
        this.A0K = jSONObject.optBoolean(A04(439, 29, 38), true);
        this.A0L = jSONObject.optBoolean(A04(PglCryptUtils.COMPRESS_FAILED, 44, 77), false);
        this.A02 = jSONObject.optInt(A04(67, 24, 4), this.A03);
        String strOptString = jSONObject.optString(A04(230, 2, 8));
        A0G(strOptString);
        A0Z.put(strOptString, jSONObject.optString(A04(androidx.recyclerview.widget.n0.DEFAULT_SWIPE_ANIMATION_DURATION, 28, 120)));
        this.A0T = jSONObject.optBoolean(A04(689, 26, 2), false);
        this.A0S = jSONObject.optBoolean(A04(660, 29, 80), false);
        this.A0R = jSONObject.optBoolean(A04(590, 17, 92), false);
        AbstractC1762ff.A04(jSONObject, this.A0A);
        A25(jSONObject);
    }

    public final void A3C(boolean z11) {
        this.A0E = z11;
    }

    public final void A3D(boolean z11) {
        this.A0M = z11;
    }

    public final boolean A3E() {
        return this.A0E;
    }

    public final boolean A3F() {
        return A3O() || A3S();
    }

    public final boolean A3G() {
        return this.A0F;
    }

    public final boolean A3H() {
        return this.A0G;
    }

    public final boolean A3I() {
        return this.A0H;
    }

    public final boolean A3J() {
        return this.A0I;
    }

    public final boolean A3K() {
        return this.A0J;
    }

    public final boolean A3L() {
        return this.A0K;
    }

    public final boolean A3M() {
        return this.A0L;
    }

    public final boolean A3N() {
        return this.A0M;
    }

    public final boolean A3O() {
        return this.A0N;
    }

    public final boolean A3P() {
        return this.A0O;
    }

    public final boolean A3Q() {
        return this.A0P;
    }

    public final boolean A3R() {
        return this.A0Q;
    }

    public final boolean A3S() {
        return this.A0R;
    }

    public final boolean A3T() {
        return this.A0S;
    }

    public final boolean A3U() {
        return this.A0T;
    }
}
