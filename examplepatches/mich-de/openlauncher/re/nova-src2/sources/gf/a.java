package gf;

import android.os.Looper;
import fe.z1;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f57444a = new ArrayList(1);

    /* renamed from: b, reason: collision with root package name */
    public final HashSet f57445b = new HashSet(1);

    /* renamed from: c, reason: collision with root package name */
    public final a0 f57446c = new a0(0);

    /* renamed from: d, reason: collision with root package name */
    public final a0 f57447d = new a0(1);

    /* renamed from: e, reason: collision with root package name */
    public Looper f57448e;

    /* renamed from: f, reason: collision with root package name */
    public z1 f57449f;

    /* renamed from: g, reason: collision with root package name */
    public ge.m f57450g;

    public abstract t a(w wVar, vf.m mVar, long j11);

    public final void b(x xVar) {
        HashSet hashSet = this.f57445b;
        boolean zIsEmpty = hashSet.isEmpty();
        hashSet.remove(xVar);
        if (zIsEmpty || !hashSet.isEmpty()) {
            return;
        }
        c();
    }

    public void c() {
    }

    public final void d(x xVar) {
        this.f57448e.getClass();
        HashSet hashSet = this.f57445b;
        boolean zIsEmpty = hashSet.isEmpty();
        hashSet.add(xVar);
        if (zIsEmpty) {
            e();
        }
    }

    public void e() {
    }

    public z1 f() {
        return null;
    }

    public abstract fe.u0 g();

    public boolean h() {
        return true;
    }

    public abstract void i();

    public final void j(x xVar, vf.g0 g0Var, ge.m mVar) {
        Looper looperMyLooper = Looper.myLooper();
        Looper looper = this.f57448e;
        wf.a.e(looper == null || looper == looperMyLooper);
        this.f57450g = mVar;
        z1 z1Var = this.f57449f;
        this.f57444a.add(xVar);
        if (this.f57448e == null) {
            this.f57448e = looperMyLooper;
            this.f57445b.add(xVar);
            k(g0Var);
        } else if (z1Var != null) {
            d(xVar);
            xVar.a(this, z1Var);
        }
    }

    public abstract void k(vf.g0 g0Var);

    public final void l(z1 z1Var) {
        this.f57449f = z1Var;
        Iterator it = this.f57444a.iterator();
        while (it.hasNext()) {
            ((x) it.next()).a(this, z1Var);
        }
    }

    public abstract void m(t tVar);

    public final void n(x xVar) {
        ArrayList arrayList = this.f57444a;
        arrayList.remove(xVar);
        if (!arrayList.isEmpty()) {
            b(xVar);
            return;
        }
        this.f57448e = null;
        this.f57449f = null;
        this.f57450g = null;
        this.f57445b.clear();
        o();
    }

    public abstract void o();

    public final void p(je.b bVar) {
        CopyOnWriteArrayList copyOnWriteArrayList = this.f57447d.f57453c;
        Iterator it = copyOnWriteArrayList.iterator();
        while (it.hasNext()) {
            je.a aVar = (je.a) it.next();
            if (aVar.f69482a == bVar) {
                copyOnWriteArrayList.remove(aVar);
            }
        }
    }

    public final void q(b0 b0Var) {
        CopyOnWriteArrayList copyOnWriteArrayList = this.f57446c.f57453c;
        Iterator it = copyOnWriteArrayList.iterator();
        while (it.hasNext()) {
            z zVar = (z) it.next();
            if (zVar.f57670b == b0Var) {
                copyOnWriteArrayList.remove(zVar);
            }
        }
    }
}
