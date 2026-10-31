package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.lw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2143lw {
    public static byte[] A04;
    public static String[] A05 = {"MRuBx", "tnrUNtkj", "pjyIxrC6Yt5E7Bc8e3CsDS5x0xMg", "2xISKY0hJDtdJSu4Q6JXzE3xpGdbyGij", "ditV1dZQcpc", "LaRPF5Qegj7e827D6k5bX2o3j9w5", "b", "ieJW9hY3GIu"};
    public final String A00;
    public final String A01;
    public final Map<EnumC2147m0, List<String>> A02 = new HashMap();
    public final JSONObject A03;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 9);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        byte[] bArr = {-23, -18, -27, -38, -69, -72, -78};
        String[] strArr = A05;
        if (strArr[2].length() != strArr[5].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A05;
        strArr2[4] = "sekG1ort6wl";
        strArr2[7] = "5zf1LSqUL7z";
        A04 = bArr;
    }

    static {
        A01();
    }

    /* JADX WARN: Incorrect condition in loop: B:12:0x0035 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public C2143lw(String str, String str2, JSONObject jSONObject, JSONArray jSONArray) throws JSONException {
        List<String> list;
        this.A00 = str;
        this.A01 = str2;
        this.A03 = jSONObject;
        if (jSONArray == null || jSONArray.length() == 0) {
            return;
        }
        for (EnumC2147m0 enumC2147m0 : EnumC2147m0.values()) {
            this.A02.put(enumC2147m0, new LinkedList());
        }
        for (int i5 = 0; i5 < i; i5++) {
            try {
                JSONObject jSONObject2 = jSONArray.getJSONObject(i5);
                String trackerUrl = jSONObject2.getString(A00(0, 4, 108));
                String trackerTypeStr = jSONObject2.getString(A00(4, 3, 61));
                EnumC2147m0 enumC2147m0ValueOf = EnumC2147m0.valueOf(trackerUrl.toUpperCase(Locale.US));
                if (!TextUtils.isEmpty(trackerTypeStr) && (list = this.A02.get(enumC2147m0ValueOf)) != null) {
                    list.add(trackerTypeStr);
                }
            } catch (Exception unused) {
            }
        }
    }

    public final String A02() {
        return this.A00;
    }

    public final List<String> A03(EnumC2147m0 enumC2147m0) {
        return this.A02.get(enumC2147m0);
    }

    public final JSONObject A04() {
        return this.A03;
    }
}
