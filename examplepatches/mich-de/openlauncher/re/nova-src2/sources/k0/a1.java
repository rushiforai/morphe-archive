package k0;

/* loaded from: classes.dex */
public final class a1 {

    /* renamed from: a, reason: collision with root package name */
    public final int f70558a;

    /* renamed from: b, reason: collision with root package name */
    public final int f70559b;

    /* renamed from: c, reason: collision with root package name */
    public final int f70560c;

    /* renamed from: d, reason: collision with root package name */
    public final int f70561d;

    public a1(int i5, int i11, int i12, int i13) {
        this.f70558a = i5;
        this.f70559b = i11;
        this.f70560c = i12;
        this.f70561d = i13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a1)) {
            return false;
        }
        a1 a1Var = (a1) obj;
        return this.f70558a == a1Var.f70558a && this.f70559b == a1Var.f70559b && this.f70560c == a1Var.f70560c && this.f70561d == a1Var.f70561d;
    }

    public final int hashCode() {
        return (((((this.f70558a * 31) + this.f70559b) * 31) + this.f70560c) * 31) + this.f70561d;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("InsetsValues(left=");
        sb2.append(this.f70558a);
        sb2.append(", top=");
        sb2.append(this.f70559b);
        sb2.append(", right=");
        sb2.append(this.f70560c);
        sb2.append(", bottom=");
        return a2.c.m(sb2, this.f70561d, ')');
    }
}
