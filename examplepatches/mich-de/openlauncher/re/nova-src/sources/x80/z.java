package x80;

import h6.c1;
import java.util.ArrayList;
import java.util.Locale;
import java.util.regex.Matcher;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public abstract class z {
    public static a0 a(String str) {
        Intrinsics.g(str, "<this>");
        Matcher matcher = a0.f95396e.matcher(str);
        if (!matcher.lookingAt()) {
            throw new IllegalArgumentException(c1.m(AbstractJsonLexerKt.STRING, "No subtype found for: \"", str).toString());
        }
        String strGroup = matcher.group(1);
        Intrinsics.f(strGroup, "typeSubtype.group(1)");
        Locale US = Locale.US;
        Intrinsics.f(US, "US");
        String lowerCase = strGroup.toLowerCase(US);
        Intrinsics.f(lowerCase, "this as java.lang.String).toLowerCase(locale)");
        String strGroup2 = matcher.group(2);
        Intrinsics.f(strGroup2, "typeSubtype.group(2)");
        String lowerCase2 = strGroup2.toLowerCase(US);
        Intrinsics.f(lowerCase2, "this as java.lang.String).toLowerCase(locale)");
        ArrayList arrayList = new ArrayList();
        Matcher matcher2 = a0.f95397f.matcher(str);
        int iEnd = matcher.end();
        while (iEnd < str.length()) {
            matcher2.region(iEnd, str.length());
            if (!matcher2.lookingAt()) {
                StringBuilder sb2 = new StringBuilder("Parameter is not formatted correctly: \"");
                String strSubstring = str.substring(iEnd);
                Intrinsics.f(strSubstring, "this as java.lang.String).substring(startIndex)");
                sb2.append(strSubstring);
                sb2.append("\" for: \"");
                throw new IllegalArgumentException(c1.t(sb2, str, AbstractJsonLexerKt.STRING).toString());
            }
            String strGroup3 = matcher2.group(1);
            if (strGroup3 == null) {
                iEnd = matcher2.end();
            } else {
                String strGroup4 = matcher2.group(2);
                if (strGroup4 == null) {
                    strGroup4 = matcher2.group(3);
                } else if (r70.j.I0(strGroup4, "'", false) && r70.j.A0(strGroup4, "'", false) && strGroup4.length() > 2) {
                    strGroup4 = strGroup4.substring(1, strGroup4.length() - 1);
                    Intrinsics.f(strGroup4, "this as java.lang.String…ing(startIndex, endIndex)");
                }
                arrayList.add(strGroup3);
                arrayList.add(strGroup4);
                iEnd = matcher2.end();
            }
        }
        return new a0(str, lowerCase, lowerCase2, (String[]) arrayList.toArray(new String[0]));
    }

    public static a0 b(String str) {
        Intrinsics.g(str, "<this>");
        try {
            return a(str);
        } catch (IllegalArgumentException unused) {
            return null;
        }
    }
}
