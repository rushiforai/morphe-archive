package x80;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgression;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static final b f95402a = new b();

    /* renamed from: b, reason: collision with root package name */
    public static final b f95403b = new b();

    /* renamed from: c, reason: collision with root package name */
    public static final b f95404c = new b();

    public static final m a(b bVar, String str) {
        m mVar = new m(str);
        m.f95537d.put(str, mVar);
        return mVar;
    }

    public static String b(String str, int i5, int i11, int i12, String str2) {
        int i13 = (i12 & 1) != 0 ? 0 : i5;
        int length = (i12 & 2) != 0 ? str.length() : i11;
        boolean z11 = (i12 & 8) == 0;
        boolean z12 = (i12 & 16) == 0;
        boolean z13 = (i12 & 32) == 0;
        boolean z14 = (i12 & 64) == 0;
        Intrinsics.g(str, "<this>");
        int iCharCount = i13;
        while (iCharCount < length) {
            int iCodePointAt = str.codePointAt(iCharCount);
            int i14 = 128;
            int i15 = 32;
            if (iCodePointAt < 32 || iCodePointAt == 127 || ((iCodePointAt >= 128 && !z14) || r70.k.L0(str2, (char) iCodePointAt) || ((iCodePointAt == 37 && (!z11 || (z12 && !d(iCharCount, length, str)))) || (iCodePointAt == 43 && z13)))) {
                m90.g gVar = new m90.g();
                gVar.l0(i13, iCharCount, str);
                m90.g gVar2 = null;
                while (iCharCount < length) {
                    int iCodePointAt2 = str.codePointAt(iCharCount);
                    if (!z11 || (iCodePointAt2 != 9 && iCodePointAt2 != 10 && iCodePointAt2 != 12 && iCodePointAt2 != 13)) {
                        if (iCodePointAt2 == 43 && z13) {
                            gVar.m0(z11 ? "+" : "%2B");
                        } else if (iCodePointAt2 < i15 || iCodePointAt2 == 127 || ((iCodePointAt2 >= i14 && !z14) || r70.k.L0(str2, (char) iCodePointAt2) || (iCodePointAt2 == 37 && (!z11 || (z12 && !d(iCharCount, length, str)))))) {
                            if (gVar2 == null) {
                                gVar2 = new m90.g();
                            }
                            gVar2.n0(iCodePointAt2);
                            while (!gVar2.N()) {
                                byte b11 = gVar2.readByte();
                                gVar.g0(37);
                                char[] cArr = w.f95624k;
                                gVar.g0(cArr[((b11 & 255) >> 4) & 15]);
                                gVar.g0(cArr[b11 & 15]);
                            }
                        } else {
                            gVar.n0(iCodePointAt2);
                        }
                    }
                    iCharCount += Character.charCount(iCodePointAt2);
                    i14 = 128;
                    i15 = 32;
                }
                return gVar.P();
            }
            iCharCount += Character.charCount(iCodePointAt);
        }
        String strSubstring = str.substring(i13, length);
        Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
        return strSubstring;
    }

    public static boolean d(int i5, int i11, String str) {
        int i12 = i5 + 2;
        return i12 < i11 && str.charAt(i5) == '%' && y80.c.p(str.charAt(i5 + 1)) != -1 && y80.c.p(str.charAt(i12)) != -1;
    }

    public static String e(int i5, int i11, int i12, String str) {
        int i13;
        if ((i12 & 1) != 0) {
            i5 = 0;
        }
        if ((i12 & 2) != 0) {
            i11 = str.length();
        }
        boolean z11 = (i12 & 4) == 0;
        Intrinsics.g(str, "<this>");
        int iCharCount = i5;
        while (iCharCount < i11) {
            char cCharAt = str.charAt(iCharCount);
            if (cCharAt == '%' || (cCharAt == '+' && z11)) {
                m90.g gVar = new m90.g();
                gVar.l0(i5, iCharCount, str);
                while (iCharCount < i11) {
                    int iCodePointAt = str.codePointAt(iCharCount);
                    if (iCodePointAt == 37 && (i13 = iCharCount + 2) < i11) {
                        int iP = y80.c.p(str.charAt(iCharCount + 1));
                        int iP2 = y80.c.p(str.charAt(i13));
                        if (iP == -1 || iP2 == -1) {
                            gVar.n0(iCodePointAt);
                            iCharCount += Character.charCount(iCodePointAt);
                        } else {
                            gVar.g0((iP << 4) + iP2);
                            iCharCount = Character.charCount(iCodePointAt) + i13;
                        }
                    } else if (iCodePointAt == 43 && z11) {
                        gVar.g0(32);
                        iCharCount++;
                    } else {
                        gVar.n0(iCodePointAt);
                        iCharCount += Character.charCount(iCodePointAt);
                    }
                }
                return gVar.P();
            }
            iCharCount++;
        }
        String strSubstring = str.substring(i5, i11);
        Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
        return strSubstring;
    }

    public static ArrayList f(String str) {
        ArrayList arrayList = new ArrayList();
        int i5 = 0;
        while (i5 <= str.length()) {
            int iR0 = r70.k.R0('&', i5, 4, str);
            if (iR0 == -1) {
                iR0 = str.length();
            }
            int iR02 = r70.k.R0('=', i5, 4, str);
            if (iR02 == -1 || iR02 > iR0) {
                String strSubstring = str.substring(i5, iR0);
                Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
                arrayList.add(strSubstring);
                arrayList.add(null);
            } else {
                String strSubstring2 = str.substring(i5, iR02);
                Intrinsics.f(strSubstring2, "this as java.lang.String…ing(startIndex, endIndex)");
                arrayList.add(strSubstring2);
                String strSubstring3 = str.substring(iR02 + 1, iR0);
                Intrinsics.f(strSubstring3, "this as java.lang.String…ing(startIndex, endIndex)");
                arrayList.add(strSubstring3);
            }
            i5 = iR0 + 1;
        }
        return arrayList;
    }

    public static void g(List list, StringBuilder sb2) {
        Intrinsics.g(list, "<this>");
        IntProgression intProgressionL0 = kotlin.ranges.a.l0(kotlin.ranges.a.m0(0, list.size()), 2);
        int i5 = intProgressionL0.f71906a;
        int i11 = intProgressionL0.f71907b;
        int i12 = intProgressionL0.f71908c;
        if ((i12 <= 0 || i5 > i11) && (i12 >= 0 || i11 > i5)) {
            return;
        }
        while (true) {
            String str = (String) list.get(i5);
            String str2 = (String) list.get(i5 + 1);
            if (i5 > 0) {
                sb2.append('&');
            }
            sb2.append(str);
            if (str2 != null) {
                sb2.append('=');
                sb2.append(str2);
            }
            if (i5 == i11) {
                return;
            } else {
                i5 += i12;
            }
        }
    }

    public synchronized m c(String javaName) {
        m mVar;
        String strConcat;
        try {
            Intrinsics.g(javaName, "javaName");
            LinkedHashMap linkedHashMap = m.f95537d;
            mVar = (m) linkedHashMap.get(javaName);
            if (mVar == null) {
                if (r70.j.I0(javaName, "TLS_", false)) {
                    String strSubstring = javaName.substring(4);
                    Intrinsics.f(strSubstring, "this as java.lang.String).substring(startIndex)");
                    strConcat = "SSL_".concat(strSubstring);
                } else if (r70.j.I0(javaName, "SSL_", false)) {
                    String strSubstring2 = javaName.substring(4);
                    Intrinsics.f(strSubstring2, "this as java.lang.String).substring(startIndex)");
                    strConcat = "TLS_".concat(strSubstring2);
                } else {
                    strConcat = javaName;
                }
                mVar = (m) linkedHashMap.get(strConcat);
                if (mVar == null) {
                    mVar = new m(javaName);
                }
                linkedHashMap.put(javaName, mVar);
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return mVar;
    }
}
