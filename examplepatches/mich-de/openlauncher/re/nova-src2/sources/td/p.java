package td;

import java.util.HashMap;
import o9.w1;

/* loaded from: classes.dex */
public final class p implements qd.f {

    /* renamed from: a, reason: collision with root package name */
    public final i f89001a;

    /* renamed from: b, reason: collision with root package name */
    public final String f89002b;

    /* renamed from: c, reason: collision with root package name */
    public final qd.c f89003c;

    /* renamed from: d, reason: collision with root package name */
    public final qd.e f89004d;

    /* renamed from: e, reason: collision with root package name */
    public final q f89005e;

    public p(i iVar, String str, qd.c cVar, qd.e eVar, q qVar) {
        this.f89001a = iVar;
        this.f89002b = str;
        this.f89003c = cVar;
        this.f89004d = eVar;
        this.f89005e = qVar;
    }

    public final void a(qd.a aVar, qd.h hVar) {
        qd.e eVar = this.f89004d;
        if (eVar == null) {
            throw new NullPointerException("Null transformer");
        }
        q qVar = this.f89005e;
        zd.b bVar = qVar.f89009c;
        i iVarB = this.f89001a.b(aVar.f83914b);
        ra.f fVar = new ra.f();
        fVar.f85765g = new HashMap();
        fVar.f85763e = Long.valueOf(qVar.f89007a.getTime());
        fVar.f85764f = Long.valueOf(qVar.f89008b.getTime());
        fVar.f85760b = this.f89002b;
        fVar.f85762d = new l(this.f89003c, (byte[]) eVar.apply(aVar.f83913a));
        fVar.f85761c = null;
        qd.b bVar2 = aVar.f83915c;
        if (bVar2 != null && bVar2.a() != null) {
            fVar.f85766h = bVar2.a();
        }
        zd.a aVar2 = (zd.a) bVar;
        aVar2.f98516b.execute(new w1(aVar2, iVarB, hVar, fVar.c(), 2));
    }
}
