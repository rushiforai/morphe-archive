package com.bytedance.sdk.openadsdk.oty.zb;

import android.view.View;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.oty.zb.lud;

/* loaded from: classes2.dex */
public class fby extends zb {

    /* renamed from: dj, reason: collision with root package name */
    private int f26956dj;

    public fby(Integer num, View view, tn tnVar, lud.ycx ycxVar) {
        super(num, view, tnVar, 2000, ycxVar);
        this.f26956dj = 0;
    }

    @Override // com.bytedance.sdk.openadsdk.oty.zb.zb
    public void dj() {
        super.dj();
    }

    @Override // com.bytedance.sdk.openadsdk.oty.zb.zb
    public int lt() {
        return 200;
    }

    @Override // com.bytedance.sdk.openadsdk.oty.zb.zb
    public boolean ok() {
        int i5 = this.f26956dj;
        boolean z11 = i5 == 2 || i5 == 0;
        if (z11) {
            this.sya.set(false);
        }
        return !z11 || super.ok();
    }

    @Override // com.bytedance.sdk.openadsdk.oty.zb.zb
    public boolean sya() {
        return lt.ycx(this.ycx.get(), this.f26965zb.tz()) && this.f26956dj == 1;
    }

    @Override // com.bytedance.sdk.openadsdk.oty.zb.zb
    public void ycx() {
        if (this.f26956dj != 1) {
            return;
        }
        super.ycx();
    }

    @Override // com.bytedance.sdk.openadsdk.oty.zb.zb
    public void zb(int i5) {
        if (jw()) {
            return;
        }
        if (i5 == 6 || i5 == 5) {
            this.f26956dj = 0;
            fby();
        }
        if (i5 == 3 || i5 == 2) {
            this.f26956dj = 2;
            fby();
        }
        if (this.f26956dj == 1 || i5 != 0) {
            return;
        }
        this.f26956dj = 1;
        ycx();
    }
}
