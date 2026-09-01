package j$.util;

import java.util.function.IntConsumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class v implements IntConsumer {
    private long count;
    private long sum;
    private int min = Integer.MAX_VALUE;
    private int max = Integer.MIN_VALUE;

    public final void a(v vVar) {
        this.count += vVar.count;
        this.sum += vVar.sum;
        this.min = Math.min(this.min, vVar.min);
        this.max = Math.max(this.max, vVar.max);
    }

    @Override // java.util.function.IntConsumer
    public final void accept(int i) {
        this.count++;
        this.sum += (long) i;
        this.min = Math.min(this.min, i);
        this.max = Math.max(this.max, i);
    }

    public final /* synthetic */ IntConsumer andThen(IntConsumer intConsumer) {
        return j$.time.a.f(this, intConsumer);
    }

    public final String toString() {
        String simpleName = v.class.getSimpleName();
        Long lValueOf = Long.valueOf(this.count);
        Long lValueOf2 = Long.valueOf(this.sum);
        Integer numValueOf = Integer.valueOf(this.min);
        long j = this.count;
        return String.format("%s{count=%d, sum=%d, min=%d, average=%f, max=%d}", simpleName, lValueOf, lValueOf2, numValueOf, Double.valueOf(j > 0 ? this.sum / j : 0.0d), Integer.valueOf(this.max));
    }
}
