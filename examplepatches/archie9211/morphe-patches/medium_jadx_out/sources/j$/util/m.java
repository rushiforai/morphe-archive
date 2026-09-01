package j$.util;

import java.util.ListIterator;
import java.util.RandomAccess;
import java.util.function.UnaryOperator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public class m extends k implements java.util.List, List {
    private static final long serialVersionUID = -283967356065247728L;
    public final java.util.List b;

    public m(java.util.List list) {
        super(list);
        this.b = list;
    }

    private Object readResolve() {
        java.util.List list = this.b;
        return list instanceof RandomAccess ? new s(list) : this;
    }

    @Override // java.util.List
    public final void add(int i, Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public final boolean addAll(int i, java.util.Collection collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        return obj == this || this.b.equals(obj);
    }

    @Override // java.util.List
    public final Object get(int i) {
        return this.b.get(i);
    }

    @Override // java.util.Collection, java.util.List
    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // java.util.List
    public final int indexOf(Object obj) {
        return this.b.indexOf(obj);
    }

    @Override // java.util.List
    public final int lastIndexOf(Object obj) {
        return this.b.lastIndexOf(obj);
    }

    @Override // java.util.List
    public final ListIterator listIterator() {
        return new l(this, 0);
    }

    @Override // java.util.List
    public final Object remove(int i) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, j$.util.List
    public final void replaceAll(UnaryOperator unaryOperator) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public final Object set(int i, Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List, j$.util.List
    public final void sort(java.util.Comparator comparator) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public java.util.List subList(int i, int i2) {
        return new m(this.b.subList(i, i2));
    }

    @Override // java.util.List
    public final ListIterator listIterator(int i) {
        return new l(this, i);
    }
}
