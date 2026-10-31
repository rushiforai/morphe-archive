package mh;

import java.util.Iterator;

/* loaded from: classes3.dex */
public final class y extends l {

    /* renamed from: d, reason: collision with root package name */
    public final transient Object f76400d;

    public y(Object obj) {
        this.f76400d = obj;
    }

    @Override // mh.f
    public final int b(Object[] objArr) {
        objArr[0] = this.f76400d;
        return 1;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        return this.f76400d.equals(obj);
    }

    @Override // mh.f
    public final a0 e() {
        return new q(this.f76400d);
    }

    @Override // mh.l
    public final j g() {
        Object[] objArr = {this.f76400d};
        for (int i5 = 0; i5 < 1; i5++) {
            g gVar = j.f76346b;
            if (objArr[i5] == null) {
                throw new NullPointerException(b.c0.h(i5, "at index "));
            }
        }
        return j.j(1, objArr);
    }

    @Override // mh.l, java.util.Collection, java.util.Set
    public final int hashCode() {
        return this.f76400d.hashCode();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final /* synthetic */ Iterator iterator() {
        return new q(this.f76400d);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return 1;
    }

    @Override // java.util.AbstractCollection
    public final String toString() {
        return b.c0.l("[", this.f76400d.toString(), "]");
    }
}
