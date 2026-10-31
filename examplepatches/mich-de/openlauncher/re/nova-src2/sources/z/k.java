package z;

import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;

/* loaded from: classes.dex */
public abstract class k {

    /* renamed from: a, reason: collision with root package name */
    public int[] f97783a;

    /* renamed from: b, reason: collision with root package name */
    public int f97784b;

    public final int a(int i5) {
        if (i5 >= 0 && i5 < this.f97784b) {
            return this.f97783a[i5];
        }
        android.support.v4.media.session.b.m0("Index must be between 0 and size");
        throw null;
    }

    public final int b() {
        int i5 = this.f97784b;
        if (i5 != 0) {
            return this.f97783a[i5 - 1];
        }
        android.support.v4.media.session.b.n0("IntList is empty.");
        throw null;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof k) {
            k kVar = (k) obj;
            int i5 = kVar.f97784b;
            int i11 = this.f97784b;
            if (i5 == i11) {
                int[] iArr = this.f97783a;
                int[] iArr2 = kVar.f97783a;
                IntRange intRangeM0 = kotlin.ranges.a.m0(0, i11);
                int i12 = intRangeM0.f71906a;
                int i13 = intRangeM0.f71907b;
                if (i12 > i13) {
                    return true;
                }
                while (iArr[i12] == iArr2[i12]) {
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
        int[] iArr = this.f97783a;
        int i5 = this.f97784b;
        int iHashCode = 0;
        for (int i11 = 0; i11 < i5; i11++) {
            iHashCode += Integer.hashCode(iArr[i11]) * 31;
        }
        return iHashCode;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append((CharSequence) "[");
        int[] iArr = this.f97783a;
        int i5 = this.f97784b;
        int i11 = 0;
        while (true) {
            if (i11 >= i5) {
                sb2.append((CharSequence) "]");
                break;
            }
            int i12 = iArr[i11];
            if (i11 == -1) {
                sb2.append((CharSequence) "...");
                break;
            }
            if (i11 != 0) {
                sb2.append((CharSequence) ", ");
            }
            sb2.append(i12);
            i11++;
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }
}
