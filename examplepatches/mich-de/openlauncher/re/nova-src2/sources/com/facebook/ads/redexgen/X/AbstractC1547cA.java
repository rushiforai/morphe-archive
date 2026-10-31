package com.facebook.ads.redexgen.X;

import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.style.AbsoluteSizeSpan;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.RelativeSizeSpan;
import android.text.style.StrikethroughSpan;
import android.text.style.StyleSpan;
import android.text.style.TypefaceSpan;
import android.text.style.UnderlineSpan;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.cA, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1547cA {
    public static byte[] A00;
    public static String[] A01 = {"Okqv6edinGosqwiTCfVs5i9M4fHgh6xq", "2coCig2EMHuJfyloBMevEgmKzZo11IjV", "rWe0XORH1IJaV", "CQdKn5atywFLktVwSw", "cnxOUeDTZRofLDgXiL8T5QUahwVDnW9r", "Wc3PkUG7q", "wjaXM5MFs2EkQt", "75mD8qoXLu9ES4osh"};

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 4 out of bounds for length 4
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static C1545c8 A00(C1545c8 c1545c8, Map<String, C1552cF> map) {
        while (c1545c8 != null) {
            C1552cF c1552cFA02 = A02(c1545c8.A04, c1545c8.A0H(), map);
            if (c1552cFA02 != null && c1552cFA02.A09() == 1) {
                return c1545c8;
            }
            c1545c8 = c1545c8.A03;
        }
        return null;
    }

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 32);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A00 = new byte[]{72, 120, AbstractJsonLexerKt.TC_INVALID, 81, 79, 69, 101, 79, 69, 58, 2, 0, 25, 25, 0, 7, 14, 73, 27, 28, 11, 16, 61, 12, 17, 29, 73, 7, 6, 13, 12, 73, 30, 0, 29, 1, 6, 28, 29, 73, 12, 17, 8, 10, 29, 5, 16, 73, 6, 7, 12, 73, 29, 12, 17, 29, 73, 10, 1, 0, 5, 13, 71, 98, 66, 91, 90, 100, 83, 88, 82, 83, 68, 99, 66, 95, 90, 40, 83, 122, 47, 11, 67, 49, AbstractJsonLexerKt.TC_INVALID, 126, 46, 88};
    }

    static {
        A05();
    }

    public static C1545c8 A01(C1545c8 c1545c8, Map<String, C1552cF> map) {
        ArrayDeque arrayDeque = new ArrayDeque();
        arrayDeque.push(c1545c8);
        while (!arrayDeque.isEmpty()) {
            C1545c8 c1545c82 = (C1545c8) arrayDeque.pop();
            C1552cF c1552cFA02 = A02(c1545c82.A04, c1545c82.A0H(), map);
            if (c1552cFA02 != null && c1552cFA02.A09() == 3) {
                return c1545c82;
            }
            for (int i5 = c1545c82.A0C() - 1; i5 >= 0; i5--) {
                arrayDeque.push(c1545c82.A0D(i5));
                if (A01[1].charAt(25) != 'Z') {
                    throw new RuntimeException();
                }
                A01[1] = "oUkj0cLWt95NaAiE8zQz0XIeFZLZPawv";
            }
        }
        return null;
    }

    public static C1552cF A02(C1552cF c1552cF, String[] strArr, Map<String, C1552cF> map) {
        int i5 = 0;
        if (c1552cF == null) {
            if (strArr == null) {
                return null;
            }
            if (strArr.length == 1) {
                return map.get(strArr[0]);
            }
            if (strArr.length > 1) {
                C1552cF c1552cF2 = new C1552cF();
                int length = strArr.length;
                while (i5 < length) {
                    c1552cF2.A0O(map.get(strArr[i5]));
                    i5++;
                }
                return c1552cF2;
            }
        } else {
            if (strArr != null) {
                int length2 = strArr.length;
                String[] strArr2 = A01;
                if (strArr2[4].charAt(5) != strArr2[0].charAt(5)) {
                    throw new RuntimeException();
                }
                A01[5] = "4YMNwpxyde5XBlHHujAjw4k74P";
                if (length2 == 1) {
                    return c1552cF.A0O(map.get(strArr[0]));
                }
            }
            if (strArr != null && strArr.length > 1) {
                int length3 = strArr.length;
                while (i5 < length3) {
                    C1552cF c1552cF3 = map.get(strArr[i5]);
                    if (A01[5].length() != 13) {
                        String[] strArr3 = A01;
                        strArr3[4] = "VhALseOgtR9NpKL9OILQfSa1j4ck4peO";
                        strArr3[0] = "9qPeIeKoCdpJMZvtIza7OrA3T7xUyVxS";
                        c1552cF.A0O(c1552cF3);
                        i5++;
                    } else {
                        A01[5] = "VIw";
                        c1552cF.A0O(c1552cF3);
                        i5 += 0;
                    }
                }
                return c1552cF;
            }
        }
        return c1552cF;
    }

    public static String A04(String str) {
        String strA03 = A03(1, 2, 85);
        String strA032 = A03(0, 1, 98);
        String strReplaceAll = str.replaceAll(strA03, strA032);
        String out = A03(4, 5, 79);
        String strReplaceAll2 = strReplaceAll.replaceAll(out, strA032);
        String strA033 = A03(3, 1, 81);
        String strReplaceAll3 = strReplaceAll2.replaceAll(strA032, strA033);
        String out2 = A03(77, 11, 83);
        return strReplaceAll3.replaceAll(out2, strA033);
    }

    /* JADX WARN: Removed duplicated region for block: B:68:0x016b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A06(Spannable spannable, int i5, int i11, C1552cF c1552cF, C1545c8 c1545c8, Map<String, C1552cF> map, int i12) {
        C1552cF c1552cFA02;
        int i13;
        int i14;
        int i15;
        if (c1552cF.A0A() != -1) {
            spannable.setSpan(new StyleSpan(c1552cF.A0A()), i5, i11, 33);
        }
        if (c1552cF.A0b()) {
            spannable.setSpan(new StrikethroughSpan(), i5, i11, 33);
        }
        if (c1552cF.A0c()) {
            spannable.setSpan(new UnderlineSpan(), i5, i11, 33);
        }
        if (c1552cF.A0a()) {
            AbstractC1057Li.A00(spannable, new ForegroundColorSpan(c1552cF.A06()), i5, i11, 33);
        }
        if (c1552cF.A0Z()) {
            AbstractC1057Li.A00(spannable, new BackgroundColorSpan(c1552cF.A05()), i5, i11, 33);
        }
        if (c1552cF.A0W() != null) {
            AbstractC1057Li.A00(spannable, new TypefaceSpan(c1552cF.A0W()), i5, i11, 33);
        }
        if (c1552cF.A0D() != null) {
            C1541c4 c1541c4 = (C1541c4) AbstractC1062Ln.A01(c1552cF.A0D());
            int i16 = c1541c4.A01;
            if (A01[5].length() == 13) {
                throw new RuntimeException();
            }
            A01[5] = "9xnD932t64ew";
            if (i16 == -1) {
                if (i12 == 2 || i12 == 1) {
                    i13 = 3;
                } else {
                    i13 = 1;
                }
                i14 = 1;
            } else {
                i13 = c1541c4.A01;
                i14 = c1541c4.A00;
            }
            if (c1541c4.A02 == -2) {
                i15 = 1;
            } else {
                i15 = c1541c4.A02;
            }
            AbstractC1057Li.A00(spannable, new C1246Tc(i13, i14, i15), i5, i11, 33);
        }
        switch (c1552cF.A09()) {
            case 2:
                C1545c8 c1545c8A00 = A00(c1545c8, map);
                if (c1545c8A00 != null) {
                    C1545c8 c1545c8A01 = A01(c1545c8A00, map);
                    String[] strArr = A01;
                    if (strArr[3].length() == strArr[6].length()) {
                        throw new RuntimeException();
                    }
                    String[] strArr2 = A01;
                    strArr2[7] = "79f8SlLs6s5rQCzQf";
                    strArr2[2] = "FvizhTY8WZABD";
                    if (c1545c8A01 != null) {
                        if (c1545c8A01.A0C() == 1) {
                            C1545c8 containerNode = c1545c8A01.A0D(0);
                            if (containerNode.A08 != null) {
                                C1545c8 containerNode2 = c1545c8A01.A0D(0);
                                String str = (String) N1.A0f(containerNode2.A08);
                                C1552cF c1552cFA022 = A02(c1545c8A01.A04, c1545c8A01.A0H(), map);
                                int iA08 = c1552cFA022 != null ? c1552cFA022.A08() : -1;
                                if (iA08 == -1 && (c1552cFA02 = A02(c1545c8A00.A04, c1545c8A00.A0H(), map)) != null) {
                                    iA08 = c1552cFA02.A08();
                                }
                                spannable.setSpan(new C1247Td(str, iA08), i5, i11, 33);
                                break;
                            } else {
                                MV.A06(A03(63, 14, 22), A03(9, 54, 73));
                                break;
                            }
                        }
                    }
                }
                break;
            case 3:
            case 4:
                spannable.setSpan(new C1538c1(), i5, i11, 33);
                break;
        }
        if (c1552cF.A0Y()) {
            AbstractC1057Li.A00(spannable, new C1248Te(), i5, i11, 33);
        }
        switch (c1552cF.A07()) {
            case 1:
                AbstractC1057Li.A00(spannable, new AbsoluteSizeSpan((int) c1552cF.A03(), true), i5, i11, 33);
                return;
            case 2:
                AbstractC1057Li.A00(spannable, new RelativeSizeSpan(c1552cF.A03()), i5, i11, 33);
                return;
            case 3:
                AbstractC1057Li.A00(spannable, new RelativeSizeSpan(c1552cF.A03() / 100.0f), i5, i11, 33);
                return;
            default:
                return;
        }
    }

    public static void A07(SpannableStringBuilder spannableStringBuilder) {
        int length = spannableStringBuilder.length() - 1;
        while (length >= 0 && spannableStringBuilder.charAt(length) == ' ') {
            length--;
        }
        if (length >= 0 && spannableStringBuilder.charAt(length) != '\n') {
            spannableStringBuilder.append('\n');
        }
    }
}
