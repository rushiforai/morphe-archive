package j$.util.stream;

import j$.util.Collection;
import j$.util.Spliterator;
import java.util.Collection;
import java.util.Iterator;
import java.util.function.Consumer;
import java.util.function.IntFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class k2 implements g2 {
    public final Collection a;

    public k2(Collection collection) {
        this.a = collection;
    }

    @Override // j$.util.stream.g2
    public final g2 a(int i) {
        throw new IndexOutOfBoundsException();
    }

    @Override // j$.util.stream.g2
    public final long count() {
        return this.a.size();
    }

    @Override // j$.util.stream.g2
    public final void forEach(Consumer consumer) {
        Collection.EL.a(this.a, consumer);
    }

    @Override // j$.util.stream.g2
    public final /* synthetic */ g2 j(long j, long j2, IntFunction intFunction) {
        return v3.w(this, j, j2, intFunction);
    }

    @Override // j$.util.stream.g2
    public final void k(Object[] objArr, int i) {
        Iterator it2 = this.a.iterator();
        while (it2.hasNext()) {
            objArr[i] = it2.next();
            i++;
        }
    }

    @Override // j$.util.stream.g2
    public final Object[] m(IntFunction intFunction) {
        java.util.Collection collection = this.a;
        return collection.toArray((Object[]) intFunction.apply(collection.size()));
    }

    @Override // j$.util.stream.g2
    public final int o() {
        return 0;
    }

    @Override // j$.util.stream.g2
    public final Spliterator spliterator() {
        return Collection.EL.d(this.a).spliterator();
    }

    public final String toString() {
        return String.format("CollectionNode[%d][%s]", Integer.valueOf(this.a.size()), this.a);
    }
}
