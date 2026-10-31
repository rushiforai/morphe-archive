package a0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final int[] f54a = new int[0];

    /* renamed from: b, reason: collision with root package name */
    public static final long[] f55b = new long[0];

    /* renamed from: c, reason: collision with root package name */
    public static final Object[] f56c = new Object[0];

    public static final int a(int i5, int i11, int[] array) {
        Intrinsics.g(array, "array");
        int i12 = i5 - 1;
        int i13 = 0;
        while (i13 <= i12) {
            int i14 = (i13 + i12) >>> 1;
            int i15 = array[i14];
            if (i15 < i11) {
                i13 = i14 + 1;
            } else {
                if (i15 <= i11) {
                    return i14;
                }
                i12 = i14 - 1;
            }
        }
        return ~i13;
    }

    public static final int b(long[] array, int i5, long j11) {
        Intrinsics.g(array, "array");
        int i11 = i5 - 1;
        int i12 = 0;
        while (i12 <= i11) {
            int i13 = (i12 + i11) >>> 1;
            long j12 = array[i13];
            if (j12 < j11) {
                i12 = i13 + 1;
            } else {
                if (j12 <= j11) {
                    return i13;
                }
                i11 = i13 - 1;
            }
        }
        return ~i12;
    }
}
