package com.bytedance.sdk.openadsdk.core.dj;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewTreeObserver;
import com.bytedance.sdk.component.utils.tru;
import com.bytedance.sdk.openadsdk.core.ifb;
import com.bytedance.sdk.openadsdk.core.syc;
import com.bytedance.sdk.openadsdk.utils.yzp;

/* loaded from: classes2.dex */
public class lt extends com.bytedance.adsdk.ugeno.ul.ycx<View> implements tru.ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final Handler f25282dj;

    /* renamed from: ea, reason: collision with root package name */
    private final ViewTreeObserver.OnScrollChangedListener f25283ea;
    private zb fby;

    /* renamed from: jc, reason: collision with root package name */
    private final Runnable f25284jc;

    /* renamed from: jw, reason: collision with root package name */
    private ycx f25285jw;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f25286lt;
    private long lud;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f25287ul;

    public interface ycx {
        void ycx(boolean z11);
    }

    public interface zb {
        void ycx(boolean z11);
    }

    public lt(Context context) {
        super(context);
        this.f25282dj = new tru(syc.zb().getLooper(), this);
        this.f25286lt = true;
        this.f25287ul = true;
        this.f25284jc = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.dj.lt.1
            @Override // java.lang.Runnable
            public void run() {
                if (lt.this.f25285jw != null) {
                    lt.this.f25285jw.ycx(lt.this.f25287ul);
                }
            }
        };
        this.f25283ea = new ViewTreeObserver.OnScrollChangedListener() { // from class: com.bytedance.sdk.openadsdk.core.dj.lt.2
            @Override // android.view.ViewTreeObserver.OnScrollChangedListener
            public void onScrollChanged() {
                long jElapsedRealtime = SystemClock.elapsedRealtime();
                if (jElapsedRealtime - lt.this.lud > 500) {
                    lt.this.lud = jElapsedRealtime;
                    lt.this.f25282dj.sendEmptyMessageDelayed(1, 500L);
                }
            }
        };
    }

    private void ul() {
        boolean zYcx = ifb.ycx(this, 50, -1, false);
        this.f25287ul = zYcx;
        if (zYcx == this.f25286lt) {
            return;
        }
        this.f25286lt = zYcx;
        yzp.ycx(this.f25284jc);
    }

    @Override // com.bytedance.adsdk.ugeno.ul.ycx
    public View ea(int i5) {
        return (View) this.ycx.get(i5);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        getViewTreeObserver().addOnScrollChangedListener(this.f25283ea);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        ViewTreeObserver viewTreeObserver = getViewTreeObserver();
        if (viewTreeObserver.isAlive()) {
            viewTreeObserver.removeOnScrollChangedListener(this.f25283ea);
        }
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        zb zbVar = this.fby;
        if (zbVar != null) {
            zbVar.ycx(z11);
        }
    }

    public void setSwiperVisibleChangeListener(ycx ycxVar) {
        this.f25285jw = ycxVar;
    }

    public void setSwiperWindowFocusChangedListener(zb zbVar) {
        this.fby = zbVar;
    }

    @Override // com.bytedance.sdk.component.utils.tru.ycx
    public void ycx(Message message) {
        if (message.what == 1) {
            ul();
        }
    }
}
