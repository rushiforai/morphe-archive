package nb0;

/* loaded from: classes.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final b f78104a = new b(0);

    /* renamed from: b, reason: collision with root package name */
    public static final b f78105b = new b(1);

    public static boolean a(ib0.e eVar, Object obj) {
        if (obj == f78104a) {
            eVar.onCompleted();
            return true;
        }
        if (obj == f78105b) {
            eVar.c(null);
            return false;
        }
        if (obj == null) {
            throw new IllegalArgumentException("The lite notification can not be null");
        }
        if (obj.getClass() == c.class) {
            eVar.onError(((c) obj).f78103a);
            return true;
        }
        eVar.c(obj);
        return false;
    }
}
