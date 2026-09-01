package j$.util;

import java.util.Iterator;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public class n1 implements Spliterator {
    public final java.util.Collection a;
    public Iterator b = null;
    public final int c;
    public long d;
    public int e;

    public n1(java.util.Collection collection, int i) {
        this.a = collection;
        this.c = (i & 4096) == 0 ? i | 16448 : i;
    }

    @Override // j$.util.Spliterator
    public final int characteristics() {
        return this.c;
    }

    @Override // j$.util.Spliterator
    public final long estimateSize() {
        if (this.b != null) {
            return this.d;
        }
        this.b = this.a.iterator();
        long size = this.a.size();
        this.d = size;
        return size;
    }

    @Override // j$.util.Spliterator
    public final void forEachRemaining(Consumer consumer) {
        consumer.getClass();
        Iterator it2 = this.b;
        if (it2 == null) {
            it2 = this.a.iterator();
            this.b = it2;
            this.d = this.a.size();
        }
        j$.time.a.M(it2, consumer);
    }

    @Override // j$.util.Spliterator
    public java.util.Comparator getComparator() {
        if (j$.time.a.s(this, 4)) {
            return null;
        }
        throw new IllegalStateException();
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ long getExactSizeIfKnown() {
        return j$.time.a.q(this);
    }

    @Override // j$.util.Spliterator
    public final /* synthetic */ boolean hasCharacteristics(int i) {
        return j$.time.a.s(this, i);
    }

    @Override // j$.util.Spliterator
    public final boolean tryAdvance(Consumer consumer) {
        consumer.getClass();
        if (this.b == null) {
            this.b = this.a.iterator();
            this.d = this.a.size();
        }
        if (!this.b.hasNext()) {
            return false;
        }
        consumer.accept(this.b.next());
        return true;
    }

    @Override // j$.util.Spliterator
    public final Spliterator trySplit() {
        long size;
        Iterator it2 = this.b;
        if (it2 == null) {
            it2 = this.a.iterator();
            this.b = it2;
            size = this.a.size();
            this.d = size;
        } else {
            size = this.d;
        }
        if (size <= 1 || !it2.hasNext()) {
            return null;
        }
        int i = this.e + 1024;
        if (i > size) {
            i = (int) size;
        }
        if (i > 33554432) {
            i = 33554432;
        }
        Object[] objArr = new Object[i];
        int i2 = 0;
        do {
            objArr[i2] = it2.next();
            i2++;
            if (i2 >= i) {
                break;
            }
        } while (it2.hasNext());
        this.e = i2;
        long j = this.d;
        if (j != Long.MAX_VALUE) {
            this.d = j - ((long) i2);
        }
        return new g1(objArr, 0, i2, this.c);
    }
}
