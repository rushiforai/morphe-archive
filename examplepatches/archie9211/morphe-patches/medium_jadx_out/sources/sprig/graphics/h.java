package sprig.graphics;

import defpackage.gy2;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0010\b\u0080\b\u0018\u00002\u00020\u0001B\u001b\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0002\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0004¢\u0006\u0004\b\u001b\u0010\u001cJ\t\u0010\u0003\u001a\u00020\u0002HÆ\u0003J\t\u0010\u0005\u001a\u00020\u0004HÆ\u0003J\u001d\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0006\u001a\u00020\u00022\b\b\u0002\u0010\u0007\u001a\u00020\u0004HÆ\u0001J\t\u0010\n\u001a\u00020\tHÖ\u0001J\t\u0010\u000b\u001a\u00020\u0002HÖ\u0001J\u0013\u0010\u000e\u001a\u00020\r2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003R\"\u0010\u0006\u001a\u00020\u00028\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u000f\u0010\u0010\u001a\u0004\b\u0011\u0010\u0012\"\u0004\b\u0013\u0010\u0014R\"\u0010\u0007\u001a\u00020\u00048\u0006@\u0006X\u0086\u000e¢\u0006\u0012\n\u0004\b\u0015\u0010\u0016\u001a\u0004\b\u0017\u0010\u0018\"\u0004\b\u0019\u0010\u001a¨\u0006\u001d"}, d2 = {"Lsprig/h/h;", "", "", "component1", "", "component2", "sampleCount", "total", "copy", "", "toString", "hashCode", "other", "", "equals", "a", "I", "getSampleCount", "()I", "setSampleCount", "(I)V", "b", "J", "getTotal", "()J", "setTotal", "(J)V", "<init>", "(IJ)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final /* data */ class h {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public int sampleCount;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public long total;

    public /* synthetic */ h(int i, long j, int i2, gy2 gy2Var) {
        this((i2 & 1) != 0 ? 0 : i, (i2 & 2) != 0 ? 0L : j);
    }

    public static /* synthetic */ h copy$default(h hVar, int i, long j, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            i = hVar.sampleCount;
        }
        if ((i2 & 2) != 0) {
            j = hVar.total;
        }
        return hVar.copy(i, j);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final int getSampleCount() {
        return this.sampleCount;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final long getTotal() {
        return this.total;
    }

    public final h copy(int sampleCount, long total) {
        return new h(sampleCount, total);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof h)) {
            return false;
        }
        h hVar = (h) other;
        return this.sampleCount == hVar.sampleCount && this.total == hVar.total;
    }

    public final int getSampleCount() {
        return this.sampleCount;
    }

    public final long getTotal() {
        return this.total;
    }

    public int hashCode() {
        int i = this.sampleCount * 31;
        long j = this.total;
        return i + ((int) (j ^ (j >>> 32)));
    }

    public final void setSampleCount(int i) {
        this.sampleCount = i;
    }

    public final void setTotal(long j) {
        this.total = j;
    }

    public String toString() {
        return "RecordingMetric(sampleCount=" + this.sampleCount + ", total=" + this.total + ")";
    }

    public h(int i, long j) {
        this.sampleCount = i;
        this.total = j;
    }

    public h() {
        this(0, 0L, 3, null);
    }
}
