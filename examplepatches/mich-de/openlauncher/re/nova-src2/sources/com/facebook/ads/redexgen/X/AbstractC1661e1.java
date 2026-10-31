package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.text.TextUtils;
import android.util.Pair;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.e1, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1661e1 {
    public static byte[] A00;
    public static String[] A01 = {"Xk1kfMm1vqid3nXGcMABBxIYdKXbDo3B", "Tba49h0j1DSqTKK5AZeMHCixjNSvNzC8", "tUw1vJOBnlNHWQpnwJpSUOvNN6rHufed", "MNv3cAivDgcv7LDkpHDZbr6ID5svYoE2", "bpitahLPIV1cyga99qmdGNHRvutJJD57", "WjDmZ9QFMIoPWrPjMhTZzTZlD9IeDf6c", "Ay8snxOVcxDEDKoHcRjXuKsAG8X7C1Ma", "Hie4DHlmJa88KDCvfDwYVWlCV2Ts1"};

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static WebResourceResponse A00(C0958Hi c0958Hi, WebResourceRequest webResourceRequest, Uri uri, String str, HashMap<String, String> map) throws JSONException, IOException {
        String strA02;
        String strA022 = A02(85, 5, 83);
        NN nnA0H = C1562cP.A06(c0958Hi.A02()).A0H(c0958Hi);
        C2086kz.A0H(c0958Hi, uri.toString());
        try {
            C1660e0 c1660e0 = new C1660e0(c0958Hi.A02(), uri, nnA0H);
            int iAvailable = c1660e0.available();
            if (iAvailable <= 0) {
                A05(c0958Hi, 1, new Pair[]{new Pair(A02(61, 9, 115), String.valueOf(iAvailable))});
                return null;
            }
            String strA03 = A03(webResourceRequest.getRequestHeaders());
            if (strA03 == null) {
                c0958Hi.A0F().A6m();
                A06(map, iAvailable);
                return new WebResourceResponse(str, null, 200, A02(44, 2, 33), map, c1660e0);
            }
            try {
                C1662e2 c1662e2A01 = A01(strA03);
                if (c1662e2A01.A03) {
                    int i5 = c1662e2A01.A01;
                    int i11 = c1662e2A01.A00 == -1 ? iAvailable - 1 : c1662e2A01.A00;
                    A06(map, iAvailable);
                    map.put(A02(31, 13, 62), A02(75, 6, 100) + i5 + A02(1, 1, 0) + i11 + A02(2, 1, 88) + iAvailable);
                    c0958Hi.A0F().A6m();
                    return new WebResourceResponse(str, null, Sdk.SDKError.Reason.AD_ALREADY_FAILED_VALUE, A02(46, 15, 10), map, c1660e0);
                }
                if (c1662e2A01.A02 != null) {
                    strA02 = c1662e2A01.A02;
                } else {
                    if (A01[1].charAt(3) == 'U') {
                        throw new RuntimeException();
                    }
                    A01[4] = "uHkXDZAZlpB5P3uzvkbRDbIcwaFBDsfL";
                    strA02 = A02(90, 4, 70);
                }
                A05(c0958Hi, 0, new Pair[]{new Pair(A02(94, 5, 79), strA02)});
                return null;
            } catch (NumberFormatException e3) {
                A05(c0958Hi, 3, new Pair[]{new Pair(strA022, e3.toString())});
                return null;
            }
        } catch (IOException e11) {
            A05(c0958Hi, 2, new Pair[]{new Pair(strA022, e11.toString())});
            return null;
        }
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 8);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A00 = new byte[]{118, 53, -113, 97, -67, -33, -33, -31, -20, -16, -87, -50, -35, -22, -29, -31, -17, 88, -124, -125, -119, 122, -125, -119, 66, 97, 122, -125, 124, -119, 125, -119, -75, -76, -70, -85, -76, -70, 115, -104, -89, -76, -83, -85, 120, 116, 98, 115, -124, -122, 123, 115, 126, 50, 85, -127, -128, -122, 119, -128, -122, -36, -15, -36, -28, -25, -36, -35, -25, -32, -122, -99, -104, -119, -105, -50, -27, -32, -47, -33, -116, -127, -115, -126, -125, -64, -51, -51, -54, -51, -68, -61, -70, -70, -55, -72, -59, -66, -68};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    public static void A05(C0958Hi c0958Hi, int i5, Pair<String, String>[] pairArr) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(A02(81, 4, 22), i5);
            for (Pair<String, String> pair : pairArr) {
                jSONObject.put((String) pair.first, pair.second);
            }
        } catch (JSONException unused) {
        }
        c0958Hi.A0F().A6l(jSONObject.toString());
    }

    static {
        A04();
    }

    public static C1662e2 A01(String str) {
        if (str == null) {
            C1662e2 parseResult = new C1662e2();
            parseResult.A03 = false;
            parseResult.A02 = null;
            return parseResult;
        }
        String[] strArrSplit = str.split(A02(3, 1, 28));
        if (strArrSplit.length >= 2) {
            if (A02(70, 5, 28).equals(strArrSplit[0].toLowerCase(Locale.US).trim())) {
                if (strArrSplit[1].trim().split(A02(0, 1, 66)).length != 1) {
                    C1662e2 c1662e2 = new C1662e2();
                    c1662e2.A03 = false;
                    c1662e2.A02 = str;
                    return c1662e2;
                }
                String[] rangeParts = strArrSplit[1].trim().split(A02(1, 1, 0));
                C1662e2 c1662e22 = new C1662e2();
                c1662e22.A03 = true;
                c1662e22.A02 = str;
                c1662e22.A01 = TextUtils.isEmpty(rangeParts[0]) ? 0 : Integer.parseInt(rangeParts[0]);
                int length = rangeParts.length;
                String[] mainParts = A01;
                if (mainParts[7].length() != 29) {
                    throw new RuntimeException();
                }
                String[] strArr = A01;
                strArr[2] = "pgB7YcOeECmWisHlhnCXqQl4jF6X8fPP";
                strArr[5] = "MuK1RJAj7x3zyJ1VHs3Dmt0bGGRcsf8r";
                if (length > 1) {
                    c1662e22.A00 = TextUtils.isEmpty(rangeParts[1]) ? -1 : Integer.parseInt(rangeParts[1]);
                } else {
                    c1662e22.A00 = -1;
                }
                return c1662e22;
            }
        }
        C1662e2 c1662e23 = new C1662e2();
        c1662e23.A03 = false;
        c1662e23.A02 = str;
        return c1662e23;
    }

    public static String A03(Map<String, String> map) {
        for (String str : map.keySet()) {
            if (A02(94, 5, 79).equals(str.toLowerCase(Locale.US))) {
                return map.get(str);
            }
        }
        return null;
    }

    public static void A06(HashMap<String, String> map, int i5) {
        map.put(A02(4, 13, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), A02(70, 5, 28));
        map.put(A02(17, 14, 13), String.valueOf(i5));
    }
}
