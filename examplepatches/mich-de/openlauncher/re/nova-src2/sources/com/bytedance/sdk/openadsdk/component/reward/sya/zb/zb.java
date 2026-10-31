package com.bytedance.sdk.openadsdk.component.reward.sya.zb;

import android.os.Handler;
import android.os.Message;
import com.bytedance.sdk.component.utils.tru;

/* loaded from: classes2.dex */
public class zb implements tru.ycx {

    /* renamed from: dj, reason: collision with root package name */
    private long f24972dj;
    private long sya;

    /* renamed from: zb, reason: collision with root package name */
    private ycx f24975zb;
    private Handler ycx = new tru(this);
    private boolean lud = false;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f24973lt = false;

    /* renamed from: ul, reason: collision with root package name */
    private int f24974ul = 10000;
    private int fby = 10000;

    public interface ycx {
        void ycx();

        void ycx(EnumC0057zb enumC0057zb);
    }

    /* renamed from: com.bytedance.sdk.openadsdk.component.reward.sya.zb.zb$zb, reason: collision with other inner class name */
    public enum EnumC0057zb {
        NORMAL,
        TIMEOUT,
        DISCONNECTED
    }

    private void dj() {
        if (this.lud && this.f24973lt && System.currentTimeMillis() - this.sya >= this.f24974ul) {
            this.f24973lt = false;
            ycx ycxVar = this.f24975zb;
            if (ycxVar != null) {
                ycxVar.ycx(EnumC0057zb.TIMEOUT);
            }
            ycx();
        }
    }

    private void sya() {
        if (!this.lud || this.f24975zb == null) {
            return;
        }
        this.sya = System.currentTimeMillis();
        this.f24973lt = true;
        this.f24975zb.ycx();
        this.ycx.removeMessages(2);
        this.ycx.sendEmptyMessageDelayed(2, this.fby);
        this.ycx.removeMessages(1);
        this.ycx.sendEmptyMessageDelayed(1, this.f24974ul);
    }

    public void ycx(int i5) {
        this.f24974ul = i5;
    }

    public void zb(int i5) {
        this.fby = i5;
    }

    public void ycx(ycx ycxVar) {
        if (this.lud) {
            return;
        }
        this.f24975zb = ycxVar;
        this.lud = true;
        this.f24973lt = false;
        this.ycx.sendEmptyMessage(1);
        if (ycxVar != null) {
            ycxVar.ycx(EnumC0057zb.NORMAL);
        }
    }

    public void zb() {
        if (this.lud && this.f24973lt) {
            this.f24972dj = System.currentTimeMillis();
            this.f24973lt = false;
            this.ycx.removeMessages(2);
            ycx ycxVar = this.f24975zb;
            if (ycxVar != null) {
                ycxVar.ycx(EnumC0057zb.NORMAL);
            }
        }
    }

    public void ycx() {
        this.lud = false;
        this.f24973lt = false;
        this.ycx.removeMessages(1);
        this.ycx.removeMessages(2);
        this.f24975zb = null;
    }

    @Override // com.bytedance.sdk.component.utils.tru.ycx
    public void ycx(Message message) {
        int i5 = message.what;
        if (i5 == 1) {
            sya();
        } else {
            if (i5 != 2) {
                return;
            }
            dj();
        }
    }
}
