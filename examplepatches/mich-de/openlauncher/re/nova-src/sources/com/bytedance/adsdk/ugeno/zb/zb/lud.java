package com.bytedance.adsdk.ugeno.zb.zb;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.SystemClock;
import com.bytedance.adsdk.ugeno.zb.zb.zb;

/* loaded from: classes2.dex */
final class lud {
    private static HandlerThread ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static Handler f22755zb;

    /* renamed from: ea, reason: collision with root package name */
    private volatile int f22757ea;
    private volatile boolean fby;

    /* renamed from: jc, reason: collision with root package name */
    private volatile int f22758jc;

    /* renamed from: jw, reason: collision with root package name */
    private long f22759jw;
    private final dj sya;

    /* renamed from: dj, reason: collision with root package name */
    private lt f22756dj = new lt();
    private lt lud = new lt();

    /* renamed from: lt, reason: collision with root package name */
    private lt f22760lt = new lt();

    /* renamed from: ul, reason: collision with root package name */
    private final Object f22762ul = new Object();

    /* renamed from: ok, reason: collision with root package name */
    private final Runnable f22761ok = new Runnable() { // from class: com.bytedance.adsdk.ugeno.zb.zb.lud.1
        @Override // java.lang.Runnable
        public void run() {
            float f11;
            if (lud.this.fby) {
                long jUptimeMillis = SystemClock.uptimeMillis();
                if (lud.this.f22759jw == 0) {
                    f11 = 0.016f;
                } else {
                    f11 = (jUptimeMillis - lud.this.f22759jw) / 1000.0f;
                    if (f11 > 0.033333335f) {
                        f11 = 0.033333335f;
                    }
                }
                lud.this.f22759jw = jUptimeMillis;
                lud.this.sya.ycx(lud.this.f22758jc, lud.this.f22757ea);
                lud.this.sya.ycx(f11);
                lud.this.sya.ycx(lud.this.f22756dj);
                synchronized (lud.this.f22762ul) {
                    lt ltVar = lud.this.lud;
                    lud ludVar = lud.this;
                    ludVar.lud = ludVar.f22756dj;
                    lud.this.f22756dj = ltVar;
                }
                if (lud.this.fby) {
                    lud.fby().postDelayed(this, 16L);
                }
            }
        }
    };

    public lud(zb zbVar) {
        this.sya = new dj(zbVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static synchronized Handler fby() {
        try {
            if (ycx == null) {
                HandlerThread handlerThread = new HandlerThread("ugen-particle-physics", 10);
                ycx = handlerThread;
                handlerThread.start();
                f22755zb = new Handler(ycx.getLooper());
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return f22755zb;
    }

    public void dj() {
        if (this.fby) {
            return;
        }
        this.fby = true;
        this.f22759jw = 0L;
        fby().post(this.f22761ok);
    }

    public void lt() {
        lud();
        synchronized (this.f22762ul) {
            this.f22756dj = new lt();
            this.lud = new lt();
            this.f22760lt = new lt();
        }
    }

    public void lud() {
        this.fby = false;
        fby().removeCallbacks(this.f22761ok);
    }

    public zb.dj[] sya() {
        return this.sya.ycx();
    }

    public zb zb() {
        return this.sya.zb();
    }

    public void ycx(int i5, int i11) {
        this.f22758jc = i5;
        this.f22757ea = i11;
    }

    public lt ycx() {
        lt ltVar;
        synchronized (this.f22762ul) {
            lt ltVar2 = this.f22760lt;
            ltVar = this.lud;
            this.f22760lt = ltVar;
            this.lud = ltVar2;
        }
        return ltVar;
    }
}
