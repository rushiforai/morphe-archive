package fe;

/* loaded from: classes3.dex */
public final class s1 {

    /* renamed from: c, reason: collision with root package name */
    public static final s1 f54985c;

    /* renamed from: a, reason: collision with root package name */
    public final long f54986a;

    /* renamed from: b, reason: collision with root package name */
    public final long f54987b;

    static {
        s1 s1Var = new s1(0L, 0L);
        new s1(Long.MAX_VALUE, Long.MAX_VALUE);
        new s1(Long.MAX_VALUE, 0L);
        new s1(0L, Long.MAX_VALUE);
        f54985c = s1Var;
    }

    public s1(long j11, long j12) {
        wf.a.e(j11 >= 0);
        wf.a.e(j12 >= 0);
        this.f54986a = j11;
        this.f54987b = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && s1.class == obj.getClass()) {
            s1 s1Var = (s1) obj;
            if (this.f54986a == s1Var.f54986a && this.f54987b == s1Var.f54987b) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return (((int) this.f54986a) * 31) + ((int) this.f54987b);
    }
}
