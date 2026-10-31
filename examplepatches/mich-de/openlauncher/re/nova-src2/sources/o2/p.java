package o2;

import b.c9;

/* loaded from: classes.dex */
public final class p extends d0 {

    /* renamed from: c, reason: collision with root package name */
    public final float f79347c;

    /* renamed from: d, reason: collision with root package name */
    public final float f79348d;

    public p(float f11, float f12) {
        super(3);
        this.f79347c = f11;
        this.f79348d = f12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return Float.compare(this.f79347c, pVar.f79347c) == 0 && Float.compare(this.f79348d, pVar.f79348d) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f79348d) + (Float.hashCode(this.f79347c) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("MoveTo(x=");
        sb2.append(this.f79347c);
        sb2.append(", y=");
        return c9.k(sb2, this.f79348d, ')');
    }
}
