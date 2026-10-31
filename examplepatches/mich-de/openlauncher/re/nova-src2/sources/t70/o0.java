package t70;

/* loaded from: classes.dex */
public abstract class o0 {

    /* renamed from: a, reason: collision with root package name */
    public static final r0 f88845a;

    static {
        String property;
        r0 r0Var;
        int i5 = y70.v.f96828a;
        try {
            property = System.getProperty("kotlinx.coroutines.main.delay");
        } catch (SecurityException unused) {
            property = null;
        }
        if (property != null ? Boolean.parseBoolean(property) : false) {
            a80.e eVar = y0.f88884a;
            u70.d dVar = y70.o.f96819a;
            u70.d dVar2 = dVar.f90673f;
            r0Var = dVar;
            if (dVar == null) {
                r0Var = n0.f88840j;
            }
        } else {
            r0Var = n0.f88840j;
        }
        f88845a = r0Var;
    }
}
