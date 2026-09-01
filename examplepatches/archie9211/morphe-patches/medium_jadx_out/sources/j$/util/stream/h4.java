package j$.util.stream;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.function.BiConsumer;
import java.util.function.BinaryOperator;
import java.util.function.Supplier;
import java.util.stream.Collector;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class h4 extends v3 {
    public final /* synthetic */ BinaryOperator h;
    public final /* synthetic */ BiConsumer i;
    public final /* synthetic */ Supplier j;
    public final /* synthetic */ i k;

    public h4(z6 z6Var, BinaryOperator binaryOperator, BiConsumer biConsumer, Supplier supplier, i iVar) {
        this.h = binaryOperator;
        this.i = biConsumer;
        this.j = supplier;
        this.k = iVar;
    }

    @Override // j$.util.stream.v3
    public final q4 X() {
        return new i4(this.j, this.i, this.h);
    }

    @Override // j$.util.stream.v3, j$.util.stream.e8
    public final int f() {
        Set<Collector.Characteristics> setCharacteristics = this.k.a.characteristics();
        if (setCharacteristics != null && !setCharacteristics.isEmpty()) {
            HashSet hashSet = new HashSet();
            Collector.Characteristics next = setCharacteristics.iterator().next();
            if (next instanceof h) {
                Iterator<Collector.Characteristics> it2 = setCharacteristics.iterator();
                while (it2.hasNext()) {
                    try {
                        h hVar = (h) it2.next();
                        hashSet.add(hVar == null ? null : hVar == h.CONCURRENT ? Collector.Characteristics.CONCURRENT : hVar == h.UNORDERED ? Collector.Characteristics.UNORDERED : Collector.Characteristics.IDENTITY_FINISH);
                    } catch (ClassCastException e) {
                        j$.util.f.a(e, "java.util.stream.Collector.Characteristics");
                        throw null;
                    }
                }
            } else {
                if (!(next instanceof Collector.Characteristics)) {
                    j$.util.f.a(next.getClass(), "java.util.stream.Collector.Characteristics");
                    throw null;
                }
                Iterator<Collector.Characteristics> it3 = setCharacteristics.iterator();
                while (it3.hasNext()) {
                    try {
                        Collector.Characteristics next2 = it3.next();
                        hashSet.add(next2 == null ? null : next2 == Collector.Characteristics.CONCURRENT ? h.CONCURRENT : next2 == Collector.Characteristics.UNORDERED ? h.UNORDERED : h.IDENTITY_FINISH);
                    } catch (ClassCastException e2) {
                        j$.util.f.a(e2, "java.util.stream.Collector.Characteristics");
                        throw null;
                    }
                }
            }
            setCharacteristics = hashSet;
        }
        if (setCharacteristics.contains(h.UNORDERED)) {
            return y6.r;
        }
        return 0;
    }
}
