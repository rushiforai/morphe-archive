package o2;

import b.c9;

/* loaded from: classes.dex */
public final class w extends d0 {

    /* renamed from: c, reason: collision with root package name */
    public final float f79373c;

    /* renamed from: d, reason: collision with root package name */
    public final float f79374d;

    public w(float f11, float f12) {
        super(3);
        this.f79373c = f11;
        this.f79374d = f12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w)) {
            return false;
        }
        w wVar = (w) obj;
        return Float.compare(this.f79373c, wVar.f79373c) == 0 && Float.compare(this.f79374d, wVar.f79374d) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f79374d) + (Float.hashCode(this.f79373c) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("RelativeLineTo(dx=");
        sb2.append(this.f79373c);
        sb2.append(", dy=");
        return c9.k(sb2, this.f79374d, ')');
    }
}
