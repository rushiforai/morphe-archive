package fl;

/* loaded from: classes3.dex */
public final class b0 {

    /* renamed from: c, reason: collision with root package name */
    public static final b0 f55284c;

    /* renamed from: d, reason: collision with root package name */
    public static final b0 f55285d;

    /* renamed from: e, reason: collision with root package name */
    public static final b0 f55286e;

    /* renamed from: f, reason: collision with root package name */
    public static final b0 f55287f;

    /* renamed from: g, reason: collision with root package name */
    public static final b0 f55288g;

    /* renamed from: h, reason: collision with root package name */
    public static final b0 f55289h;

    /* renamed from: i, reason: collision with root package name */
    public static final b0 f55290i;

    /* renamed from: j, reason: collision with root package name */
    public static final b0 f55291j;

    /* renamed from: k, reason: collision with root package name */
    public static final b0 f55292k;

    /* renamed from: l, reason: collision with root package name */
    public static final b0 f55293l;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55294a;

    /* renamed from: b, reason: collision with root package name */
    public final String f55295b;

    static {
        int i5 = 0;
        f55284c = new b0("TINK", i5);
        f55285d = new b0("NO_PREFIX", i5);
        int i11 = 1;
        f55286e = new b0("ASSUME_AES_GCM", i11);
        f55287f = new b0("ASSUME_XCHACHA20POLY1305", i11);
        f55288g = new b0("ASSUME_CHACHA20POLY1305", i11);
        f55289h = new b0("ASSUME_AES_CTR_HMAC", i11);
        f55290i = new b0("ASSUME_AES_EAX", i11);
        f55291j = new b0("ASSUME_AES_GCM_SIV", i11);
        int i12 = 2;
        f55292k = new b0("TINK", i12);
        f55293l = new b0("NO_PREFIX", i12);
    }

    public /* synthetic */ b0(String str, int i5) {
        this.f55294a = i5;
        this.f55295b = str;
    }

    public final String toString() {
        switch (this.f55294a) {
        }
        return this.f55295b;
    }
}
