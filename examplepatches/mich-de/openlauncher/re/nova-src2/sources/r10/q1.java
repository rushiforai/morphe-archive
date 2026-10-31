package r10;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public abstract class q1 {

    /* renamed from: a, reason: collision with root package name */
    public static final Object f85218a = MapsKt.j0(new Pair(Character.valueOf((char) 12593), Character.valueOf((char) 4352)), new Pair(Character.valueOf((char) 12596), Character.valueOf((char) 4354)), new Pair(Character.valueOf((char) 12599), Character.valueOf((char) 4355)), new Pair(Character.valueOf((char) 12601), Character.valueOf((char) 4357)), new Pair(Character.valueOf((char) 12609), Character.valueOf((char) 4358)), new Pair(Character.valueOf((char) 12610), Character.valueOf((char) 4359)), new Pair(Character.valueOf((char) 12613), Character.valueOf((char) 4361)), new Pair(Character.valueOf((char) 12615), Character.valueOf((char) 4363)), new Pair(Character.valueOf((char) 12616), Character.valueOf((char) 4364)), new Pair(Character.valueOf((char) 12618), Character.valueOf((char) 4366)), new Pair(Character.valueOf((char) 12619), Character.valueOf((char) 4367)), new Pair(Character.valueOf((char) 12620), Character.valueOf((char) 4368)), new Pair(Character.valueOf((char) 12621), Character.valueOf((char) 4369)), new Pair(Character.valueOf((char) 12622), Character.valueOf((char) 4370)));

    /* renamed from: b, reason: collision with root package name */
    public static final Object f85219b = MapsKt.j0(new Pair((char) 65377, (char) 12290), new Pair((char) 65378, (char) 12300), new Pair((char) 65379, (char) 12301), new Pair((char) 65380, (char) 12289), new Pair((char) 65381, (char) 12539), new Pair((char) 65382, (char) 12530), new Pair((char) 65383, (char) 12449), new Pair((char) 65384, (char) 12451), new Pair((char) 65385, (char) 12453), new Pair((char) 65386, (char) 12455), new Pair((char) 65387, (char) 12457), new Pair((char) 65388, (char) 12515), new Pair((char) 65389, (char) 12517), new Pair((char) 65390, (char) 12519), new Pair((char) 65391, (char) 12483), new Pair((char) 65392, (char) 12540), new Pair((char) 65393, (char) 12450), new Pair((char) 65394, (char) 12452), new Pair((char) 65395, (char) 12454), new Pair((char) 65396, (char) 12456), new Pair((char) 65397, (char) 12458), new Pair((char) 65398, (char) 12459), new Pair((char) 65399, (char) 12461), new Pair((char) 65400, (char) 12463), new Pair((char) 65401, (char) 12465), new Pair((char) 65402, (char) 12467), new Pair((char) 65403, (char) 12469), new Pair((char) 65404, (char) 12471), new Pair((char) 65405, (char) 12473), new Pair((char) 65406, (char) 12475), new Pair((char) 65407, (char) 12477), new Pair((char) 65408, (char) 12479), new Pair((char) 65409, (char) 12481), new Pair((char) 65410, (char) 12484), new Pair((char) 65411, (char) 12486), new Pair((char) 65412, (char) 12488), new Pair((char) 65413, (char) 12490), new Pair((char) 65414, (char) 12491), new Pair((char) 65415, (char) 12492), new Pair((char) 65416, (char) 12493), new Pair((char) 65417, (char) 12494), new Pair((char) 65418, (char) 12495), new Pair((char) 65419, (char) 12498), new Pair((char) 65420, (char) 12501), new Pair((char) 65421, (char) 12504), new Pair((char) 65422, (char) 12507), new Pair((char) 65423, (char) 12510), new Pair((char) 65424, (char) 12511), new Pair((char) 65425, (char) 12512), new Pair((char) 65426, (char) 12513), new Pair((char) 65427, (char) 12514), new Pair((char) 65428, (char) 12516), new Pair((char) 65429, (char) 12518), new Pair((char) 65430, (char) 12520), new Pair((char) 65431, (char) 12521), new Pair((char) 65432, (char) 12522), new Pair((char) 65433, (char) 12523), new Pair((char) 65434, (char) 12524), new Pair((char) 65435, (char) 12525), new Pair((char) 65436, (char) 12527), new Pair((char) 65437, (char) 12531));

    /* renamed from: c, reason: collision with root package name */
    public static final Object f85220c = MapsKt.j0(new Pair('1', new char[]{'q', 'a'}), new Pair('2', new char[]{'w', 'z'}), new Pair('3', new char[]{'e'}), new Pair('4', new char[]{'r'}), new Pair('5', new char[]{'t'}), new Pair('6', new char[]{'y', 'z'}), new Pair('7', new char[]{AbstractJsonLexerKt.UNICODE_ESC}), new Pair('8', new char[]{'i'}), new Pair('9', new char[]{'o'}), new Pair('0', new char[]{'p'}), new Pair('\'', new char[]{'k', 'l', 'n'}), new Pair('q', new char[]{'w', 'e', 'a', 's', 'z'}), new Pair('w', new char[]{'q', 'e', 'a', 's', 'z', 'x', 's', 'd'}), new Pair('e', new char[]{'w', 'r', 's', 'd', 'z'}), new Pair('r', new char[]{'e', 't', 'd', 'f'}), new Pair('t', new char[]{'r', 'y', 'f', 'g', 'z'}), new Pair('y', new char[]{'t', AbstractJsonLexerKt.UNICODE_ESC, 'g', 'h', 'z', 's', 'x'}), new Pair(Character.valueOf(AbstractJsonLexerKt.UNICODE_ESC), new char[]{'y', 'i', 'h', 'j', 'z'}), new Pair('i', new char[]{AbstractJsonLexerKt.UNICODE_ESC, 'o', 'j', 'k'}), new Pair('o', new char[]{'i', 'p', 'k', 'l'}), new Pair('p', new char[]{'o', 'l', 'm'}), new Pair('a', new char[]{'q', 'w', 's', 'z'}), new Pair('s', new char[]{'w', 'e', 'a', 'd', 'z', 'y', 'q'}), new Pair('d', new char[]{'e', 'r', 's', 'f', 'x', 'w'}), new Pair('f', new char[]{'r', 't', 'd', 'g', 'c', 'x'}), new Pair('g', new char[]{'t', 'y', 'f', 'h', 'v', 'z', 'c'}), new Pair('h', new char[]{'y', AbstractJsonLexerKt.UNICODE_ESC, 'g', 'j', 'b', 'z', 'v'}), new Pair('j', new char[]{AbstractJsonLexerKt.UNICODE_ESC, 'i', 'h', 'k', 'n', 'b'}), new Pair('k', new char[]{'i', 'o', 'j', 'l', 'm', 'n'}), new Pair('l', new char[]{'o', 'p', 'k', 'm'}), new Pair('z', new char[]{'s', 'x', 'y', 't', AbstractJsonLexerKt.UNICODE_ESC, 'g', 'h', 'w', 'a', 'e'}), new Pair('x', new char[]{'d', 'z', 'c', 'y', 'w', 'f'}), new Pair('c', new char[]{'f', 'x', 'v', 'g'}), new Pair('v', new char[]{'g', 'c', 'b', 'h'}), new Pair('b', new char[]{'h', 'v', 'n', 'j'}), new Pair('n', new char[]{'j', 'b', 'm', 'k'}), new Pair('m', new char[]{'k', 'n', 'l', 'p'}));

    public static final boolean a(String str) {
        for (int i5 = 0; i5 < str.length(); i5++) {
            char cCharAt = str.charAt(i5);
            if (4352 <= cCharAt && cCharAt < 4371) {
                return true;
            }
            if (12593 <= cCharAt && cCharAt < 12623) {
                return true;
            }
            if (12353 <= cCharAt && cCharAt < 12436) {
                return true;
            }
            if (' ' <= cCharAt && cCharAt < '0') {
                return true;
            }
            if (':' <= cCharAt && cCharAt < 'A') {
                return true;
            }
            if ('[' <= cCharAt && cCharAt < 'a') {
                return true;
            }
            if ('{' <= cCharAt && cCharAt < 127) {
                return true;
            }
            if (62976 <= cCharAt && cCharAt <= 65535) {
                return true;
            }
            if (9728 <= cCharAt && cCharAt < 10240) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Type inference failed for: r1v5, types: [java.lang.Object, java.util.Map] */
    /* JADX WARN: Type inference failed for: r3v2, types: [java.lang.Object, java.util.Map] */
    public static final boolean b(char c11, char c12) {
        Character ch;
        if (c11 == c12) {
            return true;
        }
        String strNormalize = Normalizer.normalize(String.valueOf(c12), Normalizer.Form.NFD);
        if (strNormalize.length() != 0 && c11 == strNormalize.charAt(0)) {
            return true;
        }
        if (12353 <= c11 && c11 < 12436) {
            char c13 = (char) (c11 + '`');
            if (c13 == strNormalize.charAt(0)) {
                return true;
            }
            Character ch2 = (Character) f85219b.get(Character.valueOf(strNormalize.charAt(0)));
            if (ch2 != null && c13 == ch2.charValue()) {
                return true;
            }
        }
        if (4352 > c11 || c11 >= 4371) {
            c11 = (12593 > c11 || c11 >= 12623 || (ch = (Character) f85218a.get(Character.valueOf(c11))) == null) ? (char) 0 : ch.charValue();
        }
        return c11 != ((char) 0) && b.c0.c(c12, 44032, 588, 4352) == c11;
    }

    /* JADX WARN: Type inference failed for: r5v3, types: [java.lang.Object, java.util.Map] */
    public static final int c(CharSequence charSequence, String str, boolean z11) {
        Object obj;
        if (charSequence.length() >= str.length()) {
            ArrayList arrayList = new ArrayList();
            v0 v0Var = new v0();
            int i5 = 0;
            int i11 = 0;
            while (true) {
                if (i5 >= charSequence.length()) {
                    break;
                }
                int i12 = i11 + 1;
                if (d(v0Var, str, charSequence.charAt(i5), i11 == 0)) {
                    v0Var.f85269d = i11;
                    arrayList.add(v0Var);
                    v0Var = new v0();
                }
                i5++;
                i11 = i12;
            }
            if (arrayList.size() > 0) {
                int i13 = 0;
                int i14 = 0;
                while (i13 < charSequence.length()) {
                    char cCharAt = charSequence.charAt(i13);
                    int i15 = i14 + 1;
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        v0 v0Var2 = (v0) it.next();
                        if (v0Var2.f85270e < str.length() && v0Var2.f85269d < i14) {
                            d(v0Var2, str, cCharAt, i14 == 0);
                        }
                    }
                    i13++;
                    i14 = i15;
                }
            }
            ArrayList arrayList2 = new ArrayList();
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                Object next = it2.next();
                if (((v0) next).f85270e >= str.length()) {
                    arrayList2.add(next);
                }
            }
            Iterator it3 = arrayList2.iterator();
            if (it3.hasNext()) {
                Object next2 = it3.next();
                if (it3.hasNext()) {
                    int i16 = v0Var.f85272g;
                    do {
                        Object next3 = it3.next();
                        int i17 = v0Var.f85272g;
                        if (i16 < i17) {
                            next2 = next3;
                            i16 = i17;
                        }
                    } while (it3.hasNext());
                }
                obj = next2;
            } else {
                obj = null;
            }
            v0 v0Var3 = (v0) obj;
            int i18 = v0Var3 != null ? v0Var3.f85272g : 0;
            if (i18 != 0 || !z11 || str.length() < 3) {
                return i18;
            }
            if (z11) {
                char[] cArr = new char[0];
                int length = str.length();
                int i19 = 0;
                for (int i21 = 0; i21 < length; i21++) {
                    for (char c11 : (char[]) f85220c.getOrDefault(Character.valueOf(str.charAt(i21)), cArr)) {
                        int iC = c(charSequence, r70.k.e1(str, i21, i21 + 1, String.valueOf(c11)).toString(), false) - 1073742823;
                        if (iC > i19) {
                            i19 = iC;
                        }
                    }
                }
                return i19;
            }
        }
        return 0;
    }

    public static final boolean d(v0 v0Var, String str, char c11, boolean z11) {
        boolean z12;
        if (v0Var.f85270e >= str.length()) {
            return false;
        }
        if (kotlin.text.a.b(c11)) {
            v0Var.f85268c = true;
            v0Var.f85266a = true;
            v0Var.f85267b = 0;
            return false;
        }
        boolean z13 = v0Var.f85271f;
        v0Var.f85268c = v0Var.f85268c || !Character.isUpperCase(c11);
        boolean z14 = (!Character.isLowerCase(c11) && v0Var.f85268c) || !Character.isLetter(c11) || v0Var.f85266a || (v0Var.f85268c && v0Var.f85267b > 1);
        if (Character.isUpperCase(c11)) {
            v0Var.f85267b++;
            v0Var.f85268c = false;
        } else {
            v0Var.f85267b = 0;
            v0Var.f85268c = true;
        }
        v0Var.f85266a = !Character.isLetter(c11);
        if ((z13 || z11 || z14) && b(str.charAt(v0Var.f85270e), Character.toLowerCase(c11))) {
            v0Var.f85272g -= (z13 || z11) ? 0 : z14 ? 1 : 8;
            v0Var.f85271f = true;
            z12 = true;
        } else {
            z12 = false;
        }
        if (!z12) {
            if (v0Var.f85271f && b(str.charAt(v0Var.f85270e), Character.toLowerCase(c11))) {
                v0Var.f85271f = true;
                z12 = true;
            } else {
                v0Var.f85271f = false;
            }
        }
        if (z12) {
            v0Var.f85270e++;
        }
        return z12;
    }
}
