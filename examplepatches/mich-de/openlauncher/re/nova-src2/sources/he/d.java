package he;

/* loaded from: classes3.dex */
public final class d implements fe.e {

    /* renamed from: g, reason: collision with root package name */
    public static final d f59672g = new d(0, 0, 1, 1, 0);

    /* renamed from: a, reason: collision with root package name */
    public final int f59673a;

    /* renamed from: b, reason: collision with root package name */
    public final int f59674b;

    /* renamed from: c, reason: collision with root package name */
    public final int f59675c;

    /* renamed from: d, reason: collision with root package name */
    public final int f59676d;

    /* renamed from: e, reason: collision with root package name */
    public final int f59677e;

    /* renamed from: f, reason: collision with root package name */
    public gu.j f59678f;

    public d(int i5, int i11, int i12, int i13, int i14) {
        this.f59673a = i5;
        this.f59674b = i11;
        this.f59675c = i12;
        this.f59676d = i13;
        this.f59677e = i14;
    }

    public final gu.j a() {
        if (this.f59678f == null) {
            this.f59678f = new gu.j(this);
        }
        return this.f59678f;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && d.class == obj.getClass()) {
            d dVar = (d) obj;
            if (this.f59673a == dVar.f59673a && this.f59674b == dVar.f59674b && this.f59675c == dVar.f59675c && this.f59676d == dVar.f59676d && this.f59677e == dVar.f59677e) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((((((((527 + this.f59673a) * 31) + this.f59674b) * 31) + this.f59675c) * 31) + this.f59676d) * 31) + this.f59677e;
    }
}
