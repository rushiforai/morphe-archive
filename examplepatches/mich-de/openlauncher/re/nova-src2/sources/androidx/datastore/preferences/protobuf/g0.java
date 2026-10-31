package androidx.datastore.preferences.protobuf;

/* loaded from: classes2.dex */
public abstract class g0 {

    /* renamed from: a, reason: collision with root package name */
    public static final e0 f14316a;

    /* renamed from: b, reason: collision with root package name */
    public static final f0 f14317b;

    static {
        w0 w0Var = w0.f14415c;
        e0 e0Var = null;
        try {
            e0Var = (e0) Class.forName("androidx.datastore.preferences.protobuf.ListFieldSchemaFull").getDeclaredConstructor(null).newInstance(null);
        } catch (Exception unused) {
        }
        f14316a = e0Var;
        f14317b = new f0();
    }

    public static e0 a() {
        return f14316a;
    }

    public static f0 b() {
        return f14317b;
    }
}
