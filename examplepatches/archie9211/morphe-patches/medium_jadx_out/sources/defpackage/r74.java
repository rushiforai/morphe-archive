package defpackage;

import java.util.Collections;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r74 {
    public static volatile r74 a;
    public static final r74 b;

    static {
        r74 r74Var = new r74();
        Map map = Collections.EMPTY_MAP;
        b = r74Var;
    }

    public static r74 a() {
        r74 r74Var;
        u7a u7aVar = u7a.c;
        r74 r74Var2 = a;
        if (r74Var2 != null) {
            return r74Var2;
        }
        synchronized (r74.class) {
            try {
                r74Var = a;
                if (r74Var == null) {
                    Class cls = n74.a;
                    r74 r74Var3 = null;
                    if (cls != null) {
                        try {
                            r74Var3 = (r74) cls.getDeclaredMethod("getEmptyRegistry", null).invoke(null, null);
                        } catch (Exception unused) {
                        }
                    }
                    r74Var = r74Var3 != null ? r74Var3 : b;
                    a = r74Var;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return r74Var;
    }
}
