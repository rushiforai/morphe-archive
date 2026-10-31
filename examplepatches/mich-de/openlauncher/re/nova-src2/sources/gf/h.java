package gf;

import android.os.Handler;
import fe.z1;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes3.dex */
public abstract class h extends a {

    /* renamed from: h, reason: collision with root package name */
    public final HashMap f57504h = new HashMap();

    /* renamed from: i, reason: collision with root package name */
    public Handler f57505i;

    /* renamed from: j, reason: collision with root package name */
    public vf.g0 f57506j;

    @Override // gf.a
    public final void c() {
        for (g gVar : this.f57504h.values()) {
            gVar.f57495a.b(gVar.f57496b);
        }
    }

    @Override // gf.a
    public final void e() {
        for (g gVar : this.f57504h.values()) {
            gVar.f57495a.d(gVar.f57496b);
        }
    }

    @Override // gf.a
    public void i() {
        Iterator it = this.f57504h.values().iterator();
        while (it.hasNext()) {
            ((g) it.next()).f57495a.i();
        }
    }

    @Override // gf.a
    public void o() {
        HashMap map = this.f57504h;
        for (g gVar : map.values()) {
            a aVar = gVar.f57495a;
            tm.o oVar = gVar.f57497c;
            aVar.n(gVar.f57496b);
            aVar.q(oVar);
            aVar.p(oVar);
        }
        map.clear();
    }

    public abstract w r(Object obj, w wVar);

    public long s(long j11, Object obj) {
        return j11;
    }

    public int t(int i5, Object obj) {
        return i5;
    }

    public abstract void u(Object obj, a aVar, z1 z1Var);

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v2, types: [gf.f, gf.x] */
    public final void v(final Object obj, a aVar) {
        HashMap map = this.f57504h;
        wf.a.e(!map.containsKey(obj));
        ?? r12 = new x() { // from class: gf.f
            @Override // gf.x
            public final void a(a aVar2, z1 z1Var) {
                this.f57484a.u(obj, aVar2, z1Var);
            }
        };
        tm.o oVar = new tm.o(this, obj);
        map.put(obj, new g(aVar, r12, oVar));
        Handler handler = this.f57505i;
        handler.getClass();
        aVar.getClass();
        a0 a0Var = aVar.f57446c;
        a0Var.getClass();
        CopyOnWriteArrayList copyOnWriteArrayList = a0Var.f57453c;
        z zVar = new z();
        zVar.f57669a = handler;
        zVar.f57670b = oVar;
        copyOnWriteArrayList.add(zVar);
        this.f57505i.getClass();
        a0 a0Var2 = aVar.f57447d;
        a0Var2.getClass();
        CopyOnWriteArrayList copyOnWriteArrayList2 = a0Var2.f57453c;
        je.a aVar2 = new je.a();
        aVar2.f69482a = oVar;
        copyOnWriteArrayList2.add(aVar2);
        vf.g0 g0Var = this.f57506j;
        ge.m mVar = this.f57450g;
        wf.a.j(mVar);
        aVar.j(r12, g0Var, mVar);
        if (this.f57445b.isEmpty()) {
            aVar.b(r12);
        }
    }
}
