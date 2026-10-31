package pn;

import com.amplitude.core.events.Identify;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final a f82684a;

    /* renamed from: b, reason: collision with root package name */
    public final int[] f82685b;

    public b(a aVar, int[] iArr) {
        if (iArr.length == 0) {
            throw new IllegalArgumentException();
        }
        this.f82684a = aVar;
        int length = iArr.length;
        int i5 = 1;
        if (length <= 1 || iArr[0] != 0) {
            this.f82685b = iArr;
            return;
        }
        while (i5 < length && iArr[i5] == 0) {
            i5++;
        }
        if (i5 == length) {
            this.f82685b = new int[]{0};
            return;
        }
        int i11 = length - i5;
        int[] iArr2 = new int[i11];
        this.f82685b = iArr2;
        System.arraycopy(iArr, i5, iArr2, 0, i11);
    }

    public final b a(b bVar) {
        a aVar = bVar.f82684a;
        a aVar2 = this.f82684a;
        if (!aVar2.equals(aVar)) {
            throw new IllegalArgumentException("GenericGFPolys do not have same GenericGF field");
        }
        if (c()) {
            return bVar;
        }
        if (bVar.c()) {
            return this;
        }
        int[] iArr = bVar.f82685b;
        int[] iArr2 = this.f82685b;
        if (iArr2.length > iArr.length) {
            iArr2 = iArr;
            iArr = iArr2;
        }
        int[] iArr3 = new int[iArr.length];
        int length = iArr.length - iArr2.length;
        System.arraycopy(iArr, 0, iArr3, 0, length);
        for (int i5 = length; i5 < iArr.length; i5++) {
            iArr3[i5] = iArr2[i5 - length] ^ iArr[i5];
        }
        return new b(aVar2, iArr3);
    }

    public final int b() {
        return this.f82685b.length - 1;
    }

    public final boolean c() {
        return this.f82685b[0] == 0;
    }

    public final String toString() {
        if (c()) {
            return "0";
        }
        StringBuilder sb2 = new StringBuilder(b() * 8);
        for (int iB = b(); iB >= 0; iB--) {
            int[] iArr = this.f82685b;
            int i5 = iArr[(iArr.length - 1) - iB];
            if (i5 != 0) {
                if (i5 < 0) {
                    if (iB == b()) {
                        sb2.append(Identify.UNSET_VALUE);
                    } else {
                        sb2.append(" - ");
                    }
                    i5 = -i5;
                } else if (sb2.length() > 0) {
                    sb2.append(" + ");
                }
                if (iB == 0 || i5 != 1) {
                    a aVar = this.f82684a;
                    if (i5 == 0) {
                        aVar.getClass();
                        throw new IllegalArgumentException();
                    }
                    int i11 = aVar.f82679b[i5];
                    if (i11 == 0) {
                        sb2.append('1');
                    } else if (i11 == 1) {
                        sb2.append('a');
                    } else {
                        sb2.append("a^");
                        sb2.append(i11);
                    }
                }
                if (iB != 0) {
                    if (iB == 1) {
                        sb2.append('x');
                    } else {
                        sb2.append("x^");
                        sb2.append(iB);
                    }
                }
            }
        }
        return sb2.toString();
    }
}
