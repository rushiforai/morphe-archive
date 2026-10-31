package j2;

import z.c0;

/* loaded from: classes.dex */
public abstract class h {

    /* renamed from: a, reason: collision with root package name */
    public static final c0 f68688a;

    static {
        q qVar = d.f68662e;
        int i5 = qVar.f68657c;
        e eVar = new e(qVar, qVar, 1);
        int i11 = qVar.f68657c;
        l lVar = d.f68679x;
        int i12 = (lVar.f68657c << 6) | i11;
        g gVar = new g(qVar, lVar, 0);
        int i13 = (i11 << 6) | lVar.f68657c;
        g gVar2 = new g(lVar, qVar, 0);
        c0 c0Var = z.n.f97803a;
        c0 c0Var2 = new c0();
        c0Var2.h(i5 | (i5 << 6), eVar);
        c0Var2.h(i12, gVar);
        c0Var2.h(i13, gVar2);
        f68688a = c0Var2;
    }
}
