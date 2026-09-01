package defpackage;

import com.medium.android.common.ui.Ezz.Plbho;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public abstract class muc extends tuc {
    public static boolean Q(CharSequence charSequence, CharSequence charSequence2, boolean z) {
        charSequence.getClass();
        charSequence2.getClass();
        if (charSequence2 instanceof String) {
            if (Z(charSequence, (String) charSequence2, 0, z, 2) >= 0) {
                return true;
            }
        } else if (X(charSequence, charSequence2, 0, charSequence.length(), z, false) >= 0) {
            return true;
        }
        return false;
    }

    public static boolean R(CharSequence charSequence, char c) {
        charSequence.getClass();
        return Y(charSequence, c, 0, 2) >= 0;
    }

    public static String T(int i, String str) {
        str.getClass();
        if (i < 0) {
            ywb.g(ev6.w("Requested character count ", i, " is less than zero."));
            return null;
        }
        int length = str.length();
        if (i > length) {
            i = length;
        }
        return str.substring(i);
    }

    public static boolean U(CharSequence charSequence, char c) {
        charSequence.getClass();
        return charSequence.length() > 0 && kyd.S(charSequence.charAt(charSequence.length() - 1), c, false);
    }

    public static boolean V(CharSequence charSequence, String str) {
        return charSequence instanceof String ? tuc.F((String) charSequence, str, false) : i0(charSequence, charSequence.length() - str.length(), str, 0, str.length(), false);
    }

    public static final int W(CharSequence charSequence, String str, int i, boolean z) {
        charSequence.getClass();
        str.getClass();
        return (z || !(charSequence instanceof String)) ? X(charSequence, str, i, charSequence.length(), z, false) : ((String) charSequence).indexOf(str, i);
    }

    public static final int X(CharSequence charSequence, CharSequence charSequence2, int i, int i2, boolean z, boolean z2) {
        l46 l46Var;
        if (z2) {
            charSequence.getClass();
            int length = charSequence.length() - 1;
            if (i > length) {
                i = length;
            }
            if (i2 < 0) {
                i2 = 0;
            }
            l46Var = new l46(i, i2, -1);
        } else {
            if (i < 0) {
                i = 0;
            }
            int length2 = charSequence.length();
            if (i2 > length2) {
                i2 = length2;
            }
            l46Var = new n46(i, i2, 1);
        }
        boolean z3 = charSequence instanceof String;
        int i3 = l46Var.c;
        int i4 = l46Var.b;
        int i5 = l46Var.a;
        if (!z3 || !(charSequence2 instanceof String)) {
            boolean z4 = z;
            if ((i3 > 0 && i5 <= i4) || (i3 < 0 && i4 <= i5)) {
                while (true) {
                    CharSequence charSequence3 = charSequence;
                    CharSequence charSequence4 = charSequence2;
                    boolean z5 = z4;
                    z4 = z5;
                    if (!i0(charSequence4, 0, charSequence3, i5, charSequence2.length(), z5)) {
                        if (i5 == i4) {
                            break;
                        }
                        i5 += i3;
                        charSequence2 = charSequence4;
                        charSequence = charSequence3;
                    } else {
                        return i5;
                    }
                }
            }
        } else if ((i3 > 0 && i5 <= i4) || (i3 < 0 && i4 <= i5)) {
            int i6 = i5;
            while (true) {
                String str = (String) charSequence2;
                boolean z6 = z;
                if (!tuc.I(0, i6, str.length(), str, (String) charSequence, z6)) {
                    if (i6 == i4) {
                        break;
                    }
                    i6 += i3;
                    z = z6;
                } else {
                    return i6;
                }
            }
        }
        return -1;
    }

    public static int Y(CharSequence charSequence, char c, int i, int i2) {
        if ((i2 & 2) != 0) {
            i = 0;
        }
        charSequence.getClass();
        return !(charSequence instanceof String) ? a0(charSequence, new char[]{c}, i, false) : ((String) charSequence).indexOf(c, i);
    }

    public static /* synthetic */ int Z(CharSequence charSequence, String str, int i, boolean z, int i2) {
        if ((i2 & 2) != 0) {
            i = 0;
        }
        if ((i2 & 4) != 0) {
            z = false;
        }
        return W(charSequence, str, i, z);
    }

    public static final int a0(CharSequence charSequence, char[] cArr, int i, boolean z) {
        charSequence.getClass();
        if (!z && cArr.length == 1 && (charSequence instanceof String)) {
            return ((String) charSequence).indexOf(k80.J0(cArr), i);
        }
        if (i < 0) {
            i = 0;
        }
        int length = charSequence.length() - 1;
        if (i > length) {
            return -1;
        }
        while (true) {
            char cCharAt = charSequence.charAt(i);
            for (char c : cArr) {
                if (kyd.S(c, cCharAt, z)) {
                    return i;
                }
            }
            if (i == length) {
                return -1;
            }
            i++;
        }
    }

    public static boolean b0(CharSequence charSequence) {
        charSequence.getClass();
        for (int i = 0; i < charSequence.length(); i++) {
            if (!kyd.c0(charSequence.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    public static char c0(CharSequence charSequence) {
        if (charSequence.length() != 0) {
            return charSequence.charAt(charSequence.length() - 1);
        }
        ywb.h("Char sequence is empty.");
        return (char) 0;
    }

    public static int d0(CharSequence charSequence, char c, int i, int i2) {
        if ((i2 & 2) != 0) {
            charSequence.getClass();
            i = charSequence.length() - 1;
        }
        charSequence.getClass();
        if (charSequence instanceof String) {
            return ((String) charSequence).lastIndexOf(c, i);
        }
        char[] cArr = {c};
        if (charSequence instanceof String) {
            return ((String) charSequence).lastIndexOf(k80.J0(cArr), i);
        }
        int length = charSequence.length() - 1;
        if (i > length) {
            i = length;
        }
        while (-1 < i) {
            if (kyd.S(cArr[0], charSequence.charAt(i), false)) {
                return i;
            }
            i--;
        }
        return -1;
    }

    public static int e0(String str, int i, int i2, String str2) {
        if ((i2 & 2) != 0) {
            str.getClass();
            i = str.length() - 1;
        }
        str.getClass();
        str2.getClass();
        return str.lastIndexOf(str2, i);
    }

    public static List f0(CharSequence charSequence) {
        xz6 xz6Var = new xz6(charSequence);
        if (!xz6Var.hasNext()) {
            return ey3.a;
        }
        Object next = xz6Var.next();
        if (!xz6Var.hasNext()) {
            return d46.Q(next);
        }
        ArrayList arrayList = new ArrayList();
        arrayList.add(next);
        while (xz6Var.hasNext()) {
            arrayList.add(xz6Var.next());
        }
        return arrayList;
    }

    public static String h0(int i, String str) {
        CharSequence charSequenceSubSequence;
        str.getClass();
        if (i < 0) {
            ay0.e(ev6.w("Desired length ", i, " is less than zero."));
            return null;
        }
        if (i <= str.length()) {
            charSequenceSubSequence = str.subSequence(0, str.length());
        } else {
            StringBuilder sb = new StringBuilder(i);
            int length = i - str.length();
            int i2 = 1;
            if (1 <= length) {
                while (true) {
                    sb.append('0');
                    if (i2 == length) {
                        break;
                    }
                    i2++;
                }
            }
            sb.append((CharSequence) str);
            charSequenceSubSequence = sb;
        }
        return charSequenceSubSequence.toString();
    }

    public static final boolean i0(CharSequence charSequence, int i, CharSequence charSequence2, int i2, int i3, boolean z) {
        charSequence.getClass();
        charSequence2.getClass();
        if (i2 < 0 || i < 0 || i > charSequence.length() - i3 || i2 > charSequence2.length() - i3) {
            return false;
        }
        for (int i4 = 0; i4 < i3; i4++) {
            if (!kyd.S(charSequence.charAt(i + i4), charSequence2.charAt(i2 + i4), z)) {
                return false;
            }
        }
        return true;
    }

    public static String j0(CharSequence charSequence, String str) {
        str.getClass();
        return r0(charSequence, str) ? str.substring(charSequence.length()) : str;
    }

    public static CharSequence k0(String str, n46 n46Var) {
        int i = n46Var.a;
        int i2 = n46Var.b + 1;
        if (i2 < i) {
            z10.i(ev6.s(i2, i, "End index (", ") is less than start index (", ")."));
            return null;
        }
        if (i2 == i) {
            return str.subSequence(0, str.length());
        }
        StringBuilder sb = new StringBuilder(str.length() - (i2 - i));
        sb.append((CharSequence) str, 0, i);
        sb.append((CharSequence) str, i2, str.length());
        return sb;
    }

    public static String l0(String str, String str2) {
        str.getClass();
        return V(str, str2) ? str.substring(0, str.length() - str2.length()) : str;
    }

    public static final void m0(int i) {
        if (i >= 0) {
            return;
        }
        ywb.g(b09.w(i, "Limit must be non-negative, but was "));
    }

    public static final List n0(int i, CharSequence charSequence, String str) {
        m0(i);
        int iW = W(charSequence, str, 0, false);
        if (iW == -1 || i == 1) {
            return d46.Q(charSequence.toString());
        }
        boolean z = i > 0;
        int i2 = 10;
        if (z && i <= 10) {
            i2 = i;
        }
        ArrayList arrayList = new ArrayList(i2);
        int length = 0;
        do {
            arrayList.add(charSequence.subSequence(length, iW).toString());
            length = str.length() + iW;
            if (z && arrayList.size() == i - 1) {
                break;
            }
            iW = W(charSequence, str, length, false);
        } while (iW != -1);
        arrayList.add(charSequence.subSequence(length, charSequence.length()).toString());
        return arrayList;
    }

    public static List o0(CharSequence charSequence, char[] cArr) {
        charSequence.getClass();
        if (cArr.length == 1) {
            return n0(0, charSequence, String.valueOf(cArr[0]));
        }
        m0(0);
        c63<n46> c63Var = new c63(charSequence, 0, new h9b(20, cArr));
        ArrayList arrayList = new ArrayList(cu1.k0(new i80(2, c63Var), 10));
        for (n46 n46Var : c63Var) {
            n46Var.getClass();
            arrayList.add(charSequence.subSequence(n46Var.a, n46Var.b + 1).toString());
        }
        return arrayList;
    }

    public static List p0(CharSequence charSequence, String[] strArr, int i, int i2) {
        if ((i2 & 4) != 0) {
            i = 0;
        }
        charSequence.getClass();
        int i3 = 1;
        if (strArr.length == 1) {
            String str = strArr[0];
            if (str.length() != 0) {
                return n0(i, charSequence, str);
            }
        }
        m0(i);
        List listAsList = Arrays.asList(strArr);
        listAsList.getClass();
        c63<n46> c63Var = new c63(charSequence, i, new xw8(listAsList, i3));
        ArrayList arrayList = new ArrayList(cu1.k0(new i80(2, c63Var), 10));
        for (n46 n46Var : c63Var) {
            n46Var.getClass();
            arrayList.add(charSequence.subSequence(n46Var.a, n46Var.b + 1).toString());
        }
        return arrayList;
    }

    public static boolean q0(CharSequence charSequence, char c) {
        charSequence.getClass();
        return charSequence.length() > 0 && kyd.S(charSequence.charAt(0), c, false);
    }

    public static boolean r0(CharSequence charSequence, String str) {
        return charSequence instanceof String ? tuc.N(str, (String) charSequence, false) : i0(str, 0, charSequence, 0, charSequence.length(), false);
    }

    public static String s0(String str, String str2, String str3) {
        int iZ = Z(str, str2, 0, false, 6);
        return iZ == -1 ? str3 : str.substring(str2.length() + iZ, str.length());
    }

    public static String t0(char c, String str, String str2) {
        str.getClass();
        str2.getClass();
        int iD0 = d0(str, c, 0, 6);
        return iD0 == -1 ? str2 : str.substring(iD0 + 1, str.length());
    }

    public static String u0(String str, char c) {
        str.getClass();
        str.getClass();
        int iY = Y(str, c, 0, 6);
        return iY == -1 ? str : str.substring(0, iY);
    }

    public static String v0(String str, String str2) {
        str.getClass();
        str.getClass();
        int iZ = Z(str, str2, 0, false, 6);
        return iZ == -1 ? str : str.substring(0, iZ);
    }

    public static String w0(String str, char c) {
        int iD0 = d0(str, c, 0, 6);
        return iD0 == -1 ? str : str.substring(0, iD0);
    }

    public static String x0(int i, String str) {
        str.getClass();
        if (i < 0) {
            ywb.g(ev6.w("Requested character count ", i, " is less than zero."));
            return null;
        }
        int length = str.length();
        if (i > length) {
            i = length;
        }
        return str.substring(0, i);
    }

    public static CharSequence y0(CharSequence charSequence) {
        charSequence.getClass();
        int length = charSequence.length() - 1;
        int i = 0;
        boolean z = false;
        while (i <= length) {
            boolean zC0 = kyd.c0(charSequence.charAt(!z ? i : length));
            if (z) {
                if (!zC0) {
                    break;
                }
                length--;
            } else if (zC0) {
                i++;
            } else {
                z = true;
            }
        }
        return charSequence.subSequence(i, length + 1);
    }

    public static String g0(int i, String str) {
        CharSequence charSequenceSubSequence;
        str.getClass();
        if (i >= 0) {
            if (i <= str.length()) {
                charSequenceSubSequence = str.subSequence(0, str.length());
            } else {
                StringBuilder sb = new StringBuilder(i);
                sb.append((CharSequence) str);
                int length = i - str.length();
                int i2 = 1;
                if (1 <= length) {
                    while (true) {
                        sb.append(' ');
                        if (i2 == length) {
                            break;
                        }
                        i2++;
                    }
                }
                charSequenceSubSequence = sb;
            }
            return charSequenceSubSequence.toString();
        }
        ay0.e(ev6.w("Desired length ", i, Plbho.FKGKKSjTuEtc));
        return null;
    }
}
