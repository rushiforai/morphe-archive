package fz;

import b.u4;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final int f56231a;

    /* renamed from: b, reason: collision with root package name */
    public final int f56232b;

    /* renamed from: c, reason: collision with root package name */
    public final int f56233c;

    /* renamed from: d, reason: collision with root package name */
    public final int f56234d;

    public f(int i5, int i11, int i12, int i13) {
        this.f56231a = i5;
        this.f56232b = i11;
        this.f56233c = i12;
        this.f56234d = i13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return this.f56231a == fVar.f56231a && this.f56232b == fVar.f56232b && this.f56233c == fVar.f56233c && this.f56234d == fVar.f56234d;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f56234d) + u4.a(this.f56233c, u4.a(this.f56232b, Integer.hashCode(this.f56231a) * 31, 31), 31);
    }

    public final String toString() {
        StringBuilder sbT = b.c0.t(this.f56231a, "CornerColors(topLeft=", ", bottomLeft=", this.f56232b, ", topRight=");
        sbT.append(this.f56233c);
        sbT.append(", bottomRight=");
        sbT.append(this.f56234d);
        sbT.append(")");
        return sbT.toString();
    }
}
