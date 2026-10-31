package hw;

/* loaded from: classes4.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public final float f60762a;

    /* renamed from: b, reason: collision with root package name */
    public final float f60763b;

    /* renamed from: c, reason: collision with root package name */
    public final float f60764c;

    public o(float f11, float f12, float f13) {
        this.f60762a = f11;
        this.f60763b = f12;
        this.f60764c = f13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o)) {
            return false;
        }
        o oVar = (o) obj;
        return Float.compare(this.f60762a, oVar.f60762a) == 0 && Float.compare(this.f60763b, oVar.f60763b) == 0 && Float.compare(this.f60764c, oVar.f60764c) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f60764c) + a80.m.d(this.f60763b, Float.hashCode(this.f60762a) * 31, 31);
    }

    public final String toString() {
        return "StripeShapes(cornerRadius=" + this.f60762a + ", bottomSheetCornerRadius=" + this.f60763b + ", borderStrokeWidth=" + this.f60764c + ")";
    }
}
