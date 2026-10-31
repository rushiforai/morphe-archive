package bm;

/* loaded from: classes.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final r f18087a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f18088b;

    public j(r rVar, boolean z11) {
        this.f18087a = rVar;
        this.f18088b = z11;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof j) {
            j jVar = (j) obj;
            if (jVar.f18087a.equals(this.f18087a) && jVar.f18088b == this.f18088b) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((this.f18087a.hashCode() ^ 1000003) * 1000003) ^ Boolean.valueOf(this.f18088b).hashCode();
    }
}
