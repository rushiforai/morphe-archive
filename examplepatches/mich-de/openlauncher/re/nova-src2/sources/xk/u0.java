package xk;

import java.util.Iterator;
import java.util.ListIterator;

/* loaded from: classes3.dex */
public final class u0 extends v0 {

    /* renamed from: c, reason: collision with root package name */
    public final transient int f96022c;

    /* renamed from: d, reason: collision with root package name */
    public final transient int f96023d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ v0 f96024e;

    public u0(v0 v0Var, int i5, int i11) {
        this.f96024e = v0Var;
        this.f96022c = i5;
        this.f96023d = i11;
    }

    @Override // xk.q0
    public final Object[] e() {
        return this.f96024e.e();
    }

    @Override // xk.q0
    public final int f() {
        return this.f96024e.g() + this.f96022c + this.f96023d;
    }

    @Override // xk.q0
    public final int g() {
        return this.f96024e.g() + this.f96022c;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        vk.b0.e(i5, this.f96023d);
        return this.f96024e.get(i5 + this.f96022c);
    }

    @Override // xk.q0
    public final boolean h() {
        return true;
    }

    @Override // xk.v0, xk.q0, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        return listIterator(0);
    }

    @Override // xk.v0, java.util.List
    public final ListIterator listIterator() {
        return listIterator(0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f96023d;
    }

    @Override // xk.v0, java.util.List
    /* renamed from: v */
    public final v0 subList(int i5, int i11) {
        vk.b0.i(i5, i11, this.f96023d);
        int i12 = this.f96022c;
        return this.f96024e.subList(i5 + i12, i11 + i12);
    }

    @Override // xk.v0, java.util.List
    public final /* bridge */ /* synthetic */ ListIterator listIterator(int i5) {
        return listIterator(i5);
    }
}
