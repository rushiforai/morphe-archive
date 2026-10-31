package com.facebook.ads.redexgen.X;

import android.database.Cursor;
import android.util.Log;
import android.util.Pair;
import java.io.IOException;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.mS, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2174mS {
    public static byte[] A00;

    static {
        A03();
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 51);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A00 = new byte[]{-2, -15, -17, -5, -2, -16, -21, -16, -19, 0, -19, -18, -19, -1, -15};
    }

    public static InterfaceC2176mU A00(C0957Hh c0957Hh) {
        try {
            return new H8(c0957Hh);
        } catch (IOException e3) {
            c0957Hh.A08().ABz(A02(0, 15, 89), AbstractC2126lf.A2K, new C2127lg(e3));
            return new HB();
        }
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.facebook.ads.redexgen.X.7A] */
    public static C7A A01(C0957Hh c0957Hh) {
        return new HC(c0957Hh) { // from class: com.facebook.ads.redexgen.X.7A
            public static byte[] A03;
            public static String[] A04 = {"zSqnO64p11LQVC3SPrHTwk7q", "RQQcRArwNRw7pCFobI7zm4AECBhyO", "uX7W3VjoXSZ8mIic8tH9fb17VHeYN2EI", "VdQ4q", "h", "roUcO9bhLUMzgbi0", "6tdL5l5B64y16QievzXwm2hdxMIwTdT2", "M1EyYsdVjnJYnVOvo"};
            public boolean A00 = true;
            public final C0957Hh A01;
            public final C2104lJ A02;

            public static String A00(int i5, int i11, int i12) {
                byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
                for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                    bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 85);
                }
                return new String(bArrCopyOfRange);
            }

            public static void A04() {
                String[] strArr = A04;
                if (strArr[7].length() == strArr[5].length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A04;
                strArr2[0] = "GUa5RhIL61d4FW3HWW0RBx9i";
                strArr2[1] = "4nKtohmUbY7tHai9z2t8ojCMJbrZv";
                A03 = new byte[]{62, 28, 19, 90, 9, 93, 25, 24, 17, 24, 9, 24, 93, 28, 9, 9, 24, 16, 13, 9, 14, 93, 24, 5, 30, 24, 24, 25, 24, 25, 93, 24, 11, 24, 19, 9, 14, 83, 16, 21, 7, 24, 21, 46, 59, 59, 42, 34, 63, 59, AbstractJsonLexerKt.TC_INVALID, 122, 111, 122, 16, 29, 50, 36, 50, 50, 40, 46, 47, 30, 40, 37, 32, 54, 32, 32, 58, 60, 61, 12, 39, 58, 62, 54, 76, 81, 85, 93, 20, 15, 11, 5, 14, 63, 9, 4, AbstractJsonLexerKt.TC_INVALID, 114, 123, 110};
            }

            static {
                A04();
            }

            {
                this.A01 = c0957Hh;
                this.A02 = new C2104lJ(c0957Hh);
            }

            private JSONArray A01(Cursor cursor) throws JSONException {
                JSONArray jSONArray = new JSONArray();
                cursor.moveToPosition(-1);
                while (cursor.moveToNext()) {
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put(A00(54, 2, 44), cursor.getString(C0956Hg.A04.A00));
                    jSONObject.put(A00(82, 8, 53), cursor.getString(C0956Hg.A09.A00));
                    jSONObject.put(A00(90, 4, 94), cursor.getString(C0956Hg.A0A.A00));
                    jSONObject.put(A00(78, 4, 109), C2416qS.A03(cursor.getDouble(C0956Hg.A08.A00)));
                    jSONObject.put(A00(66, 12, 6), C2416qS.A03(cursor.getDouble(C0956Hg.A07.A00)));
                    jSONObject.put(A00(56, 10, 20), cursor.getString(C0956Hg.A06.A00));
                    String string = cursor.getString(C0956Hg.A03.A00);
                    jSONObject.put(A00(50, 4, 78), string != null ? new JSONObject(string) : new JSONObject());
                    jSONObject.put(A00(43, 7, 26), cursor.getString(C0956Hg.A02.A00));
                    jSONObject.put(A00(38, 5, 36), this.A01.A04().A8z());
                    jSONArray.put(jSONObject);
                }
                return jSONArray;
            }

            private JSONArray A02(Cursor cursor) throws JSONException {
                JSONArray jSONArray = new JSONArray();
                cursor.moveToPosition(-1);
                while (cursor.moveToNext()) {
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put(A00(54, 2, 44), cursor.getString(2));
                    jSONObject.put(A00(82, 8, 53), cursor.getString(0));
                    jSONObject.put(A00(90, 4, 94), cursor.getString(4));
                    jSONObject.put(A00(78, 4, 109), C2416qS.A03(cursor.getDouble(5)));
                    jSONObject.put(A00(66, 12, 6), C2416qS.A03(cursor.getDouble(6)));
                    jSONObject.put(A00(56, 10, 20), cursor.getString(7));
                    String string = cursor.getString(8);
                    jSONObject.put(A00(50, 4, 78), string != null ? new JSONObject(string) : new JSONObject());
                    jSONObject.put(A00(43, 7, 26), cursor.getString(9));
                    jSONObject.put(A00(38, 5, 36), this.A01.A04().A8z());
                    jSONArray.put(jSONObject);
                }
                return jSONArray;
            }

            public static JSONObject A03(Cursor cursor) throws JSONException {
                JSONObject jSONObject = new JSONObject();
                while (cursor.moveToNext()) {
                    String string = cursor.getString(C0955Hf.A02.A00);
                    String string2 = cursor.getString(C0955Hf.A01.A00);
                    String[] strArr = A04;
                    if (strArr[6].charAt(14) != strArr[2].charAt(14)) {
                        throw new RuntimeException();
                    }
                    String[] strArr2 = A04;
                    strArr2[7] = "IfQdYzKY6vCyBSxPg";
                    strArr2[5] = "fxZpsWnZoPKbT5Dt";
                    jSONObject.put(string, string2);
                }
                return jSONObject;
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC2175mT
            public final int A5Z(int i5) {
                int iA08 = 0;
                if (i5 > -1) {
                    try {
                        iA08 = this.A02.A08(i5);
                    } catch (Exception e3) {
                        if (this.A01.A05().AB6()) {
                            Log.e(HC.A00, A00(0, 38, 40), e3);
                        }
                    }
                }
                this.A02.A0I();
                if (this.A00) {
                    this.A02.A0J();
                }
                return iA08;
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC2176mU
            public final void A5a() {
                this.A02.A0H();
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC2175mT
            public final boolean A6P(String str) {
                return this.A02.A0K(str);
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC2175mT
            public final JSONArray A7S() {
                Cursor cursorA0A = null;
                try {
                    cursorA0A = this.A02.A0A();
                    JSONArray jSONArrayA01 = null;
                    if (cursorA0A.getCount() > 0) {
                        jSONArrayA01 = A01(cursorA0A);
                    }
                    if (cursorA0A != null) {
                        cursorA0A.close();
                    }
                    return jSONArrayA01;
                } catch (JSONException unused) {
                    if (cursorA0A != null) {
                        cursorA0A.close();
                        return null;
                    }
                    return null;
                } catch (Throwable th2) {
                    if (cursorA0A != null) {
                        cursorA0A.close();
                    }
                    throw th2;
                }
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC2175mT
            public final JSONObject A7T() {
                Cursor cursorA0B = null;
                try {
                    cursorA0B = this.A02.A0B();
                    JSONObject jSONObjectA03 = null;
                    if (cursorA0B.getCount() > 0) {
                        jSONObjectA03 = A03(cursorA0B);
                    }
                    if (cursorA0B != null) {
                        cursorA0B.close();
                    }
                    return jSONObjectA03;
                } catch (JSONException unused) {
                    if (cursorA0B != null) {
                        cursorA0B.close();
                        return null;
                    }
                    return null;
                } catch (Throwable th2) {
                    if (cursorA0B != null) {
                        cursorA0B.close();
                    }
                    throw th2;
                }
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC2175mT
            public final int A8d() {
                Cursor cursorA09 = null;
                try {
                    cursorA09 = this.A02.A09();
                    return cursorA09.moveToFirst() ? cursorA09.getInt(0) : 0;
                } finally {
                    if (cursorA09 != null) {
                        cursorA09.close();
                    }
                }
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC2175mT
            public final String A8g(String str) {
                String string = null;
                Cursor cursorA0D = this.A02.A0D(str);
                if (cursorA0D != null) {
                    if (cursorA0D.moveToNext() && cursorA0D.getCount() > 0) {
                        C2102lH c2102lH = C0956Hg.A0A;
                        String[] strArr = A04;
                        String str2 = strArr[7];
                        String eventType = strArr[5];
                        if (str2.length() == eventType.length()) {
                            throw new RuntimeException();
                        }
                        String[] strArr2 = A04;
                        strArr2[3] = "VgiME";
                        strArr2[4] = "4";
                        String eventType2 = c2102lH.A01;
                        string = cursorA0D.getString(cursorA0D.getColumnIndex(eventType2));
                    }
                    cursorA0D.close();
                }
                return string;
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC2175mT
            public final Pair<JSONObject, JSONArray> A9v(int i5) {
                Cursor cursorA0C = null;
                try {
                    try {
                        cursorA0C = this.A02.A0C(i5);
                        JSONArray events = null;
                        JSONObject tokens = null;
                        if (cursorA0C.getCount() > 0) {
                            tokens = A03(cursorA0C);
                            events = A02(cursorA0C);
                        }
                        Pair<JSONObject, JSONArray> pair = new Pair<>(tokens, events);
                        if (cursorA0C != null) {
                            cursorA0C.close();
                        }
                        return pair;
                    } catch (JSONException unused) {
                        Pair<JSONObject, JSONArray> pair2 = new Pair<>(null, null);
                        if (cursorA0C != null) {
                            cursorA0C.close();
                        }
                        return pair2;
                    }
                } catch (Throwable th2) {
                    if (cursorA0C != null) {
                        cursorA0C.close();
                    }
                    throw th2;
                }
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC2175mT
            public final boolean AAj(String str) {
                return this.A02.A0L(str);
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.mR != com.facebook.ads.internal.eventstorage.AdEventStorageCallback<java.lang.String> */
            @Override // com.facebook.ads.redexgen.X.InterfaceC2176mU
            public final void AMQ(C2221nD c2221nD, AbstractC2173mR<String> abstractC2173mR) {
                this.A02.A0G(c2221nD.A08(), c2221nD.A05().A00, c2221nD.A06().toString(), c2221nD.A04(), c2221nD.A03(), c2221nD.A07(), c2221nD.A09(), abstractC2173mR);
            }
        };
    }
}
