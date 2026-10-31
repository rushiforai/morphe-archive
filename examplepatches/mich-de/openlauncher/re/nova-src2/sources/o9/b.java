package o9;

import android.os.Handler;
import android.os.SystemClock;

/* loaded from: classes.dex */
public final class b implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public long f79766a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f79767b;

    /* renamed from: d, reason: collision with root package name */
    public p2 f79769d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f79770e = false;

    /* renamed from: c, reason: collision with root package name */
    public final Handler f79768c = new Handler();

    public final void a(long j11) {
        long jUptimeMillis = SystemClock.uptimeMillis();
        this.f79770e = true;
        long j12 = this.f79766a;
        long j13 = j11 + jUptimeMillis;
        this.f79766a = j13;
        boolean z11 = this.f79767b;
        Handler handler = this.f79768c;
        if (z11 && j12 > j13) {
            handler.removeCallbacks(this);
            this.f79767b = false;
        }
        if (this.f79767b) {
            return;
        }
        handler.postDelayed(this, this.f79766a - jUptimeMillis);
        this.f79767b = true;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f79767b = false;
        if (this.f79770e) {
            long jUptimeMillis = SystemClock.uptimeMillis();
            long j11 = this.f79766a;
            if (j11 > jUptimeMillis) {
                this.f79768c.postDelayed(this, Math.max(0L, j11 - jUptimeMillis));
                this.f79767b = true;
            } else {
                this.f79770e = false;
                p2 p2Var = this.f79769d;
                if (p2Var != null) {
                    p2Var.onAlarm();
                }
            }
        }
    }
}
