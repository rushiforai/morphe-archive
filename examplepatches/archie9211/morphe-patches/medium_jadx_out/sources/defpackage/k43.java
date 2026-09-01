package defpackage;

import java.util.concurrent.Delayed;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k43 extends j2 implements ScheduledFuture {
    public final ScheduledFuture h;

    public k43(j43 j43Var) {
        this.h = j43Var.a(new zm7(11, this));
    }

    @Override // java.lang.Comparable
    public final int compareTo(Delayed delayed) {
        return this.h.compareTo(delayed);
    }

    @Override // defpackage.j2
    public final void d() {
        ScheduledFuture scheduledFuture = this.h;
        Object obj = this.a;
        scheduledFuture.cancel((obj instanceof c2) && ((c2) obj).a);
    }

    @Override // java.util.concurrent.Delayed
    public final long getDelay(TimeUnit timeUnit) {
        return this.h.getDelay(timeUnit);
    }
}
