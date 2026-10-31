package xk;

import java.util.Iterator;
import java.util.ListIterator;

/* loaded from: classes3.dex */
public final class t0 extends v0 {

    /* renamed from: c, reason: collision with root package name */
    public final transient v0 f96014c;

    public t0(v0 v0Var) {
        this.f96014c = v0Var;
    }

    @Override // xk.v0, xk.q0, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        return this.f96014c.contains(obj);
    }

    @Override // java.util.List
    public final Object get(int i5) {
        v0 v0Var = this.f96014c;
        vk.b0.e(i5, v0Var.size());
        return v0Var.get((v0Var.size() - 1) - i5);
    }

    @Override // xk.q0
    public final boolean h() {
        return this.f96014c.h();
    }

    @Override // xk.v0, java.util.List
    public final int indexOf(Object obj) {
        int iLastIndexOf = this.f96014c.lastIndexOf(obj);
        if (iLastIndexOf >= 0) {
            return (r0.size() - 1) - iLastIndexOf;
        }
        return -1;
    }

    @Override // xk.v0, xk.q0, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        return listIterator(0);
    }

    @Override // xk.v0, java.util.List
    public final int lastIndexOf(Object obj) {
        int iIndexOf = this.f96014c.indexOf(obj);
        if (iIndexOf >= 0) {
            return (r0.size() - 1) - iIndexOf;
        }
        return -1;
    }

    @Override // xk.v0, java.util.List
    public final ListIterator listIterator() {
        return listIterator(0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f96014c.size();
    }

    @Override // xk.v0
    public final v0 u() {
        return this.f96014c;
    }

    @Override // xk.v0, java.util.List
    /* renamed from: v */
    public final v0 subList(int i5, int i11) {
        v0 v0Var = this.f96014c;
        vk.b0.i(i5, i11, v0Var.size());
        return v0Var.subList(v0Var.size() - i11, v0Var.size() - i5).u();
    }

    @Override // xk.v0, java.util.List
    public final /* bridge */ /* synthetic */ ListIterator listIterator(int i5) {
        return listIterator(i5);
    }
}
