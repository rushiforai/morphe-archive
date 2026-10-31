package z;

import java.util.ConcurrentModificationException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class w {

    /* renamed from: a, reason: collision with root package name */
    public static final Object f97848a = new Object();

    /* renamed from: b, reason: collision with root package name */
    public static final long[] f97849b = new long[0];

    public static final void a(f fVar, int i5) {
        fVar.f97764a = new int[i5];
        fVar.f97765b = new Object[i5];
    }

    public static final int b(f fVar, Object obj, int i5) {
        int i11 = fVar.f97766c;
        if (i11 == 0) {
            return -1;
        }
        try {
            int iA = a0.a.a(i11, i5, fVar.f97764a);
            if (iA < 0 || Intrinsics.b(obj, fVar.f97765b[iA])) {
                return iA;
            }
            int i12 = iA + 1;
            while (i12 < i11 && fVar.f97764a[i12] == i5) {
                if (Intrinsics.b(obj, fVar.f97765b[i12])) {
                    return i12;
                }
                i12++;
            }
            for (int i13 = iA - 1; i13 >= 0 && fVar.f97764a[i13] == i5; i13--) {
                if (Intrinsics.b(obj, fVar.f97765b[i13])) {
                    return i13;
                }
            }
            return ~i12;
        } catch (IndexOutOfBoundsException unused) {
            throw new ConcurrentModificationException();
        }
    }
}
