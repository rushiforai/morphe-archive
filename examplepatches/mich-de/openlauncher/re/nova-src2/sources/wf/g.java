package wf;

/* loaded from: classes3.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final Object f94323a;

    /* renamed from: b, reason: collision with root package name */
    public e30.j f94324b = new e30.j(7);

    /* renamed from: c, reason: collision with root package name */
    public boolean f94325c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f94326d;

    public g(Object obj) {
        this.f94323a = obj;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || g.class != obj.getClass()) {
            return false;
        }
        return this.f94323a.equals(((g) obj).f94323a);
    }

    public final int hashCode() {
        return this.f94323a.hashCode();
    }
}
