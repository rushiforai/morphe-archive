package com.bytedance.sdk.openadsdk.core.model;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;

/* loaded from: classes2.dex */
public class thx {
    private long ycx = h.f42227c;

    /* renamed from: zb, reason: collision with root package name */
    private long f25748zb = h.f42227c;
    private long sya = 10;

    /* renamed from: dj, reason: collision with root package name */
    private long f25747dj = 20;
    private String lud = b.f42142b;

    public long dj() {
        return this.f25747dj;
    }

    public String lud() {
        return this.lud;
    }

    public long sya() {
        return this.sya;
    }

    public long ycx() {
        return this.ycx;
    }

    public long zb() {
        return this.f25748zb;
    }

    public void dj(long j11) {
        if (j11 < 0) {
            this.f25747dj = 20L;
        } else {
            this.f25747dj = j11;
        }
    }

    public void sya(long j11) {
        if (j11 <= 0) {
            this.sya = 10L;
        } else {
            this.sya = j11;
        }
    }

    public void ycx(long j11) {
        if (j11 <= 0) {
            this.ycx = 10L;
        } else {
            this.ycx = j11;
        }
    }

    public void zb(long j11) {
        if (j11 < 0) {
            this.f25748zb = 20L;
        } else {
            this.f25748zb = j11;
        }
    }

    public void ycx(String str) {
        this.lud = str;
    }
}
