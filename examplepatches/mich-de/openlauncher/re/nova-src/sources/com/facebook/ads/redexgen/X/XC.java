package com.facebook.ads.redexgen.X;

import com.google.common.base.ElementTypesAreNonnullByDefault;

@ElementTypesAreNonnullByDefault
/* loaded from: assets/audience_network/classes.dex */
public abstract class XC {
    public static int A00(char c11) {
        return (char) ((c11 | ' ') - 97);
    }

    public static String A01(String string) {
        int length = string.length();
        int i5 = 0;
        while (i5 < length) {
            if (A02(string.charAt(i5))) {
                char[] chars = string.toCharArray();
                while (i5 < length) {
                    char c11 = chars[i5];
                    if (A02(c11)) {
                        int length2 = c11 ^ ' ';
                        chars[i5] = (char) length2;
                    }
                    i5++;
                }
                return String.valueOf(chars);
            }
            i5++;
        }
        return string;
    }

    public static boolean A02(char c11) {
        return c11 >= 'A' && c11 <= 'Z';
    }

    public static boolean A03(CharSequence s12, CharSequence s22) {
        int length = s12.length();
        if (s12 == s22) {
            return true;
        }
        int length2 = s22.length();
        if (length != length2) {
            return false;
        }
        for (int i5 = 0; i5 < length; i5++) {
            char cCharAt = s12.charAt(i5);
            char cCharAt2 = s22.charAt(i5);
            if (cCharAt != cCharAt2) {
                int iA00 = A00(cCharAt);
                if (iA00 < 26) {
                    int length3 = A00(cCharAt2);
                    if (iA00 == length3) {
                    }
                }
                return false;
            }
        }
        return true;
    }
}
