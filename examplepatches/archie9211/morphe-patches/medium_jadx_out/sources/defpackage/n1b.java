package defpackage;

import java.util.Collections;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class n1b {
    public static final s1b a;

    static {
        s1b s1bVar = null;
        try {
            s1bVar = (s1b) t1b.class.newInstance();
        } catch (ClassCastException | ClassNotFoundException | IllegalAccessException | InstantiationException unused) {
        }
        if (s1bVar == null) {
            s1bVar = new s1b();
        }
        a = s1bVar;
    }

    public static qj6 a(Class cls) {
        s1b s1bVar = a;
        return s1bVar.k(s1bVar.b(cls), Collections.EMPTY_LIST);
    }
}
