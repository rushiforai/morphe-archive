package cu;

/* loaded from: classes4.dex */
public final class s extends p {

    /* renamed from: b, reason: collision with root package name */
    public final u f47965b;

    public s(u uVar) {
        this.f47965b = uVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof s) && this.f47965b.equals(((s) obj).f47965b);
    }

    public final int hashCode() {
        return this.f47965b.hashCode();
    }

    public final String toString() {
        return "GoToScreen(screen=" + this.f47965b + ")";
    }
}
