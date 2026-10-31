package com.bytedance.sdk.openadsdk.oty.ycx;

import android.os.Handler;
import android.os.SystemClock;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.yzp;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb {

    /* renamed from: zb, reason: collision with root package name */
    private final tn f26951zb;
    private int ycx = sya.f26946zb;
    private final AtomicBoolean sya = new AtomicBoolean(false);

    /* renamed from: dj, reason: collision with root package name */
    private final AtomicBoolean f26948dj = new AtomicBoolean(true);
    private final AtomicInteger lud = new AtomicInteger(0);

    /* renamed from: lt, reason: collision with root package name */
    private long f26949lt = 0;

    /* renamed from: ul, reason: collision with root package name */
    private long f26950ul = 0;
    private final Runnable fby = new Runnable() { // from class: com.bytedance.sdk.openadsdk.oty.ycx.zb.3
        @Override // java.lang.Runnable
        public void run() {
            zb.this.dj();
        }
    };

    public zb(tn tnVar) {
        this.f26951zb = tnVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void lt() {
        if (this.lud.get() != 1 || this.f26949lt == 0) {
            return;
        }
        Handler handlerYcx = ycx.ycx();
        if (handlerYcx != null) {
            handlerYcx.removeCallbacks(this.fby);
        }
        this.f26950ul = (SystemClock.elapsedRealtime() - this.f26949lt) + this.f26950ul;
        this.f26949lt = 0L;
        this.lud.set(2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dj() {
        if (this.sya.compareAndSet(false, true)) {
            zb();
            final long jElapsedRealtime = (SystemClock.elapsedRealtime() - this.f26949lt) + this.f26950ul;
            this.f26950ul = jElapsedRealtime;
            yzp.zb(new com.bytedance.sdk.component.fby.zb.sya("ev_tracker") { // from class: com.bytedance.sdk.openadsdk.oty.ycx.zb.1
                @Override // java.lang.Runnable
                public void run() throws JSONException {
                    String strYcx = oby.ycx(zb.this.f26951zb);
                    JSONObject jSONObject = new JSONObject();
                    try {
                        jSONObject.put("ev_wait_time_server", zb.this.f26951zb.nfe() * 1000);
                        jSONObject.put("ev_wait_time_client", jElapsedRealtime);
                    } catch (JSONException e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5gDoStQoCiD", "a88KsBWIe8aDQdJPyEA=", "Sfsj", 73);
                        htf.sya("EvTracker", e3.getMessage());
                    }
                    com.bytedance.sdk.openadsdk.dj.sya.zb(zb.this.f26951zb, strYcx, zb.this.f26951zb.vd(), jSONObject);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void lud() {
        if (this.lud.get() == 2) {
            this.f26949lt = SystemClock.elapsedRealtime();
            Handler handlerYcx = ycx.ycx();
            if (handlerYcx != null) {
                handlerYcx.postDelayed(this.fby, this.ycx - this.f26950ul);
            }
            this.lud.set(1);
        }
    }

    public boolean sya() {
        return this.lud.get() == 3;
    }

    public void ycx() {
        if (this.lud.get() != 0) {
            return;
        }
        this.ycx = this.f26951zb.nfe() * 1000;
        this.lud.set(1);
        this.f26949lt = SystemClock.elapsedRealtime();
        Handler handlerYcx = ycx.ycx();
        if (handlerYcx != null) {
            handlerYcx.postDelayed(this.fby, this.ycx);
        }
    }

    public void zb() {
        this.lud.set(3);
        Handler handlerYcx = ycx.ycx();
        if (handlerYcx != null) {
            handlerYcx.removeCallbacks(this.fby);
        }
    }

    public void ycx(final int i5) {
        Handler handlerYcx;
        if (this.lud.get() == 3 || (handlerYcx = ycx.ycx()) == null) {
            return;
        }
        handlerYcx.post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.oty.ycx.zb.2
            @Override // java.lang.Runnable
            public void run() {
                if (i5 == 4 && zb.this.f26948dj.get()) {
                    zb.this.lud();
                    return;
                }
                int i11 = i5;
                if (i11 == 8) {
                    zb.this.lt();
                } else if (i11 == 5) {
                    zb.this.dj();
                }
            }
        });
    }

    public void ycx(boolean z11) {
        this.f26948dj.set(z11);
    }
}
