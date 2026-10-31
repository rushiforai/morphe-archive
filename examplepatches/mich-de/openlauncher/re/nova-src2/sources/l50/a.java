package l50;

/* loaded from: classes.dex */
public final class a extends w50.d {

    /* renamed from: g, reason: collision with root package name */
    public static final w50.g f74721g = new w50.g("Before", 0);

    /* renamed from: h, reason: collision with root package name */
    public static final w50.g f74722h = new w50.g("State", 0);

    /* renamed from: i, reason: collision with root package name */
    public static final w50.g f74723i = new w50.g("After", 0);

    /* renamed from: j, reason: collision with root package name */
    public static final w50.g f74724j = new w50.g("Receive", 0);

    /* renamed from: k, reason: collision with root package name */
    public static final w50.g f74725k = new w50.g("Parse", 0);

    /* renamed from: l, reason: collision with root package name */
    public static final w50.g f74726l = new w50.g("Transform", 0);

    /* renamed from: m, reason: collision with root package name */
    public static final w50.g f74727m = new w50.g("State", 0);
    public static final w50.g n = new w50.g("After", 0);

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f74728e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f74729f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(int i5) {
        super(f74721g, f74722h, f74723i);
        this.f74728e = i5;
        switch (i5) {
            case 1:
                super(f74724j, f74725k, f74726l, f74727m, n);
                this.f74729f = true;
                break;
            default:
                this.f74729f = true;
                break;
        }
    }

    @Override // w50.d
    public final boolean d() {
        switch (this.f74728e) {
        }
        return this.f74729f;
    }
}
