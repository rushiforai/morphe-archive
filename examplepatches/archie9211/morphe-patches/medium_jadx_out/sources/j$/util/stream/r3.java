package j$.util.stream;

import j$.util.Spliterator;
import java.util.concurrent.CountedCompleter;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public abstract class r3 extends CountedCompleter implements l5 {
    public final Spliterator a;
    public final a b;
    public final long c;
    public final long d;
    public final long e;
    public int f;
    public int g;

    public r3(r3 r3Var, Spliterator spliterator, long j, long j2, int i) {
        super(r3Var);
        this.a = spliterator;
        this.b = r3Var.b;
        this.c = r3Var.c;
        this.d = j;
        this.e = j2;
        if (j < 0 || j2 < 0 || (j + j2) - 1 >= i) {
            throw new IllegalArgumentException(String.format("offset and length interval [%d, %d + %d) is not within array size interval [0, %d)", Long.valueOf(j), Long.valueOf(j), Long.valueOf(j2), Integer.valueOf(i)));
        }
    }

    public abstract r3 a(Spliterator spliterator, long j, long j2);

    public /* synthetic */ void accept(double d) {
        v3.c();
        throw null;
    }

    public final /* synthetic */ Consumer andThen(Consumer consumer) {
        return j$.time.a.d(this, consumer);
    }

    @Override // j$.util.stream.l5
    public final void c(long j) {
        long j2 = this.e;
        if (j > j2) {
            throw new IllegalStateException("size passed to Sink.begin exceeds array length");
        }
        int i = (int) this.d;
        this.f = i;
        this.g = i + ((int) j2);
    }

    @Override // java.util.concurrent.CountedCompleter
    public final void compute() {
        Spliterator spliteratorTrySplit;
        Spliterator spliterator = this.a;
        r3 r3VarA = this;
        while (spliterator.estimateSize() > r3VarA.c && (spliteratorTrySplit = spliterator.trySplit()) != null) {
            r3VarA.setPendingCount(1);
            long jEstimateSize = spliteratorTrySplit.estimateSize();
            r3VarA.a(spliteratorTrySplit, r3VarA.d, jEstimateSize).fork();
            r3VarA = r3VarA.a(spliterator, r3VarA.d + jEstimateSize, r3VarA.e - jEstimateSize);
        }
        r3VarA.b.R(spliterator, r3VarA);
        r3VarA.propagateCompletion();
    }

    @Override // j$.util.stream.l5
    public final boolean e() {
        return false;
    }

    public /* synthetic */ void accept(int i) {
        v3.k();
        throw null;
    }

    public /* synthetic */ void accept(long j) {
        v3.l();
        throw null;
    }

    public r3(Spliterator spliterator, a aVar, int i) {
        this.a = spliterator;
        this.b = aVar;
        this.c = d.e(spliterator.estimateSize());
        this.d = 0L;
        this.e = i;
    }

    @Override // j$.util.stream.l5
    public final void end() {
    }
}
