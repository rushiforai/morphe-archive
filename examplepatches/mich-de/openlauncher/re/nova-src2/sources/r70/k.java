package r70;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import h6.c1;
import hv.z1;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgression;
import kotlin.ranges.IntRange;
import kotlin.sequences.Sequence;
import kotlin.sequences.SequencesKt;
import kotlin.sequences.SequencesKt___SequencesKt$asIterable$$inlined$Iterable$1;
import kotlin.text.CharsKt;
import r70.c;

/* loaded from: classes.dex */
public abstract class k extends j {
    public static boolean K0(CharSequence charSequence, CharSequence other, boolean z11) {
        Intrinsics.g(charSequence, "<this>");
        Intrinsics.g(other, "other");
        if (other instanceof String) {
            if (S0(charSequence, (String) other, 0, z11, 2) >= 0) {
                return true;
            }
        } else if (Q0(charSequence, other, 0, charSequence.length(), z11, false) >= 0) {
            return true;
        }
        return false;
    }

    public static boolean L0(CharSequence charSequence, char c11) {
        Intrinsics.g(charSequence, "<this>");
        return R0(c11, 0, 2, charSequence) >= 0;
    }

    public static boolean M0(CharSequence charSequence, char c11) {
        Intrinsics.g(charSequence, "<this>");
        return charSequence.length() > 0 && CharsKt.c(charSequence.charAt(O0(charSequence)), c11, false);
    }

    public static boolean N0(String str, CharSequence charSequence) {
        Intrinsics.g(charSequence, "<this>");
        return charSequence instanceof String ? j.A0((String) charSequence, str, false) : Z0(charSequence, charSequence.length() - str.length(), str, 0, str.length(), false);
    }

    public static int O0(CharSequence charSequence) {
        Intrinsics.g(charSequence, "<this>");
        return charSequence.length() - 1;
    }

    public static final int P0(CharSequence charSequence, String string, int i5, boolean z11) {
        Intrinsics.g(charSequence, "<this>");
        Intrinsics.g(string, "string");
        return (z11 || !(charSequence instanceof String)) ? Q0(charSequence, string, i5, charSequence.length(), z11, false) : ((String) charSequence).indexOf(string, i5);
    }

    public static final int Q0(CharSequence charSequence, CharSequence charSequence2, int i5, int i11, boolean z11, boolean z12) {
        IntProgression intProgressionJ0;
        int i12 = i5;
        int i13 = i11;
        if (z12) {
            int iO0 = O0(charSequence);
            if (i12 > iO0) {
                i12 = iO0;
            }
            if (i13 < 0) {
                i13 = 0;
            }
            intProgressionJ0 = kotlin.ranges.a.j0(i12, i13);
        } else {
            if (i12 < 0) {
                i12 = 0;
            }
            int length = charSequence.length();
            if (i13 > length) {
                i13 = length;
            }
            intProgressionJ0 = new IntRange(i12, i13, 1);
        }
        int i14 = intProgressionJ0.f71908c;
        int i15 = intProgressionJ0.f71907b;
        int i16 = intProgressionJ0.f71906a;
        if (!(charSequence instanceof String) || !(charSequence2 instanceof String)) {
            if ((i14 <= 0 || i16 > i15) && (i14 >= 0 || i15 > i16)) {
                return -1;
            }
            int i17 = i16;
            while (!Z0(charSequence2, 0, charSequence, i17, charSequence2.length(), z11)) {
                if (i17 == i15) {
                    return -1;
                }
                i17 += i14;
            }
            return i17;
        }
        if ((i14 <= 0 || i16 > i15) && (i14 >= 0 || i15 > i16)) {
            return -1;
        }
        int i18 = i16;
        while (true) {
            String str = (String) charSequence2;
            if (j.C0(z11, 0, str, i18, (String) charSequence, str.length())) {
                return i18;
            }
            if (i18 == i15) {
                return -1;
            }
            i18 += i14;
        }
    }

    public static int R0(char c11, int i5, int i11, CharSequence charSequence) {
        if ((i11 & 2) != 0) {
            i5 = 0;
        }
        Intrinsics.g(charSequence, "<this>");
        return !(charSequence instanceof String) ? T0(charSequence, new char[]{c11}, i5, false) : ((String) charSequence).indexOf(c11, i5);
    }

    public static /* synthetic */ int S0(CharSequence charSequence, String str, int i5, boolean z11, int i11) {
        if ((i11 & 2) != 0) {
            i5 = 0;
        }
        if ((i11 & 4) != 0) {
            z11 = false;
        }
        return P0(charSequence, str, i5, z11);
    }

    public static final int T0(CharSequence charSequence, char[] chars, int i5, boolean z11) {
        Intrinsics.g(charSequence, "<this>");
        Intrinsics.g(chars, "chars");
        if (!z11 && chars.length == 1 && (charSequence instanceof String)) {
            return ((String) charSequence).indexOf(kotlin.collections.c.T0(chars), i5);
        }
        if (i5 < 0) {
            i5 = 0;
        }
        int iO0 = O0(charSequence);
        if (i5 > iO0) {
            return -1;
        }
        while (true) {
            char cCharAt = charSequence.charAt(i5);
            for (char c11 : chars) {
                if (CharsKt.c(c11, cCharAt, z11)) {
                    return i5;
                }
            }
            if (i5 == iO0) {
                return -1;
            }
            i5++;
        }
    }

    public static boolean U0(CharSequence charSequence) {
        Intrinsics.g(charSequence, "<this>");
        for (int i5 = 0; i5 < charSequence.length(); i5++) {
            if (!kotlin.text.a.b(charSequence.charAt(i5))) {
                return false;
            }
        }
        return true;
    }

    public static int V0(char c11, int i5, int i11, CharSequence charSequence) {
        if ((i11 & 2) != 0) {
            i5 = O0(charSequence);
        }
        Intrinsics.g(charSequence, "<this>");
        if (charSequence instanceof String) {
            return ((String) charSequence).lastIndexOf(c11, i5);
        }
        char[] cArr = {c11};
        if (charSequence instanceof String) {
            return ((String) charSequence).lastIndexOf(kotlin.collections.c.T0(cArr), i5);
        }
        int iO0 = O0(charSequence);
        if (i5 > iO0) {
            i5 = iO0;
        }
        while (-1 < i5) {
            if (CharsKt.c(cArr[0], charSequence.charAt(i5), false)) {
                return i5;
            }
            i5--;
        }
        return -1;
    }

    public static int W0(int i5, String str, String string) {
        int iO0 = (i5 & 2) != 0 ? O0(str) : 0;
        Intrinsics.g(str, "<this>");
        Intrinsics.g(string, "string");
        return str.lastIndexOf(string, iO0);
    }

    public static List X0(final String str) {
        Intrinsics.g(str, "<this>");
        return SequencesKt.A0(new Sequence<String>() { // from class: kotlin.text.StringsKt__StringsKt$lineSequence$$inlined$Sequence$1
            @Override // kotlin.sequences.Sequence
            public final Iterator iterator() {
                return new c(str);
            }
        });
    }

    public static String Y0(int i5, String str) {
        CharSequence charSequenceSubSequence;
        Intrinsics.g(str, "<this>");
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.i(i5, "Desired length ", " is less than zero."));
        }
        if (i5 <= str.length()) {
            charSequenceSubSequence = str.subSequence(0, str.length());
        } else {
            StringBuilder sb2 = new StringBuilder(i5);
            int length = i5 - str.length();
            int i11 = 1;
            if (1 <= length) {
                while (true) {
                    sb2.append('0');
                    if (i11 == length) {
                        break;
                    }
                    i11++;
                }
            }
            sb2.append((CharSequence) str);
            charSequenceSubSequence = sb2;
        }
        return charSequenceSubSequence.toString();
    }

    public static final boolean Z0(CharSequence charSequence, int i5, CharSequence other, int i11, int i12, boolean z11) {
        Intrinsics.g(charSequence, "<this>");
        Intrinsics.g(other, "other");
        if (i11 < 0 || i5 < 0 || i5 > charSequence.length() - i12 || i11 > other.length() - i12) {
            return false;
        }
        for (int i13 = 0; i13 < i12; i13++) {
            if (!CharsKt.c(charSequence.charAt(i5 + i13), other.charAt(i11 + i13), z11)) {
                return false;
            }
        }
        return true;
    }

    public static String a1(String str, CharSequence prefix) {
        Intrinsics.g(str, "<this>");
        Intrinsics.g(prefix, "prefix");
        if (!j1(str, prefix, false)) {
            return str;
        }
        String strSubstring = str.substring(prefix.length());
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }

    public static String b1(String str, String str2) {
        Intrinsics.g(str, "<this>");
        if (!N0(str2, str)) {
            return str;
        }
        String strSubstring = str.substring(0, str.length() - str2.length());
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }

    public static String c1(String str) {
        Intrinsics.g(str, "<this>");
        return d1(str, "\"", "\"");
    }

    public static String d1(String str, String str2, String str3) {
        Intrinsics.g(str, "<this>");
        if (str.length() < str3.length() + str2.length() || !j1(str, str2, false) || !N0(str3, str)) {
            return str;
        }
        String strSubstring = str.substring(str2.length(), str.length() - str3.length());
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }

    public static StringBuilder e1(CharSequence charSequence, int i5, int i11, CharSequence replacement) {
        Intrinsics.g(charSequence, "<this>");
        Intrinsics.g(replacement, "replacement");
        if (i11 < i5) {
            throw new IndexOutOfBoundsException(c1.n(i11, "End index (", ") is less than start index (", i5, ")."));
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(charSequence, 0, i5);
        sb2.append(replacement);
        sb2.append(charSequence, i11, charSequence.length());
        return sb2;
    }

    public static final void f1(int i5) {
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.h(i5, "Limit must be non-negative, but was ").toString());
        }
    }

    public static final List g1(int i5, String str, CharSequence charSequence) {
        f1(i5);
        int iP0 = P0(charSequence, str, 0, false);
        if (iP0 == -1 || i5 == 1) {
            return ul.b.P(charSequence.toString());
        }
        boolean z11 = i5 > 0;
        int i11 = 10;
        if (z11 && i5 <= 10) {
            i11 = i5;
        }
        ArrayList arrayList = new ArrayList(i11);
        int length = 0;
        do {
            arrayList.add(charSequence.subSequence(length, iP0).toString());
            length = str.length() + iP0;
            if (z11 && arrayList.size() == i5 - 1) {
                break;
            }
            iP0 = P0(charSequence, str, length, false);
        } while (iP0 != -1);
        arrayList.add(charSequence.subSequence(length, charSequence.length()).toString());
        return arrayList;
    }

    public static List h1(CharSequence charSequence, char[] cArr, int i5) {
        int i11 = (i5 & 4) != 0 ? 0 : 2;
        Intrinsics.g(charSequence, "<this>");
        if (cArr.length == 1) {
            return g1(i11, String.valueOf(cArr[0]), charSequence);
        }
        f1(i11);
        SequencesKt___SequencesKt$asIterable$$inlined$Iterable$1 sequencesKt___SequencesKt$asIterable$$inlined$Iterable$1 = new SequencesKt___SequencesKt$asIterable$$inlined$Iterable$1(new a(charSequence, i11, new z1(cArr, 14)));
        ArrayList arrayList = new ArrayList(b70.c.u0(sequencesKt___SequencesKt$asIterable$$inlined$Iterable$1, 10));
        Iterator<Object> it = sequencesKt___SequencesKt$asIterable$$inlined$Iterable$1.iterator();
        while (it.hasNext()) {
            IntRange range = (IntRange) it.next();
            Intrinsics.g(range, "range");
            arrayList.add(charSequence.subSequence(range.f71906a, range.f71907b + 1).toString());
        }
        return arrayList;
    }

    public static List i1(CharSequence charSequence, String[] strArr, int i5) {
        int i11 = (i5 & 4) != 0 ? 0 : 2;
        Intrinsics.g(charSequence, "<this>");
        if (strArr.length == 1) {
            String str = strArr[0];
            if (str.length() != 0) {
                return g1(i11, str, charSequence);
            }
        }
        f1(i11);
        SequencesKt___SequencesKt$asIterable$$inlined$Iterable$1 sequencesKt___SequencesKt$asIterable$$inlined$Iterable$1 = new SequencesKt___SequencesKt$asIterable$$inlined$Iterable$1(new a(charSequence, i11, new z1(u90.b.f(strArr), 15)));
        ArrayList arrayList = new ArrayList(b70.c.u0(sequencesKt___SequencesKt$asIterable$$inlined$Iterable$1, 10));
        Iterator<Object> it = sequencesKt___SequencesKt$asIterable$$inlined$Iterable$1.iterator();
        while (it.hasNext()) {
            IntRange range = (IntRange) it.next();
            Intrinsics.g(range, "range");
            arrayList.add(charSequence.subSequence(range.f71906a, range.f71907b + 1).toString());
        }
        return arrayList;
    }

    public static boolean j1(CharSequence charSequence, CharSequence prefix, boolean z11) {
        Intrinsics.g(charSequence, "<this>");
        Intrinsics.g(prefix, "prefix");
        return (!z11 && (charSequence instanceof String) && (prefix instanceof String)) ? j.I0((String) charSequence, (String) prefix, false) : Z0(charSequence, 0, prefix, 0, prefix.length(), z11);
    }

    public static boolean k1(CharSequence charSequence, char c11) {
        Intrinsics.g(charSequence, "<this>");
        return charSequence.length() > 0 && CharsKt.c(charSequence.charAt(0), c11, false);
    }

    public static String l1(char c11, String str, String missingDelimiterValue) {
        Intrinsics.g(str, "<this>");
        Intrinsics.g(missingDelimiterValue, "missingDelimiterValue");
        int iR0 = R0(c11, 0, 6, str);
        if (iR0 == -1) {
            return missingDelimiterValue;
        }
        String strSubstring = str.substring(iR0 + 1, str.length());
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }

    public static String m1(String str, String delimiter, String missingDelimiterValue) {
        Intrinsics.g(str, "<this>");
        Intrinsics.g(delimiter, "delimiter");
        Intrinsics.g(missingDelimiterValue, "missingDelimiterValue");
        int iS0 = S0(str, delimiter, 0, false, 6);
        if (iS0 == -1) {
            return missingDelimiterValue;
        }
        String strSubstring = str.substring(delimiter.length() + iS0, str.length());
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }

    public static String n1(char c11, String str, String missingDelimiterValue) {
        Intrinsics.g(str, "<this>");
        Intrinsics.g(missingDelimiterValue, "missingDelimiterValue");
        int iV0 = V0(c11, 0, 6, str);
        if (iV0 == -1) {
            return missingDelimiterValue;
        }
        String strSubstring = str.substring(iV0 + 1, str.length());
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }

    public static String o1(String str, String str2, String missingDelimiterValue) {
        Intrinsics.g(str, "<this>");
        Intrinsics.g(missingDelimiterValue, "missingDelimiterValue");
        int iW0 = W0(6, str, str2);
        if (iW0 == -1) {
            return missingDelimiterValue;
        }
        String strSubstring = str.substring(str2.length() + iW0, str.length());
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }

    public static String p1(String str, String str2, String missingDelimiterValue) {
        Intrinsics.g(str, "<this>");
        Intrinsics.g(missingDelimiterValue, "missingDelimiterValue");
        int iS0 = S0(str, str2, 0, false, 6);
        if (iS0 == -1) {
            return missingDelimiterValue;
        }
        String strSubstring = str.substring(0, iS0);
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }

    public static String q1(String missingDelimiterValue, char c11) {
        Intrinsics.g(missingDelimiterValue, "<this>");
        Intrinsics.g(missingDelimiterValue, "missingDelimiterValue");
        int iR0 = R0(c11, 0, 6, missingDelimiterValue);
        if (iR0 == -1) {
            return missingDelimiterValue;
        }
        String strSubstring = missingDelimiterValue.substring(0, iR0);
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }

    public static String r1(String str, String str2) {
        Intrinsics.g(str, "<this>");
        int iW0 = W0(6, str, ".");
        if (iW0 == -1) {
            return str2;
        }
        String strSubstring = str.substring(0, iW0);
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }

    public static String s1(String missingDelimiterValue, char c11) {
        Intrinsics.g(missingDelimiterValue, "<this>");
        Intrinsics.g(missingDelimiterValue, "missingDelimiterValue");
        int iV0 = V0(c11, 0, 6, missingDelimiterValue);
        if (iV0 == -1) {
            return missingDelimiterValue;
        }
        String strSubstring = missingDelimiterValue.substring(0, iV0);
        Intrinsics.f(strSubstring, "substring(...)");
        return strSubstring;
    }

    public static Boolean t1(String str) {
        Intrinsics.g(str, "<this>");
        if (str.equals(InneractiveMediationDefs.SHOW_HOUSE_AD_YES)) {
            return Boolean.TRUE;
        }
        if (str.equals("false")) {
            return Boolean.FALSE;
        }
        return null;
    }

    public static CharSequence u1(CharSequence charSequence) {
        Intrinsics.g(charSequence, "<this>");
        int length = charSequence.length() - 1;
        int i5 = 0;
        boolean z11 = false;
        while (i5 <= length) {
            boolean zB = kotlin.text.a.b(charSequence.charAt(!z11 ? i5 : length));
            if (z11) {
                if (!zB) {
                    break;
                }
                length--;
            } else if (zB) {
                i5++;
            } else {
                z11 = true;
            }
        }
        return charSequence.subSequence(i5, length + 1);
    }

    public static String v1(String str, char... cArr) {
        Intrinsics.g(str, "<this>");
        int length = str.length() - 1;
        int i5 = 0;
        boolean z11 = false;
        while (i5 <= length) {
            boolean zQ0 = kotlin.collections.c.q0(cArr, str.charAt(!z11 ? i5 : length));
            if (z11) {
                if (!zQ0) {
                    break;
                }
                length--;
            } else if (zQ0) {
                i5++;
            } else {
                z11 = true;
            }
        }
        return str.subSequence(i5, length + 1).toString();
    }

    public static CharSequence w1(String str) {
        Intrinsics.g(str, "<this>");
        int length = str.length() - 1;
        if (length < 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        while (true) {
            int i5 = length - 1;
            if (!kotlin.text.a.b(str.charAt(length))) {
                return str.subSequence(0, length + 1);
            }
            if (i5 < 0) {
                return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            length = i5;
        }
    }

    public static String x1(String str, char... cArr) {
        CharSequence charSequenceSubSequence;
        Intrinsics.g(str, "<this>");
        int length = str.length() - 1;
        if (length >= 0) {
            while (true) {
                int i5 = length - 1;
                if (!kotlin.collections.c.q0(cArr, str.charAt(length))) {
                    charSequenceSubSequence = str.subSequence(0, length + 1);
                    break;
                }
                if (i5 < 0) {
                    break;
                }
                length = i5;
            }
            charSequenceSubSequence = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } else {
            charSequenceSubSequence = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        return charSequenceSubSequence.toString();
    }

    public static CharSequence y1(String str) {
        Intrinsics.g(str, "<this>");
        int length = str.length();
        for (int i5 = 0; i5 < length; i5++) {
            if (!kotlin.text.a.b(str.charAt(i5))) {
                return str.subSequence(i5, str.length());
            }
        }
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public static String z1(String str, char... cArr) {
        CharSequence charSequenceSubSequence;
        Intrinsics.g(str, "<this>");
        int length = str.length();
        int i5 = 0;
        while (true) {
            if (i5 >= length) {
                charSequenceSubSequence = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                break;
            }
            if (!kotlin.collections.c.q0(cArr, str.charAt(i5))) {
                charSequenceSubSequence = str.subSequence(i5, str.length());
                break;
            }
            i5++;
        }
        return charSequenceSubSequence.toString();
    }
}
