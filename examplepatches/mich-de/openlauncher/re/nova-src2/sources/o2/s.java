package o2;

import b.c9;

/* loaded from: classes2.dex */
public final class s extends d0 {

    /* renamed from: c, reason: collision with root package name */
    public final float f79357c;

    /* renamed from: d, reason: collision with root package name */
    public final float f79358d;

    public s(float f11, float f12) {
        super(1);
        this.f79357c = f11;
        this.f79358d = f12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s)) {
            return false;
        }
        s sVar = (s) obj;
        return Float.compare(this.f79357c, sVar.f79357c) == 0 && Float.compare(this.f79358d, sVar.f79358d) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f79358d) + (Float.hashCode(this.f79357c) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ReflectiveQuadTo(x=");
        sb2.append(this.f79357c);
        sb2.append(", y=");
        return c9.k(sb2, this.f79358d, ')');
    }
}
