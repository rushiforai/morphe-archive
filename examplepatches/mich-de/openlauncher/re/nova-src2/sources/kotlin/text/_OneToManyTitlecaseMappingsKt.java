package kotlin.text;

import java.util.Locale;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0002\n\u0000¨\u0006\u0000"}, d2 = {"kotlin-stdlib"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class _OneToManyTitlecaseMappingsKt {
    public static final String a(char c11) {
        String strValueOf = String.valueOf(c11);
        Intrinsics.e(strValueOf, "null cannot be cast to non-null type java.lang.String");
        Locale locale = Locale.ROOT;
        String upperCase = strValueOf.toUpperCase(locale);
        Intrinsics.f(upperCase, "toUpperCase(...)");
        if (upperCase.length() <= 1) {
            return String.valueOf(Character.toTitleCase(c11));
        }
        if (c11 == 329) {
            return upperCase;
        }
        char cCharAt = upperCase.charAt(0);
        String strSubstring = upperCase.substring(1);
        Intrinsics.f(strSubstring, "substring(...)");
        String lowerCase = strSubstring.toLowerCase(locale);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        return cCharAt + lowerCase;
    }
}
