package j$.util.stream;

import j$.util.Spliterator;
import j$.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountedCompleter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class r0 extends CountedCompleter {
    public final a a;
    public Spliterator b;
    public final long c;
    public final ConcurrentHashMap d;
    public final q0 e;
    public final r0 f;
    public g2 g;

    public r0(a aVar, Spliterator spliterator, q0 q0Var) {
        super(null);
        this.a = aVar;
        this.b = spliterator;
        this.c = d.e(spliterator.estimateSize());
        this.d = new ConcurrentHashMap(Math.max(16, d.g << 1));
        this.e = q0Var;
        this.f = null;
    }

    @Override // java.util.concurrent.CountedCompleter
    public final void compute() {
        Spliterator spliteratorTrySplit;
        Spliterator spliterator = this.b;
        long j = this.c;
        boolean z = false;
        while (spliterator.estimateSize() > j && (spliteratorTrySplit = spliterator.trySplit()) != null) {
            r0 r0Var = new r0(this, spliteratorTrySplit, this.f);
            r0 r0Var2 = new r0(this, spliterator, r0Var);
            this.addToPendingCount(1);
            r0Var2.addToPendingCount(1);
            this.d.put(r0Var, r0Var2);
            if (this.f != null) {
                r0Var.addToPendingCount(1);
                if (this.d.replace(this.f, this, r0Var)) {
                    this.addToPendingCount(-1);
                } else {
                    r0Var.addToPendingCount(-1);
                }
            }
            if (z) {
                spliterator = spliteratorTrySplit;
                this = r0Var;
                r0Var = r0Var2;
            } else {
                this = r0Var2;
            }
            z = !z;
            r0Var.fork();
        }
        if (this.getPendingCount() > 0) {
            e0 e0Var = new e0(7);
            a aVar = this.a;
            y1 y1VarJ = aVar.J(aVar.G(spliterator), e0Var);
            this.a.R(spliterator, y1VarJ);
            this.g = y1VarJ.build();
            this.b = null;
        }
        this.tryComplete();
    }

    @Override // java.util.concurrent.CountedCompleter
    public final void onCompletion(CountedCompleter countedCompleter) {
        g2 g2Var = this.g;
        if (g2Var != null) {
            g2Var.forEach(this.e);
            this.g = null;
        } else {
            Spliterator spliterator = this.b;
            if (spliterator != null) {
                this.a.R(spliterator, this.e);
                this.b = null;
            }
        }
        r0 r0Var = (r0) this.d.remove(this);
        if (r0Var != null) {
            r0Var.tryComplete();
        }
    }

    public r0(r0 r0Var, Spliterator spliterator, r0 r0Var2) {
        super(r0Var);
        this.a = r0Var.a;
        this.b = spliterator;
        this.c = r0Var.c;
        this.d = r0Var.d;
        this.e = r0Var.e;
        this.f = r0Var2;
    }
}
