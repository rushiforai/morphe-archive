package ke;

/* loaded from: classes3.dex */
public final class t {

    /* renamed from: c, reason: collision with root package name */
    public static final t f71432c = new t(0, 0);

    /* renamed from: a, reason: collision with root package name */
    public final long f71433a;

    /* renamed from: b, reason: collision with root package name */
    public final long f71434b;

    public t(long j11, long j12) {
        this.f71433a = j11;
        this.f71434b = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && t.class == obj.getClass()) {
            t tVar = (t) obj;
            if (this.f71433a == tVar.f71433a && this.f71434b == tVar.f71434b) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return (((int) this.f71433a) * 31) + ((int) this.f71434b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("[timeUs=");
        sb2.append(this.f71433a);
        sb2.append(", position=");
        return a2.c.i(this.f71434b, "]", sb2);
    }
}
