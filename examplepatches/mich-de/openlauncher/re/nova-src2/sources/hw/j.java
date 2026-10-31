package hw;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final float f60741a;

    /* renamed from: b, reason: collision with root package name */
    public final float f60742b;

    /* renamed from: c, reason: collision with root package name */
    public final float f60743c;

    public j(float f11, float f12, float f13) {
        this.f60741a = f11;
        this.f60742b = f12;
        this.f60743c = f13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return Float.compare(this.f60741a, jVar.f60741a) == 0 && Float.compare(this.f60742b, jVar.f60742b) == 0 && Float.compare(this.f60743c, jVar.f60743c) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f60743c) + a80.m.d(this.f60742b, Float.hashCode(this.f60741a) * 31, 31);
    }

    public final String toString() {
        return "PrimaryButtonShape(cornerRadius=" + this.f60741a + ", borderStrokeWidth=" + this.f60742b + ", height=" + this.f60743c + ")";
    }
}
