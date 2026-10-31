package cu;

/* loaded from: classes4.dex */
public final class r extends p {

    /* renamed from: b, reason: collision with root package name */
    public final boolean f47964b;

    public r(boolean z11) {
        this.f47964b = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof r) && this.f47964b == ((r) obj).f47964b;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f47964b);
    }

    public final String toString() {
        return a80.m.i("Close(shouldInvokeRowSelectionCallback=", ")", this.f47964b);
    }
}
