package androidx.datastore.preferences.protobuf;

/* loaded from: classes.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static final Class f14286a;

    /* renamed from: b, reason: collision with root package name */
    public static final boolean f14287b;

    static {
        Class<?> cls;
        Class<?> cls2 = null;
        try {
            cls = Class.forName("libcore.io.Memory");
        } catch (Throwable unused) {
            cls = null;
        }
        f14286a = cls;
        try {
            cls2 = Class.forName("org.robolectric.Robolectric");
        } catch (Throwable unused2) {
        }
        f14287b = cls2 != null;
    }

    public static boolean a() {
        return (f14286a == null || f14287b) ? false : true;
    }
}
