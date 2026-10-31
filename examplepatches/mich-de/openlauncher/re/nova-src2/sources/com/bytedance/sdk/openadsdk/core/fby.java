package com.bytedance.sdk.openadsdk.core;

import android.content.Context;
import android.os.Handler;
import android.os.Message;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import com.bytedance.sdk.component.utils.tru;
import com.vungle.ads.internal.protos.Sdk;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class fby extends View implements tru.ycx {

    /* renamed from: dj, reason: collision with root package name */
    private View f25361dj;

    /* renamed from: ea, reason: collision with root package name */
    private ViewTreeObserver.OnGlobalLayoutListener f25362ea;
    private int fby;

    /* renamed from: jc, reason: collision with root package name */
    private final AtomicBoolean f25363jc;

    /* renamed from: jw, reason: collision with root package name */
    private final Handler f25364jw;

    /* renamed from: lt, reason: collision with root package name */
    private List<View> f25365lt;
    private List<View> lud;

    /* renamed from: ok, reason: collision with root package name */
    private boolean f25366ok;

    /* renamed from: ry, reason: collision with root package name */
    private boolean f25367ry;
    private ycx sya;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f25368ul;
    private final Runnable xkz;
    private boolean ycx;

    /* renamed from: zb, reason: collision with root package name */
    private boolean f25369zb;

    public interface ycx {
        void ycx();

        void ycx(View view);

        void ycx(boolean z11);

        void zb();
    }

    public fby(Context context, View view, boolean z11) {
        super(pmi.ycx());
        this.f25364jw = new com.bytedance.sdk.component.utils.tru(syc.zb().getLooper(), this);
        this.f25363jc = new AtomicBoolean(true);
        this.f25367ry = false;
        this.xkz = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.fby.3
            @Override // java.lang.Runnable
            public void run() {
                if (fby.this.sya != null) {
                    fby.this.sya.ycx(fby.this.f25361dj);
                }
            }
        };
        this.f25366ok = z11;
        this.f25361dj = view;
        setLayoutParams(new ViewGroup.LayoutParams(0, 0));
        this.f25362ea = new ViewTreeObserver.OnGlobalLayoutListener() { // from class: com.bytedance.sdk.openadsdk.core.fby.1
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public void onGlobalLayout() {
                if (fby.this.f25367ry) {
                    return;
                }
                fby.this.lud();
                fby.this.dj();
            }
        };
    }

    @Override // android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.f25368ul = false;
        zb();
        if (this.f25362ea != null) {
            getViewTreeObserver().addOnGlobalLayoutListener(this.f25362ea);
        }
    }

    @Override // android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        lud();
        this.f25368ul = true;
        sya();
        ycx(false);
    }

    @Override // android.view.View
    public void onFinishTemporaryDetach() {
        super.onFinishTemporaryDetach();
        zb();
    }

    @Override // android.view.View
    public void onStartTemporaryDetach() {
        super.onStartTemporaryDetach();
        sya();
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        ycx ycxVar = this.sya;
        if (ycxVar != null) {
            ycxVar.ycx(z11);
        }
    }

    public void setAdType(int i5) {
        this.fby = i5;
    }

    public void setCallback(ycx ycxVar) {
        this.sya = ycxVar;
    }

    public void setNeedCheckingShow(boolean z11) {
        this.f25369zb = z11;
        if (!z11 && this.ycx) {
            lud();
        } else {
            if (!z11 || this.ycx) {
                return;
            }
            dj();
        }
    }

    public void setRefClickViews(List<View> list) {
        this.lud = list;
    }

    public void setRefCreativeViews(List<View> list) {
        this.f25365lt = list;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dj() {
        if (!this.f25369zb || this.ycx) {
            return;
        }
        this.ycx = true;
        this.f25364jw.sendEmptyMessage(1);
    }

    private boolean lt() {
        View view = this.f25361dj;
        if (view instanceof com.bytedance.sdk.openadsdk.core.jc.thx) {
            return ((com.bytedance.sdk.openadsdk.core.jc.thx) view).oty();
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void lud() {
        if (this.ycx) {
            this.f25364jw.removeCallbacksAndMessages(null);
            this.ycx = false;
        }
    }

    private void sya() {
        ycx ycxVar;
        if (this.f25363jc.getAndSet(true) || (ycxVar = this.sya) == null) {
            return;
        }
        ycxVar.zb();
    }

    private void zb() {
        ycx ycxVar;
        if (!this.f25363jc.getAndSet(false) || (ycxVar = this.sya) == null) {
            return;
        }
        ycxVar.ycx();
    }

    public void ycx() {
        ycx(this.lud, (com.bytedance.sdk.openadsdk.core.sya.sya) null);
        ycx(this.f25365lt, (com.bytedance.sdk.openadsdk.core.sya.sya) null);
    }

    public void ycx(List<View> list, com.bytedance.sdk.openadsdk.core.sya.sya syaVar) {
        if (com.bytedance.sdk.component.utils.ry.zb(list)) {
            for (View view : list) {
                if (view != null) {
                    view.setOnClickListener(syaVar);
                    view.setOnTouchListener(syaVar);
                }
            }
        }
    }

    @Override // com.bytedance.sdk.component.utils.tru.ycx
    public void ycx(Message message) {
        if (message.what == 1 && this.ycx) {
            if (lt() && ifb.ycx(this.f25361dj, 20, this.fby, this.f25366ok)) {
                lud();
                this.f25367ry = true;
                syc.sya().post(this.xkz);
                ycx(true);
                return;
            }
            this.f25364jw.sendEmptyMessageDelayed(1, 1000L);
        }
    }

    private void ycx(final boolean z11) {
        final ViewTreeObserver viewTreeObserver = getViewTreeObserver();
        com.bytedance.sdk.component.utils.jw.zb().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.fby.2
            @Override // java.lang.Runnable
            public void run() {
                ViewTreeObserver viewTreeObserver2;
                if (fby.this.f25362ea != null && (viewTreeObserver2 = viewTreeObserver) != null) {
                    try {
                        viewTreeObserver2.removeOnGlobalLayoutListener(fby.this.f25362ea);
                    } catch (Exception e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fuM9gRqKYMKXDoU=", "Sfsj", Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE);
                    }
                }
                if (z11) {
                    fby.this.f25362ea = null;
                }
            }
        });
    }
}
