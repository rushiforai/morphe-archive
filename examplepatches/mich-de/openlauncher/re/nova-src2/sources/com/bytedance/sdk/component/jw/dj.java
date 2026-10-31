package com.bytedance.sdk.component.jw;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import com.bytedance.sdk.component.utils.htf;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj extends sya {

    /* renamed from: dj, reason: collision with root package name */
    private final Context f23766dj;
    private float fby;

    /* renamed from: jc, reason: collision with root package name */
    private String f23767jc;

    /* renamed from: jw, reason: collision with root package name */
    private float f23768jw;

    /* renamed from: lt, reason: collision with root package name */
    private View.OnTouchListener f23769lt;
    private final fby lud;
    private final long sya;

    /* renamed from: ul, reason: collision with root package name */
    private long f23770ul = -1;
    private final View.OnTouchListener ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final int f23771zb;

    public dj(Context context, View.OnTouchListener onTouchListener, int i5, long j11, fby fbyVar) {
        this.f23766dj = context;
        this.ycx = onTouchListener;
        this.f23771zb = i5;
        this.sya = j11;
        this.lud = fbyVar;
    }

    private boolean ycx(long j11) {
        long j12 = this.f23770ul;
        if (j12 == -1) {
            this.f23770ul = j11;
            return false;
        }
        int i5 = this.f23771zb;
        if (i5 == 1) {
            if (j11 - j12 <= this.sya) {
                return true;
            }
            this.f23770ul = j11;
            return false;
        }
        if (i5 == 2) {
            if (j11 - j12 <= this.sya) {
                this.f23770ul = j11;
                return true;
            }
            this.f23770ul = j11;
        }
        return false;
    }

    @Override // android.view.View.OnTouchListener
    @SuppressLint({"ClickableViewAccessibility"})
    public boolean onTouch(View view, MotionEvent motionEvent) {
        dj djVar;
        int action = motionEvent.getAction();
        motionEvent.getX();
        motionEvent.getY();
        float x11 = motionEvent.getX();
        float y11 = motionEvent.getY();
        if (action == 0) {
            djVar = this;
            djVar.fby = x11;
            djVar.f23768jw = y11;
        } else if (action != 1) {
            djVar = this;
        } else {
            djVar = this;
            if (djVar.ycx(x11, y11, this.fby, this.f23768jw, this.f23766dj)) {
                if (ycx(SystemClock.elapsedRealtime())) {
                    motionEvent.setAction(3);
                    ycx(1, x11, y11);
                } else {
                    ycx(0, x11, y11);
                }
            }
        }
        View.OnTouchListener onTouchListener = djVar.ycx;
        if (onTouchListener != null) {
            onTouchListener.onTouch(view, motionEvent);
        }
        View.OnTouchListener onTouchListener2 = djVar.f23769lt;
        if (onTouchListener2 != null) {
            onTouchListener2.onTouch(view, motionEvent);
        }
        return false;
    }

    private void ycx(int i5, float f11, float f12) {
        JSONObject jSONObject = new JSONObject();
        JSONObject jSONObject2 = new JSONObject();
        try {
            jSONObject2.put("is_interceptor", i5);
            jSONObject2.put("click_x", f11);
            jSONObject2.put("click_y", f12);
            jSONObject.put("lp_click_type", this.f23771zb);
            jSONObject.put("lp_click_interval", this.sya);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5sYpC9e+g==", "d/4OmQq/Yu6OXtJPmhCsHFT7Lp0vtXrThUTSTw==", "SOsjkS+sSsuJSdx0ggWlOljrPYEmqmzJlA==", 109);
            htf.ycx("LpClickIntervalTouchListener", "sendLpClickInterceptEvent", th2);
        }
        if (com.bytedance.sdk.component.jw.ycx.ycx.ycx().zb() != null) {
            com.bytedance.sdk.component.jw.ycx.zb zbVarZb = com.bytedance.sdk.component.jw.ycx.ycx.ycx().zb();
            fby fbyVar = this.lud;
            zbVarZb.ycx(fbyVar != null ? fbyVar.getMaterialMeta() : null, this.f23767jc, "click_interval_intercept", jSONObject, jSONObject2);
        }
    }

    public void ycx(String str) {
        this.f23767jc = str;
    }

    @Override // com.bytedance.sdk.component.jw.sya
    public void ycx(View.OnTouchListener onTouchListener) {
        this.f23769lt = onTouchListener;
    }
}
