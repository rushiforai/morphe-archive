package p1;

import java.util.ArrayList;
import java.util.ConcurrentModificationException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class i2 {
    public static final int a(int[] iArr, int i5) {
        return iArr[(i5 * 5) + 3];
    }

    public static final int b(ArrayList arrayList, int i5, int i11) {
        int iE = e(arrayList, i5, i11);
        return iE >= 0 ? iE : -(iE + 1);
    }

    public static final int c(int[] iArr, int i5) {
        int i11 = i5 * 5;
        return Integer.bitCount(iArr[i11 + 1] >> 28) + iArr[i11 + 4];
    }

    public static final void d(int i5, int i11, int[] iArr) {
        if (i11 >= 0) {
        }
        int i12 = (i5 * 5) + 1;
        iArr[i12] = i11 | (iArr[i12] & (-67108864));
    }

    public static final int e(ArrayList arrayList, int i5, int i11) {
        int size = arrayList.size() - 1;
        int i12 = 0;
        while (i12 <= size) {
            int i13 = (i12 + size) >>> 1;
            int i14 = ((a) arrayList.get(i13)).f81379a;
            if (i14 < 0) {
                i14 += i11;
            }
            int iH = Intrinsics.h(i14, i5);
            if (iH < 0) {
                i12 = i13 + 1;
            } else {
                if (iH <= 0) {
                    return i13;
                }
                size = i13 - 1;
            }
        }
        return -(i12 + 1);
    }

    public static final void f() {
        throw new ConcurrentModificationException();
    }
}
