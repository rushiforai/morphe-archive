package os;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final s0.g f80761a;

    /* renamed from: b, reason: collision with root package name */
    public final s0.g f80762b;

    /* renamed from: c, reason: collision with root package name */
    public final s0.g f80763c;

    /* renamed from: d, reason: collision with root package name */
    public final float f80764d;

    public c(s0.g gVar, s0.g gVar2, s0.g gVar3, float f11) {
        this.f80761a = gVar;
        this.f80762b = gVar2;
        this.f80763c = gVar3;
        this.f80764d = f11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return this.f80761a.equals(cVar.f80761a) && this.f80762b.equals(cVar.f80762b) && this.f80763c.equals(cVar.f80763c) && y3.f.a(this.f80764d, cVar.f80764d);
    }

    public final int hashCode() {
        return Float.hashCode(this.f80764d) + ((this.f80763c.hashCode() + ((this.f80762b.hashCode() + (this.f80761a.hashCode() * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "LinkShapes(extraSmall=" + this.f80761a + ", default=" + this.f80762b + ", primaryButton=" + this.f80763c + ", primaryButtonHeight=" + y3.f.b(this.f80764d) + ")";
    }
}
