package fe;

/* loaded from: classes3.dex */
public final class i1 {

    /* renamed from: a, reason: collision with root package name */
    public final wf.d f54842a;

    public i1(wf.d dVar) {
        this.f54842a = dVar;
    }

    public final boolean a(int... iArr) {
        for (int i5 : iArr) {
            if (this.f54842a.f94322a.get(i5)) {
                return true;
            }
        }
        return false;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof i1) {
            return this.f54842a.equals(((i1) obj).f54842a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f54842a.hashCode();
    }
}
