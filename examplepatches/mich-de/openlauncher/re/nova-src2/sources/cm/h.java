package cm;

import java.util.concurrent.Delayed;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class h extends d4.g implements ScheduledFuture {

    /* renamed from: h, reason: collision with root package name */
    public final ScheduledFuture f20117h;

    public h(g gVar) {
        this.f20117h = gVar.a(new f(this, 0));
    }

    @Override // java.lang.Comparable
    public final int compareTo(Delayed delayed) {
        return this.f20117h.compareTo(delayed);
    }

    @Override // d4.g
    public final void d() {
        ScheduledFuture scheduledFuture = this.f20117h;
        Object obj = this.f48963a;
        scheduledFuture.cancel((obj instanceof d4.a) && ((d4.a) obj).f48944a);
    }

    @Override // java.util.concurrent.Delayed
    public final long getDelay(TimeUnit timeUnit) {
        return this.f20117h.getDelay(timeUnit);
    }
}
