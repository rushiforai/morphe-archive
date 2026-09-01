package j$.util.stream;

import j$.util.Spliterator;
import java.util.concurrent.CountedCompleter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class s0 extends CountedCompleter {
    public Spliterator a;
    public final l5 b;
    public final a c;
    public long d;

    public s0(s0 s0Var, Spliterator spliterator) {
        super(s0Var);
        this.a = spliterator;
        this.b = s0Var.b;
        this.d = s0Var.d;
        this.c = s0Var.c;
    }

    @Override // java.util.concurrent.CountedCompleter
    public final void compute() {
        Spliterator spliteratorTrySplit;
        Spliterator spliterator = this.a;
        long jEstimateSize = spliterator.estimateSize();
        long jE = this.d;
        if (jE == 0) {
            jE = d.e(jEstimateSize);
            this.d = jE;
        }
        boolean zK = y6.SHORT_CIRCUIT.k(this.c.f);
        l5 l5Var = this.b;
        boolean z = false;
        while (true) {
            if (zK && l5Var.e()) {
                break;
            }
            if (jEstimateSize <= jE || (spliteratorTrySplit = spliterator.trySplit()) == null) {
                break;
            }
            s0 s0Var = new s0(this, spliteratorTrySplit);
            this.addToPendingCount(1);
            if (z) {
                spliterator = spliteratorTrySplit;
            } else {
                s0Var = this;
                this = s0Var;
            }
            z = !z;
            this.fork();
            this = s0Var;
            jEstimateSize = spliterator.estimateSize();
        }
        this.c.A(spliterator, l5Var);
        this.a = null;
        this.propagateCompletion();
    }

    public s0(a aVar, Spliterator spliterator, l5 l5Var) {
        super(null);
        this.b = l5Var;
        this.c = aVar;
        this.a = spliterator;
        this.d = 0L;
    }
}
