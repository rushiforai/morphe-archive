package wk;

import java.util.AbstractQueue;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class j extends AbstractQueue {

    /* renamed from: a, reason: collision with root package name */
    public final h f94540a;

    public j() {
        h hVar = new h();
        hVar.f94536a = hVar;
        hVar.f94537b = hVar;
        this.f94540a = hVar;
    }

    @Override // java.util.AbstractQueue, java.util.AbstractCollection, java.util.Collection
    public final void clear() {
        h hVar = this.f94540a;
        h0 h0Var = hVar.f94536a;
        while (h0Var != hVar) {
            h0 h0VarG = h0Var.g();
            e eVar = g0.f94519r;
            o oVar = o.f94555a;
            h0Var.a(oVar);
            h0Var.h(oVar);
            h0Var = h0VarG;
        }
        hVar.f94536a = hVar;
        hVar.f94537b = hVar;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean contains(Object obj) {
        return ((h0) obj).g() != o.f94555a;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean isEmpty() {
        h hVar = this.f94540a;
        return hVar.f94536a == hVar;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        h hVar = this.f94540a;
        h0 h0Var = hVar.f94536a;
        if (h0Var == hVar) {
            h0Var = null;
        }
        return new i(this, h0Var);
    }

    @Override // java.util.Queue
    public final boolean offer(Object obj) {
        h0 h0Var = (h0) obj;
        h0 h0VarB = h0Var.b();
        h0 h0VarG = h0Var.g();
        e eVar = g0.f94519r;
        h0VarB.a(h0VarG);
        h0VarG.h(h0VarB);
        h hVar = this.f94540a;
        h0 h0Var2 = hVar.f94537b;
        h0Var2.a(h0Var);
        h0Var.h(h0Var2);
        h0Var.a(hVar);
        hVar.f94537b = h0Var;
        return true;
    }

    @Override // java.util.Queue
    public final Object peek() {
        h hVar = this.f94540a;
        h0 h0Var = hVar.f94536a;
        if (h0Var == hVar) {
            return null;
        }
        return h0Var;
    }

    @Override // java.util.Queue
    public final Object poll() {
        h hVar = this.f94540a;
        h0 h0Var = hVar.f94536a;
        if (h0Var == hVar) {
            return null;
        }
        remove(h0Var);
        return h0Var;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean remove(Object obj) {
        h0 h0Var = (h0) obj;
        h0 h0VarB = h0Var.b();
        h0 h0VarG = h0Var.g();
        e eVar = g0.f94519r;
        h0VarB.a(h0VarG);
        h0VarG.h(h0VarB);
        o oVar = o.f94555a;
        h0Var.a(oVar);
        h0Var.h(oVar);
        return h0VarG != oVar;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final int size() {
        h hVar = this.f94540a;
        int i5 = 0;
        for (h0 h0VarG = hVar.f94536a; h0VarG != hVar; h0VarG = h0VarG.g()) {
            i5++;
        }
        return i5;
    }
}
