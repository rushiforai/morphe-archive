package com.iab.omid.library.vungle;

import b.c0;
import com.iab.omid.library.vungle.utils.g;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
class c {

    /* renamed from: a, reason: collision with root package name */
    private static final Pattern f35180a = Pattern.compile("<(head)( [^>]*)?>", 2);

    /* renamed from: b, reason: collision with root package name */
    private static final Pattern f35181b = Pattern.compile("<(head)( [^>]*)?/>", 2);

    /* renamed from: c, reason: collision with root package name */
    private static final Pattern f35182c = Pattern.compile("<(body)( [^>]*?)?>", 2);

    /* renamed from: d, reason: collision with root package name */
    private static final Pattern f35183d = Pattern.compile("<(body)( [^>]*?)?/>", 2);

    /* renamed from: e, reason: collision with root package name */
    private static final Pattern f35184e = Pattern.compile("<(html)( [^>]*?)?>", 2);

    /* renamed from: f, reason: collision with root package name */
    private static final Pattern f35185f = Pattern.compile("<(html)( [^>]*?)?/>", 2);

    /* renamed from: g, reason: collision with root package name */
    private static final Pattern f35186g = Pattern.compile("<!DOCTYPE [^>]*>", 2);

    private static boolean a(int i5, int[][] iArr) {
        if (iArr != null) {
            for (int[] iArr2 : iArr) {
                if (i5 >= iArr2[0] && i5 <= iArr2[1]) {
                    return true;
                }
            }
        }
        return false;
    }

    public static String b(String str, String str2) {
        return a(str2, c0.l("<script type=\"text/javascript\">", str, "</script>"));
    }

    private static boolean a(String str, StringBuilder sb2, Pattern pattern, String str2, int[][] iArr) {
        Matcher matcher = pattern.matcher(str);
        int i5 = 0;
        while (matcher.find(i5)) {
            int iStart = matcher.start();
            int iEnd = matcher.end();
            if (!a(iStart, iArr)) {
                sb2.append(str.substring(0, matcher.end()));
                sb2.append(str2);
                sb2.append(str.substring(matcher.end()));
                return true;
            }
            i5 = iEnd;
        }
        return false;
    }

    private static int[][] a(String str) {
        ArrayList arrayList = new ArrayList();
        int length = str.length();
        int i5 = 0;
        while (i5 < length) {
            int iIndexOf = str.indexOf("<!--", i5);
            if (iIndexOf >= 0) {
                int iIndexOf2 = str.indexOf("-->", iIndexOf);
                if (iIndexOf2 >= 0) {
                    arrayList.add(new int[]{iIndexOf, iIndexOf2});
                    i5 = iIndexOf2 + 3;
                } else {
                    arrayList.add(new int[]{iIndexOf, length});
                }
            }
            i5 = length;
        }
        return (int[][]) arrayList.toArray((int[][]) Array.newInstance((Class<?>) Integer.TYPE, 0, 2));
    }

    public static String a(String str, String str2) {
        g.a(str, "HTML is null or empty");
        int[][] iArrA = a(str);
        StringBuilder sb2 = new StringBuilder(str2.length() + str.length() + 16);
        if (!b(str, sb2, f35181b, str2, iArrA) && !a(str, sb2, f35180a, str2, iArrA) && !b(str, sb2, f35183d, str2, iArrA) && !a(str, sb2, f35182c, str2, iArrA) && !b(str, sb2, f35185f, str2, iArrA) && !a(str, sb2, f35184e, str2, iArrA) && !a(str, sb2, f35186g, str2, iArrA)) {
            return d.a(str2, str);
        }
        return sb2.toString();
    }

    private static boolean b(String str, StringBuilder sb2, Pattern pattern, String str2, int[][] iArr) {
        Matcher matcher = pattern.matcher(str);
        int i5 = 0;
        while (matcher.find(i5)) {
            int iStart = matcher.start();
            int iEnd = matcher.end();
            if (!a(iStart, iArr)) {
                sb2.append(str.substring(0, matcher.end() - 2));
                c0.C(sb2, ">", str2, "</");
                sb2.append(matcher.group(1));
                sb2.append(">");
                sb2.append(str.substring(matcher.end()));
                return true;
            }
            i5 = iEnd;
        }
        return false;
    }
}
