package sd;

/* loaded from: classes.dex */
public final class v extends h0 {

    /* renamed from: a, reason: collision with root package name */
    public final g0 f87216a;

    public v(u uVar) {
        this.f87216a = uVar;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof h0)) {
            return false;
        }
        g0 g0Var = this.f87216a;
        v vVar = (v) ((h0) obj);
        return g0Var == null ? vVar.f87216a == null : g0Var.equals(vVar.f87216a);
    }

    public final int hashCode() {
        g0 g0Var = this.f87216a;
        return (g0Var == null ? 0 : g0Var.hashCode()) ^ 1000003;
    }

    public final String toString() {
        return "ExternalPrivacyContext{prequest=" + this.f87216a + "}";
    }
}
