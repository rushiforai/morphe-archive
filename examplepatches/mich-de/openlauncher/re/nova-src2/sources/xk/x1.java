package xk;

import java.io.Serializable;
import java.util.AbstractSequentialList;
import java.util.List;
import java.util.ListIterator;

/* loaded from: classes3.dex */
public final class x1 extends AbstractSequentialList implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final List f96055a;

    /* renamed from: b, reason: collision with root package name */
    public final vk.g f96056b;

    public x1(List list, vk.g gVar) {
        list.getClass();
        this.f96055a = list;
        this.f96056b = gVar;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        this.f96055a.clear();
    }

    @Override // java.util.AbstractSequentialList, java.util.AbstractList, java.util.List
    public final ListIterator listIterator(int i5) {
        return new v1(this, this.f96055a.listIterator(i5), 1);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f96055a.size();
    }
}
