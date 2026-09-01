package defpackage;

import java.util.Collections;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p74 {
    public static volatile p74 a;
    public static final p74 b;

    static {
        p74 p74Var = new p74();
        Map map = Collections.EMPTY_MAP;
        b = p74Var;
    }

    public static p74 a() {
        p74 p74Var;
        p74 p74Var2 = a;
        if (p74Var2 != null) {
            return p74Var2;
        }
        synchronized (p74.class) {
            try {
                p74Var = a;
                if (p74Var == null) {
                    Class cls = m74.a;
                    p74 p74Var3 = null;
                    if (cls != null) {
                        try {
                            p74Var3 = (p74) cls.getDeclaredMethod("getEmptyRegistry", null).invoke(null, null);
                        } catch (Exception unused) {
                        }
                    }
                    p74Var = p74Var3 != null ? p74Var3 : b;
                    a = p74Var;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return p74Var;
    }
}
