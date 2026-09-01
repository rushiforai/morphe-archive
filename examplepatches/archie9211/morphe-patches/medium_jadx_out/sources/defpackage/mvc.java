package defpackage;

import j$.lang.Iterable$CC;
import j$.util.Collection;
import j$.util.Spliterator;
import j$.util.stream.Stream;
import java.util.Collection;
import java.util.Iterator;
import java.util.Spliterator;
import java.util.function.Consumer;
import java.util.function.IntFunction;
import java.util.function.Predicate;
import java.util.stream.Stream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mvc implements Collection, th6, j$.util.Collection {
    public final /* synthetic */ int a = 0;
    public final Object b;

    public mvc() {
        int i = gw8.a;
        this.b = new y68(6);
    }

    @Override // java.util.Collection
    public final boolean add(Object obj) {
        switch (this.a) {
            case 0:
                return ((y68) this.b).a(obj);
            default:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    @Override // java.util.Collection
    public final boolean addAll(Collection collection) {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            default:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    @Override // java.util.Collection
    public final void clear() {
        switch (this.a) {
            case 0:
                ((y68) this.b).b();
                return;
            default:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    @Override // java.util.Collection
    public final boolean contains(Object obj) {
        int i = this.a;
        Object obj2 = this.b;
        switch (i) {
            case 0:
                return ((y68) obj2).c(obj);
            default:
                return ((f78) obj2).d(obj);
        }
    }

    @Override // java.util.Collection
    public final boolean containsAll(Collection collection) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                Iterator it2 = collection.iterator();
                while (it2.hasNext()) {
                    if (!((y68) obj).c(it2.next())) {
                        break;
                    }
                }
                break;
            default:
                collection.getClass();
                Collection collection2 = collection;
                if (!collection2.isEmpty()) {
                    Iterator it3 = collection2.iterator();
                    while (it3.hasNext()) {
                        if (!((f78) obj).d(it3.next())) {
                            break;
                        }
                    }
                }
                break;
        }
        return true;
    }

    @Override // java.lang.Iterable, j$.util.Collection
    public /* synthetic */ void forEach(Consumer consumer) {
        int i = this.a;
        Iterable$CC.$default$forEach(this, consumer);
    }

    @Override // java.util.Collection
    public final boolean isEmpty() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((y68) obj).g == 0;
            default:
                return ((f78) obj).i();
        }
    }

    @Override // java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        switch (this.a) {
            case 0:
                return new u75(new a78((y68) this.b));
            default:
                return vn7.F(new e04(this, null, 3));
        }
    }

    @Override // java.util.Collection
    public /* synthetic */ Stream parallelStream() {
        int i = this.a;
        return Stream.Wrapper.convert(parallelStream());
    }

    @Override // java.util.Collection
    public final boolean remove(Object obj) {
        switch (this.a) {
            case 0:
                return ((y68) this.b).g(obj);
            default:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    @Override // java.util.Collection
    public final boolean removeAll(Collection collection) {
        switch (this.a) {
            case 0:
                return ((y68) this.b).g(collection);
            default:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    @Override // java.util.Collection, j$.util.Collection
    public final boolean removeIf(Predicate predicate) {
        switch (this.a) {
            case 0:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
            default:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    @Override // java.util.Collection
    public final boolean retainAll(Collection collection) {
        switch (this.a) {
            case 0:
                return ((y68) this.b).i(collection);
            default:
                throw new UnsupportedOperationException("Operation is not supported for read-only collection");
        }
    }

    @Override // java.util.Collection
    public final int size() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return ((y68) obj).g;
            default:
                return ((f78) obj).e;
        }
    }

    @Override // java.util.Collection, java.lang.Iterable
    public /* synthetic */ Spliterator spliterator() {
        int i = this.a;
        return Spliterator.Wrapper.convert(spliterator());
    }

    @Override // java.util.Collection
    public /* synthetic */ java.util.stream.Stream stream() {
        int i = this.a;
        return Stream.Wrapper.convert(stream());
    }

    @Override // java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        switch (this.a) {
            case 0:
                break;
            default:
                objArr.getClass();
                break;
        }
        return kng.O(this, objArr);
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* synthetic */ j$.util.stream.Stream parallelStream() {
        int i = this.a;
        return Collection.CC.$default$parallelStream(this);
    }

    @Override // java.util.Collection, java.lang.Iterable, j$.util.Collection
    public /* synthetic */ j$.util.Spliterator spliterator() {
        int i = this.a;
        return Collection.CC.$default$spliterator(this);
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* synthetic */ j$.util.stream.Stream stream() {
        int i = this.a;
        return Collection.CC.$default$stream(this);
    }

    public mvc(f78 f78Var) {
        this.b = f78Var;
    }

    @Override // java.util.Collection, j$.util.Collection
    public /* synthetic */ Object[] toArray(IntFunction intFunction) {
        int i = this.a;
        return toArray((Object[]) intFunction.apply(0));
    }

    @Override // java.util.Collection
    public final Object[] toArray() {
        switch (this.a) {
        }
        return kng.N(this);
    }
}
