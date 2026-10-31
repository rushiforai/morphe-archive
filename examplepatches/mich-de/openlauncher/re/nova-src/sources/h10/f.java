package h10;

import b.u4;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final int f58872a;

    /* renamed from: b, reason: collision with root package name */
    public final int f58873b;

    /* renamed from: c, reason: collision with root package name */
    public final int f58874c;

    public f(int i5, int i11, int i12) {
        this.f58872a = i5;
        this.f58873b = i11;
        this.f58874c = i12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return this.f58872a == fVar.f58872a && this.f58873b == fVar.f58873b && this.f58874c == fVar.f58874c;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f58874c) + u4.a(this.f58873b, Integer.hashCode(this.f58872a) * 31, 31);
    }

    public final String toString() {
        return b.c0.o(b.c0.t(this.f58872a, "GesturePrefInfo(name=", ", iconId=", this.f58873b, ", prefId="), this.f58874c, ")");
    }
}
