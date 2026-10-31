package z;

import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class e0 extends q {
    public e0(int i5) {
        this.f97813a = i5 == 0 ? u.f97839a : new long[i5];
    }

    public final void a(long j11) {
        int i5 = this.f97814b + 1;
        long[] jArr = this.f97813a;
        if (jArr.length < i5) {
            long[] jArrCopyOf = Arrays.copyOf(jArr, Math.max(i5, (jArr.length * 3) / 2));
            Intrinsics.f(jArrCopyOf, "copyOf(...)");
            this.f97813a = jArrCopyOf;
        }
        long[] jArr2 = this.f97813a;
        int i11 = this.f97814b;
        jArr2[i11] = j11;
        this.f97814b = i11 + 1;
    }
}
