package an;

/* loaded from: classes3.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public String f13543a;

    /* renamed from: b, reason: collision with root package name */
    public String f13544b;

    /* renamed from: c, reason: collision with root package name */
    public String f13545c;

    /* renamed from: d, reason: collision with root package name */
    public String f13546d;

    /* renamed from: e, reason: collision with root package name */
    public long f13547e;

    /* renamed from: f, reason: collision with root package name */
    public byte f13548f;

    public final c a() {
        if (this.f13548f == 1 && this.f13543a != null && this.f13544b != null && this.f13545c != null && this.f13546d != null) {
            return new c(this.f13543a, this.f13544b, this.f13545c, this.f13546d, this.f13547e);
        }
        StringBuilder sb2 = new StringBuilder();
        if (this.f13543a == null) {
            sb2.append(" rolloutId");
        }
        if (this.f13544b == null) {
            sb2.append(" variantId");
        }
        if (this.f13545c == null) {
            sb2.append(" parameterKey");
        }
        if (this.f13546d == null) {
            sb2.append(" parameterValue");
        }
        if ((1 & this.f13548f) == 0) {
            sb2.append(" templateVersion");
        }
        throw new IllegalStateException(a2.c.k("Missing required properties:", sb2));
    }

    public final void b(String str) {
        if (str == null) {
            throw new NullPointerException("Null parameterKey");
        }
        this.f13545c = str;
    }

    public final void c(String str) {
        this.f13546d = str;
    }

    public final void d(String str) {
        if (str == null) {
            throw new NullPointerException("Null rolloutId");
        }
        this.f13543a = str;
    }

    public final void e(long j11) {
        this.f13547e = j11;
        this.f13548f = (byte) (this.f13548f | 1);
    }

    public final void f(String str) {
        if (str == null) {
            throw new NullPointerException("Null variantId");
        }
        this.f13544b = str;
    }
}
