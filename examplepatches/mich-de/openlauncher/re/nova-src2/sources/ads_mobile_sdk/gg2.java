package ads_mobile_sdk;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public final class gg2 implements b.g7 {

    /* renamed from: a, reason: collision with root package name */
    public final ScheduledExecutorService f3841a = Executors.newSingleThreadScheduledExecutor();

    @Override // b.g7
    public final void a() {
    }

    @Override // b.g7
    public final void a(Runnable runnable, long j11) {
        this.f3841a.schedule(runnable, j11, TimeUnit.MILLISECONDS);
    }
}
