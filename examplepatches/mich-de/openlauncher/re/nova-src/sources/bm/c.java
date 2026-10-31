package bm;

import java.util.Set;

/* loaded from: classes.dex */
public interface c {
    default Object a(Class cls) {
        return d(r.a(cls));
    }

    nm.b c(r rVar);

    default Object d(r rVar) {
        nm.c cVarH = h(rVar);
        if (cVarH == null) {
            return null;
        }
        return cVarH.get();
    }

    nm.c e(r rVar);

    default nm.c f(Class cls) {
        return h(r.a(cls));
    }

    default Set g(r rVar) {
        return (Set) e(rVar).get();
    }

    nm.c h(r rVar);

    default nm.b i(Class cls) {
        return c(r.a(cls));
    }
}
