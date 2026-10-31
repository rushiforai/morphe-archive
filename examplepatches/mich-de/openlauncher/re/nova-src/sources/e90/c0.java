package e90;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c0 {

    /* renamed from: a, reason: collision with root package name */
    public int f52309a;

    /* renamed from: b, reason: collision with root package name */
    public final int[] f52310b = new int[10];

    public final int a() {
        if ((this.f52309a & 128) != 0) {
            return this.f52310b[7];
        }
        return 65535;
    }

    public final void b(c0 other) {
        Intrinsics.g(other, "other");
        for (int i5 = 0; i5 < 10; i5++) {
            if (((1 << i5) & other.f52309a) != 0) {
                c(i5, other.f52310b[i5]);
            }
        }
    }

    public final void c(int i5, int i11) {
        if (i5 >= 0) {
            int[] iArr = this.f52310b;
            if (i5 >= iArr.length) {
                return;
            }
            this.f52309a = (1 << i5) | this.f52309a;
            iArr[i5] = i11;
        }
    }
}
