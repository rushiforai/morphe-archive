package com.bytedance.sdk.openadsdk.dj;

import android.os.Handler;
import android.os.Message;
import android.os.SystemClock;
import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.core.model.tn;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes2.dex */
public class xkz {
    private static volatile xkz ycx;

    /* renamed from: dj, reason: collision with root package name */
    private Map<String, Object> f26695dj;
    private zb sya = zb.ycx();

    /* renamed from: zb, reason: collision with root package name */
    private final Handler f26696zb = new Handler(com.bytedance.sdk.openadsdk.core.syc.zb().getLooper(), new Handler.Callback() { // from class: com.bytedance.sdk.openadsdk.dj.xkz.1
        @Override // android.os.Handler.Callback
        public boolean handleMessage(Message message) {
            if (message.what != 100) {
                return true;
            }
            Object obj = message.obj;
            ycx ycxVar = (obj == null || !(obj instanceof ycx)) ? null : (ycx) obj;
            if (ycxVar == null) {
                return true;
            }
            xkz.this.zb(ycxVar);
            return true;
        }
    });

    public static class ycx implements Serializable, Runnable {

        /* renamed from: dj, reason: collision with root package name */
        public String f26697dj;
        public Map<String, Object> lud;
        public tn sya;
        public final AtomicInteger ycx = new AtomicInteger(0);

        /* renamed from: zb, reason: collision with root package name */
        public final AtomicBoolean f26699zb = new AtomicBoolean(false);

        /* renamed from: lt, reason: collision with root package name */
        private final long f26698lt = SystemClock.elapsedRealtime();

        public ycx(tn tnVar, String str, Map<String, Object> map) {
            this.sya = tnVar;
            this.f26697dj = str;
            this.lud = map;
        }

        public static ycx ycx(tn tnVar, String str, Map<String, Object> map) {
            return new ycx(tnVar, str, map);
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.sya == null || TextUtils.isEmpty(this.f26697dj)) {
                return;
            }
            String str = this.f26699zb.get() ? "dpl_success" : "dpl_failed";
            if (this.lud == null) {
                this.lud = new HashMap();
            }
            tn tnVar = this.sya;
            if (tnVar != null && tnVar.mm() == 0) {
                Map<String, Object> map = this.lud;
                tn tnVar2 = this.sya;
                map.put("auto_click", Boolean.valueOf((tnVar2 == null || tnVar2.htf()) ? false : true));
            }
            this.lud.put("lifeCycleInit", Boolean.valueOf(com.bytedance.sdk.openadsdk.core.dy.ycx().sya()));
            this.lud.put("duration", Long.valueOf(SystemClock.elapsedRealtime() - this.f26698lt));
            sya.ycx(this.sya, this.f26697dj, str, this.lud);
        }

        public void zb() {
            this.ycx.incrementAndGet();
        }

        public ycx ycx(boolean z11) {
            this.f26699zb.set(z11);
            return this;
        }

        public int ycx() {
            return this.ycx.get();
        }
    }

    public static class zb {
        public int ycx = 300;

        /* renamed from: zb, reason: collision with root package name */
        public int f26700zb = 6000;

        private zb() {
        }

        public static zb ycx() {
            return new zb();
        }
    }

    private xkz() {
    }

    private void sya(ycx ycxVar) {
        if (ycxVar == null) {
            return;
        }
        this.f26696zb.post(ycxVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(ycx ycxVar) {
        if (ycxVar == null) {
            return;
        }
        boolean zDj = com.bytedance.sdk.openadsdk.core.dy.ycx().dj();
        boolean zYcx = com.bytedance.sdk.openadsdk.core.dy.ycx().ycx(true);
        if (!zDj && zYcx) {
            ycx(ycxVar);
            return;
        }
        if (ycxVar.lud == null) {
            ycxVar.lud = new HashMap();
        }
        ycxVar.lud.put("is_background", Boolean.valueOf(zDj));
        ycxVar.lud.put("has_focus", Boolean.valueOf(zYcx));
        sya(ycxVar.ycx(true));
    }

    public static xkz ycx() {
        if (ycx == null) {
            synchronized (xkz.class) {
                try {
                    if (ycx == null) {
                        ycx = new xkz();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return ycx;
    }

    public xkz ycx(Map<String, Object> map) {
        this.f26695dj = map;
        return ycx();
    }

    public void ycx(tn tnVar, String str) {
        Message messageObtainMessage = this.f26696zb.obtainMessage();
        messageObtainMessage.what = 100;
        messageObtainMessage.obj = ycx.ycx(tnVar, str, this.f26695dj);
        messageObtainMessage.sendToTarget();
    }

    private void ycx(ycx ycxVar) {
        if (ycxVar == null) {
            return;
        }
        ycxVar.zb();
        int iYcx = ycxVar.ycx();
        zb zbVar = this.sya;
        if (iYcx * zbVar.ycx > zbVar.f26700zb) {
            sya(ycxVar.ycx(false));
            return;
        }
        Message messageObtainMessage = this.f26696zb.obtainMessage();
        messageObtainMessage.what = 100;
        messageObtainMessage.obj = ycxVar;
        this.f26696zb.sendMessageDelayed(messageObtainMessage, this.sya.ycx);
    }
}
