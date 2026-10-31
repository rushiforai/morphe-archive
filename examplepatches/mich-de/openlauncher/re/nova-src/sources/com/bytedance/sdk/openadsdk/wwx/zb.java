package com.bytedance.sdk.openadsdk.wwx;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/* loaded from: classes2.dex */
public class zb {

    /* renamed from: dj, reason: collision with root package name */
    private int f27403dj;
    private ycx lud;

    /* renamed from: zb, reason: collision with root package name */
    private fby f27404zb;
    private ScheduledExecutorService ycx = null;
    private long sya = 0;

    public interface ycx {
    }

    public zb(fby fbyVar, int i5) {
        this.f27404zb = fbyVar;
        this.f27403dj = i5;
    }

    public void ycx(long j11) {
        this.sya = j11;
    }

    public boolean zb() {
        ScheduledExecutorService scheduledExecutorService = this.ycx;
        if (scheduledExecutorService != null) {
            return scheduledExecutorService.isShutdown();
        }
        return true;
    }

    public void ycx(int i5) {
        ScheduledExecutorService scheduledExecutorServiceNewScheduledThreadPool = Executors.newScheduledThreadPool(1);
        this.ycx = scheduledExecutorServiceNewScheduledThreadPool;
        scheduledExecutorServiceNewScheduledThreadPool.scheduleAtFixedRate(new Runnable() { // from class: com.bytedance.sdk.openadsdk.wwx.zb.1
            @Override // java.lang.Runnable
            public void run() {
                long unused = zb.this.sya;
                if (System.currentTimeMillis() - zb.this.sya > zb.this.f27403dj) {
                    zb.this.ycx.shutdown();
                    if (zb.this.f27404zb != null) {
                        zb.this.f27404zb.zb(0, "Automatic detection of stuck");
                    }
                    if (zb.this.lud != null) {
                        ycx unused2 = zb.this.lud;
                    }
                }
            }
        }, 0L, i5, TimeUnit.MILLISECONDS);
    }

    public void ycx() {
        ScheduledExecutorService scheduledExecutorService = this.ycx;
        if (scheduledExecutorService != null) {
            scheduledExecutorService.shutdown();
        }
    }
}
