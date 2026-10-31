package fe;

/* loaded from: classes3.dex */
public final /* synthetic */ class b0 implements vk.u {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54715a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f54716b;

    public /* synthetic */ b0(Object obj, int i5) {
        this.f54715a = i5;
        this.f54716b = obj;
    }

    @Override // vk.u
    public final Object get() {
        switch (this.f54715a) {
            case 0:
                return Boolean.valueOf(((h0) this.f54716b).f54831y);
            default:
                try {
                    return (gf.v) ((Class) this.f54716b).getConstructor(null).newInstance(null);
                } catch (Exception e3) {
                    throw new IllegalStateException(e3);
                }
        }
    }
}
