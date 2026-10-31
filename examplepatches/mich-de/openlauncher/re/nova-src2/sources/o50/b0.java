package o50;

import e10.j2;
import io.ktor.http.URLParserException;
import java.util.Collection;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class b0 {

    /* renamed from: a, reason: collision with root package name */
    public static final List f79543a = ul.b.P(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);

    public static final int a(int i5, int i11, String str) {
        boolean z11 = false;
        while (i5 < i11) {
            char cCharAt = str.charAt(i5);
            if (cCharAt != ':') {
                if (cCharAt == '[') {
                    z11 = true;
                } else if (cCharAt == ']') {
                    z11 = false;
                }
            } else if (!z11) {
                return i5;
            }
            i5++;
        }
        return -1;
    }

    public static final void b(a0 a0Var, String urlString) {
        Intrinsics.g(a0Var, "<this>");
        Intrinsics.g(urlString, "urlString");
        if (r70.k.U0(urlString)) {
            return;
        }
        try {
            c(a0Var, urlString);
        } catch (Throwable th2) {
            throw new URLParserException("Fail to parse url: ".concat(urlString), th2);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x013b  */
    /* JADX WARN: Removed duplicated region for block: B:103:0x014b  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x0155  */
    /* JADX WARN: Removed duplicated region for block: B:263:0x00e8 A[EDGE_INSN: B:263:0x00e8->B:78:0x00e8 BREAK  A[LOOP:3: B:62:0x00bd->B:76:0x00e0], SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00ad  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x00e0 A[LOOP:3: B:62:0x00bd->B:76:0x00e0, LOOP_END] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void c(a0 a0Var, String urlString) throws NumberFormatException {
        int i5;
        int i11;
        int i12;
        int i13;
        int i14;
        int i15;
        List listH1;
        int iIntValue;
        int i16;
        char lowerCase;
        Intrinsics.g(a0Var, "<this>");
        Intrinsics.g(urlString, "urlString");
        int length = urlString.length();
        int i17 = 0;
        while (true) {
            if (i17 >= length) {
                i17 = -1;
                break;
            } else if (!kotlin.text.a.b(urlString.charAt(i17))) {
                break;
            } else {
                i17++;
            }
        }
        int length2 = urlString.length() - 1;
        if (length2 >= 0) {
            while (true) {
                int i18 = length2 - 1;
                if (!kotlin.text.a.b(urlString.charAt(length2))) {
                    break;
                } else if (i18 < 0) {
                    break;
                } else {
                    length2 = i18;
                }
            }
            length2 = -1;
        } else {
            length2 = -1;
        }
        int i19 = length2 + 1;
        char cCharAt = urlString.charAt(i17);
        char c11 = 'A';
        if (('a' > cCharAt || cCharAt >= '{') && ('A' > cCharAt || cCharAt >= '[')) {
            i5 = i17;
            i11 = i5;
        } else {
            i5 = i17;
            i11 = -1;
        }
        while (i5 < i19) {
            char cCharAt2 = urlString.charAt(i5);
            if (cCharAt2 == ':') {
                if (i11 != -1) {
                    throw new IllegalArgumentException(b.c0.h(i11, "Illegal character in scheme at position "));
                }
                i12 = i5 - i17;
                if (i12 <= 0) {
                    String strSubstring = urlString.substring(i17, i17 + i12);
                    Intrinsics.f(strSubstring, "substring(...)");
                    c0 c0Var = c0.f79545c;
                    int length3 = strSubstring.length();
                    int i21 = 0;
                    while (true) {
                        if (i21 >= length3) {
                            i13 = 1;
                            i21 = -1;
                            break;
                        }
                        char cCharAt3 = strSubstring.charAt(i21);
                        if ('A' <= cCharAt3) {
                            i13 = 1;
                            if (cCharAt3 < '[') {
                                lowerCase = (char) (cCharAt3 + ' ');
                            }
                            if (lowerCase == cCharAt3) {
                                break;
                            } else {
                                i21++;
                            }
                        } else {
                            i13 = 1;
                        }
                        lowerCase = (cCharAt3 < 0 || cCharAt3 >= 128) ? Character.toLowerCase(cCharAt3) : cCharAt3;
                        if (lowerCase == cCharAt3) {
                        }
                    }
                    if (i21 != -1) {
                        StringBuilder sb2 = new StringBuilder(strSubstring.length());
                        sb2.append((CharSequence) strSubstring, 0, i21);
                        int iO0 = r70.k.O0(strSubstring);
                        if (i21 <= iO0) {
                            while (true) {
                                char cCharAt4 = strSubstring.charAt(i21);
                                if (c11 <= cCharAt4 && cCharAt4 < '[') {
                                    cCharAt4 = (char) (cCharAt4 + ' ');
                                } else if (cCharAt4 < 0 || cCharAt4 >= 128) {
                                    cCharAt4 = Character.toLowerCase(cCharAt4);
                                }
                                sb2.append(cCharAt4);
                                if (i21 == iO0) {
                                    break;
                                }
                                i21++;
                                c11 = 'A';
                            }
                        }
                        strSubstring = sb2.toString();
                    }
                    c0 c0Var2 = (c0) c0.f79546d.get(strSubstring);
                    if (c0Var2 == null) {
                        c0Var2 = new c0(strSubstring, 0);
                    }
                    a0Var.f79533d = c0Var2;
                    i17 += i12 + 1;
                } else {
                    i13 = 1;
                }
                if (!Intrinsics.b(a0Var.c().f79547a, "data")) {
                    String strSubstring2 = urlString.substring(i17, i19);
                    Intrinsics.f(strSubstring2, "substring(...)");
                    a0Var.f79530a = strSubstring2;
                    return;
                }
                int i22 = 0;
                while (true) {
                    i14 = i17 + i22;
                    if (i14 >= i19 || urlString.charAt(i14) != '/') {
                        break;
                    } else {
                        i22++;
                    }
                }
                if (Intrinsics.b(a0Var.c().f79547a, "file")) {
                    if (i22 == i13) {
                        a0Var.f79530a = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        String strSubstring3 = urlString.substring(i14, i19);
                        Intrinsics.f(strSubstring3, "substring(...)");
                        x7.f.P(a0Var, strSubstring3);
                        return;
                    }
                    if (i22 != 2) {
                        if (i22 != 3) {
                            throw new IllegalArgumentException("Invalid file url: ".concat(urlString));
                        }
                        a0Var.f79530a = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                        String strSubstring4 = urlString.substring(i14, i19);
                        Intrinsics.f(strSubstring4, "substring(...)");
                        x7.f.P(a0Var, "/".concat(strSubstring4));
                        return;
                    }
                    int iR0 = r70.k.R0('/', i14, 4, urlString);
                    if (iR0 == -1 || iR0 == i19) {
                        String strSubstring5 = urlString.substring(i14, i19);
                        Intrinsics.f(strSubstring5, "substring(...)");
                        a0Var.f79530a = strSubstring5;
                        return;
                    } else {
                        String strSubstring6 = urlString.substring(i14, iR0);
                        Intrinsics.f(strSubstring6, "substring(...)");
                        a0Var.f79530a = strSubstring6;
                        String strSubstring7 = urlString.substring(iR0, i19);
                        Intrinsics.f(strSubstring7, "substring(...)");
                        x7.f.P(a0Var, strSubstring7);
                        return;
                    }
                }
                if (Intrinsics.b(a0Var.c().f79547a, "mailto")) {
                    if (i22 != 0) {
                        throw new IllegalArgumentException("Failed requirement.");
                    }
                    int iS0 = r70.k.S0(urlString, "@", i14, false, 4);
                    if (iS0 == -1) {
                        throw new IllegalArgumentException(b.c0.l("Invalid mailto url: ", urlString, ", it should contain '@'."));
                    }
                    String strSubstring8 = urlString.substring(i14, iS0);
                    Intrinsics.f(strSubstring8, "substring(...)");
                    String strC = a.c(strSubstring8);
                    a0Var.f79534e = strC != null ? a.e(strC, false) : null;
                    String strSubstring9 = urlString.substring(iS0 + 1, i19);
                    Intrinsics.f(strSubstring9, "substring(...)");
                    a0Var.f79530a = strSubstring9;
                    return;
                }
                if (Intrinsics.b(a0Var.c().f79547a, "about")) {
                    if (i22 != 0) {
                        throw new IllegalArgumentException("Failed requirement.");
                    }
                    String strSubstring10 = urlString.substring(i14, i19);
                    Intrinsics.f(strSubstring10, "substring(...)");
                    a0Var.f79530a = strSubstring10;
                    return;
                }
                if (Intrinsics.b(a0Var.c().f79547a, "tel")) {
                    if (i22 != 0) {
                        throw new IllegalArgumentException("Failed requirement.");
                    }
                    String strSubstring11 = urlString.substring(i14, i19);
                    Intrinsics.f(strSubstring11, "substring(...)");
                    a0Var.f79530a = strSubstring11;
                    return;
                }
                if (i22 >= 2) {
                    while (true) {
                        char[] cArr = new char[5];
                        int i23 = 0;
                        for (int i24 = 5; i23 < i24; i24 = 5) {
                            cArr[i23] = "@/\\?#".charAt(i23);
                            i23++;
                        }
                        int iT0 = r70.k.T0(urlString, cArr, i14, false);
                        Integer numValueOf = Integer.valueOf(iT0);
                        if (iT0 <= 0) {
                            numValueOf = null;
                        }
                        iIntValue = numValueOf != null ? numValueOf.intValue() : i19;
                        if (iIntValue >= i19 || urlString.charAt(iIntValue) != '@') {
                            break;
                        }
                        int iA = a(i14, iIntValue, urlString);
                        if (iA != -1) {
                            String strSubstring12 = urlString.substring(i14, iA);
                            Intrinsics.f(strSubstring12, "substring(...)");
                            a0Var.f79534e = strSubstring12;
                            String strSubstring13 = urlString.substring(iA + 1, iIntValue);
                            Intrinsics.f(strSubstring13, "substring(...)");
                            a0Var.f79535f = strSubstring13;
                        } else {
                            String strSubstring14 = urlString.substring(i14, iIntValue);
                            Intrinsics.f(strSubstring14, "substring(...)");
                            a0Var.f79534e = strSubstring14;
                        }
                        i14 = iIntValue + 1;
                    }
                    int iA2 = a(i14, iIntValue, urlString);
                    Integer numValueOf2 = Integer.valueOf(iA2);
                    if (iA2 <= 0) {
                        numValueOf2 = null;
                    }
                    int iIntValue2 = numValueOf2 != null ? numValueOf2.intValue() : iIntValue;
                    String strSubstring15 = urlString.substring(i14, iIntValue2);
                    Intrinsics.f(strSubstring15, "substring(...)");
                    a0Var.f79530a = strSubstring15;
                    int i25 = iIntValue2 + 1;
                    if (i25 < iIntValue) {
                        String strSubstring16 = urlString.substring(i25, iIntValue);
                        Intrinsics.f(strSubstring16, "substring(...)");
                        i16 = Integer.parseInt(strSubstring16);
                    } else {
                        i16 = 0;
                    }
                    a0Var.e(i16);
                    i14 = iIntValue;
                }
                List list = f79543a;
                if (i14 >= i19) {
                    if (urlString.charAt(length2) != '/') {
                        list = EmptyList.f71733a;
                    }
                    a0Var.d(list);
                    return;
                }
                a0Var.d(i22 == 0 ? b70.g.R0(a0Var.f79537h) : EmptyList.f71733a);
                char[] cArr2 = new char[2];
                for (int i26 = 0; i26 < 2; i26++) {
                    cArr2[i26] = "?#".charAt(i26);
                }
                int iT02 = r70.k.T0(urlString, cArr2, i14, false);
                Integer numValueOf3 = Integer.valueOf(iT02);
                if (iT02 <= 0) {
                    numValueOf3 = null;
                }
                int iIntValue3 = numValueOf3 != null ? numValueOf3.intValue() : i19;
                if (iIntValue3 > i14) {
                    String strSubstring17 = urlString.substring(i14, iIntValue3);
                    Intrinsics.f(strSubstring17, "substring(...)");
                    Collection collection = (a0Var.f79537h.size() == 1 && ((CharSequence) b70.g.W0(a0Var.f79537h)).length() == 0) ? EmptyList.f71733a : a0Var.f79537h;
                    if (strSubstring17.equals("/")) {
                        listH1 = list;
                        i15 = 1;
                    } else {
                        i15 = 1;
                        listH1 = r70.k.h1(strSubstring17, new char[]{'/'}, 6);
                    }
                    if (i22 != i15) {
                        list = EmptyList.f71733a;
                    }
                    a0Var.f79537h = b70.g.t1(b70.g.t1(listH1, list), collection);
                    i14 = iIntValue3;
                }
                if (i14 < i19 && urlString.charAt(i14) == '?') {
                    int i27 = i14 + 1;
                    if (i27 == i19) {
                        a0Var.f79531b = true;
                        i14 = i19;
                    } else {
                        int iR02 = r70.k.R0('#', i27, 4, urlString);
                        Integer numValueOf4 = iR02 > 0 ? Integer.valueOf(iR02) : null;
                        int iIntValue4 = numValueOf4 != null ? numValueOf4.intValue() : i19;
                        String strSubstring18 = urlString.substring(i27, iIntValue4);
                        Intrinsics.f(strSubstring18, "substring(...)");
                        ul.b.W(strSubstring18).c(new j2(a0Var, 7));
                        i14 = iIntValue4;
                    }
                }
                if (i14 >= i19 || urlString.charAt(i14) != '#') {
                    return;
                }
                String strSubstring19 = urlString.substring(i14 + 1, i19);
                Intrinsics.f(strSubstring19, "substring(...)");
                a0Var.f79536g = strSubstring19;
                return;
            }
            if (cCharAt2 == '#' || cCharAt2 == '/' || cCharAt2 == '?') {
                break;
            }
            if (i11 == -1 && (('a' > cCharAt2 || cCharAt2 >= '{') && (('A' > cCharAt2 || cCharAt2 >= '[') && (('0' > cCharAt2 || cCharAt2 >= ':') && cCharAt2 != '.' && cCharAt2 != '+' && cCharAt2 != '-')))) {
                i11 = i5;
            }
            i5++;
        }
        i12 = -1;
        if (i12 <= 0) {
        }
        if (!Intrinsics.b(a0Var.c().f79547a, "data")) {
        }
    }
}
