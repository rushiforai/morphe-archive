package n0;

/* loaded from: classes.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final int f77427a;

    /* renamed from: b, reason: collision with root package name */
    public final int f77428b;

    public i(int i5, int i11) {
        this.f77427a = i5;
        this.f77428b = i11;
        if (!(i5 >= 0)) {
            j0.b.a("negative start index");
        }
        if (i11 >= i5) {
            return;
        }
        j0.b.a("end index greater than start");
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        return this.f77427a == iVar.f77427a && this.f77428b == iVar.f77428b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f77428b) + (Integer.hashCode(this.f77427a) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Interval(start=");
        sb2.append(this.f77427a);
        sb2.append(", end=");
        return a2.c.m(sb2, this.f77428b, ')');
    }
}
