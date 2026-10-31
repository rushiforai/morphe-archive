package bn;

/* loaded from: classes.dex */
public final class m0 {

    /* renamed from: a, reason: collision with root package name */
    public final v0 f18247a;

    /* renamed from: b, reason: collision with root package name */
    public final b f18248b;

    public m0(v0 v0Var, b bVar) {
        o oVar = o.f18253b;
        this.f18247a = v0Var;
        this.f18248b = bVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m0)) {
            return false;
        }
        m0 m0Var = (m0) obj;
        o oVar = o.f18253b;
        return this.f18247a.equals(m0Var.f18247a) && this.f18248b.equals(m0Var.f18248b);
    }

    public final int hashCode() {
        return this.f18248b.hashCode() + ((this.f18247a.hashCode() + (o.f18253b.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "SessionEvent(eventType=" + o.f18253b + ", sessionData=" + this.f18247a + ", applicationInfo=" + this.f18248b + ')';
    }
}
