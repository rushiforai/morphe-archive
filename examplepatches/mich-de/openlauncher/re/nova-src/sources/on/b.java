package on;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class b implements Cloneable {

    /* renamed from: a, reason: collision with root package name */
    public int f80534a;

    /* renamed from: b, reason: collision with root package name */
    public int f80535b;

    /* renamed from: c, reason: collision with root package name */
    public int f80536c;

    /* renamed from: d, reason: collision with root package name */
    public int[] f80537d;

    public final Object clone() {
        int i5 = this.f80534a;
        int i11 = this.f80535b;
        int i12 = this.f80536c;
        int[] iArr = (int[]) this.f80537d.clone();
        b bVar = new b();
        bVar.f80534a = i5;
        bVar.f80535b = i11;
        bVar.f80536c = i12;
        bVar.f80537d = iArr;
        return bVar;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return this.f80534a == bVar.f80534a && this.f80535b == bVar.f80535b && this.f80536c == bVar.f80536c && Arrays.equals(this.f80537d, bVar.f80537d);
    }

    public final int hashCode() {
        int i5 = this.f80534a;
        return Arrays.hashCode(this.f80537d) + (((((((i5 * 31) + i5) * 31) + this.f80535b) * 31) + this.f80536c) * 31);
    }

    public final String toString() {
        int i5 = this.f80535b;
        int i11 = this.f80534a;
        StringBuilder sb2 = new StringBuilder((i11 + 1) * i5);
        for (int i12 = 0; i12 < i5; i12++) {
            for (int i13 = 0; i13 < i11; i13++) {
                sb2.append(((this.f80537d[(i13 / 32) + (this.f80536c * i12)] >>> (i13 & 31)) & 1) != 0 ? "X " : "  ");
            }
            sb2.append("\n");
        }
        return sb2.toString();
    }
}
