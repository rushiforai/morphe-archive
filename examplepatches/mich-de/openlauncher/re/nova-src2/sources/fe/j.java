package fe;

/* loaded from: classes3.dex */
public final class j implements e {

    /* renamed from: a, reason: collision with root package name */
    public final int f54843a;

    /* renamed from: b, reason: collision with root package name */
    public final int f54844b;

    /* renamed from: c, reason: collision with root package name */
    public final int f54845c;

    public j(int i5, int i11, int i12) {
        this.f54843a = i5;
        this.f54844b = i11;
        this.f54845c = i12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return this.f54843a == jVar.f54843a && this.f54844b == jVar.f54844b && this.f54845c == jVar.f54845c;
    }

    public final int hashCode() {
        return ((((527 + this.f54843a) * 31) + this.f54844b) * 31) + this.f54845c;
    }
}
