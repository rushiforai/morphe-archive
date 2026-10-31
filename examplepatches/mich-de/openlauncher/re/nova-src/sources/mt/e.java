package mt;

/* loaded from: classes4.dex */
public final class e implements i {

    /* renamed from: a, reason: collision with root package name */
    public final k f76743a;

    public e(k kVar) {
        this.f76743a = kVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof e) && this.f76743a == ((e) obj).f76743a;
    }

    public final int hashCode() {
        return this.f76743a.hashCode();
    }

    public final String toString() {
        return "Canceled(action=" + this.f76743a + ")";
    }
}
