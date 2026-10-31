package q3;

/* loaded from: classes2.dex */
public final class z implements x {

    /* renamed from: a, reason: collision with root package name */
    public final int f83604a;

    public z(int i5) {
        this.f83604a = i5;
    }

    @Override // q3.x
    public final float a() {
        return this.f83604a;
    }

    @Override // q3.x
    public final String b() {
        return "wght";
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof z) && this.f83604a == ((z) obj).f83604a;
    }

    public final int hashCode() {
        return 113071012 + this.f83604a;
    }

    public final String toString() {
        return a2.c.m(new StringBuilder("FontVariation.Setting(axisName='wght', value="), this.f83604a, ')');
    }
}
