package n0;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final int f77411a;

    /* renamed from: b, reason: collision with root package name */
    public final int f77412b;

    /* renamed from: c, reason: collision with root package name */
    public final q f77413c;

    public f(int i5, int i11, q qVar) {
        this.f77411a = i5;
        this.f77412b = i11;
        this.f77413c = qVar;
        if (i5 < 0) {
            j0.b.a("startIndex should be >= 0");
        }
        if (i11 > 0) {
            return;
        }
        j0.b.a("size should be > 0");
    }
}
