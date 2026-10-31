package o2;

import b.c9;

/* loaded from: classes2.dex */
public final class x extends d0 {

    /* renamed from: c, reason: collision with root package name */
    public final float f79375c;

    /* renamed from: d, reason: collision with root package name */
    public final float f79376d;

    public x(float f11, float f12) {
        super(3);
        this.f79375c = f11;
        this.f79376d = f12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x)) {
            return false;
        }
        x xVar = (x) obj;
        return Float.compare(this.f79375c, xVar.f79375c) == 0 && Float.compare(this.f79376d, xVar.f79376d) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f79376d) + (Float.hashCode(this.f79375c) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("RelativeMoveTo(dx=");
        sb2.append(this.f79375c);
        sb2.append(", dy=");
        return c9.k(sb2, this.f79376d, ')');
    }
}
