package ads_mobile_sdk;

/* loaded from: classes2.dex */
abstract class qe {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f8596a = 0;

    /* renamed from: c, reason: collision with root package name */
    private static final Class<?> f8597c;

    /* renamed from: d, reason: collision with root package name */
    private static final boolean f8598d;

    static {
        Class<?> cls;
        Class<?> cls2 = null;
        try {
            cls = Class.forName("libcore.io.Memory");
        } catch (Throwable unused) {
            cls = null;
        }
        f8597c = cls;
        try {
            cls2 = Class.forName("org.robolectric.Robolectric");
        } catch (Throwable unused2) {
        }
        f8598d = cls2 != null;
    }

    public static Class<?> a() {
        return f8597c;
    }

    public static boolean b() {
        return (f8597c == null || f8598d) ? false : true;
    }
}
