package r70;

import b.c0;
import java.util.ArrayList;
import java.util.NoSuchElementException;
import kotlin.collections.SlidingWindowKt;
import kotlin.jvm.internal.Intrinsics;
import qx.z0;

/* loaded from: classes.dex */
public abstract class l extends k {
    public static ArrayList A1(int i5, CharSequence charSequence) {
        Intrinsics.g(charSequence, "<this>");
        z0 z0Var = new z0(22);
        SlidingWindowKt.a(i5, i5);
        int length = charSequence.length();
        int i11 = 0;
        ArrayList arrayList = new ArrayList((length / i5) + (length % i5 == 0 ? 0 : 1));
        while (i11 >= 0 && i11 < length) {
            int i12 = i11 + i5;
            arrayList.add(z0Var.invoke(charSequence.subSequence(i11, (i12 < 0 || i12 > length) ? length : i12)));
            i11 = i12;
        }
        return arrayList;
    }

    public static String B1(int i5, String str) {
        Intrinsics.g(str, "<this>");
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.i(i5, "Requested character count ", " is less than zero.").toString());
        }
        int length = str.length();
        if (i5 > length) {
            i5 = length;
        }
        String strSubstring = str.substring(i5);
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }

    public static String C1(String str) {
        Intrinsics.g(str, "<this>");
        int length = str.length() - 1;
        if (length < 0) {
            length = 0;
        }
        return G1(length, str);
    }

    public static char D1(CharSequence charSequence) {
        Intrinsics.g(charSequence, "<this>");
        if (charSequence.length() != 0) {
            return charSequence.charAt(0);
        }
        throw new NoSuchElementException("Char sequence is empty.");
    }

    public static Character E1(int i5, String str) {
        if (i5 < 0 || i5 >= str.length()) {
            return null;
        }
        return Character.valueOf(str.charAt(i5));
    }

    public static char F1(CharSequence charSequence) {
        Intrinsics.g(charSequence, "<this>");
        if (charSequence.length() != 0) {
            return charSequence.charAt(k.O0(charSequence));
        }
        throw new NoSuchElementException("Char sequence is empty.");
    }

    public static String G1(int i5, String str) {
        Intrinsics.g(str, "<this>");
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.i(i5, "Requested character count ", " is less than zero.").toString());
        }
        int length = str.length();
        if (i5 > length) {
            i5 = length;
        }
        String strSubstring = str.substring(0, i5);
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }

    public static String H1(int i5, String str) {
        Intrinsics.g(str, "<this>");
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.i(i5, "Requested character count ", " is less than zero.").toString());
        }
        int length = str.length();
        if (i5 > length) {
            i5 = length;
        }
        String strSubstring = str.substring(length - i5);
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }
}
