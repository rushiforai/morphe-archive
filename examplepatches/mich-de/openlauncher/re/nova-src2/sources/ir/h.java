package ir;

import b.c0;

/* loaded from: classes4.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public static final String f68013a;

    static {
        Object next;
        i70.a aVar = g.f68010d;
        b70.a aVarF = c0.f(aVar, aVar);
        while (true) {
            if (!aVarF.hasNext()) {
                next = null;
                break;
            }
            next = aVarF.next();
            try {
                Class.forName(((g) next).f68011a);
                break;
            } catch (ClassNotFoundException e3) {
                e3.toString();
            }
        }
        g gVar = (g) next;
        f68013a = gVar != null ? gVar.f68012b : null;
    }
}
