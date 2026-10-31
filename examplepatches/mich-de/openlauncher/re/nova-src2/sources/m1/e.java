package m1;

/* loaded from: classes2.dex */
public final class e implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final b2.j f75680a;

    /* renamed from: b, reason: collision with root package name */
    public final b2.j f75681b;

    /* renamed from: c, reason: collision with root package name */
    public final int f75682c;

    public e(b2.j jVar, b2.j jVar2, int i5) {
        this.f75680a = jVar;
        this.f75681b = jVar2;
        this.f75682c = i5;
    }

    @Override // m1.f0
    public final int a(y3.l lVar, long j11, int i5) {
        int iA = this.f75681b.a(0, lVar.c());
        return lVar.f96608b + iA + (-this.f75680a.a(0, i5)) + this.f75682c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return this.f75680a.equals(eVar.f75680a) && this.f75681b.equals(eVar.f75681b) && this.f75682c == eVar.f75682c;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f75682c) + a80.m.d(this.f75681b.f17013a, Float.hashCode(this.f75680a.f17013a) * 31, 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Vertical(menuAlignment=");
        sb2.append(this.f75680a);
        sb2.append(", anchorAlignment=");
        sb2.append(this.f75681b);
        sb2.append(", offset=");
        return a2.c.m(sb2, this.f75682c, ')');
    }
}
