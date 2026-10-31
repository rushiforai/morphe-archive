package kotlin.collections;

import java.util.ListIterator;
import java.util.NoSuchElementException;
import kotlin.collections.AbstractList;

/* loaded from: classes4.dex */
public final class a extends b70.a implements ListIterator {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ AbstractList f71748d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(AbstractList abstractList, int i5) {
        super(abstractList);
        this.f71748d = abstractList;
        AbstractList.Companion companion = AbstractList.f71712a;
        int iC = abstractList.c();
        companion.getClass();
        AbstractList.Companion.c(i5, iC);
        this.f17588b = i5;
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.f17588b > 0;
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.f17588b;
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        if (!hasPrevious()) {
            throw new NoSuchElementException();
        }
        int i5 = this.f17588b - 1;
        this.f17588b = i5;
        return this.f71748d.get(i5);
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return this.f17588b - 1;
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
