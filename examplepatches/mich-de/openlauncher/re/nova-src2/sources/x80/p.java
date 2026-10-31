package x80;

import com.amplitude.core.events.Identify;
import java.util.ArrayList;
import java.util.Collections;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;
import okhttp3.internal.publicsuffix.PublicSuffixDatabase;

/* loaded from: classes5.dex */
public abstract class p {
    public static int a(int i5, int i11, String str, boolean z11) {
        while (i5 < i11) {
            char cCharAt = str.charAt(i5);
            if (((cCharAt < ' ' && cCharAt != '\t') || cCharAt >= 127 || ('0' <= cCharAt && cCharAt < ':') || (('a' <= cCharAt && cCharAt < '{') || (('A' <= cCharAt && cCharAt < '[') || cCharAt == ':'))) == (!z11)) {
                return i5;
            }
            i5++;
        }
        return i11;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0061  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static List b(w url, u headers) throws NumberFormatException {
        int i5;
        q qVar;
        long j11;
        Intrinsics.g(url, "url");
        Intrinsics.g(headers, "headers");
        List listF = headers.f("Set-Cookie");
        int size = listF.size();
        int i11 = 0;
        int i12 = 0;
        ArrayList arrayList = null;
        while (i12 < size) {
            String setCookie = (String) listF.get(i12);
            Intrinsics.g(setCookie, "setCookie");
            long jCurrentTimeMillis = System.currentTimeMillis();
            byte[] bArr = y80.c.f96853a;
            char c11 = ';';
            int iF = y80.c.f(setCookie, i11, setCookie.length(), ';');
            char c12 = '=';
            int iF2 = y80.c.f(setCookie, i11, iF, '=');
            if (iF2 == iF) {
                i5 = i11;
                qVar = null;
            } else {
                String strX = y80.c.x(i11, iF2, setCookie);
                if (strX.length() != 0 && y80.c.k(strX) == -1) {
                    String strX2 = y80.c.x(iF2 + 1, iF, setCookie);
                    if (y80.c.k(strX2) == -1) {
                        int i13 = iF + 1;
                        int length = setCookie.length();
                        int i14 = i11;
                        int i15 = i14;
                        int i16 = i15;
                        long j12 = -1;
                        long jC = 253402300799999L;
                        String str = null;
                        String str2 = null;
                        boolean z11 = true;
                        while (true) {
                            if (i13 < length) {
                                int iF3 = y80.c.f(setCookie, i13, length, c11);
                                int iF4 = y80.c.f(setCookie, i13, iF3, c12);
                                String strX3 = y80.c.x(i13, iF4, setCookie);
                                String strX4 = iF4 < iF3 ? y80.c.x(iF4 + 1, iF3, setCookie) : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                                if (strX3.equalsIgnoreCase("expires")) {
                                    try {
                                        jC = c(strX4.length(), strX4);
                                        i15 = 1;
                                    } catch (NumberFormatException | IllegalArgumentException unused) {
                                    }
                                } else if (strX3.equalsIgnoreCase("max-age")) {
                                    try {
                                        long j13 = Long.parseLong(strX4);
                                        j12 = j13 <= 0 ? Long.MIN_VALUE : j13;
                                    } catch (NumberFormatException e3) {
                                        if (!new Regex("-?\\d+").f(strX4)) {
                                            throw e3;
                                        }
                                        j12 = r70.j.I0(strX4, Identify.UNSET_VALUE, false) ? Long.MIN_VALUE : Long.MAX_VALUE;
                                    }
                                    i15 = 1;
                                } else if (strX3.equalsIgnoreCase("domain")) {
                                    if (r70.j.A0(strX4, ".", false)) {
                                        throw new IllegalArgumentException("Failed requirement.");
                                    }
                                    String strB = y80.a.b(r70.k.a1(strX4, "."));
                                    if (strB == null) {
                                        throw new IllegalArgumentException();
                                    }
                                    str2 = strB;
                                    z11 = false;
                                } else if (strX3.equalsIgnoreCase("path")) {
                                    str = strX4;
                                } else if (strX3.equalsIgnoreCase("secure")) {
                                    i16 = 1;
                                } else if (strX3.equalsIgnoreCase("httponly")) {
                                    i14 = 1;
                                }
                                i13 = iF3 + 1;
                                c11 = ';';
                                c12 = '=';
                            } else {
                                if (j12 == Long.MIN_VALUE) {
                                    j11 = Long.MIN_VALUE;
                                } else if (j12 != -1) {
                                    long j14 = jCurrentTimeMillis + (j12 <= 9223372036854775L ? j12 * 1000 : Long.MAX_VALUE);
                                    j11 = (j14 < jCurrentTimeMillis || j14 > 253402300799999L) ? 253402300799999L : j14;
                                } else {
                                    j11 = jC;
                                }
                                String str3 = url.f95628d;
                                if (str2 == null) {
                                    str2 = str3;
                                } else {
                                    if (Intrinsics.b(str3, str2) || (r70.j.A0(str3, str2, false) && str3.charAt((str3.length() - str2.length()) - 1) == '.' && !y80.c.f96858f.f(str3))) {
                                    }
                                    i5 = 0;
                                }
                                if (str3.length() == str2.length() || PublicSuffixDatabase.f80494g.a(str2) != null) {
                                    String strSubstring = "/";
                                    i5 = 0;
                                    if (str == null || !r70.j.I0(str, "/", false)) {
                                        String strC = url.c();
                                        int iV0 = r70.k.V0('/', 0, 6, strC);
                                        if (iV0 != 0) {
                                            strSubstring = strC.substring(0, iV0);
                                            Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
                                        }
                                        str = strSubstring;
                                    }
                                    qVar = new q(strX, strX2, j11, str2, str, i16, i14, i15, z11);
                                }
                                i5 = 0;
                            }
                        }
                    }
                    qVar = null;
                }
            }
            if (qVar != null) {
                if (arrayList == null) {
                    arrayList = new ArrayList();
                }
                arrayList.add(qVar);
            }
            i12++;
            i11 = i5;
        }
        if (arrayList == null) {
            return EmptyList.f71733a;
        }
        List listUnmodifiableList = Collections.unmodifiableList(arrayList);
        Intrinsics.f(listUnmodifiableList, "{\n        Collections.un…ableList(cookies)\n      }");
        return listUnmodifiableList;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x00a6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static long c(int i5, String str) throws NumberFormatException {
        int iA = a(0, i5, str, false);
        Matcher matcher = q.f95584m.matcher(str);
        int i11 = -1;
        int i12 = -1;
        int i13 = -1;
        int iS0 = -1;
        int i14 = -1;
        int i15 = -1;
        while (iA < i5) {
            int iA2 = a(iA + 1, i5, str, true);
            matcher.region(iA, iA2);
            if (i12 == -1 && matcher.usePattern(q.f95584m).matches()) {
                String strGroup = matcher.group(1);
                Intrinsics.f(strGroup, "matcher.group(1)");
                i12 = Integer.parseInt(strGroup);
                String strGroup2 = matcher.group(2);
                Intrinsics.f(strGroup2, "matcher.group(2)");
                i14 = Integer.parseInt(strGroup2);
                String strGroup3 = matcher.group(3);
                Intrinsics.f(strGroup3, "matcher.group(3)");
                i15 = Integer.parseInt(strGroup3);
            } else if (i13 == -1 && matcher.usePattern(q.f95583l).matches()) {
                String strGroup4 = matcher.group(1);
                Intrinsics.f(strGroup4, "matcher.group(1)");
                i13 = Integer.parseInt(strGroup4);
            } else if (iS0 == -1) {
                Pattern pattern = q.f95582k;
                if (matcher.usePattern(pattern).matches()) {
                    String strGroup5 = matcher.group(1);
                    Intrinsics.f(strGroup5, "matcher.group(1)");
                    Locale US = Locale.US;
                    Intrinsics.f(US, "US");
                    String lowerCase = strGroup5.toLowerCase(US);
                    Intrinsics.f(lowerCase, "this as java.lang.String).toLowerCase(locale)");
                    String strPattern = pattern.pattern();
                    Intrinsics.f(strPattern, "MONTH_PATTERN.pattern()");
                    iS0 = r70.k.S0(strPattern, lowerCase, 0, false, 6) / 4;
                } else if (i11 == -1 && matcher.usePattern(q.f95581j).matches()) {
                    String strGroup6 = matcher.group(1);
                    Intrinsics.f(strGroup6, "matcher.group(1)");
                    i11 = Integer.parseInt(strGroup6);
                }
            }
            iA = a(iA2 + 1, i5, str, false);
        }
        if (70 <= i11 && i11 < 100) {
            i11 += 1900;
        }
        if (i11 >= 0 && i11 < 70) {
            i11 += 2000;
        }
        if (i11 < 1601) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        if (iS0 == -1) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        if (1 > i13 || i13 >= 32) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        if (i12 < 0 || i12 >= 24) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        if (i14 < 0 || i14 >= 60) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        if (i15 < 0 || i15 >= 60) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        GregorianCalendar gregorianCalendar = new GregorianCalendar(y80.c.f96857e);
        gregorianCalendar.setLenient(false);
        gregorianCalendar.set(1, i11);
        gregorianCalendar.set(2, iS0 - 1);
        gregorianCalendar.set(5, i13);
        gregorianCalendar.set(11, i12);
        gregorianCalendar.set(12, i14);
        gregorianCalendar.set(13, i15);
        gregorianCalendar.set(14, 0);
        return gregorianCalendar.getTimeInMillis();
    }
}
