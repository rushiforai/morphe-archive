package on;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class a implements Cloneable {

    /* renamed from: c, reason: collision with root package name */
    public static final int[] f80531c = new int[0];

    /* renamed from: b, reason: collision with root package name */
    public int f80533b = 0;

    /* renamed from: a, reason: collision with root package name */
    public int[] f80532a = f80531c;

    public final void a(boolean z11) {
        d(this.f80533b + 1);
        if (z11) {
            int[] iArr = this.f80532a;
            int i5 = this.f80533b;
            int i11 = i5 / 32;
            iArr[i11] = (1 << (i5 & 31)) | iArr[i11];
        }
        this.f80533b++;
    }

    public final void c(int i5, int i11) {
        if (i11 < 0 || i11 > 32) {
            throw new IllegalArgumentException("Num bits must be between 0 and 32");
        }
        int i12 = this.f80533b;
        d(i12 + i11);
        for (int i13 = i11 - 1; i13 >= 0; i13--) {
            if (((1 << i13) & i5) != 0) {
                int[] iArr = this.f80532a;
                int i14 = i12 / 32;
                iArr[i14] = iArr[i14] | (1 << (i12 & 31));
            }
            i12++;
        }
        this.f80533b = i12;
    }

    public final Object clone() {
        int[] iArr = (int[]) this.f80532a.clone();
        int i5 = this.f80533b;
        a aVar = new a();
        aVar.f80532a = iArr;
        aVar.f80533b = i5;
        return aVar;
    }

    public final void d(int i5) {
        if (i5 > this.f80532a.length * 32) {
            int[] iArr = new int[(((int) Math.ceil(i5 / 0.75f)) + 31) / 32];
            int[] iArr2 = this.f80532a;
            System.arraycopy(iArr2, 0, iArr, 0, iArr2.length);
            this.f80532a = iArr;
        }
    }

    public final boolean e(int i5) {
        return ((1 << (i5 & 31)) & this.f80532a[i5 / 32]) != 0;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f80533b == aVar.f80533b && Arrays.equals(this.f80532a, aVar.f80532a);
    }

    public final int f() {
        return (this.f80533b + 7) / 8;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f80532a) + (this.f80533b * 31);
    }

    public final String toString() {
        int i5 = this.f80533b;
        StringBuilder sb2 = new StringBuilder((i5 / 8) + i5 + 1);
        for (int i11 = 0; i11 < this.f80533b; i11++) {
            if ((i11 & 7) == 0) {
                sb2.append(' ');
            }
            sb2.append(e(i11) ? 'X' : '.');
        }
        return sb2.toString();
    }
}
