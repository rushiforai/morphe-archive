package o2;

import b.c9;

/* loaded from: classes.dex */
public final class o extends d0 {

    /* renamed from: c, reason: collision with root package name */
    public final float f79345c;

    /* renamed from: d, reason: collision with root package name */
    public final float f79346d;

    public o(float f11, float f12) {
        super(3);
        this.f79345c = f11;
        this.f79346d = f12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o)) {
            return false;
        }
        o oVar = (o) obj;
        return Float.compare(this.f79345c, oVar.f79345c) == 0 && Float.compare(this.f79346d, oVar.f79346d) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f79346d) + (Float.hashCode(this.f79345c) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("LineTo(x=");
        sb2.append(this.f79345c);
        sb2.append(", y=");
        return c9.k(sb2, this.f79346d, ')');
    }
}
