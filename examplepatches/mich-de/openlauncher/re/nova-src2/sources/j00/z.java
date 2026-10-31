package j00;

/* loaded from: classes4.dex */
public final class z {

    /* renamed from: a, reason: collision with root package name */
    public final y20.b f68595a;

    /* renamed from: b, reason: collision with root package name */
    public final y20.e f68596b;

    public z(y20.b bVar, y20.e eVar) {
        this.f68595a = bVar;
        this.f68596b = eVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z)) {
            return false;
        }
        z zVar = (z) obj;
        return this.f68595a.equals(zVar.f68595a) && this.f68596b.equals(zVar.f68596b);
    }

    public final int hashCode() {
        return this.f68596b.f96595a.hashCode() + (this.f68595a.f96593a.hashCode() * 31);
    }

    public final String toString() {
        return "ListEntry(imageSource=" + this.f68595a + ", labelSource=" + this.f68596b + ")";
    }
}
