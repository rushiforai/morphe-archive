package com.bytedance.sdk.openadsdk.utils;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import com.vungle.ads.internal.protos.Sdk;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class jw implements xkz, Runnable {
    private boolean fby;

    /* renamed from: jw, reason: collision with root package name */
    private syc f27144jw;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f27145lt;
    private long lud;

    /* renamed from: ul, reason: collision with root package name */
    private final ycx f27146ul;

    /* renamed from: zb, reason: collision with root package name */
    private final Activity f27147zb;

    /* renamed from: dj, reason: collision with root package name */
    private int f27142dj = 5000;

    /* renamed from: jc, reason: collision with root package name */
    private final AtomicBoolean f27143jc = new AtomicBoolean(false);
    private final Handler sya = new Handler(Looper.getMainLooper());
    private View ycx = lud();

    public interface ycx {
        View ycx();

        void zb();
    }

    private jw(Activity activity, ycx ycxVar) {
        this.f27146ul = ycxVar;
        this.f27147zb = activity;
    }

    private void fby() {
        ViewParent parent = this.ycx.getParent();
        if (parent instanceof ViewGroup) {
            if (((ViewGroup) parent).indexOfChild(this.ycx) != r0.getChildCount() - 1) {
                this.ycx.bringToFront();
            }
        }
    }

    private void lt() {
        this.fby = false;
        this.lud = SystemClock.elapsedRealtime();
        Handler handler = this.sya;
        if (handler != null) {
            handler.postDelayed(this, this.f27142dj);
        }
    }

    private View lud() {
        ycx ycxVar = this.f27146ul;
        if (ycxVar != null) {
            return ycxVar.ycx();
        }
        return null;
    }

    private void ul() {
        Activity activity;
        View childAt;
        if (this.f27145lt || (activity = this.f27147zb) == null || activity.isFinishing() || this.f27147zb.isDestroyed()) {
            return;
        }
        if (this.ycx == null) {
            this.ycx = lud();
        }
        View view = this.ycx;
        if (view != null) {
            if (zb(view)) {
                ycx(this.ycx);
                View view2 = this.ycx;
                if ((view2 instanceof ViewGroup) && ((ViewGroup) view2).getChildCount() > 0 && (childAt = ((ViewGroup) this.ycx).getChildAt(0)) != null && zb(childAt)) {
                    ycx(childAt);
                }
                ycx ycxVar = this.f27146ul;
                if (ycxVar != null) {
                    ycxVar.zb();
                }
                syc sycVar = this.f27144jw;
                if (sycVar != null) {
                    sycVar.ycx();
                }
            }
            fby();
        }
        this.f27145lt = true;
    }

    public static xkz ycx(Activity activity, ycx ycxVar) {
        return new jw(activity, ycxVar);
    }

    @Override // com.bytedance.sdk.openadsdk.utils.xkz
    public void dj() {
        this.f27143jc.set(false);
        this.fby = false;
        this.f27145lt = false;
        this.f27142dj = 0;
        Handler handler = this.sya;
        if (handler != null) {
            try {
                handler.removeCallbacks(this);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "eOIihgaefNOURdl+gx+0OlTiIZAR", "Ses+kBc=", Sdk.SDKError.Reason.AD_LOAD_FAIL_PLACEMENT_ID_MISMATCH_VALUE);
                com.bytedance.sdk.component.utils.htf.sya(th2.getMessage(), new Object[0]);
            }
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        ul();
    }

    @Override // com.bytedance.sdk.openadsdk.utils.xkz
    public void sya() {
        if (this.f27145lt) {
            return;
        }
        this.f27145lt = true;
        Handler handler = this.sya;
        if (handler != null) {
            try {
                handler.removeCallbacks(this);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "eOIihgaefNOURdl+gx+0OlTiIZAR", "X+s+gRGzcA==", 211);
                com.bytedance.sdk.component.utils.htf.sya(th2.getMessage(), new Object[0]);
            }
        }
    }

    @Override // com.bytedance.sdk.openadsdk.utils.xkz
    public void zb() {
        if (this.lud <= 0 || this.f27145lt) {
            return;
        }
        if (!this.fby) {
            this.f27142dj = (int) (this.f27142dj - (SystemClock.elapsedRealtime() - this.lud));
        }
        this.fby = true;
        if (this.f27142dj <= 0) {
            ul();
            return;
        }
        Handler handler = this.sya;
        if (handler != null) {
            try {
                handler.removeCallbacks(this);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "eOIihgaefNOURdl+gx+0OlTiIZAR", "S+84hgY=", Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE);
                com.bytedance.sdk.component.utils.htf.sya(th2.getMessage(), new Object[0]);
            }
        }
    }

    @Override // com.bytedance.sdk.openadsdk.utils.xkz
    public void ycx(long j11) {
        this.f27143jc.get();
        if (this.f27143jc.compareAndSet(false, true)) {
            if (j11 < 0) {
                j11 = 0;
            }
            this.f27142dj = (int) (this.f27142dj + j11);
            lt();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.utils.xkz
    public void ycx(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar, long j11) {
        if (zbVar == null) {
            return;
        }
        if (j11 < 0) {
            j11 = 0;
        }
        int iYcx = com.bytedance.sdk.openadsdk.dv.lud.ycx(zbVar);
        if (iYcx >= 0) {
            ycx(iYcx);
            ycx(j11);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.utils.xkz
    public void ycx() {
        if (this.lud == 0 || !this.fby) {
            return;
        }
        lt();
    }

    private void ycx(View view) {
        view.setVisibility(0);
        view.setAlpha(1.0f);
    }

    private boolean zb(View view) {
        if (view == null) {
            return true;
        }
        return !view.isShown() || ((double) view.getAlpha()) <= 0.9d;
    }

    @Override // com.bytedance.sdk.openadsdk.utils.xkz
    public void ycx(int i5) {
        this.f27142dj = i5;
    }

    @Override // com.bytedance.sdk.openadsdk.utils.xkz
    public void ycx(syc sycVar) {
        this.f27144jw = sycVar;
    }
}
