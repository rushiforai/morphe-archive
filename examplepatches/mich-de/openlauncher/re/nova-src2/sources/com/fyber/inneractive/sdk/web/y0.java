package com.fyber.inneractive.sdk.web;

import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class y0 implements View.OnTouchListener {

    /* renamed from: a, reason: collision with root package name */
    public final x0 f31420a;

    /* renamed from: b, reason: collision with root package name */
    public float f31421b;

    /* renamed from: c, reason: collision with root package name */
    public float f31422c;

    /* renamed from: d, reason: collision with root package name */
    public final float f31423d;

    public y0(x0 x0Var, Context context) {
        this.f31420a = x0Var;
        this.f31423d = ViewConfiguration.get(context).getScaledTouchSlop();
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        if (this.f31420a != null) {
            if (motionEvent.getActionMasked() == 0) {
                ((i) this.f31420a).i();
                this.f31421b = motionEvent.getX();
                this.f31422c = motionEvent.getY();
            } else if (motionEvent.getActionMasked() == 3) {
                ((i) this.f31420a).i();
                this.f31422c = -1.0f;
                this.f31421b = -1.0f;
            } else if (motionEvent.getActionMasked() == 1) {
                float f11 = this.f31421b;
                if (f11 >= 0.0f && this.f31422c >= 0.0f) {
                    float fRound = Math.round(Math.abs(f11 - motionEvent.getX()));
                    float fRound2 = Math.round(Math.abs(this.f31422c - motionEvent.getY()));
                    float f12 = this.f31423d;
                    if (fRound < f12 && fRound2 < f12) {
                        i iVar = (i) this.f31420a;
                        iVar.getClass();
                        IAlog.a("IAWebViewController onClicked()", new Object[0]);
                        if (iVar.f31314l != null) {
                            IAlog.e("Native click detected in time. Processing pending click", new Object[0]);
                            iVar.f31314l.d();
                            d dVar = iVar.f31315m;
                            if (dVar != null) {
                                com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(dVar);
                            }
                            iVar.f31314l = null;
                            iVar.i();
                        } else {
                            if (iVar.n != null) {
                                com.fyber.inneractive.sdk.util.r.f31216b.postDelayed(iVar.n, IAConfigManager.Q.f27761u.f27936b.a("click_timeout", 1000, 1000));
                            }
                            iVar.f31312j = true;
                        }
                    }
                    this.f31421b = -1.0f;
                    this.f31422c = -1.0f;
                }
            }
        }
        return false;
    }
}
