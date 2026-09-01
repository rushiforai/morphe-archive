package j$.util.concurrent;

import j$.util.Collection;
import j$.util.Spliterator;
import j$.util.stream.Stream;
import java.util.AbstractMap;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.function.Consumer;
import java.util.function.IntFunction;
import java.util.function.Predicate;
import java.util.stream.Stream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class e extends b implements Set, j$.util.Set {
    private static final long serialVersionUID = 2249069246763182397L;

    @Override // java.util.Collection, java.util.Set
    public final boolean add(Object obj) {
        Map.Entry entry = (Map.Entry) obj;
        return this.a.f(entry.getKey(), entry.getValue(), false) == null;
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean addAll(Collection collection) {
        Iterator it2 = collection.iterator();
        boolean z = false;
        while (it2.hasNext()) {
            Map.Entry entry = (Map.Entry) it2.next();
            if (this.a.f(entry.getKey(), entry.getValue(), false) == null) {
                z = true;
            }
        }
        return z;
    }

    @Override // j$.util.concurrent.b, java.util.Collection
    public final boolean contains(Object obj) {
        Map.Entry entry;
        Object key;
        Object obj2;
        Object value;
        if (!(obj instanceof Map.Entry) || (key = (entry = (Map.Entry) obj).getKey()) == null || (obj2 = this.a.get(key)) == null || (value = entry.getValue()) == null) {
            return false;
        }
        return value == obj2 || value.equals(obj2);
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean equals(Object obj) {
        if (!(obj instanceof Set)) {
            return false;
        }
        Set set = (Set) obj;
        if (set != this) {
            return containsAll(set) && set.containsAll(this);
        }
        return true;
    }

    @Override // java.lang.Iterable, j$.util.Collection
    public final void forEach(Consumer consumer) {
        consumer.getClass();
        l[] lVarArr = this.a.a;
        if (lVarArr == null) {
            return;
        }
        p pVar = new p(lVarArr, lVarArr.length, 0, lVarArr.length);
        while (true) {
            l lVarA = pVar.a();
            if (lVarA == null) {
                return;
            } else {
                consumer.n(new k(lVarA.b, lVarA.c, this.a));
            }
        }
    }

    @Override // java.util.Collection, java.util.Set
    public final int hashCode() {
        l[] lVarArr = this.a.a;
        int iHashCode = 0;
        if (lVarArr != null) {
            p pVar = new p(lVarArr, lVarArr.length, 0, lVarArr.length);
            while (true) {
                l lVarA = pVar.a();
                if (lVarA == null) {
                    break;
                }
                iHashCode += lVarA.hashCode();
            }
        }
        return iHashCode;
    }

    @Override // j$.util.concurrent.b, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        ConcurrentHashMap concurrentHashMap = this.a;
        l[] lVarArr = concurrentHashMap.a;
        int length = lVarArr == null ? 0 : lVarArr.length;
        return new d(lVarArr, length, length, concurrentHashMap);
    }

    @Override // java.util.Collection
    public final /* synthetic */ Stream parallelStream() {
        return Stream.Wrapper.convert(Collection.CC.$default$parallelStream(this));
    }

    @Override // j$.util.concurrent.b, java.util.Collection
    public final boolean remove(Object obj) {
        Map.Entry entry;
        Object key;
        Object value;
        return (obj instanceof Map.Entry) && (key = (entry = (Map.Entry) obj).getKey()) != null && (value = entry.getValue()) != null && this.a.remove(key, value);
    }

    @Override // java.util.Collection, j$.util.Collection
    public final boolean removeIf(Predicate predicate) {
        ConcurrentHashMap concurrentHashMap = this.a;
        predicate.getClass();
        l[] lVarArr = concurrentHashMap.a;
        boolean z = false;
        if (lVarArr != null) {
            p pVar = new p(lVarArr, lVarArr.length, 0, lVarArr.length);
            while (true) {
                l lVarA = pVar.a();
                if (lVarA == null) {
                    break;
                }
                Object obj = lVarA.b;
                Object obj2 = lVarA.c;
                if (predicate.test(new AbstractMap.SimpleImmutableEntry(obj, obj2)) && concurrentHashMap.g(obj, null, obj2) != null) {
                    z = true;
                }
            }
        }
        return z;
    }

    @Override // java.util.Collection, java.lang.Iterable, java.util.Set, j$.util.Collection
    public final Spliterator spliterator() {
        ConcurrentHashMap concurrentHashMap = this.a;
        long j = concurrentHashMap.j();
        l[] lVarArr = concurrentHashMap.a;
        int length = lVarArr == null ? 0 : lVarArr.length;
        return new f(lVarArr, length, 0, length, j < 0 ? 0L : j, concurrentHashMap);
    }

    @Override // java.util.Collection
    public final /* synthetic */ java.util.stream.Stream stream() {
        return Stream.Wrapper.convert(Collection.CC.$default$stream(this));
    }

    @Override // java.util.Collection, j$.util.Collection
    public final /* synthetic */ Object[] toArray(IntFunction intFunction) {
        return toArray((Object[]) intFunction.apply(0));
    }

    @Override // java.util.Collection, j$.util.Collection
    public final /* synthetic */ j$.util.stream.Stream parallelStream() {
        return Collection.CC.$default$parallelStream(this);
    }

    @Override // java.util.Collection, j$.util.Collection
    public final /* synthetic */ j$.util.stream.Stream stream() {
        return Collection.CC.$default$stream(this);
    }

    @Override // java.util.Collection, java.lang.Iterable, java.util.Set
    public final /* synthetic */ java.util.Spliterator spliterator() {
        return Spliterator.Wrapper.convert(spliterator());
    }
}
