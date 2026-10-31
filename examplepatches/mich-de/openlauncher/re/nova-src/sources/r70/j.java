package r70;

import kotlin.collections.AbstractList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes.dex */
public abstract class j extends i {
    public static boolean A0(String str, String suffix, boolean z11) {
        Intrinsics.g(str, "<this>");
        Intrinsics.g(suffix, "suffix");
        return !z11 ? str.endsWith(suffix) : C0(true, str.length() - suffix.length(), str, 0, suffix, suffix.length());
    }

    public static boolean B0(String str, String str2, boolean z11) {
        return str == null ? str2 == null : !z11 ? str.equals(str2) : str.equalsIgnoreCase(str2);
    }

    public static boolean C0(boolean z11, int i5, String str, int i11, String other, int i12) {
        Intrinsics.g(str, "<this>");
        Intrinsics.g(other, "other");
        return !z11 ? str.regionMatches(i5, other, i11, i12) : str.regionMatches(z11, i5, other, i11, i12);
    }

    public static String D0(int i5, String str) {
        if (i5 < 0) {
            throw new IllegalArgumentException(("Count 'n' must be non-negative, but was " + i5 + '.').toString());
        }
        if (i5 == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        int i11 = 1;
        if (i5 == 1) {
            return str.toString();
        }
        int length = str.length();
        if (length == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (length == 1) {
            char cCharAt = str.charAt(0);
            char[] cArr = new char[i5];
            for (int i12 = 0; i12 < i5; i12++) {
                cArr[i12] = cCharAt;
            }
            return new String(cArr);
        }
        StringBuilder sb2 = new StringBuilder(str.length() * i5);
        if (1 <= i5) {
            while (true) {
                sb2.append((CharSequence) str);
                if (i11 == i5) {
                    break;
                }
                i11++;
            }
        }
        String string = sb2.toString();
        Intrinsics.d(string);
        return string;
    }

    public static String E0(String str, char c11, char c12) {
        Intrinsics.g(str, "<this>");
        String strReplace = str.replace(c11, c12);
        Intrinsics.f(strReplace, "replace(...)");
        return strReplace;
    }

    public static String F0(String str, String oldValue, String newValue, boolean z11) {
        Intrinsics.g(str, "<this>");
        Intrinsics.g(oldValue, "oldValue");
        Intrinsics.g(newValue, "newValue");
        int i5 = 0;
        int iP0 = k.P0(str, oldValue, 0, z11);
        if (iP0 < 0) {
            return str;
        }
        int length = oldValue.length();
        int i11 = length >= 1 ? length : 1;
        int length2 = newValue.length() + (str.length() - length);
        if (length2 < 0) {
            throw new OutOfMemoryError();
        }
        StringBuilder sb2 = new StringBuilder(length2);
        do {
            sb2.append((CharSequence) str, i5, iP0);
            sb2.append(newValue);
            i5 = iP0 + length;
            if (iP0 >= str.length()) {
                break;
            }
            iP0 = k.P0(str, oldValue, iP0 + i11, z11);
        } while (iP0 > 0);
        sb2.append((CharSequence) str, i5, str.length());
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    public static String G0(String str, String oldValue, String newValue) {
        Intrinsics.g(str, "<this>");
        Intrinsics.g(oldValue, "oldValue");
        Intrinsics.g(newValue, "newValue");
        int iS0 = k.S0(str, oldValue, 0, false, 2);
        return iS0 < 0 ? str : k.e1(str, iS0, oldValue.length() + iS0, newValue).toString();
    }

    public static boolean H0(int i5, String str, String prefix, boolean z11) {
        Intrinsics.g(str, "<this>");
        Intrinsics.g(prefix, "prefix");
        return !z11 ? str.startsWith(prefix, i5) : C0(z11, i5, str, 0, prefix, prefix.length());
    }

    public static boolean I0(String str, String prefix, boolean z11) {
        Intrinsics.g(str, "<this>");
        Intrinsics.g(prefix, "prefix");
        return !z11 ? str.startsWith(prefix) : C0(z11, 0, str, 0, prefix, prefix.length());
    }

    public static String w0(char[] cArr, int i5, int i11) {
        Intrinsics.g(cArr, "<this>");
        AbstractList.Companion companion = AbstractList.f71712a;
        int length = cArr.length;
        companion.getClass();
        AbstractList.Companion.a(i5, i11, length);
        return new String(cArr, i5, i11 - i5);
    }

    public static String x0(byte[] bArr) {
        Intrinsics.g(bArr, "<this>");
        return new String(bArr, Charsets.f72000b);
    }

    public static String y0(int i5, int i11, byte[] bArr) {
        Intrinsics.g(bArr, "<this>");
        AbstractList.Companion companion = AbstractList.f71712a;
        int length = bArr.length;
        companion.getClass();
        AbstractList.Companion.a(i5, i11, length);
        return new String(bArr, i5, i11 - i5, Charsets.f72000b);
    }

    public static byte[] z0(String str) {
        Intrinsics.g(str, "<this>");
        byte[] bytes = str.getBytes(Charsets.f72000b);
        Intrinsics.f(bytes, "getBytes(...)");
        return bytes;
    }
}
