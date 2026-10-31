package xk;

import java.util.AbstractList;
import java.util.ListIterator;

/* loaded from: classes3.dex */
public final class v1 extends i3 implements ListIterator {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f96031b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ AbstractList f96032c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ v1(AbstractList abstractList, ListIterator listIterator, int i5) {
        super(listIterator);
        this.f96031b = i5;
        this.f96032c = abstractList;
    }

    @Override // xk.i3
    public final Object a(Object obj) {
        switch (this.f96031b) {
            case 0:
                return ((w1) this.f96032c).f96041b.apply(obj);
            default:
                return ((x1) this.f96032c).f96056b.apply(obj);
        }
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return ((ListIterator) this.f95940a).hasPrevious();
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return ((ListIterator) this.f95940a).nextIndex();
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        return a(((ListIterator) this.f95940a).previous());
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return ((ListIterator) this.f95940a).previousIndex();
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        throw new UnsupportedOperationException();
    }
}
