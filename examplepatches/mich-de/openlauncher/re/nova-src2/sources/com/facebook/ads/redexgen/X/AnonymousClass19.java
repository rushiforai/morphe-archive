package com.facebook.ads.redexgen.X;

import androidx.compose.ui.node.LayoutNode;
import com.google.common.primitives.ElementTypesAreNonnullByDefault;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.19, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AnonymousClass19 extends AnonymousClass38 {
    public static byte[] A00;
    public static String[] A01 = {"s3nfJFmoB5mLIS4qJGcFpaREKU7XO5Rb", "W0X90hinoLbRugwrlMfBJItOSuTD1fBo", "uLiCYyfmoz81juWzq6c7TRvaokDAgd7K", "UrbhsenRX9EhQgDboPfzNp3nUnf12f", "ow7V3cTX6ZeSu5DLO16", "4lPVtgZcl9Kfu8J0YRCX1yThVB7sLZmz", "FzcBhwomNGOgnlOxXD5Sk", "RZXcs0kqm5Q92DMyM3M2tr0OFsP4PqV8"};

    public static String A08(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 72);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0A() {
        A00 = new byte[]{-55, -17, -18, -102, -23, -32, -102, -20, -37, -24, -31, -33, -76, -102, -97, -19, -44, -48, -43, -121, -113, -116, -38, -112, -121, -44, -36, -38, -37, -121, -55, -52, -121, -45, -52, -38, -38, -121, -37, -49, -56, -43, -121, -42, -39, -121, -52, -40, -36, -56, -45, -121, -37, -42, -121, -44, -56, -33, -121, -113, -116, -38, -112};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 5
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static int[] A0B(Collection<? extends Number> collection) {
        if (collection instanceof AnonymousClass39) {
            return ((AnonymousClass39) collection).A05();
        }
        Object[] array = collection.toArray();
        int length = array.length;
        int[] iArr = new int[length];
        for (int i5 = 0; i5 < length; i5++) {
            iArr[i5] = ((Number) AbstractC1335Wu.A04(array[i5])).intValue();
        }
        return iArr;
    }

    static {
        A0A();
    }

    public static int A00(int value) {
        return value;
    }

    public static int A01(int value, int min, int max) {
        boolean z11 = min <= max;
        String[] strArr = A01;
        if (strArr[2].charAt(5) == strArr[0].charAt(5)) {
            throw new RuntimeException();
        }
        A01[6] = "EVhdGTJMBuUvG";
        AbstractC1335Wu.A0G(z11, A08(16, 47, 31), min, max);
        return Math.min(Math.max(value, min), max);
    }

    public static int A02(long value) {
        int i5 = (int) value;
        boolean z11 = ((long) i5) == value;
        String strA08 = A08(0, 16, 50);
        if (A01[7].charAt(30) != 'V') {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[3] = "eSBCOQ7uVTMFBXTC77WmGuoxyDQfcq";
        strArr[4] = "iWJAXWDU80WI8thVFIH";
        AbstractC1335Wu.A0H(z11, strA08, value);
        return i5;
    }

    public static int A03(long value) {
        if (value > 2147483647L) {
            return LayoutNode.NotPlacedPlaceOrder;
        }
        if (value < -2147483648L) {
            return Integer.MIN_VALUE;
        }
        return (int) value;
    }

    public static int A04(int[] array, int target, int start, int end) {
        while (start < end) {
            int i5 = array[start];
            String[] strArr = A01;
            String str = strArr[2];
            String str2 = strArr[0];
            int iCharAt = str.charAt(5);
            int i11 = str2.charAt(5);
            if (iCharAt == i11) {
                throw new RuntimeException();
            }
            A01[6] = "R";
            if (i5 == target) {
                return start;
            }
            start++;
        }
        return -1;
    }

    public static int A05(int[] array, int target, int start, int end) {
        for (int i5 = end - 1; i5 >= start; i5--) {
            int i11 = array[i5];
            if (i11 == target) {
                return i5;
            }
        }
        return -1;
    }

    public static List<Integer> A09(int... backingArray) {
        if (backingArray.length == 0) {
            return Collections.emptyList();
        }
        return new AnonymousClass39(backingArray);
    }
}
