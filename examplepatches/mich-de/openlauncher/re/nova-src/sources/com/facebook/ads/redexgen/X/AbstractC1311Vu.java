package com.facebook.ads.redexgen.X;

import androidx.compose.ui.node.LayoutNode;
import com.google.errorprone.annotations.DoNotMock;
import java.util.Arrays;

@DoNotMock
/* renamed from: com.facebook.ads.redexgen.X.Vu, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1311Vu<E> {
    public static byte[] A00;

    static {
        A05();
    }

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 76);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A00 = new byte[]{5, 3, 16, 16, 17, 22, -62, 21, 22, 17, 20, 7, -62, 15, 17, 20, 7, -62, 22, 10, 3, 16, -62, -21, 16, 22, 7, 9, 7, 20, -48, -17, -29, -6, 1, -8, -29, -18, -9, -25, -62, 7, 14, 7, 15, 7, 16, 22, 21};
    }

    public static int A03(int oldCapacity, int minCapacity) {
        if (minCapacity >= 0) {
            if (minCapacity <= oldCapacity) {
                return oldCapacity;
            }
            int newCapacity = (oldCapacity >> 1) + oldCapacity + 1;
            if (newCapacity < minCapacity) {
                newCapacity = Integer.highestOneBit(minCapacity - 1) << 1;
            }
            if (newCapacity < 0) {
                return LayoutNode.NotPlacedPlaceOrder;
            }
            return newCapacity;
        }
        throw new IllegalArgumentException(A04(0, 49, 86));
    }
}
