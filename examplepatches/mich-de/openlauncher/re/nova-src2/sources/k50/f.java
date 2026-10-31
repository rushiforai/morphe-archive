package k50;

/* loaded from: classes.dex */
public final class f extends w50.d {

    /* renamed from: g, reason: collision with root package name */
    public static final w50.g f71131g = new w50.g("Before", 0);

    /* renamed from: h, reason: collision with root package name */
    public static final w50.g f71132h = new w50.g("State", 0);

    /* renamed from: i, reason: collision with root package name */
    public static final w50.g f71133i = new w50.g("Transform", 0);

    /* renamed from: j, reason: collision with root package name */
    public static final w50.g f71134j = new w50.g("Render", 0);

    /* renamed from: k, reason: collision with root package name */
    public static final w50.g f71135k = new w50.g("Send", 0);

    /* renamed from: l, reason: collision with root package name */
    public static final w50.g f71136l = new w50.g("Before", 0);

    /* renamed from: m, reason: collision with root package name */
    public static final w50.g f71137m = new w50.g("State", 0);
    public static final w50.g n = new w50.g("Monitoring", 0);
    public static final w50.g o = new w50.g("Engine", 0);

    /* renamed from: p, reason: collision with root package name */
    public static final w50.g f71138p = new w50.g("Receive", 0);

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f71139e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f71140f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(int i5) {
        super(f71131g, f71132h, f71133i, f71134j, f71135k);
        this.f71139e = i5;
        switch (i5) {
            case 1:
                super(f71136l, f71137m, n, o, f71138p);
                this.f71140f = true;
                break;
            default:
                this.f71140f = true;
                break;
        }
    }

    @Override // w50.d
    public final boolean d() {
        switch (this.f71139e) {
        }
        return this.f71140f;
    }
}
