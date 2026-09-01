package j$.util;

import java.util.PrimitiveIterator;
import java.util.function.Consumer;
import java.util.function.LongConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final /* synthetic */ class k0 implements m0, w {
    public final /* synthetic */ PrimitiveIterator.OfLong a;

    public /* synthetic */ k0(PrimitiveIterator.OfLong ofLong) {
        this.a = ofLong;
    }

    public final /* synthetic */ boolean equals(Object obj) {
        PrimitiveIterator.OfLong ofLong = this.a;
        if (obj instanceof k0) {
            obj = ((k0) obj).a;
        }
        return ofLong.equals(obj);
    }

    @Override // j$.util.n0
    public final /* synthetic */ void forEachRemaining(Object obj) {
        this.a.forEachRemaining(obj);
    }

    @Override // java.util.Iterator
    public final /* synthetic */ boolean hasNext() {
        return this.a.hasNext();
    }

    public final /* synthetic */ int hashCode() {
        return this.a.hashCode();
    }

    @Override // j$.util.m0, java.util.Iterator
    public final /* synthetic */ Long next() {
        return this.a.next();
    }

    @Override // j$.util.m0
    public final /* synthetic */ long nextLong() {
        return this.a.nextLong();
    }

    @Override // java.util.Iterator
    public final /* synthetic */ void remove() {
        this.a.remove();
    }

    @Override // j$.util.m0, java.util.Iterator, j$.util.w
    public final /* synthetic */ void forEachRemaining(Consumer consumer) {
        this.a.forEachRemaining((Consumer<? super Long>) consumer);
    }

    @Override // j$.util.m0
    public final /* synthetic */ void forEachRemaining(LongConsumer longConsumer) {
        this.a.forEachRemaining(longConsumer);
    }

    @Override // java.util.Iterator
    public final /* synthetic */ Object next() {
        return this.a.next();
    }
}
