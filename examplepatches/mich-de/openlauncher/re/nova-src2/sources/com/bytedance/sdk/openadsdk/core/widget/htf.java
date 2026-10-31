package com.bytedance.sdk.openadsdk.core.widget;

import android.annotation.SuppressLint;
import android.view.MotionEvent;
import android.view.View;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class htf {

    /* renamed from: dj, reason: collision with root package name */
    private float f26299dj;

    /* renamed from: ea, reason: collision with root package name */
    private boolean f26300ea;

    /* renamed from: lt, reason: collision with root package name */
    private int f26303lt;
    private float lud;

    /* renamed from: ul, reason: collision with root package name */
    private int f26304ul;
    private final ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final boolean f26305zb = false;
    private boolean sya = false;
    private boolean fby = true;

    /* renamed from: jw, reason: collision with root package name */
    private boolean f26302jw = false;

    /* renamed from: jc, reason: collision with root package name */
    private final View.OnTouchListener f26301jc = new View.OnTouchListener() { // from class: com.bytedance.sdk.openadsdk.core.widget.htf.1
        @Override // android.view.View.OnTouchListener
        @SuppressLint({"ClickableViewAccessibility"})
        public boolean onTouch(View view, MotionEvent motionEvent) {
            if (htf.this.ycx.tn()) {
                return !htf.this.sya;
            }
            float x11 = motionEvent.getX();
            float y11 = motionEvent.getY();
            int action = motionEvent.getAction();
            if (action == 0) {
                htf htfVar = htf.this;
                htfVar.f26300ea = htfVar.ycx(motionEvent);
                htf.this.f26299dj = x11;
                htf.this.lud = y11;
                htf.this.f26303lt = (int) x11;
                htf.this.f26304ul = (int) y11;
                htf.this.fby = true;
                if (htf.this.ycx != null && htf.this.sya) {
                    htf.this.ycx.ycx(view, true);
                }
            } else if (action == 1) {
                if (Math.abs(x11 - htf.this.f26303lt) > 20.0f || Math.abs(y11 - htf.this.f26304ul) > 20.0f) {
                    htf.this.fby = false;
                }
                htf.this.fby = true;
                htf.this.f26302jw = false;
                htf.this.f26299dj = 0.0f;
                htf.this.lud = 0.0f;
                htf.this.f26303lt = 0;
                if (htf.this.ycx != null) {
                    htf.this.ycx.ycx(view, htf.this.fby);
                }
                htf.this.f26300ea = false;
            } else if (action == 3) {
                htf.this.f26300ea = false;
            }
            return !htf.this.sya;
        }
    };

    public interface ycx {
        boolean tn();

        void ycx(View view, boolean z11);
    }

    public htf(ycx ycxVar) {
        this.ycx = ycxVar;
    }

    public void ycx(View view) {
        if (view != null) {
            view.setOnTouchListener(this.f26301jc);
        }
    }

    public void ycx(boolean z11) {
        this.sya = z11;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean ycx(MotionEvent motionEvent) {
        if (motionEvent.getActionMasked() != 0) {
            return false;
        }
        int iDj = dc.dj(com.bytedance.sdk.openadsdk.core.pmi.ycx().getApplicationContext());
        int iLt = dc.lt(com.bytedance.sdk.openadsdk.core.pmi.ycx().getApplicationContext());
        float rawX = motionEvent.getRawX();
        float rawY = motionEvent.getRawY();
        float f11 = iDj;
        if (rawX <= f11 * 0.01f || rawX >= f11 * 0.99f) {
            return true;
        }
        float f12 = iLt;
        return rawY <= 0.01f * f12 || rawY >= f12 * 0.99f;
    }
}
