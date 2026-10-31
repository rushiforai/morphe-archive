package xk;

import java.util.List;
import java.util.ListIterator;

/* loaded from: classes3.dex */
public final class m extends e implements ListIterator {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ n f95964e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(n nVar) {
        super(nVar);
        this.f95964e = nVar;
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        n nVar = this.f95964e;
        boolean zIsEmpty = nVar.isEmpty();
        b().add(obj);
        nVar.f95972f.f95894e++;
        if (zIsEmpty) {
            nVar.c();
        }
    }

    public final ListIterator b() {
        a();
        return (ListIterator) this.f95899b;
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return b().hasPrevious();
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return b().nextIndex();
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        return b().previous();
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return b().previousIndex();
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        b().set(obj);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(n nVar, int i5) {
        super(nVar, ((List) nVar.f95968b).listIterator(i5));
        this.f95964e = nVar;
    }
}
