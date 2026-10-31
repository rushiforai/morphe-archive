package sl;

/* loaded from: classes3.dex */
public final class j {

    /* renamed from: b, reason: collision with root package name */
    public static final j f87509b = new j(new k(0));

    /* renamed from: c, reason: collision with root package name */
    public static final j f87510c = new j(new k(4));

    /* renamed from: d, reason: collision with root package name */
    public static final j f87511d = new j(new k(6));

    /* renamed from: e, reason: collision with root package name */
    public static final j f87512e = new j(new k(5));

    /* renamed from: f, reason: collision with root package name */
    public static final j f87513f;

    /* renamed from: a, reason: collision with root package name */
    public final i f87514a;

    static {
        new j(new k(1));
        new j(new k(3));
        f87513f = new j(new k(2));
    }

    public j(k kVar) {
        if (jl.a.a()) {
            this.f87514a = new i(kVar, 2);
        } else if ("The Android Project".equals(System.getProperty("java.vendor"))) {
            this.f87514a = new i(kVar, 0);
        } else {
            this.f87514a = new i(kVar, 1);
        }
    }
}
