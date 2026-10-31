package n90;

import kotlin.jvm.internal.Intrinsics;
import m90.g0;

/* loaded from: classes5.dex */
public abstract class d {
    public static final int a(g0 g0Var, int i5) {
        int i11;
        int[] iArr = g0Var.f76128f;
        int i12 = i5 + 1;
        int length = g0Var.f76127e.length;
        Intrinsics.g(iArr, "<this>");
        int i13 = length - 1;
        int i14 = 0;
        while (true) {
            if (i14 <= i13) {
                i11 = (i14 + i13) >>> 1;
                int i15 = iArr[i11];
                if (i15 >= i12) {
                    if (i15 <= i12) {
                        break;
                    }
                    i13 = i11 - 1;
                } else {
                    i14 = i11 + 1;
                }
            } else {
                i11 = (-i14) - 1;
                break;
            }
        }
        return i11 >= 0 ? i11 : ~i11;
    }
}
