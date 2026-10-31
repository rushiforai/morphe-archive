package ads_mobile_sdk;

/* loaded from: classes.dex */
public final class hb1 implements b.bb, b.w4 {

    /* renamed from: b, reason: collision with root package name */
    public static final hb1 f4275b = new hb1(null);

    /* renamed from: a, reason: collision with root package name */
    public final Object f4276a;

    public hb1(Object obj) {
        this.f4276a = obj;
    }

    public static hb1 a(Object obj) {
        if (obj != null) {
            return new hb1(obj);
        }
        throw new NullPointerException("instance cannot be null");
    }

    @Override // b.m5
    public final Object get() {
        return this.f4276a;
    }
}
