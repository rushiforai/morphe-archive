package r;

/* loaded from: classes2.dex */
public final class b2 {

    /* renamed from: a, reason: collision with root package name */
    public int f84671a;

    /* renamed from: b, reason: collision with root package name */
    public int f84672b;

    /* renamed from: c, reason: collision with root package name */
    public int f84673c;

    /* renamed from: d, reason: collision with root package name */
    public int f84674d;

    /* renamed from: e, reason: collision with root package name */
    public int f84675e;

    /* renamed from: f, reason: collision with root package name */
    public int f84676f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f84677g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f84678h;

    public final void a(int i5, int i11) {
        this.f84673c = i5;
        this.f84674d = i11;
        this.f84678h = true;
        if (this.f84677g) {
            if (i11 != Integer.MIN_VALUE) {
                this.f84671a = i11;
            }
            if (i5 != Integer.MIN_VALUE) {
                this.f84672b = i5;
                return;
            }
            return;
        }
        if (i5 != Integer.MIN_VALUE) {
            this.f84671a = i5;
        }
        if (i11 != Integer.MIN_VALUE) {
            this.f84672b = i11;
        }
    }
}
