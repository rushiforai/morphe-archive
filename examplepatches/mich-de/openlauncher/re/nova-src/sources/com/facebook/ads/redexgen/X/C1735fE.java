package com.facebook.ads.redexgen.X;

import androidx.compose.ui.node.LayoutNode;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.fE, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1735fE implements Serializable {
    public static byte[] A0C = null;
    public static String[] A0D = {"R5DeYR6FKIddoQ1tNFb4QO1F3D7YHRG7", "hniB1BSXMiqlCD6U", "jhH7rQZzgqsha0FGspkq8z1DrJIjsBJk", "lw6F7y1SoSoTAEcdzLyYaN1xEC1Q2oWX", "ic1GHkKPsX6vyCRQCqNODZsBJ", "Aw8qdmnq9PbtDTR9ez9n3jUjtBry3vCr", "3as5zHbOptZ96SzIdP7nSqOic", "mvWErpvjRXL0vWcjCyiUNQO7TD5zouZh"};
    public static final long serialVersionUID = 85021702336014823L;
    public C1737fG A00;
    public long A01;
    public C1738fH A02;
    public C1742fL A03;
    public C1746fP A04;
    public C1747fQ A05;
    public String A06;
    public boolean A07;
    public boolean A08;
    public boolean A09;
    public boolean A0A;
    public boolean A0B;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 22 out of bounds for length 19
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static C1735fE A00(JSONObject jSONObject) {
        int iOptInt;
        C1735fE c1735fE = new C1735fE();
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject(A01(TTAdConstant.DEEPLINK_UNAVAILABLE_CODE, 12, 2));
        C1741fK c1741fKA0M = new C1741fK().A0b(jSONObject.optString(A01(892, 5, 27))).A0a(jSONObject.optString(A01(884, 8, 10))).A0N(jSONObject.optString(A01(Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, 4, 113))).A0Z(jSONObject.optString(A01(870, 14, 57))).A0X(jSONObject.optString(A01(640, 12, 49))).A0U(jSONObject.optString(A01(600, 12, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE))).A0K(jSONObject.optString(A01(128, 8, 14))).A0P(jSONObject.optString(A01(231, 14, 10))).A0J(jSONObject.optString(A01(93, 16, 103))).A0L(jSONObject.optString(A01(165, 8, 111))).A0O(jSONObject.optString(A01(Sdk.SDKError.Reason.INVALID_GZIP_BID_PAYLOAD_VALUE, 17, 103))).A0W(A03(jSONObjectOptJSONObject, A01(629, 11, 75), A01(76, 6, 88))).A0Q(A03(jSONObjectOptJSONObject, A01(245, 19, 64), A01(8, 9, 45))).A0Y(A03(jSONObjectOptJSONObject, A01(824, 9, 104), A01(89, 4, 9))).A0M(A03(jSONObjectOptJSONObject, A01(TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173, 13, 76), A01(0, 8, 47)));
        String strA01 = A01(612, 17, 70);
        c1735fE.A09(c1741fKA0M.A0V(A03(jSONObjectOptJSONObject, strA01, A01(82, 7, 2))).A0R(jSONObject.optString(strA01)).A0S(A03(jSONObjectOptJSONObject, A01(376, 27, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE), A01(17, 22, 87))).A0T(A03(jSONObjectOptJSONObject, A01(586, 14, 43), A01(0, 0, 78))).A0c());
        c1735fE.A0C(jSONObject.optString(A01(579, 7, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE)));
        c1735fE.A0A(new C1746fP(jSONObject.optString(A01(364, 12, 15)), jSONObject.optString(A01(151, 14, 19)), jSONObject.optJSONObject(A01(140, 11, 84)), jSONObject.optString(A02(jSONObject)), jSONObject.optString(A01(186, 12, 26))));
        String strA012 = A01(897, 19, 84);
        if (jSONObject.optInt(strA012, -1) == -1) {
            if (A0D[1].length() == 16) {
                A0D[5] = "m0SNHJxvul7tSRvrfYkKg9k0pQQtrIDe";
                iOptInt = jSONObject.optInt(A01(853, 17, 68), -1);
            }
            throw new RuntimeException();
        }
        iOptInt = jSONObject.optInt(strA012, -1);
        C1737fG c1737fGA0K = new C1737fG().A0L(jSONObject.optString(A01(983, 9, 42))).A0J(jSONObject.optLong(A01(959, 24, 32), -1L)).A0F(iOptInt).A0E(jSONObject.optInt(A01(672, 18, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), LayoutNode.NotPlacedPlaceOrder)).A0D(jSONObject.optInt(A01(652, 20, 1), -1)).A0K(C1758fb.A02(jSONObject));
        JSONObject jSONObjectOptJSONObject2 = jSONObject.optJSONObject(A01(421, 5, 104));
        if (jSONObjectOptJSONObject2 != null) {
            C1737fG c1737fGA0I = c1737fGA0K.A0M(jSONObjectOptJSONObject2.optString(A01(916, 3, 71))).A0I(jSONObjectOptJSONObject2.optInt(A01(992, 5, 37)));
            if (A0D[1].length() == 16) {
                A0D[5] = "WsiHjZ6Ab9OhwgLQk07kFOW3FmkdrPnz";
                c1737fGA0I.A0H(jSONObjectOptJSONObject2.optInt(A01(TTAdConstant.VIDEO_COVER_URL_CODE, 6, 58)));
            }
            throw new RuntimeException();
        }
        c1735fE.A07(c1737fGA0K);
        c1735fE.A0G(jSONObject.optBoolean(A01(803, 21, 4)));
        c1735fE.A0B(new C1747fQ(AbstractC2392q4.A04(jSONObject.optJSONArray(A01(332, 15, 14))), jSONObject.optLong(A01(264, 24, 98), 0L), jSONObject.optLong(A01(288, 44, Sdk.SDKError.Reason.TPAT_ERROR_VALUE), 0L), jSONObject.optBoolean(A01(514, 26, 29)), jSONObject.optBoolean(A01(435, 31, 104), false), jSONObject.optBoolean(A01(466, 34, 61), false), jSONObject.optBoolean(A01(690, 45, 30), false), jSONObject.optBoolean(A01(735, 35, 25), false), A04(jSONObject.optJSONArray(A01(347, 17, 32)))));
        c1735fE.A0D(jSONObject.optBoolean(A01(560, 19, 81)));
        c1735fE.A06(jSONObject.optLong(A01(109, 19, 21), 0L));
        return c1735fE;
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0C, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 58);
            String[] strArr = A0D;
            if (strArr[3].charAt(22) != strArr[0].charAt(22)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0D;
            strArr2[2] = "LXXQrjhAH5CnLq5fKQjRUnrA3R85ks8i";
            strArr2[7] = "Vzc9rcIkwZ9oA3QEo9fi0aCOPKhgVZjz";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A0C = new byte[]{86, 116, 97, 112, 114, 122, 103, 108, 83, 120, 96, 121, 123, 120, 118, 115, 100, 43, 31, 2, 0, 77, 42, 2, 2, 10, 1, 8, 77, 61, 1, 12, 20, 77, 62, 25, 2, 31, 8, 61, 0, 84, 3, 29, 24, 24, 84, 21, 1, 0, 27, 25, 21, 0, 29, 23, 21, 24, 24, 13, 84, 27, 4, 17, 26, 84, 29, 26, 84, 47, 7, 17, 23, 7, 41, 7, 48, 3, 22, 11, 12, 5, 106, 93, 78, 81, 93, 79, 75, 96, 90, 73, 86, 60, 57, 2, 62, 47, 56, 60, 41, 52, 43, 56, 2, 41, 36, 45, 56, 78, 75, 112, 89, 70, 75, 74, 64, 112, 67, 64, 64, 95, 112, 91, 70, 66, 74, 92, 85, 68, 68, 107, 71, 93, 78, 81, 41, 36, 47, 50, 12, 27, 26, 26, 1, 0, 49, 7, 13, 1, 0, 74, 72, 69, 69, 118, 93, 70, 118, 72, 74, 93, 64, 70, 71, 54, 52, 33, 48, 50, 58, 39, 44, 21, 23, 2, 19, 17, 25, 4, 15, 41, 2, 19, 14, 2, 67, 84, 65, AbstractJsonLexerKt.TC_INVALID, 77, 69, 84, 65, 68, 65, 84, 65, 61, 60, 53, 56, 32, 6, 58, 53, 48, 58, 50, 6, 45, 60, 33, 45, 57, 56, 46, 41, 52, 51, 60, 41, 52, 50, 51, 2, 41, 52, 41, 49, 56, 84, 95, 71, 94, 92, 95, 81, 84, 111, 83, 95, 69, 94, 68, 30, 21, 13, 20, 22, 21, 27, 30, 37, 25, 21, 15, 20, 14, 37, 14, 31, 2, 14, 61, 54, 60, 7, 59, 57, 42, 60, 7, 62, 55, 42, 59, 61, 7, 46, 49, 61, 47, 7, 44, 49, 53, 61, 38, 45, 39, 28, 32, 34, 49, 39, 28, 37, 44, 49, 32, 38, 28, 53, 42, 38, 52, 28, 55, 42, 46, 38, 28, 37, 44, 49, 28, 48, 38, 32, 44, 45, 39, 28, 38, 45, 39, 28, 32, 34, 49, 39, 81, 90, 80, 107, 87, 85, 70, 80, 107, 93, 89, 85, 83, 81, 71, AbstractJsonLexerKt.TC_INVALID, 116, 126, 69, 121, 123, 104, 126, 69, 119, AbstractJsonLexerKt.TC_INVALID, 110, 123, 126, 123, 110, 123, 83, 87, 84, 81, 106, 86, 90, 88, 88, 84, 91, 81, 33, 53, 40, 42, 24, 32, 40, 40, 32, 43, 34, 24, 55, 43, 38, 62, 24, 52, 51, 40, 53, 34, 24, 51, 34, 63, 51, 95, 93, 86, 93, 74, 81, 91, 103, 76, 93, 64, 76, 104, 101, 105, 103, 104, 116, 59, 63, 51, 53, 55, 105, 109, 97, 103, 101, 95, 117, 114, 108, 59, 33, 13, 55, 60, 54, 13, 49, 51, 32, 54, 13, 36, 96, 13, 32, 55, 54, 55, 33, 59, 53, 60, 13, 55, 60, 51, 48, 62, 55, 54, 110, 116, 88, 104, 100, 88, 98, 105, 99, 88, 100, 102, 117, 99, 88, 113, 53, 88, 117, 98, 99, 98, 116, 110, 96, 105, 88, 98, 105, 102, 101, 107, 98, 99, 70, 92, 112, 93, 74, 88, 78, 93, 75, 74, 75, 112, 78, 75, 78, 84, 120, 84, 66, 68, 72, 73, 67, 120, 66, 73, 67, 120, 68, 70, 85, 67, 120, 66, 73, 70, 69, 75, 66, 67, 3, 25, 53, 28, 3, 14, 15, 5, 53, 11, 31, 14, 3, 5, 53, 7, 31, 30, 15, 14, 2, 24, 52, 28, 10, 31, 8, 3, 52, 10, 5, 15, 52, 9, 25, 4, 28, 24, 14, 53, 36, 38, 46, 36, 34, 32, 97, 112, 99, 101, AbstractJsonLexerKt.TC_INVALID, 116, 99, 98, 121, 120, 97, 78, 112, 117, 52, 39, 50, 47, 40, 33, 25, 37, 41, 51, 40, 50, 14, 29, 8, 21, 18, 27, 35, 31, 19, 9, 18, 8, 35, 8, 25, 4, 8, 3, 16, 5, 24, 31, 22, 46, 5, 20, 9, 5, 121, 106, AbstractJsonLexerKt.TC_INVALID, 98, 101, 108, 84, 125, 106, 103, 126, 110, 72, 94, 88, 84, 85, 95, 72, 100, 93, 84, 73, 100, 85, 94, 67, 79, 100, 88, 79, 90, 51, 37, 35, 47, 46, 36, 51, 31, 38, 47, 50, 31, 50, 37, 55, 33, 50, 36, 87, 76, 75, 81, 72, 64, 123, 86, 65, 74, 64, 65, 86, 123, 65, 74, 64, 71, 69, 86, 64, 123, 73, 65, 80, 69, 64, 69, 80, 69, 123, 83, 77, 80, 76, 75, 81, 80, 123, 86, 69, 80, 77, 74, 67, 80, 75, 76, 86, 79, 71, 124, 86, 80, 70, 124, 80, 70, 81, 85, 70, 81, 124, 81, 66, 87, 74, 77, 68, 124, 64, 76, 86, 77, 87, 124, 87, 70, 91, 87, 75, 80, 87, 79, 103, 93, 86, 92, 103, 91, 89, 74, 92, 126, 101, 98, 122, 82, 104, 117, 100, 121, 82, 121, AbstractJsonLexerKt.TC_INVALID, 108, 99, 126, 100, 121, 100, 98, 99, 77, 86, 81, 73, 97, 87, 80, 74, 76, 81, 97, 74, 76, 95, 80, 77, 87, 74, 87, 81, 80, 33, 59, 40, 55, 13, 38, 55, 42, 38, 11, 19, 17, 8, 39, 25, 22, 28, 39, 20, 23, 11, 29, 39, 10, 29, 15, 25, 10, 28, 13, 21, 23, 14, 14, 31, 28, 18, 27, 33, 13, 27, 29, 17, 16, 26, 13, 112, 108, 96, 106, 98, 111, 92, 96, 108, 109, 119, 102, 123, 119, 67, 69, 82, 68, 89, 68, 92, 85, 85, 72, 85, 77, 68, 27, 0, 29, 5, 7, 30, 30, 15, 12, 2, 11, 49, 29, 11, 13, 1, 0, 10, 29, 8, 15, 17, 123, 100, 105, 104, 98, 82, 108, 120, 121, 98, 125, 97, 108, 116, 82, 104, 99, 108, 111, 97, 104, 105, 64, 95, 82, 83, 89, 105, 82, 67, 68, 87, 66, 95, 89, 88, 105, 69, 83, 85, 108, 115, 126, AbstractJsonLexerKt.TC_INVALID, 117, 69, 106, 104, AbstractJsonLexerKt.TC_INVALID, 118, 117, 123, 126, 69, 105, 115, 96, AbstractJsonLexerKt.TC_INVALID, 69, 120, 99, 110, AbstractJsonLexerKt.TC_INVALID, 105, 102, 121, 116, 117, AbstractJsonLexerKt.TC_INVALID, 79, 101, 98, 124, 104, 118, 123, 107, 119};
    }

    static {
        A05();
    }

    public static String A02(JSONObject jSONObject) {
        String strA01 = A01(198, 16, 99);
        String strA012 = A01(39, 37, 78);
        String strOptString = jSONObject.optString(strA01, strA012);
        if (((String) YQ.A00(strOptString)).equals(strA012)) {
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject(A01(TTAdConstant.DEEPLINK_UNAVAILABLE_CODE, 12, 2));
            if (jSONObjectOptJSONObject != null) {
                strA012 = jSONObjectOptJSONObject.optString(strA01, strA012);
            }
            return strA012;
        }
        return strOptString;
    }

    public static String A03(JSONObject jSONObject, String str, String str2) {
        return jSONObject != null ? jSONObject.optString(str, str2) : str2;
    }

    public static List<C2277o9> A04(JSONArray jSONArray) {
        ArrayList arrayList = new ArrayList();
        if (jSONArray != null) {
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
                if (jSONObjectOptJSONObject != null) {
                    String subtitle = jSONObjectOptJSONObject.optString(A01(892, 5, 27));
                    String title = jSONObjectOptJSONObject.optString(A01(884, 8, 10));
                    String strOptString = jSONObjectOptJSONObject.optString(A01(426, 9, 58));
                    if (subtitle.isEmpty()) {
                        subtitle = null;
                    }
                    if (title.isEmpty()) {
                        title = null;
                    }
                    arrayList.add(new C2277o9(subtitle, title, strOptString.isEmpty() ? null : strOptString));
                }
            }
        }
        return arrayList;
    }

    private final void A06(long j11) {
        this.A01 = Math.max(0L, j11);
    }

    private void A07(C1737fG c1737fG) {
        this.A00 = c1737fG;
    }

    private final void A08(C1738fH c1738fH) {
        this.A02 = c1738fH;
    }

    private final void A09(C1742fL c1742fL) {
        this.A03 = c1742fL;
    }

    private final void A0A(C1746fP c1746fP) {
        this.A04 = c1746fP;
    }

    private final void A0B(C1747fQ c1747fQ) {
        this.A05 = c1747fQ;
    }

    private final void A0C(String str) {
        this.A06 = str;
    }

    private final void A0D(boolean z11) {
        this.A08 = z11;
    }

    private final void A0E(boolean z11) {
        this.A09 = z11;
    }

    private final void A0F(boolean z11) {
        this.A0A = z11;
    }

    private final void A0G(boolean z11) {
        this.A0B = z11;
    }

    public final long A0H() {
        return this.A01;
    }

    public final C1738fH A0I() {
        return this.A02;
    }

    public final C1742fL A0J() {
        return this.A03;
    }

    public final C1746fP A0K() {
        return this.A04;
    }

    public final C1747fQ A0L() {
        return this.A05;
    }

    public final String A0M() {
        return this.A06;
    }

    public final void A0N(int i5) {
        this.A00.A0D(i5);
        A08(this.A00.A0Q());
    }

    public final void A0O(JSONObject jSONObject) {
        A08(this.A00.A0Q());
    }

    public final void A0P(JSONObject jSONObject) {
        this.A00.A0O(jSONObject.optBoolean(A01(919, 22, 55)));
        this.A00.A0N(jSONObject.optBoolean(A01(540, 20, 80), true));
        A08(this.A00.A0Q());
        A0S(jSONObject.optBoolean(A01(500, 14, 21)));
        A0E(jSONObject.optBoolean(A01(770, 13, 2)));
        A0F(jSONObject.optBoolean(A01(783, 20, 55)));
    }

    public final void A0Q(JSONObject jSONObject) {
        this.A00.A0N(jSONObject.optBoolean(A01(540, 20, 80), true));
        A08(this.A00.A0Q());
    }

    public final void A0R(JSONObject jSONObject) {
        this.A00.A0G(jSONObject.optInt(A01(941, 18, 12)));
        this.A00.A0N(jSONObject.optBoolean(A01(540, 20, 80), true));
        this.A00.A0P(jSONObject.optBoolean(A01(833, 20, 66), false));
        A08(this.A00.A0Q());
        A0E(jSONObject.optBoolean(A01(770, 13, 2)));
    }

    public final void A0S(boolean z11) {
        this.A07 = z11;
    }

    public final boolean A0T() {
        return this.A07;
    }

    public final boolean A0U() {
        return this.A08;
    }

    public final boolean A0V() {
        return this.A01 > 0;
    }

    public final boolean A0W() {
        return this.A09;
    }

    public final boolean A0X() {
        return this.A0B;
    }
}
