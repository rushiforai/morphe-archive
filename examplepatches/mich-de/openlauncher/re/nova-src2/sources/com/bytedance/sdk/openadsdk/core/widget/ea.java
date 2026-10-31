package com.bytedance.sdk.openadsdk.core.widget;

import android.content.Context;
import android.os.SystemClock;
import com.bytedance.sdk.openadsdk.core.model.tn;

/* loaded from: classes2.dex */
public class ea extends fby {
    private long ycx;

    /* renamed from: zb, reason: collision with root package name */
    private long f26293zb;

    public ea(Context context) {
        super(context);
        setVisibility(8);
        setClickable(true);
    }

    public boolean dj() {
        return this.ycx > 0 && this.f26293zb > 0;
    }

    public long getDisplayDuration() {
        if (this.ycx == 0) {
            return 0L;
        }
        if (this.f26293zb == 0) {
            this.f26293zb = SystemClock.elapsedRealtime();
        }
        return this.f26293zb - this.ycx;
    }

    public void sya() {
        setVisibility(8);
        if (this.ycx != 0) {
            this.f26293zb = SystemClock.elapsedRealtime();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.core.widget.fby
    public boolean ycx() {
        return false;
    }

    public void zb(tn tnVar, int i5) {
        if (isShown()) {
            return;
        }
        zb();
        setVisibility(0);
        this.ycx = SystemClock.elapsedRealtime();
        ycx(tnVar, i5);
    }
}
