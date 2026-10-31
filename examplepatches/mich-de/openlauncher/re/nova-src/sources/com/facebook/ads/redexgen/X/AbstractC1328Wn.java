package com.facebook.ads.redexgen.X;

import com.google.common.base.ElementTypesAreNonnullByDefault;
import java.util.Arrays;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.Wn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1328Wn {
    public static byte[] A00;
    public static String[] A01 = {"XGW4HhyFX8orrxnbDzWvDvwklBbzPf8b", "dXWM1N1SNJ2DgBF2aHNNDPzP0Ky0TA0B", "g3hH72U14lcYXFrIJyuvwuQVTxcULMhJ", "ivC5N95w0bjRv0tpaGCz4IXZdRohRvzA", "FIimEYpiN3S417Cm4dySf7ezAocU4ph0", "pdverDB0kapyzWg", "9IcjPHQ", "aMBHwpY"};

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 3 out of bounds for length 3
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static <T> InterfaceC1334Wt<T> A00(InterfaceC1334Wt<? super T> first, InterfaceC1334Wt<? super T> second) {
        return new A5(A04((InterfaceC1334Wt) AbstractC1335Wu.A04(first), (InterfaceC1334Wt) AbstractC1335Wu.A04(second)));
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 46);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A00 = new byte[]{28, 62, 41, 40, 37, 47, 45, 56, 41, 63, 98};
    }

    static {
        A05();
    }

    public static String A02(String methodName, Iterable<?> components) {
        StringBuilder sbAppend = new StringBuilder(A01(0, 11, 98)).append(methodName).append('(');
        boolean z11 = true;
        for (Object obj : components) {
            String[] strArr = A01;
            if (strArr[3].charAt(16) != strArr[1].charAt(16)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[3] = "Fgz5XwI3mxYX5MaQaBxoAlS5oGdULyzG";
            strArr2[1] = "c6ohRiAHCGzhaMLAa5rrssUSn3MeHuvo";
            if (!z11) {
                sbAppend.append(AbstractJsonLexerKt.COMMA);
            }
            sbAppend.append(obj);
            String[] strArr3 = A01;
            if (strArr3[2].charAt(26) != strArr3[4].charAt(26)) {
                String[] strArr4 = A01;
                strArr4[5] = "tUhlrSKFHrZjhFh";
                strArr4[7] = "ufIOxEK";
                z11 = false;
            } else {
                A01[0] = "OvExshVH4SJpg9Dk0rzCo3Rky6NnLXpj";
                z11 = false;
            }
        }
        StringBuilder builder = sbAppend.append(')');
        return builder.toString();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Wt != com.google.common.base.Predicate<? super T> */
    public static <T> List<InterfaceC1334Wt<? super T>> A04(InterfaceC1334Wt<? super T> first, InterfaceC1334Wt<? super T> second) {
        return Arrays.asList(first, second);
    }
}
