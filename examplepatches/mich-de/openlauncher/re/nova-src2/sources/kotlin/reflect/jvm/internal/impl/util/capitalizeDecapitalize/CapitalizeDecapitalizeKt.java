package kotlin.reflect.jvm.internal.impl.util.capitalizeDecapitalize;

import java.util.Iterator;
import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.ranges.IntRange;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes5.dex */
public final class CapitalizeDecapitalizeKt {
    @NotNull
    public static final String capitalizeAsciiOnly(@NotNull String str) {
        char cCharAt;
        Intrinsics.g(str, "<this>");
        if (str.length() == 0 || 'a' > (cCharAt = str.charAt(0)) || cCharAt >= '{') {
            return str;
        }
        char upperCase = Character.toUpperCase(cCharAt);
        String strSubstring = str.substring(1);
        Intrinsics.f(strSubstring, "substring(...)");
        return upperCase + strSubstring;
    }

    @NotNull
    public static final String decapitalizeAsciiOnly(@NotNull String str) {
        char cCharAt;
        Intrinsics.g(str, "<this>");
        if (str.length() == 0 || 'A' > (cCharAt = str.charAt(0)) || cCharAt >= '[') {
            return str;
        }
        char lowerCase = Character.toLowerCase(cCharAt);
        String strSubstring = str.substring(1);
        Intrinsics.f(strSubstring, "substring(...)");
        return lowerCase + strSubstring;
    }

    @NotNull
    public static final String decapitalizeSmartForCompiler(@NotNull String str, boolean z11) {
        Integer next;
        Intrinsics.g(str, "<this>");
        if (str.length() == 0 || !isUpperCaseCharAt(str, 0, z11)) {
            return str;
        }
        if (str.length() == 1 || !isUpperCaseCharAt(str, 1, z11)) {
            if (z11) {
                return decapitalizeAsciiOnly(str);
            }
            if (str.length() <= 0) {
                return str;
            }
            char lowerCase = Character.toLowerCase(str.charAt(0));
            String strSubstring = str.substring(1);
            Intrinsics.f(strSubstring, "substring(...)");
            return lowerCase + strSubstring;
        }
        Iterator<Integer> it = new IntRange(0, str.length() - 1, 1).iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (!isUpperCaseCharAt(str, next.intValue(), z11)) {
                break;
            }
        }
        Integer num = next;
        if (num == null) {
            return toLowerCase(str, z11);
        }
        int iIntValue = num.intValue() - 1;
        StringBuilder sb2 = new StringBuilder();
        String strSubstring2 = str.substring(0, iIntValue);
        Intrinsics.f(strSubstring2, "substring(...)");
        sb2.append(toLowerCase(strSubstring2, z11));
        String strSubstring3 = str.substring(iIntValue);
        Intrinsics.f(strSubstring3, "substring(...)");
        sb2.append(strSubstring3);
        return sb2.toString();
    }

    private static final boolean isUpperCaseCharAt(String str, int i5, boolean z11) {
        char cCharAt = str.charAt(i5);
        return z11 ? 'A' <= cCharAt && cCharAt < '[' : Character.isUpperCase(cCharAt);
    }

    private static final String toLowerCase(String str, boolean z11) {
        if (z11) {
            return toLowerCaseAsciiOnly(str);
        }
        String lowerCase = str.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        return lowerCase;
    }

    @NotNull
    public static final String toLowerCaseAsciiOnly(@NotNull String str) {
        Intrinsics.g(str, "<this>");
        StringBuilder sb2 = new StringBuilder(str.length());
        int length = str.length();
        for (int i5 = 0; i5 < length; i5++) {
            char cCharAt = str.charAt(i5);
            if ('A' <= cCharAt && cCharAt < '[') {
                cCharAt = Character.toLowerCase(cCharAt);
            }
            sb2.append(cCharAt);
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }
}
