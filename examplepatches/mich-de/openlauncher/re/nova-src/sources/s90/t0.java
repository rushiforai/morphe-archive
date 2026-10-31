package s90;

import android.net.TrafficStats;
import java.lang.reflect.InvocationTargetException;
import java.util.concurrent.Executor;
import org.chromium.net.ThreadStatsUid;

/* loaded from: classes5.dex */
public final /* synthetic */ class t0 implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Executor f87028a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f87029b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f87030c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f87031d;

    public /* synthetic */ t0(Executor executor, int i5, boolean z11, int i11) {
        this.f87028a = executor;
        this.f87029b = i5;
        this.f87030c = z11;
        this.f87031d = i11;
    }

    @Override // java.util.concurrent.Executor
    public final void execute(final Runnable runnable) {
        final int i5 = this.f87029b;
        final boolean z11 = this.f87030c;
        final int i11 = this.f87031d;
        this.f87028a.execute(new Runnable() { // from class: s90.v0
            @Override // java.lang.Runnable
            public final void run() throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
                Runnable runnable2 = runnable;
                int threadStatsTag = TrafficStats.getThreadStatsTag();
                TrafficStats.setThreadStatsTag(i5);
                boolean z12 = z11;
                if (z12) {
                    ThreadStatsUid.set(i11);
                }
                try {
                    runnable2.run();
                } finally {
                    if (z12) {
                        ThreadStatsUid.clear();
                    }
                    TrafficStats.setThreadStatsTag(threadStatsTag);
                }
            }
        });
    }
}
