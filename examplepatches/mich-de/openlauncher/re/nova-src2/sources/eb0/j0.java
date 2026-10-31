package eb0;

/* loaded from: classes.dex */
public abstract class j0 {

    /* renamed from: a, reason: collision with root package name */
    public static final androidx.recyclerview.widget.e f52570a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f52571b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f52572c;

    static {
        String property = System.getProperty("java.vm.name");
        property.getClass();
        if (property.equals("RoboVM")) {
            f52570a = null;
            f52571b = new a(7);
            f52572c = new a(6);
        } else if (property.equals("Dalvik")) {
            f52570a = new androidx.recyclerview.widget.e(1);
            f52571b = new k0(0);
            f52572c = new c();
        } else {
            f52570a = null;
            f52571b = new k0(1);
            f52572c = new c();
        }
    }
}
