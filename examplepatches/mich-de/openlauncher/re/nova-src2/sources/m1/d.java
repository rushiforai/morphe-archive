package m1;

/* loaded from: classes2.dex */
public final class d implements e0 {

    /* renamed from: a, reason: collision with root package name */
    public final b2.i f75676a;

    /* renamed from: b, reason: collision with root package name */
    public final b2.i f75677b;

    /* renamed from: c, reason: collision with root package name */
    public final int f75678c;

    public d(b2.i iVar, b2.i iVar2, int i5) {
        this.f75676a = iVar;
        this.f75677b = iVar2;
        this.f75678c = i5;
    }

    @Override // m1.e0
    public final int a(y3.l lVar, long j11, int i5, y3.n nVar) {
        int iA = this.f75677b.a(0, lVar.h(), nVar);
        int i11 = -this.f75676a.a(0, i5, nVar);
        y3.n nVar2 = y3.n.f96612a;
        int i12 = this.f75678c;
        if (nVar != nVar2) {
            i12 = -i12;
        }
        return lVar.f96607a + iA + i11 + i12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        d dVar = (d) obj;
        return this.f75676a.equals(dVar.f75676a) && this.f75677b.equals(dVar.f75677b) && this.f75678c == dVar.f75678c;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f75678c) + a80.m.d(this.f75677b.f17012a, Float.hashCode(this.f75676a.f17012a) * 31, 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Horizontal(menuAlignment=");
        sb2.append(this.f75676a);
        sb2.append(", anchorAlignment=");
        sb2.append(this.f75677b);
        sb2.append(", offset=");
        return a2.c.m(sb2, this.f75678c, ')');
    }
}
