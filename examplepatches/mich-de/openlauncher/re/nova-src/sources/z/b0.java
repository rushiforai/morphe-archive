package z;

import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b0 extends k {
    public b0(int i5) {
        this.f97783a = i5 == 0 ? p.f97811a : new int[i5];
    }

    public final void c(int i5) {
        d(this.f97784b + 1);
        int[] iArr = this.f97783a;
        int i11 = this.f97784b;
        iArr[i11] = i5;
        this.f97784b = i11 + 1;
    }

    public final void d(int i5) {
        int[] iArr = this.f97783a;
        if (iArr.length < i5) {
            int[] iArrCopyOf = Arrays.copyOf(iArr, Math.max(i5, (iArr.length * 3) / 2));
            Intrinsics.f(iArrCopyOf, "copyOf(...)");
            this.f97783a = iArrCopyOf;
        }
    }

    public final void e(int i5) {
        int i11;
        if (i5 < 0 || i5 >= (i11 = this.f97784b)) {
            android.support.v4.media.session.b.m0("Index must be between 0 and size");
            throw null;
        }
        int[] iArr = this.f97783a;
        int i12 = iArr[i5];
        if (i5 != i11 - 1) {
            u90.b.p(i5, i5 + 1, iArr, iArr, i11);
        }
        this.f97784b--;
    }

    public final void f(int i5, int i11) {
        if (i5 < 0 || i5 >= this.f97784b) {
            android.support.v4.media.session.b.m0("Index must be between 0 and size");
            throw null;
        }
        int[] iArr = this.f97783a;
        int i12 = iArr[i5];
        iArr[i5] = i11;
    }

    public /* synthetic */ b0() {
        this(16);
    }
}
