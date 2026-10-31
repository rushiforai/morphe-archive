package b70;

import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import kotlin.collections.AbstractList;
import kotlin.collections.ReversedListReadOnly$listIterator$1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m extends AbstractList {

    /* renamed from: b, reason: collision with root package name */
    public final List f17596b;

    public m(List delegate) {
        Intrinsics.g(delegate, "delegate");
        this.f17596b = delegate;
    }

    @Override // kotlin.collections.AbstractCollection
    public final int c() {
        return this.f17596b.size();
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final Object get(int i5) {
        return this.f17596b.get(e.J0(i5, this));
    }

    @Override // kotlin.collections.AbstractList, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        return new ReversedListReadOnly$listIterator$1(this, 0);
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final ListIterator listIterator() {
        return new ReversedListReadOnly$listIterator$1(this, 0);
    }

    @Override // kotlin.collections.AbstractList, java.util.List
    public final ListIterator listIterator(int i5) {
        return new ReversedListReadOnly$listIterator$1(this, i5);
    }
}
