package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* renamed from: com.facebook.ads.redexgen.X.lO, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2109lO {
    public static Pattern A04;
    public static byte[] A05;
    public static String[] A06 = {"pAae9rjDjut", "tkOSIHX8Zxgz2rZYxn8viKSgU7ZUgPoL", "1N", "2VeddHnoq1PdFvEHeLIEgk846BKmCK6O", "LTbK", "Z0pa1Fkg3kxxdvs7wsAZFUzX7FqiKd0T", "C5WWkuKXZZ", "LwQP7"};
    public final Integer A00;
    public final Integer A01;
    public final String A02;
    public final Set<String> A03;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 101);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A05 = new byte[]{-93, 14, -14, -68, 10, -60, -68, -5, -60, -68, -5, -12, -28, -82, -4, -26, -43, -44, -95, -44, -41, -90, -43, -42, -42, -92, -94, -95, -72, -77, -90, -95, -43, -35, -92, -94, -90, -95, -43, -35, -92, -94, -94, -72, -42, -20};
    }

    static {
        A04();
    }

    public C2109lO(Set<String> options, Integer num, Integer num2, String str) {
        this.A03 = options;
        this.A03.remove(null);
        this.A00 = num;
        this.A01 = num2;
        this.A02 = str;
    }

    public C2109lO(String[] strArr, Integer num, Integer num2) {
        strArr = strArr == null ? new String[0] : strArr;
        this.A03 = new LinkedHashSet();
        this.A03.addAll(Arrays.asList(strArr));
        this.A03.remove(null);
        this.A00 = num;
        this.A01 = num2;
        this.A02 = A01();
    }

    public static C2109lO A00(String str) {
        if (str == null) {
            return null;
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        Integer numValueOf = null;
        Integer numValueOf2 = null;
        Matcher matcher = A03().matcher(str);
        while (matcher.find()) {
            linkedHashSet.add(matcher.group(1));
            String strGroup = matcher.group(2);
            String strGroup2 = matcher.group(3);
            if (strGroup != null && strGroup2 != null) {
                numValueOf = Integer.valueOf(Integer.parseInt(strGroup));
                numValueOf2 = Integer.valueOf(Integer.parseInt(strGroup2));
            }
        }
        return new C2109lO(linkedHashSet, numValueOf, numValueOf2, str);
    }

    private String A01() {
        String strA02;
        StringBuilder sb2 = new StringBuilder();
        for (String str : this.A03) {
            Locale locale = Locale.US;
            if (this.A00 != null && this.A01 != null) {
                strA02 = A02(2, 10, 50);
            } else {
                if (A06[0].length() != 11) {
                    throw new RuntimeException();
                }
                String[] strArr = A06;
                strArr[3] = "stwUo5SqMlMCevvnzS9Ivu5YLcfkOLDd";
                strArr[5] = "Jjxe8gs2e3QRovgCJLhIxlujBEulNGa6";
                strA02 = A02(12, 4, 36);
            }
            sb2.append(String.format(locale, strA02, str.toUpperCase(), this.A00, this.A01));
        }
        return sb2.toString();
    }

    public static Pattern A03() {
        if (A04 == null) {
            String[] strArr = A06;
            if (strArr[7].length() == strArr[2].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A06;
            strArr2[4] = "NLwo";
            strArr2[6] = "S7Le7uzzm1";
            A04 = Pattern.compile(A02(16, 29, 20));
        }
        return A04;
    }

    public final Integer A05() {
        return this.A00;
    }

    public final Integer A06() {
        return this.A01;
    }

    public final String A07() {
        return this.A02;
    }

    public final String A08() {
        Iterator<String> it = this.A03.iterator();
        StringBuilder sbAppend = new StringBuilder().append(A02(1, 1, 78));
        while (it.hasNext()) {
            String next = it.next();
            if (A06[0].length() != 11) {
                throw new RuntimeException();
            }
            String[] strArr = A06;
            strArr[7] = "k7iHL";
            strArr[2] = "M5";
            sbAppend.append(next);
            if (it.hasNext()) {
                String[] strArr2 = A06;
                if (strArr2[3].charAt(13) != strArr2[5].charAt(13)) {
                    throw new RuntimeException();
                }
                String[] strArr3 = A06;
                strArr3[7] = "AO7Nq";
                strArr3[2] = "hv";
                sbAppend.append(A02(0, 1, 18));
            }
        }
        sbAppend.append(A02(45, 1, 42));
        return sbAppend.toString();
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof C2109lO)) {
            return false;
        }
        C2109lO c2109lO = (C2109lO) obj;
        Integer num = this.A00;
        String[] strArr = A06;
        if (strArr[3].charAt(13) != strArr[5].charAt(13)) {
            throw new RuntimeException();
        }
        A06[0] = "YHhc40Na8nm";
        if (num != c2109lO.A00 && (this.A00 == null || !this.A00.equals(c2109lO.A00))) {
            return false;
        }
        if (this.A01 != c2109lO.A01) {
            Integer num2 = this.A01;
            String[] strArr2 = A06;
            if (strArr2[4].length() != strArr2[6].length()) {
                A06[0] = "0PJnDGRNIQw";
                if (num2 == null) {
                    return false;
                }
            } else {
                String[] strArr3 = A06;
                strArr3[7] = "CKvPU";
                strArr3[2] = "fq";
                if (num2 == null) {
                    return false;
                }
            }
            if (!this.A01.equals(c2109lO.A01)) {
                return false;
            }
        }
        boolean zEquals = this.A03.equals(c2109lO.A03);
        String[] strArr4 = A06;
        if (strArr4[3].charAt(13) != strArr4[5].charAt(13)) {
            throw new RuntimeException();
        }
        A06[0] = "qFSZb71cdP5";
        return zEquals;
    }

    public final int hashCode() {
        return (this.A03.hashCode() * Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE) + ((this.A00 == null ? -1 : this.A00.intValue()) * Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE) + ((this.A01 != null ? this.A01.intValue() : -1) * 139);
    }
}
