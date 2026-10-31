package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX WARN: Enum visitor error
jadx.core.utils.exceptions.JadxRuntimeException: Init of enum field 'A03' uses external variables
	at jadx.core.dex.visitors.EnumVisitor.createEnumFieldByConstructor(EnumVisitor.java:451)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByField(EnumVisitor.java:372)
	at jadx.core.dex.visitors.EnumVisitor.processEnumFieldByWrappedInsn(EnumVisitor.java:337)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromFilledArray(EnumVisitor.java:322)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:262)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInvoke(EnumVisitor.java:293)
	at jadx.core.dex.visitors.EnumVisitor.extractEnumFieldsFromInsn(EnumVisitor.java:266)
	at jadx.core.dex.visitors.EnumVisitor.convertToEnum(EnumVisitor.java:151)
	at jadx.core.dex.visitors.EnumVisitor.visit(EnumVisitor.java:100)
 */
/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* renamed from: com.facebook.ads.redexgen.X.aG, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class EnumC1429aG {
    public static byte[] A00;
    public static String[] A01 = {"nA8fLeyOwVmNwvq6aIqKxCaagHA5eYr", "8Z3ODqLNUnEAqB2P3Amw9Ur1PSsugik5", "YRmdf", "zIg3Ob9eurpeZ06C2uEHUxbrUPW1iO5", "DwODnBhAs5I9lGAPLwBjllp42Gjp41Mv", "6IL6kP5nz", "IHg6IZuYXxuMxytmBHiV", "YXmTZGEBqQ8NuPQvZDB03"};
    public static final /* synthetic */ EnumC1429aG[] A02;
    public static final EnumC1429aG A03;
    public static final EnumC1429aG A04;
    public static final EnumC1429aG A05;
    public static final EnumC1429aG A06;
    public static final EnumC1429aG A07;
    public static final EnumC1429aG A08;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 4);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A00 = new byte[]{-82, -33, -33, -50, -26, 110, -101, -101, -104, -111, -115, -102, -103, -60, -54, -73, -63, -70, AbstractJsonLexerKt.TC_INVALID, -92, -86, 101, 120, -128, 123, 121, -118, 123, -100, -102, -111, -106, -113, -99, -74, -77, -74, -73, -65, -74, 104, -68, -63, -72, -83, 104, -73, -82, 104, -78, -69, -73, -74, 104, -73, -86, -78, -83, -85, -68, 104, -77, -83, -63};
    }

    public abstract boolean A05(JSONArray jSONArray, int i5);

    public abstract boolean A06(JSONArray jSONArray, JSONArray jSONArray2, int i5);

    public abstract boolean A07(JSONObject jSONObject, String str);

    public abstract boolean A08(JSONObject jSONObject, JSONObject jSONObject2, String str);

    static {
        A03();
        final String strA02 = A02(0, 5, 105);
        final int i5 = 0;
        A03 = new EnumC1429aG(strA02, i5) { // from class: com.facebook.ads.redexgen.X.AQ
            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A05(JSONArray jSONArray, int i11) {
                return jSONArray.optJSONArray(i11) != null;
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A06(JSONArray jSONArray, JSONArray jSONArray2, int i11) {
                return AbstractC1428aF.A00(jSONArray.optJSONArray(i11), jSONArray2.optJSONArray(i11));
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A07(JSONObject jSONObject, String str) {
                return jSONObject.optJSONArray(str) != null;
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A08(JSONObject jSONObject, JSONObject jSONObject2, String str) {
                return AbstractC1428aF.A00(jSONObject.optJSONArray(str), jSONObject2.optJSONArray(str));
            }
        };
        final String strA022 = A02(5, 7, 40);
        final int i11 = 1;
        A04 = new EnumC1429aG(strA022, i11) { // from class: com.facebook.ads.redexgen.X.AP
            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A05(JSONArray jSONArray, int i12) {
                return jSONArray.optBoolean(i12, true) == jSONArray.optBoolean(i12, false);
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A06(JSONArray jSONArray, JSONArray jSONArray2, int i12) {
                return jSONArray.optBoolean(i12) == jSONArray2.optBoolean(i12);
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A07(JSONObject jSONObject, String str) {
                return jSONObject.optBoolean(str, true) == jSONObject.optBoolean(str, false);
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A08(JSONObject jSONObject, JSONObject jSONObject2, String str) {
                return jSONObject.optBoolean(str) == jSONObject2.optBoolean(str);
            }
        };
        final String strA023 = A02(12, 6, 81);
        final int i12 = 2;
        A05 = new EnumC1429aG(strA023, i12) { // from class: com.facebook.ads.redexgen.X.AO
            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A05(JSONArray jSONArray, int i13) {
                return jSONArray.optInt(i13, 0) == jSONArray.optInt(i13, 1) && jSONArray.optDouble(i13, 0.0d) == jSONArray.optDouble(i13, 1.0d) && ((double) jSONArray.optInt(i13, 0)) != jSONArray.optDouble(i13, 0.0d);
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A06(JSONArray jSONArray, JSONArray jSONArray2, int i13) {
                return jSONArray.optDouble(i13) == jSONArray2.optDouble(i13);
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A07(JSONObject jSONObject, String str) {
                return jSONObject.optInt(str, 0) == jSONObject.optInt(str, 1) && jSONObject.optDouble(str, 0.0d) == jSONObject.optDouble(str, 1.0d) && ((double) jSONObject.optInt(str, 0)) != jSONObject.optDouble(str, 0.0d);
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A08(JSONObject jSONObject, JSONObject jSONObject2, String str) {
                return jSONObject.optDouble(str) == jSONObject2.optDouble(str);
            }
        };
        final String strA024 = A02(18, 3, 50);
        final int i13 = 3;
        A06 = new EnumC1429aG(strA024, i13) { // from class: com.facebook.ads.redexgen.X.AN
            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A05(JSONArray jSONArray, int i14) {
                return jSONArray.optInt(i14, 0) == jSONArray.optInt(i14, 1) && jSONArray.optDouble(i14, 0.0d) == jSONArray.optDouble(i14, 1.0d) && ((double) jSONArray.optInt(i14, 0)) == jSONArray.optDouble(i14, 0.0d);
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A06(JSONArray jSONArray, JSONArray jSONArray2, int i14) {
                return jSONArray.optInt(i14) == jSONArray2.optInt(i14);
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A07(JSONObject jSONObject, String str) {
                return jSONObject.optInt(str, 0) == jSONObject.optInt(str, 1) && jSONObject.optDouble(str, 0.0d) == jSONObject.optDouble(str, 1.0d) && ((double) jSONObject.optInt(str, 0)) == jSONObject.optDouble(str, 0.0d);
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A08(JSONObject jSONObject, JSONObject jSONObject2, String str) {
                return jSONObject.optInt(str) == jSONObject2.optInt(str);
            }
        };
        final String strA025 = A02(21, 6, 18);
        final int i14 = 4;
        A07 = new EnumC1429aG(strA025, i14) { // from class: com.facebook.ads.redexgen.X.AM
            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A05(JSONArray jSONArray, int i15) {
                return jSONArray.optJSONObject(i15) != null;
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A06(JSONArray jSONArray, JSONArray jSONArray2, int i15) {
                return AbstractC1428aF.A02(jSONArray.optJSONObject(i15), jSONArray2.optJSONObject(i15));
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A07(JSONObject jSONObject, String str) {
                return jSONObject.optJSONObject(str) != null;
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A08(JSONObject jSONObject, JSONObject jSONObject2, String str) {
                return AbstractC1428aF.A02(jSONObject.optJSONObject(str), jSONObject2.optJSONObject(str));
            }
        };
        final String strA026 = A02(27, 6, 36);
        final int i15 = 5;
        A08 = new EnumC1429aG(strA026, i15) { // from class: com.facebook.ads.redexgen.X.AL
            public static String[] A00 = {"S6TW", "ny0MdAR97Gu4SNk", "rkwOTbdxOjHEIpaOa1nUtCd8O93QoN1B", "7xY9", "Da3ipdmgSz1ZoqY39uGKYfQBSyYvvrF9", "e6UsaV3hJoeCkvN", "D0UcWRe35eYk963s7qzWCf", "Sc8AnvcCfF8gONKc99Y6P5M4Z9BtNzTY"};

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A05(JSONArray jSONArray, int i16) {
                return jSONArray.optString(i16) != null;
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A06(JSONArray jSONArray, JSONArray jSONArray2, int i16) {
                String str2 = jSONArray.optString(i16);
                String str1 = jSONArray2.optString(i16);
                if (str2 == null || str1 == null) {
                    return str2 == null && str1 == null;
                }
                boolean zEquals = str2.equals(str1);
                String[] strArr = A00;
                if (strArr[0].length() != strArr[3].length()) {
                    throw new RuntimeException();
                }
                A00[4] = "zMNaG7kHpiNMjlyvqGoXFZjAcBEumgMR";
                return zEquals;
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A07(JSONObject jSONObject, String str) {
                return jSONObject.optString(str) != null;
            }

            @Override // com.facebook.ads.redexgen.X.EnumC1429aG
            public final boolean A08(JSONObject jSONObject, JSONObject jSONObject2, String str) {
                String str2 = jSONObject.optString(str);
                String str1 = jSONObject2.optString(str);
                if (str2 == null || str1 == null) {
                    return str2 == null && str1 == null;
                }
                return str2.equals(str1);
            }
        };
        A02 = A04();
    }

    public EnumC1429aG(String str, int i5) {
    }

    public static EnumC1429aG A00(JSONArray jSONArray, int i5) {
        for (EnumC1429aG type : values()) {
            if (A01[1].charAt(14) != '2') {
                throw new RuntimeException();
            }
            A01[4] = "PUsgFaltT51mxPXWqnHKjq6lqfkoVDea";
            if (type.A05(jSONArray, i5)) {
                return type;
            }
        }
        throw new AssertionError(A02(33, 31, 68));
    }

    public static EnumC1429aG A01(JSONObject jSONObject, String str) {
        for (EnumC1429aG enumC1429aG : values()) {
            boolean zA07 = enumC1429aG.A07(jSONObject, str);
            if (A01[5].length() != 9) {
                throw new RuntimeException();
            }
            A01[6] = "GmRRmI3tzaTgoS0GQtjO0";
            if (zA07) {
                return enumC1429aG;
            }
        }
        throw new AssertionError(A02(33, 31, 68));
    }

    public static /* synthetic */ EnumC1429aG[] A04() {
        return new EnumC1429aG[]{A03, A04, A05, A06, A07, A08};
    }

    public static EnumC1429aG valueOf(String str) {
        return (EnumC1429aG) Enum.valueOf(EnumC1429aG.class, str);
    }

    public static EnumC1429aG[] values() {
        return (EnumC1429aG[]) A02.clone();
    }
}
