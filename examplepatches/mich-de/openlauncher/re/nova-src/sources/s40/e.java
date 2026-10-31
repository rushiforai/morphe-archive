package s40;

/* loaded from: classes4.dex */
public final class e implements d, r40.a {

    /* renamed from: b, reason: collision with root package name */
    public static final e f86658b = new e(null);

    /* renamed from: a, reason: collision with root package name */
    public final Object f86659a;

    public e(Object obj) {
        this.f86659a = obj;
    }

    public static e a(Object obj) {
        if (obj != null) {
            return new e(obj);
        }
        throw new NullPointerException("instance cannot be null");
    }

    @Override // w60.a
    public final Object get() {
        return this.f86659a;
    }
}
