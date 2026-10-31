package com.fyber.inneractive.sdk.player.exoplayer2.video;

import android.view.WindowManager;
import com.fyber.inneractive.sdk.config.IAConfigManager;

/* loaded from: classes3.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final g f30540a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f30541b;

    /* renamed from: c, reason: collision with root package name */
    public final long f30542c;

    /* renamed from: d, reason: collision with root package name */
    public final long f30543d;

    /* renamed from: e, reason: collision with root package name */
    public long f30544e;

    /* renamed from: f, reason: collision with root package name */
    public long f30545f;

    /* renamed from: g, reason: collision with root package name */
    public long f30546g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f30547h;

    /* renamed from: i, reason: collision with root package name */
    public long f30548i;

    /* renamed from: j, reason: collision with root package name */
    public long f30549j;

    /* renamed from: k, reason: collision with root package name */
    public long f30550k;

    public h() {
        double refreshRate = ((WindowManager) IAConfigManager.Q.f27762v.a().getSystemService("window")).getDefaultDisplay().getRefreshRate();
        this.f30541b = true;
        this.f30540a = g.f30535e;
        long j11 = (long) (1.0E9d / refreshRate);
        this.f30542c = j11;
        this.f30543d = (j11 * 80) / 100;
    }
}
