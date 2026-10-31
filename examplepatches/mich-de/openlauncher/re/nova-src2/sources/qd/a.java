package qd;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final Object f83913a;

    /* renamed from: b, reason: collision with root package name */
    public final d f83914b;

    /* renamed from: c, reason: collision with root package name */
    public final b f83915c;

    public a(Object obj, d dVar, b bVar) {
        if (obj == null) {
            throw new NullPointerException("Null payload");
        }
        this.f83913a = obj;
        this.f83914b = dVar;
        this.f83915c = bVar;
    }

    public final boolean equals(Object obj) {
        b bVar;
        if (obj == this) {
            return true;
        }
        if (obj instanceof a) {
            a aVar = (a) obj;
            b bVar2 = aVar.f83915c;
            if (this.f83913a.equals(aVar.f83913a) && this.f83914b.equals(aVar.f83914b) && ((bVar = this.f83915c) != null ? bVar.equals(bVar2) : bVar2 == null)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int iHashCode = ((((1000003 * 1000003) ^ this.f83913a.hashCode()) * 1000003) ^ this.f83914b.hashCode()) * 1000003;
        b bVar = this.f83915c;
        return (iHashCode ^ (bVar == null ? 0 : bVar.hashCode())) * 1000003;
    }

    public final String toString() {
        return "Event{code=null, payload=" + this.f83913a + ", priority=" + this.f83914b + ", productData=" + this.f83915c + ", eventContext=null}";
    }
}
