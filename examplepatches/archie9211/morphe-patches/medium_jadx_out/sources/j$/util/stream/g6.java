package j$.util.stream;

import j$.util.Objects;
import j$.util.Spliterator;
import java.util.Arrays;
import java.util.Comparator;
import java.util.function.IntFunction;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class g6 extends b5 {
    public final boolean l;
    public final Comparator m;

    public g6(d5 d5Var, Comparator comparator) {
        super(d5Var, y6.q | y6.p);
        this.l = false;
        this.m = (Comparator) Objects.requireNonNull(comparator);
    }

    @Override // j$.util.stream.a
    public final g2 K(a aVar, Spliterator spliterator, IntFunction intFunction) {
        if (y6.SORTED.k(aVar.f) && this.l) {
            return aVar.C(spliterator, false, intFunction);
        }
        Object[] objArrM = aVar.C(spliterator, true, intFunction).m(intFunction);
        Arrays.sort(objArrM, this.m);
        return new j2(objArrM);
    }

    @Override // j$.util.stream.a
    public final l5 N(int i, l5 l5Var) {
        Objects.requireNonNull(l5Var);
        if (y6.SORTED.k(i) && this.l) {
            return l5Var;
        }
        boolean zK = y6.SIZED.k(i);
        Comparator comparator = this.m;
        return zK ? new l6(l5Var, comparator) : new h6(l5Var, comparator);
    }

    public g6(d5 d5Var) {
        super(d5Var, y6.q | y6.o);
        this.l = true;
        this.m = j$.util.e.INSTANCE;
    }
}
