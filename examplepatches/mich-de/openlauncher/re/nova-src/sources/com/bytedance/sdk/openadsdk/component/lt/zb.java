package com.bytedance.sdk.openadsdk.component.lt;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.bytedance.sdk.openadsdk.oty.sya;

/* loaded from: classes2.dex */
public class zb implements Handler.Callback {

    /* renamed from: ea, reason: collision with root package name */
    private long f24824ea;

    /* renamed from: jc, reason: collision with root package name */
    private long f24825jc;

    /* renamed from: ok, reason: collision with root package name */
    private boolean f24828ok;
    private ycx sya;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f24829ul;

    /* renamed from: zb, reason: collision with root package name */
    private final com.bytedance.sdk.openadsdk.component.fby.ycx f24830zb;
    private Handler ycx = new Handler(Looper.myLooper(), this);

    /* renamed from: dj, reason: collision with root package name */
    private int f24823dj = 0;
    private int lud = 5;

    /* renamed from: lt, reason: collision with root package name */
    private int f24827lt = 0;
    private final int fby = 1000;

    /* renamed from: jw, reason: collision with root package name */
    private int f24826jw = 1000;

    public zb(com.bytedance.sdk.openadsdk.component.fby.ycx ycxVar) {
        this.f24830zb = ycxVar;
    }

    public void dj() {
        Handler handler = this.ycx;
        if (handler != null) {
            handler.removeMessages(100);
        }
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message message) {
        if (message.what == 100 && this.ycx != null) {
            int i5 = message.arg1;
            ycx(i5);
            if (i5 > 0) {
                Message messageObtain = Message.obtain();
                messageObtain.what = 100;
                messageObtain.arg1 = i5 - 1;
                this.ycx.sendMessageDelayed(messageObtain, this.f24826jw);
            }
        }
        return true;
    }

    public void lud() {
        this.ycx.removeCallbacksAndMessages(null);
        this.ycx = null;
    }

    public void sya() {
        if (this.ycx != null) {
            Message messageObtain = Message.obtain();
            messageObtain.what = 100;
            messageObtain.arg1 = this.f24823dj;
            this.ycx.sendMessage(messageObtain);
        }
    }

    public void ycx(int i5) {
        this.f24823dj = i5;
        int i11 = this.lud - i5;
        this.f24830zb.zb(i11 * 1000);
        boolean z11 = true;
        if (i5 <= 0) {
            ycx ycxVar = this.sya;
            if (ycxVar != null && !this.f24829ul) {
                ycxVar.sya();
                this.f24829ul = true;
            }
            i5 = 0;
        }
        ycx ycxVar2 = this.sya;
        if (ycxVar2 != null) {
            int iMax = Math.max(this.f24827lt - i11, 0);
            if (i5 != 0 && i11 < this.f24827lt) {
                z11 = false;
            }
            ycxVar2.ycx(iMax, z11);
        }
    }

    public void zb(int i5) {
        this.f24827lt = Math.min(i5, this.lud);
    }

    public void zb() {
        Handler handler = this.ycx;
        if (handler != null) {
            handler.sendMessage(handler.obtainMessage(100, this.lud, 0));
        }
    }

    public void ycx(float f11) {
        int i5 = (int) f11;
        this.lud = i5;
        if (i5 <= 0) {
            this.lud = 5;
        }
    }

    public void ycx(ycx ycxVar) {
        this.sya = ycxVar;
    }

    public int ycx() {
        return this.f24827lt;
    }

    public void ycx(int i5, float f11, boolean z11) {
        com.bytedance.sdk.openadsdk.component.fby.ycx ycxVar;
        if ((i5 == 1 || i5 == 2) && this.f24828ok != z11) {
            this.f24828ok = z11;
            if (i5 == 1 && (ycxVar = this.f24830zb) != null) {
                ycxVar.ycx(z11);
            }
            if (z11) {
                try {
                    this.f24826jw = (int) (1000.0f / f11);
                    this.f24824ea = System.currentTimeMillis();
                    return;
                } catch (Throwable th2) {
                    sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J9yJA=", "b9oMhROTecKOa9NpgwGMKULhOIEruWXXhVg=", "VOAMlgC5ZcKSS8NY", 153);
                }
            } else {
                long jCurrentTimeMillis = (System.currentTimeMillis() - this.f24824ea) + this.f24825jc;
                this.f24825jc = jCurrentTimeMillis;
                com.bytedance.sdk.openadsdk.component.fby.ycx ycxVar2 = this.f24830zb;
                if (ycxVar2 != null) {
                    ycxVar2.ycx(jCurrentTimeMillis);
                }
            }
            this.f24826jw = 1000;
        }
    }
}
