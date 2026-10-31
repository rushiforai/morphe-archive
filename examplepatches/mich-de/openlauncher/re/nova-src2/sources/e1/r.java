package e1;

import b.u4;

/* loaded from: classes2.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final x3.j f51370a;

    /* renamed from: b, reason: collision with root package name */
    public final int f51371b;

    /* renamed from: c, reason: collision with root package name */
    public final long f51372c;

    public r(x3.j jVar, int i5, long j11) {
        this.f51370a = jVar;
        this.f51371b = i5;
        this.f51372c = j11;
    }

    public final int a() {
        return this.f51371b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        return this.f51370a == rVar.f51370a && this.f51371b == rVar.f51371b && this.f51372c == rVar.f51372c;
    }

    public final int hashCode() {
        return Long.hashCode(this.f51372c) + u4.a(this.f51371b, this.f51370a.hashCode() * 31, 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AnchorInfo(direction=");
        sb2.append(this.f51370a);
        sb2.append(", offset=");
        sb2.append(this.f51371b);
        sb2.append(", selectableId=");
        return a2.c.n(sb2, this.f51372c, ')');
    }
}
