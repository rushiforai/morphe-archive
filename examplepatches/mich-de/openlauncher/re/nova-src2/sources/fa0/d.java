package fa0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public int f54576a;

    /* renamed from: b, reason: collision with root package name */
    public int f54577b;

    /* renamed from: c, reason: collision with root package name */
    public Object f54578c;

    /* renamed from: d, reason: collision with root package name */
    public Object f54579d;

    /* renamed from: e, reason: collision with root package name */
    public Object f54580e;

    public int a(long j11) {
        int i5 = this.f54576a + 1;
        long[] jArr = (long[]) this.f54578c;
        int length = jArr.length;
        if (i5 > length) {
            int i11 = length * 2;
            long[] jArr2 = new long[i11];
            int[] iArr = new int[i11];
            u90.b.s(jArr, jArr2, 0, 0, jArr.length);
            u90.b.u(0, 0, (int[]) this.f54579d, iArr, 14);
            this.f54578c = jArr2;
            this.f54579d = iArr;
        }
        int i12 = this.f54576a;
        this.f54576a = i12 + 1;
        int length2 = ((int[]) this.f54580e).length;
        if (this.f54577b >= length2) {
            int i13 = length2 * 2;
            int[] iArr2 = new int[i13];
            int i14 = 0;
            while (i14 < i13) {
                int i15 = i14 + 1;
                iArr2[i14] = i15;
                i14 = i15;
            }
            u90.b.u(0, 0, (int[]) this.f54580e, iArr2, 14);
            this.f54580e = iArr2;
        }
        int i16 = this.f54577b;
        int[] iArr3 = (int[]) this.f54580e;
        this.f54577b = iArr3[i16];
        long[] jArr3 = (long[]) this.f54578c;
        jArr3[i12] = j11;
        ((int[]) this.f54579d)[i12] = i16;
        iArr3[i16] = i12;
        while (i12 > 0) {
            int i17 = ((i12 + 1) >> 1) - 1;
            if (Intrinsics.i(jArr3[i17], j11) <= 0) {
                break;
            }
            b(i17, i12);
            i12 = i17;
        }
        return i16;
    }

    public void b(int i5, int i11) {
        long[] jArr = (long[]) this.f54578c;
        int[] iArr = (int[]) this.f54579d;
        int[] iArr2 = (int[]) this.f54580e;
        long j11 = jArr[i5];
        jArr[i5] = jArr[i11];
        jArr[i11] = j11;
        int i12 = iArr[i5];
        int i13 = iArr[i11];
        iArr[i5] = i13;
        iArr[i11] = i12;
        iArr2[i13] = i5;
        iArr2[i12] = i11;
    }
}
