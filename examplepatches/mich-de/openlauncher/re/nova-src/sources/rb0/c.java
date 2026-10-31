package rb0;

/* loaded from: classes5.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public static final int f85778a;

    /* renamed from: b, reason: collision with root package name */
    public static final boolean f85779b;

    static {
        int iIntValue;
        try {
            iIntValue = ((Integer) Class.forName("android.os.Build$VERSION").getField("SDK_INT").get(null)).intValue();
        } catch (Exception unused) {
            iIntValue = 0;
        }
        f85778a = iIntValue;
        f85779b = iIntValue != 0;
    }
}
