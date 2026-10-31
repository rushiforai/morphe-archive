package sd;

/* loaded from: classes.dex */
public final class p extends c0 {

    /* renamed from: a, reason: collision with root package name */
    public final b0 f87206a;

    /* renamed from: b, reason: collision with root package name */
    public final a f87207b;

    public p(b0 b0Var, n nVar) {
        this.f87206a = b0Var;
        this.f87207b = nVar;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof c0) {
            c0 c0Var = (c0) obj;
            b0 b0Var = this.f87206a;
            if (b0Var != null ? b0Var.equals(((p) c0Var).f87206a) : ((p) c0Var).f87206a == null) {
                a aVar = this.f87207b;
                if (aVar != null ? aVar.equals(((p) c0Var).f87207b) : ((p) c0Var).f87207b == null) {
                    return true;
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        b0 b0Var = this.f87206a;
        int iHashCode = ((b0Var == null ? 0 : b0Var.hashCode()) ^ 1000003) * 1000003;
        a aVar = this.f87207b;
        return (aVar != null ? aVar.hashCode() : 0) ^ iHashCode;
    }

    public final String toString() {
        return "ClientInfo{clientType=" + this.f87206a + ", androidClientInfo=" + this.f87207b + "}";
    }
}
