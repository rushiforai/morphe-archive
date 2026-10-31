package com.google.gson;

import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes.dex */
public final class m extends p implements Iterable {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f34793a;

    public m() {
        this.f34793a = new ArrayList();
    }

    @Override // com.google.gson.p
    public final p c() {
        ArrayList arrayList = this.f34793a;
        if (arrayList.isEmpty()) {
            return new m();
        }
        m mVar = new m(arrayList.size());
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            mVar.p(((p) it.next()).c());
        }
        return mVar;
    }

    @Override // com.google.gson.p
    public final boolean d() {
        return s().d();
    }

    @Override // com.google.gson.p
    public final double e() {
        return s().e();
    }

    public final boolean equals(Object obj) {
        if (obj != this) {
            return (obj instanceof m) && ((m) obj).f34793a.equals(this.f34793a);
        }
        return true;
    }

    @Override // com.google.gson.p
    public final float f() {
        return s().f();
    }

    @Override // com.google.gson.p
    public final int g() {
        return s().g();
    }

    public final int hashCode() {
        return this.f34793a.hashCode();
    }

    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return this.f34793a.iterator();
    }

    @Override // com.google.gson.p
    public final long l() {
        return s().l();
    }

    @Override // com.google.gson.p
    public final Number n() {
        return s().n();
    }

    @Override // com.google.gson.p
    public final String o() {
        return s().o();
    }

    public final void p(p pVar) {
        if (pVar == null) {
            pVar = q.f34794a;
        }
        this.f34793a.add(pVar);
    }

    public final void q(String str) {
        this.f34793a.add(str == null ? q.f34794a : new s(str));
    }

    public final p r(int i5) {
        return (p) this.f34793a.get(i5);
    }

    public final p s() {
        ArrayList arrayList = this.f34793a;
        int size = arrayList.size();
        if (size == 1) {
            return (p) arrayList.get(0);
        }
        throw new IllegalStateException(b.c0.h(size, "Array must have size 1, but has size "));
    }

    public final int size() {
        return this.f34793a.size();
    }

    public m(int i5) {
        this.f34793a = new ArrayList(i5);
    }
}
