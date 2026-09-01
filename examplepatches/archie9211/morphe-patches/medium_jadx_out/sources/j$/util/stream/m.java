package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import j$.util.concurrent.ConcurrentHashMap;
import java.util.Collection;
import java.util.HashSet;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.IntFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class m extends b5 {
    public static k2 U(a aVar, Spliterator spliterator) {
        j$.time.format.a aVar2 = new j$.time.format.a(13);
        j$.time.format.a aVar3 = new j$.time.format.a(14);
        j$.time.format.a aVar4 = new j$.time.format.a(15);
        Objects.requireNonNull(aVar2);
        Objects.requireNonNull(aVar3);
        Objects.requireNonNull(aVar4);
        return new k2((Collection) new a4(z6.REFERENCE, aVar4, aVar3, aVar2, 3).b(aVar, spliterator));
    }

    @Override // j$.util.stream.a
    public final g2 K(a aVar, Spliterator spliterator, IntFunction intFunction) {
        if (y6.DISTINCT.k(aVar.f)) {
            return aVar.C(spliterator, false, intFunction);
        }
        if (y6.ORDERED.k(aVar.f)) {
            return U(aVar, spliterator);
        }
        AtomicBoolean atomicBoolean = new AtomicBoolean(false);
        ConcurrentHashMap concurrentHashMap = new ConcurrentHashMap();
        j$.time.format.v vVar = new j$.time.format.v(5, atomicBoolean, concurrentHashMap);
        Objects.requireNonNull(vVar);
        new p0(vVar, false).g(aVar, spliterator);
        Collection collectionKeySet = concurrentHashMap.keySet();
        if (atomicBoolean.get()) {
            HashSet hashSet = new HashSet(collectionKeySet);
            hashSet.add(null);
            collectionKeySet = hashSet;
        }
        return new k2(collectionKeySet);
    }

    @Override // j$.util.stream.a
    public final Spliterator L(a aVar, Spliterator spliterator) {
        return y6.DISTINCT.k(aVar.f) ? aVar.T(spliterator) : y6.ORDERED.k(aVar.f) ? U(aVar, spliterator).spliterator() : new h7(aVar.T(spliterator), new ConcurrentHashMap());
    }

    @Override // j$.util.stream.a
    public final l5 N(int i, l5 l5Var) {
        Objects.requireNonNull(l5Var);
        return y6.DISTINCT.k(i) ? l5Var : y6.SORTED.k(i) ? new k(l5Var) : new l(l5Var);
    }
}
