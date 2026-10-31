package androidx.datastore.preferences.protobuf;

import java.util.Collections;
import java.util.Map;

/* loaded from: classes.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public static volatile p f14372a;

    /* renamed from: b, reason: collision with root package name */
    public static final p f14373b;

    static {
        p pVar = new p();
        Map map = Collections.EMPTY_MAP;
        f14373b = pVar;
    }

    public static p a() {
        p pVar;
        w0 w0Var = w0.f14415c;
        p pVar2 = f14372a;
        if (pVar2 != null) {
            return pVar2;
        }
        synchronized (p.class) {
            try {
                pVar = f14372a;
                if (pVar == null) {
                    Class cls = o.f14370a;
                    p pVar3 = null;
                    if (cls != null) {
                        try {
                            pVar3 = (p) cls.getDeclaredMethod("getEmptyRegistry", null).invoke(null, null);
                        } catch (Exception unused) {
                        }
                    }
                    pVar = pVar3 != null ? pVar3 : f14373b;
                    f14372a = pVar;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return pVar;
    }
}
