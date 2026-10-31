package ads_mobile_sdk;

/* loaded from: classes2.dex */
public abstract class ml0 {

    /* renamed from: a, reason: collision with root package name */
    public static final Class f7270a;

    static {
        Class<?> cls;
        try {
            cls = Class.forName("com.google.protobuf.ExtensionRegistry");
        } catch (ClassNotFoundException unused) {
            cls = null;
        }
        f7270a = cls;
    }

    public static final nl0 a(String str) {
        Class cls = f7270a;
        if (cls != null) {
            try {
                return (nl0) cls.getDeclaredMethod(str, null).invoke(null, null);
            } catch (Exception unused) {
            }
        }
        return null;
    }
}
