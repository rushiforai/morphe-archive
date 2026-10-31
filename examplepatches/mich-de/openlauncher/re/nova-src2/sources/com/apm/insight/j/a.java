package com.apm.insight.j;

import android.os.Handler;

/* loaded from: classes.dex */
public abstract class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    private Handler f21652a;

    /* renamed from: b, reason: collision with root package name */
    private final long f21653b = 0;

    /* renamed from: c, reason: collision with root package name */
    private final long f21654c;

    public a(Handler handler, long j11) {
        this.f21652a = handler;
        this.f21654c = j11;
    }

    public final void a() {
        this.f21652a.post(this);
    }

    public final long b() {
        return this.f21654c;
    }

    public final void a(long j11) {
        if (j11 > 0) {
            this.f21652a.postDelayed(this, j11);
        } else {
            this.f21652a.post(this);
        }
    }
}
