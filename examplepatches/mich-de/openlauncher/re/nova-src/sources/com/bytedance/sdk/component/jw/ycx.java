package com.bytedance.sdk.component.jw;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Handler;
import android.os.Message;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.webkit.WebView;
import com.bytedance.sdk.component.utils.av;
import com.bytedance.sdk.component.utils.tru;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx extends sya implements tru.ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final List<Integer> f23811dj;

    /* renamed from: dy, reason: collision with root package name */
    private boolean f23812dy;

    /* renamed from: ea, reason: collision with root package name */
    private long f23813ea;
    private volatile float fby;
    private View.OnTouchListener htf;

    /* renamed from: lt, reason: collision with root package name */
    private final Context f23816lt;
    private final int lud;

    /* renamed from: ok, reason: collision with root package name */
    private long f23817ok;
    private float pmi;

    /* renamed from: ry, reason: collision with root package name */
    private int f23818ry;
    private final int sya;

    /* renamed from: uh, reason: collision with root package name */
    private String f23819uh;

    /* renamed from: ul, reason: collision with root package name */
    private volatile float f23820ul;
    private float wie;

    /* renamed from: zb, reason: collision with root package name */
    private final int f23821zb;

    /* renamed from: jw, reason: collision with root package name */
    private float f23815jw = -1.0f;

    /* renamed from: jc, reason: collision with root package name */
    private float f23814jc = -1.0f;
    private final Handler syc = new tru(com.bytedance.sdk.component.utils.jw.ycx().getLooper(), this);
    InterfaceC0038ycx ycx = new InterfaceC0038ycx() { // from class: com.bytedance.sdk.component.jw.ycx.1
        @Override // com.bytedance.sdk.component.jw.ycx.InterfaceC0038ycx
        public void ycx() {
            if (ycx.this.f23815jw == -1.0f && ycx.this.f23814jc == -1.0f && ycx.this.f23817ok == -1) {
                float unused = ycx.this.f23815jw;
                float unused2 = ycx.this.f23814jc;
                ycx ycxVar = ycx.this;
                ycxVar.f23815jw = ycxVar.f23820ul;
                ycx ycxVar2 = ycx.this;
                ycxVar2.f23814jc = ycxVar2.fby;
                ycx ycxVar3 = ycx.this;
                ycxVar3.f23817ok = ycxVar3.f23813ea;
                ycx.this.f23812dy = true;
            }
            float unused3 = ycx.this.f23815jw;
            float unused4 = ycx.this.f23814jc;
        }

        @Override // com.bytedance.sdk.component.jw.ycx.InterfaceC0038ycx
        public void ycx(int i5) {
            ycx.this.f23818ry = i5;
            ycx.this.zb();
        }
    };
    private int thx = -1;
    private final List<Integer> xkz = new ArrayList();

    /* renamed from: com.bytedance.sdk.component.jw.ycx$ycx, reason: collision with other inner class name */
    public interface InterfaceC0038ycx {
        void ycx();

        void ycx(int i5);
    }

    public ycx(Context context, int i5, int i11, List<Integer> list, int i12) {
        this.f23816lt = context;
        if (i5 == -1) {
            this.f23821zb = av.ycx(context);
        } else {
            this.f23821zb = av.ycx(context, i5);
        }
        this.sya = av.ycx(context, i11);
        this.f23811dj = list;
        this.lud = i12;
    }

    @Override // android.view.View.OnTouchListener
    @SuppressLint({"ClickableViewAccessibility"})
    public boolean onTouch(View view, MotionEvent motionEvent) {
        ycx ycxVar;
        int action = motionEvent.getAction();
        motionEvent.getX();
        motionEvent.getY();
        float x11 = motionEvent.getX();
        float y11 = motionEvent.getY();
        this.f23813ea = SystemClock.elapsedRealtime();
        this.f23820ul = x11;
        this.fby = y11;
        if (action == 0) {
            ycxVar = this;
            ycxVar.wie = x11;
            ycxVar.pmi = y11;
        } else if (action != 1) {
            ycxVar = this;
        } else {
            ycxVar = this;
            if (ycxVar.ycx(x11, y11, this.wie, this.pmi, this.f23816lt)) {
                int iYcx = ycx(ycxVar.f23820ul, ycxVar.fby, ycxVar.f23813ea);
                boolean zContains = ycxVar.xkz.contains(Integer.valueOf(ycxVar.f23818ry));
                ycx(view, motionEvent, iYcx, !zContains);
                if (!zContains) {
                    ycxVar.xkz.add(Integer.valueOf(ycxVar.f23818ry));
                }
                if (iYcx == 0) {
                    motionEvent.setAction(3);
                }
            }
        }
        View.OnTouchListener onTouchListener = ycxVar.htf;
        if (onTouchListener != null) {
            return onTouchListener.onTouch(view, motionEvent);
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb() {
        this.f23815jw = -1.0f;
        this.f23814jc = -1.0f;
        this.f23817ok = -1L;
    }

    @Override // com.bytedance.sdk.component.jw.sya
    public void ycx(View.OnTouchListener onTouchListener) {
        this.htf = onTouchListener;
    }

    public InterfaceC0038ycx ycx() {
        return this.ycx;
    }

    private void ycx(View view, MotionEvent motionEvent, int i5, boolean z11) {
        String url;
        JSONObject jSONObject = new JSONObject();
        WebView webView = view instanceof WebView ? (WebView) view : null;
        if (webView != null) {
            try {
                url = webView.getUrl();
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "evwvnBeuaMCFZdlpgwSjIHfnPoEGsmzV", "S/wilgaveuSMQ9RWqQelJk8=", 160);
            }
        } else {
            url = b.f42142b;
        }
        jSONObject.put("arbi_current_url", url);
        jSONObject.put("click_x", motionEvent.getX());
        jSONObject.put("click_y", motionEvent.getY());
        jSONObject.put("is_interceptor", i5 == 0 ? 1 : 0);
        jSONObject.put("is_first_click", z11 ? 1 : 0);
        jSONObject.put("click_timestamp", System.currentTimeMillis());
        jSONObject.put("arbi_interceptor_type", i5);
        jSONObject.put("current_url_index", this.f23818ry);
        Message messageObtain = Message.obtain();
        messageObtain.what = 100;
        messageObtain.obj = jSONObject;
        this.syc.sendMessageDelayed(messageObtain, 200L);
    }

    public void ycx(String str) {
        this.f23819uh = str;
    }

    private int ycx(float f11, float f12, long j11) {
        if (this.f23815jw == -1.0f && this.f23814jc == -1.0f && this.f23817ok == -1) {
            return 1;
        }
        if (!this.f23811dj.contains(Integer.valueOf(this.f23818ry))) {
            return 2;
        }
        if (j11 - this.f23817ok > this.lud) {
            zb();
            return 3;
        }
        float fAbs = Math.abs(f11 - this.f23815jw);
        float fAbs2 = Math.abs(f12 - this.f23814jc);
        if (fAbs <= this.f23821zb / 2.0f && fAbs2 <= this.sya / 2.0f) {
            return 0;
        }
        zb();
        return 4;
    }

    @Override // com.bytedance.sdk.component.utils.tru.ycx
    public void ycx(Message message) {
        int i5 = message.what;
        Object obj = message.obj;
        JSONObject jSONObject = new JSONObject();
        if (i5 == 100) {
            if (obj instanceof JSONObject) {
                jSONObject = (JSONObject) obj;
                try {
                    jSONObject.put("is_trigger_jump", this.f23812dy ? 1 : 0);
                    this.f23812dy = false;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "evwvnBeuaMCFZdlpgwSjIHfnPoEGsmzV", "U+8jkQ+5RNSH", Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE);
                }
            }
            if (com.bytedance.sdk.component.jw.ycx.ycx.ycx().zb() != null) {
                com.bytedance.sdk.component.jw.ycx.ycx.ycx().zb().ycx(this.f23819uh, "arbitrage_click_event", jSONObject);
            }
        }
    }
}
