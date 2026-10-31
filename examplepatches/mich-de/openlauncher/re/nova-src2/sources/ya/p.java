package ya;

import java.util.Arrays;
import java.util.Iterator;
import java.util.StringTokenizer;

/* loaded from: classes.dex */
public final class p implements Cloneable, Iterable {

    /* renamed from: c, reason: collision with root package name */
    public static final int[] f97192c = new int[0];

    /* renamed from: a, reason: collision with root package name */
    public int[] f97193a;

    /* renamed from: b, reason: collision with root package name */
    public int f97194b;

    public p(int[] iArr, int i5) {
        this.f97193a = iArr;
        this.f97194b = i5;
    }

    public static void e(int i5, int i11) {
        if (i11 < 0 || i5 <= i11) {
            throw new ArrayIndexOutOfBoundsException(b.c0.g(i5, i11, "length=", "; index="));
        }
    }

    public static p h(String str) {
        StringTokenizer stringTokenizer = new StringTokenizer(str, ",");
        int iCountTokens = stringTokenizer.countTokens();
        int[] iArr = new int[iCountTokens];
        int i5 = 0;
        while (stringTokenizer.hasMoreTokens()) {
            iArr[i5] = Integer.parseInt(stringTokenizer.nextToken().trim());
            i5++;
        }
        return new p(iArr, iCountTokens);
    }

    public static p t(int... iArr) {
        return new p(iArr, iArr.length);
    }

    public final void c(int i5) {
        d(this.f97194b, i5);
    }

    public final Object clone() {
        return t(q());
    }

    public final void d(int i5, int i11) {
        g(1);
        int i12 = this.f97194b;
        int i13 = i12 - i5;
        int i14 = i12 + 1;
        this.f97194b = i14;
        e(i14, i5);
        if (i13 != 0) {
            int[] iArr = this.f97193a;
            System.arraycopy(iArr, i5, iArr, i5 + 1, i13);
        }
        this.f97193a[i5] = i11;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof p) {
            p pVar = (p) obj;
            if (this.f97194b == pVar.f97194b) {
                for (int i5 = 0; i5 < this.f97194b; i5++) {
                    if (pVar.f97193a[i5] != this.f97193a[i5]) {
                        return false;
                    }
                }
                return true;
            }
        }
        return false;
    }

    public final boolean f(int i5) {
        return k(i5) >= 0;
    }

    public final void g(int i5) {
        int i11 = this.f97194b;
        int i12 = i5 + i11;
        int[] iArr = this.f97193a;
        if (i12 >= iArr.length) {
            int i13 = (i11 < 6 ? 12 : i11 >> 1) + i11;
            if (i13 > i12) {
                i12 = i13;
            }
            int[] iArr2 = new int[i12];
            System.arraycopy(iArr, 0, iArr2, 0, i11);
            this.f97193a = iArr2;
        }
    }

    public final boolean isEmpty() {
        return this.f97194b == 0;
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new com.google.android.gms.internal.measurement.u(this, 2);
    }

    public final int j(int i5) {
        e(this.f97194b, i5);
        return this.f97193a[i5];
    }

    public final int k(int i5) {
        int i11 = this.f97194b;
        for (int i12 = 0; i12 < i11; i12++) {
            if (this.f97193a[i12] == i5) {
                return i12;
            }
        }
        return -1;
    }

    public final void n(int i5) {
        e(this.f97194b, i5);
        int[] iArr = this.f97193a;
        System.arraycopy(iArr, i5 + 1, iArr, i5, (this.f97194b - i5) - 1);
        this.f97194b--;
    }

    public final void o(int i5) {
        int iK = k(i5);
        if (iK >= 0) {
            n(iK);
        }
    }

    public final int[] q() {
        int i5 = this.f97194b;
        return i5 == 0 ? f97192c : Arrays.copyOf(this.f97193a, i5);
    }

    public final String r() {
        StringBuilder sb2 = new StringBuilder();
        for (int i5 = 0; i5 < this.f97194b; i5++) {
            if (i5 > 0) {
                sb2.append(", ");
            }
            sb2.append(this.f97193a[i5]);
        }
        return sb2.toString();
    }

    public p() {
        this(10);
    }

    public p(int i5) {
        if (i5 == 0) {
            this.f97193a = f97192c;
        } else {
            this.f97193a = new int[i5];
        }
        this.f97194b = 0;
    }
}
