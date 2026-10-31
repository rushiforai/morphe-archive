package z;

import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;

/* loaded from: classes.dex */
public abstract class q {

    /* renamed from: a, reason: collision with root package name */
    public long[] f97813a;

    /* renamed from: b, reason: collision with root package name */
    public int f97814b;

    public final boolean equals(Object obj) {
        if (obj instanceof q) {
            q qVar = (q) obj;
            int i5 = qVar.f97814b;
            int i11 = this.f97814b;
            if (i5 == i11) {
                long[] jArr = this.f97813a;
                long[] jArr2 = qVar.f97813a;
                IntRange intRangeM0 = kotlin.ranges.a.m0(0, i11);
                int i12 = intRangeM0.f71906a;
                int i13 = intRangeM0.f71907b;
                if (i12 > i13) {
                    return true;
                }
                while (jArr[i12] == jArr2[i12]) {
                    if (i12 == i13) {
                        return true;
                    }
                    i12++;
                }
                return false;
            }
        }
        return false;
    }

    public final int hashCode() {
        long[] jArr = this.f97813a;
        int i5 = this.f97814b;
        int iHashCode = 0;
        for (int i11 = 0; i11 < i5; i11++) {
            iHashCode += Long.hashCode(jArr[i11]) * 31;
        }
        return iHashCode;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append((CharSequence) "[");
        long[] jArr = this.f97813a;
        int i5 = this.f97814b;
        int i11 = 0;
        while (true) {
            if (i11 >= i5) {
                sb2.append((CharSequence) "]");
                break;
            }
            long j11 = jArr[i11];
            if (i11 == -1) {
                sb2.append((CharSequence) "...");
                break;
            }
            if (i11 != 0) {
                sb2.append((CharSequence) ", ");
            }
            sb2.append(j11);
            i11++;
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }
}
