package com.facebook.ads.redexgen.X;

import android.util.Log;
import android.util.Pair;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.Gs, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0942Gs implements InterfaceC2222nE {
    public static byte[] A02;
    public static String[] A03 = {"4VJF", "NMiFc9mQHDdEdTYDts8ebbMyjIljV2c0", "gJxI4lQggzgG7l1t48TOLBAVsZm4smpW", "RC", "7emK", "VnvWTQ3PSRLSSOUq71E5D", "jZ42e8scbVg896gjqaujwC7", "gj"};
    public static final String A04;
    public C0957Hh A00;
    public HC A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A03;
            if (strArr[0].length() != strArr[4].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A03;
            strArr2[5] = "6iaNxoAqzoeupDn53l2Cm";
            strArr2[6] = "N7vye13Dqewush4C3JTfsv4";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 104);
            i13++;
        }
    }

    public static void A05() {
        A02 = new byte[]{21, 83, 90, 71, 21, 80, 67, 80, 91, 65, 124, 81, 21, 60, 111, 105, AbstractJsonLexerKt.TC_INVALID, AbstractJsonLexerKt.TC_INVALID, 121, 111, 111, 122, 105, 112, 112, 101, 50, 110, 101, 68, 77, 68, 85, 68, 69, 1, 68, 87, 68, 79, 85, 82, 1, 68, 89, 66, 68, 68, 69, 68, 69, 1, 83, 68, 85, 83, 88, 1, 77, 72, 76, 72, 85, 15, 1, 98, 78, 84, 79, 85, 27, 1, 72, 123, 104, 99, 121, 45, 121, 116, 125, 104, 45, 125, AbstractJsonLexerKt.TC_INVALID, 98, 110, 104, 126, 126, 104, 105, 45, 111, 116, 45, 121, 101, 104, 45, 126, 104, AbstractJsonLexerKt.TC_INVALID, 123, 104, AbstractJsonLexerKt.TC_INVALID, 55, 45, 84, 115, 123, 126, 119, 118, 50, 102, 125, 50, 98, 115, 96, 97, 119, 50, 115, 124, 50, 119, 100, 119, 124, 102, 50, 123, 124, 50, 119, 100, 119, 124, 102, 97, 50, 115, 96, 96, 115, 107, 50, 116, 125, 96, 50, 118, 123, 97, 98, 115, 102, 113, 122, 50, 116, 115, 123, 126, 103, 96, 119, 60, 65, 119, 96, 100, 119, 96, 50, 98, 96, 125, 113, 119, 97, 97, 119, 118, 50, 119, 100, 119, 124, 102, 91, 118, 50, 50, 4, 19, 23, 4, 19, 65, 19, 4, 21, 20, 19, 15, 4, 5, 65, 15, 14, 15, 76, 19, 4, 21, 19, 24, 0, 3, 13, 4, 65, 4, 19, 19, 14, 19, 65, 2, 14, 5, 4, 65, 42, 28, 11, 15, 28, 11, 89, 11, 28, 13, 12, 11, 23, 28, 29, 89, 11, 28, 13, 11, 0, 24, 27, 21, 28, 89, 28, 11, 11, 22, 11, 89, 26, 22, 29, 28, 89, 86, 109, 98, 97, 111, 102, 35, 119, 108, 35, 115, 98, 113, 112, 102, 35, 103, 102, 97, 118, 100, 79, 108, 100, 70, 117, 102, 109, 119, 35, 98, 119, 35, 6, 61, 50, 49, 63, 54, 115, 39, 60, 115, 35, 50, 33, 32, 54, 115, 54, 37, 54, 61, 39, 115, 50, 39, 115, 111, 84, 91, 88, 86, 95, 26, 78, 85, 26, 74, 91, 72, 73, 95, 26, 73, 95, 72, 76, 95, 72, 26, 72, 95, 73, 74, 85, 84, 73, 95, 26, 91, 78, 26, 74, 85, 73, 83, 78, 83, 85, 84, 26, 80, 92, 87, 86, 104, 109, 120, 109, 110, 109, AbstractJsonLexerKt.TC_INVALID, 105, 17, 2, 17, 26, 0, 7, 6, 5, 1, 20, 21, 18, 5, 77, 3, 15, 14, 6, 9, 7, 77, 5, 22, 5, 14, 20, 77, 13, 1, 7, 9, 3, 33, 34, 38, 51, 50, 53, 34, 24, 36, 40, 41, 33, 46, 32, 44, 33, 71, 90, 94, 86, 60, 39, 35, 45, 38, 59};
    }

    static {
        A05();
        A04 = C0942Gs.class.getSimpleName();
    }

    public C0942Gs(C0957Hh c0957Hh, HC hc) {
        this.A00 = c0957Hh;
        this.A01 = hc;
    }

    public static JSONArray A01(C0957Hh c0957Hh, JSONArray jSONArray, JSONArray jSONArray2) {
        int i5 = 0;
        if (jSONArray != null) {
            int limit = jSONArray.length();
            i5 = 0 + limit;
        }
        if (jSONArray2 != null) {
            int limit2 = jSONArray2.length();
            i5 += limit2;
        }
        return A02(c0957Hh, jSONArray, jSONArray2, i5);
    }

    /* JADX WARN: Code restructure failed: missing block: B:42:0x00f9, code lost:
    
        if (r22 <= 0) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00fb, code lost:
    
        if (r5 == null) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00fd, code lost:
    
        r8.put(r5);
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x0100, code lost:
    
        return r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x0101, code lost:
    
        if (r4 == null) goto L45;
     */
    /* JADX WARN: Code restructure failed: missing block: B:47:0x0103, code lost:
    
        r8.put(r4);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static JSONArray A02(C0957Hh c0957Hh, JSONArray jSONArray, JSONArray jSONArray2, int i5) throws JSONException {
        if (jSONArray != null) {
            if (jSONArray2 == null) {
                return jSONArray;
            }
            int length = jSONArray.length();
            int length2 = jSONArray2.length();
            JSONArray jSONArray3 = new JSONArray();
            int debugIdx = 0;
            int limit = 0;
            JSONObject jSONObject = null;
            JSONObject jSONObject2 = null;
            double d5 = Double.MAX_VALUE;
            double d11 = Double.MAX_VALUE;
            while (true) {
                if ((debugIdx >= length && limit >= length2) || i5 <= 0) {
                    break;
                }
                String[] strArr = A03;
                if (strArr[0].length() != strArr[4].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A03;
                strArr2[7] = "aN";
                strArr2[3] = "P5";
                String strA00 = A00(435, 4, 91);
                if (debugIdx < length && jSONObject == null) {
                    try {
                        jSONObject = jSONArray.getJSONObject(debugIdx);
                        d5 = jSONObject.getDouble(strA00);
                    } catch (JSONException e3) {
                        if (c0957Hh.A05().AB6()) {
                            Log.e(A04, A00(273, 33, 107) + debugIdx, e3);
                        }
                        jSONObject = null;
                        d5 = Double.MAX_VALUE;
                    }
                    debugIdx++;
                }
                if (limit < length2 && jSONObject2 == null) {
                    try {
                        jSONObject2 = jSONArray2.getJSONObject(limit);
                        d11 = jSONObject2.getDouble(strA00);
                    } catch (JSONException e11) {
                        if (c0957Hh.A05().AB6()) {
                            Log.e(A04, A00(306, 25, 59) + limit, e11);
                        }
                        jSONObject2 = null;
                        d11 = Double.MAX_VALUE;
                    }
                    limit++;
                }
                if (jSONObject != null || jSONObject2 != null) {
                    if (jSONObject == null || d11 < d5) {
                        jSONArray3.put(jSONObject2);
                        jSONObject2 = null;
                        d11 = Double.MAX_VALUE;
                    } else {
                        jSONArray3.put(jSONObject);
                        jSONObject = null;
                        d5 = Double.MAX_VALUE;
                    }
                    i5--;
                }
            }
        } else {
            return jSONArray2;
        }
    }

    private JSONObject A03() throws JSONException {
        JSONArray jSONArrayA03;
        JSONObject jSONObjectA7T = this.A01.A7T();
        JSONArray jSONArrayA7S = this.A01.A7S();
        if (AbstractC2205mx.A0P(this.A00) && (jSONArrayA03 = C2128lh.A03(this.A00)) != null && jSONArrayA03.length() > 0) {
            C0957Hh c0957Hh = this.A00;
            String[] strArr = A03;
            if (strArr[7].length() != strArr[3].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A03;
            strArr2[1] = "DqeH9SIpXFi3b8zfs8mhzwqF8zVFhPmm";
            strArr2[2] = "TV1z9woSYeZeWz7dxNs9KlrMFeTbS55S";
            jSONArrayA7S = A01(c0957Hh, jSONArrayA03, jSONArrayA7S);
        }
        JSONObject jSONObject = null;
        if (jSONArrayA7S != null) {
            try {
                jSONObject = new JSONObject();
                if (jSONObjectA7T != null) {
                    jSONObject.put(A00(439, 6, 32), jSONObjectA7T);
                }
                jSONObject.put(A00(387, 6, 28), jSONArrayA7S);
            } catch (JSONException unused) {
                return null;
            }
        }
        return jSONObject;
    }

    private JSONObject A04(int i5) throws JSONException {
        int iA08;
        JSONArray jSONArrayA04;
        Pair<JSONObject, JSONArray> tokensAndEvents = this.A01.A9v(i5);
        JSONObject jSONObject = (JSONObject) tokensAndEvents.first;
        JSONArray debugLogEvents = (JSONArray) tokensAndEvents.second;
        if (AbstractC2205mx.A0P(this.A00) && (jSONArrayA04 = C2128lh.A04(this.A00, (iA08 = AbstractC2205mx.A08(this.A00)))) != null && jSONArrayA04.length() > 0) {
            debugLogEvents = A02(this.A00, jSONArrayA04, debugLogEvents, i5 + iA08);
        }
        JSONObject payload = null;
        if (debugLogEvents != null) {
            try {
                payload = new JSONObject();
                if (jSONObject != null) {
                    payload.put(A00(439, 6, 32), jSONObject);
                }
                payload.put(A00(387, 6, 28), debugLogEvents);
            } catch (JSONException unused) {
                return null;
            }
        }
        return payload;
    }

    private void A06(String str) {
        if (C2128lh.A0I(str)) {
            C2128lh.A0B(this.A00, str);
        } else {
            this.A01.AAj(str);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2222nE
    public final JSONObject A5u() {
        int eventLimit = AbstractC2205mx.A0F(this.A00);
        return eventLimit > 0 ? A04(eventLimit) : A03();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2222nE
    public final boolean ABJ() {
        int eventCount = AbstractC2205mx.A0F(this.A00);
        if (eventCount < 1) {
            return false;
        }
        int iA8d = this.A01.A8d();
        int eventLimit = C2128lh.A00(this.A00);
        return iA8d + eventLimit > eventCount;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2222nE
    public final void ADq() {
        int iA5Z = this.A01.A5Z(AbstractC2205mx.A0G(this.A00));
        if (iA5Z > 0) {
            this.A00.A08().ABz(A00(379, 8, 100), AbstractC2126lf.A10, new C2127lg(A00(28, 44, 73) + iA5Z));
        }
        C0957Hh c0957Hh = this.A00;
        String[] strArr = A03;
        String str = strArr[5];
        String str2 = strArr[6];
        int attemptsExceededEventsCount = str.length();
        int retryLimit = str2.length();
        if (attemptsExceededEventsCount == retryLimit) {
            throw new RuntimeException();
        }
        String[] strArr2 = A03;
        strArr2[5] = "bzDkK7DGlCk2AgYUikBmx";
        strArr2[6] = "oAHu9PBino36rPxONmBwiLk";
        C2128lh.A0F(c0957Hh);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2222nE
    public final void AEf(JSONArray jSONArray) {
        int length = jSONArray.length();
        for (int i5 = 0; i5 < length; i5++) {
            try {
                A06(jSONArray.getJSONObject(i5).getString(A00(433, 2, 45)));
            } catch (JSONException e3) {
                if (this.A00.A05().AB6()) {
                    String str = A04;
                    String[] strArr = A03;
                    String str2 = strArr[5];
                    String str3 = strArr[6];
                    int i11 = str2.length();
                    int length2 = str3.length();
                    if (i11 == length2) {
                        throw new RuntimeException();
                    }
                    String[] strArr2 = A03;
                    strArr2[1] = "UiT9WvgcUGvh4UJIWCcVV8uUv9KhPAuj";
                    strArr2[2] = "iCLGRVxWINjUDSHIa5c9b6YKh720uR79";
                    Log.e(str, A00(108, 62, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), e3);
                } else {
                    continue;
                }
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2222nE
    public final boolean AEh(JSONArray jSONArray) throws JSONException {
        String strA00 = A00(27, 1, 40);
        boolean z11 = true;
        boolean zA0P = AbstractC2205mx.A0P(this.A00);
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            try {
                JSONObject jSONObject = jSONArray.getJSONObject(i5);
                String string = jSONObject.getString(A00(433, 2, 45));
                if (A00(393, 26, 8).equals(string)) {
                    C2203mv.A0T(this.A00).A39(jSONObject.getString(A00(419, 14, 47)));
                    this.A00.A04().ADG();
                } else {
                    int i11 = jSONObject.getInt(A00(375, 4, 91));
                    if (i11 == 1) {
                        if (this.A00.A05().AB6()) {
                            String str = A00(170, 25, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE) + string + A00(13, 14, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
                            String eventType = this.A01.A8g(string);
                            if (eventType != null) {
                                String str2 = A00(72, 36, 101) + eventType;
                            }
                        }
                        if (!this.A01.A6P(string) && zA0P) {
                            C2128lh.A0D(string);
                        }
                    } else {
                        String strA002 = A00(0, 13, 93);
                        if (i11 >= 1000 && i11 < 2000) {
                            if (this.A00.A05().AB6()) {
                                Log.e(A04, A00(236, 37, 17) + i11 + strA002 + string + strA00);
                            }
                            A06(string);
                            z11 = false;
                        } else if (i11 >= 2000 && i11 < 3000) {
                            if (this.A00.A05().AB6()) {
                                Log.e(A04, A00(195, 41, 9) + i11 + strA002 + string + strA00);
                            }
                            if (!this.A01.A6P(string) && zA0P) {
                                C2128lh.A0D(string);
                            }
                        }
                    }
                }
            } catch (JSONException e3) {
                if (this.A00.A05().AB6()) {
                    Log.e(A04, A00(331, 44, 82) + i5 + strA00, e3);
                }
                z11 = false;
            }
        }
        return z11;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2222nE
    public final void AGg() {
        this.A01.A5a();
        C2128lh.A07(this.A00);
    }
}
