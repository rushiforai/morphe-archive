package xf;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class a implements fe.e {

    /* renamed from: a, reason: collision with root package name */
    public final int f95761a;

    /* renamed from: b, reason: collision with root package name */
    public final int f95762b;

    /* renamed from: c, reason: collision with root package name */
    public final int f95763c;

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f95764d;

    /* renamed from: e, reason: collision with root package name */
    public int f95765e;

    public a(int i5, int i11, int i12, byte[] bArr) {
        this.f95761a = i5;
        this.f95762b = i11;
        this.f95763c = i12;
        this.f95764d = bArr;
    }

    public static int a(int i5) {
        if (i5 == 1) {
            return 1;
        }
        if (i5 != 9) {
            return (i5 == 4 || i5 == 5 || i5 == 6 || i5 == 7) ? 2 : -1;
        }
        return 6;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && a.class == obj.getClass()) {
            a aVar = (a) obj;
            if (this.f95761a == aVar.f95761a && this.f95762b == aVar.f95762b && this.f95763c == aVar.f95763c && Arrays.equals(this.f95764d, aVar.f95764d)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        if (this.f95765e == 0) {
            this.f95765e = Arrays.hashCode(this.f95764d) + ((((((527 + this.f95761a) * 31) + this.f95762b) * 31) + this.f95763c) * 31);
        }
        return this.f95765e;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ColorInfo(");
        sb2.append(this.f95761a);
        sb2.append(", ");
        sb2.append(this.f95762b);
        sb2.append(", ");
        sb2.append(this.f95763c);
        sb2.append(", ");
        return a80.m.k(sb2, this.f95764d != null, ")");
    }
}
