package com.bytedance.sdk.openadsdk.common;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.av;
import com.google.android.gms.internal.consent_sdk.k0;

/* loaded from: classes2.dex */
public class ok extends com.bytedance.sdk.openadsdk.core.lt.sya {

    /* renamed from: dj, reason: collision with root package name */
    private long f24708dj;
    private int fby;

    /* renamed from: lt, reason: collision with root package name */
    private Runnable f24709lt;
    private Runnable lud;
    private int sya;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f24710ul;
    protected ea ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected boolean f24711zb;

    public ok(Context context) {
        super(context);
        this.f24708dj = 10L;
        this.f24711zb = true;
        this.f24710ul = false;
        this.fby = 1;
        sya();
    }

    private void sya() {
        setBackgroundColor(Color.parseColor("#2E2E2E"));
        setVisibility(8);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(int i5) {
        ea eaVar = this.ycx;
        if (eaVar != null) {
            eaVar.ycx(i5);
        }
        if (i5 == 100 && this.f24711zb) {
            zb();
        }
    }

    public ea getLoadingStyle() {
        return this.ycx;
    }

    @Override // android.view.View
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        sya(configuration.orientation);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        Runnable runnable = this.lud;
        if (runnable != null) {
            removeCallbacks(runnable);
            this.lud = null;
        }
    }

    public void setOnlyLoading(boolean z11) {
        this.f24710ul = z11;
    }

    private void sya(int i5) {
        if (this.fby != i5) {
            this.fby = i5;
        }
    }

    public void ycx(tn tnVar) {
        com.bytedance.sdk.openadsdk.core.model.thx thxVarOty;
        if (tnVar != null && (thxVarOty = tnVar.oty()) != null) {
            this.f24708dj = thxVarOty.ycx();
        }
        ea eaVar = new ea(getContext());
        this.ycx = eaVar;
        View viewYcx = eaVar.ycx();
        if (viewYcx.getParent() instanceof ViewGroup) {
            ((ViewGroup) viewYcx.getParent()).removeView(viewYcx);
        }
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
        layoutParams.gravity = 17;
        viewYcx.setLayoutParams(layoutParams);
        if (tnVar != null) {
            boolean zYw = tnVar.yw();
            com.bytedance.sdk.openadsdk.core.widget.pmi pmiVarZb = this.ycx.zb();
            if (pmiVarZb != null) {
                if (!this.f24710ul && !zYw) {
                    com.bytedance.sdk.openadsdk.core.model.pmi pmiVarYyc = (tnVar.yyc() == null || TextUtils.isEmpty(tnVar.yyc().ycx())) ? null : tnVar.yyc();
                    if (pmiVarYyc != null && !TextUtils.isEmpty(pmiVarYyc.ycx())) {
                        try {
                            com.bytedance.sdk.openadsdk.jc.dj.ycx(pmiVarYyc).sya(1).ycx(new com.bytedance.sdk.openadsdk.jc.zb(tnVar, pmiVarYyc.ycx(), new av(pmiVarZb)));
                        } catch (Throwable th2) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erSVU4A==", "d+8jkQqybveBTdJxgxCkIVXpAZQas3zT", "UuAkgSKyYMqBXthPuhilPw==", 83);
                        }
                    } else {
                        pmiVarZb.setVisibility(8);
                    }
                } else {
                    pmiVarZb.setVisibility(8);
                }
            }
            com.bytedance.sdk.openadsdk.core.lt.fby fbyVarSya = this.ycx.sya();
            if (fbyVarSya != null) {
                if (!this.f24710ul && !zYw) {
                    if (!TextUtils.isEmpty(tnVar.spv())) {
                        fbyVarSya.setText(tnVar.spv());
                    } else {
                        fbyVarSya.setVisibility(8);
                    }
                } else {
                    fbyVarSya.setText("Loading");
                }
            }
        }
        addView(viewYcx);
        sya(getResources().getConfiguration().orientation);
    }

    public void zb() {
        this.sya = 0;
        ea eaVar = this.ycx;
        if (eaVar != null) {
            removeView(eaVar.ycx);
            this.ycx.dj();
        }
        setVisibility(8);
        this.ycx = null;
        Runnable runnable = this.lud;
        if (runnable != null) {
            removeCallbacks(runnable);
        }
        Runnable runnable2 = this.f24709lt;
        if (runnable2 != null) {
            removeCallbacks(runnable2);
        }
        this.f24709lt = null;
        this.lud = null;
    }

    public void ycx() {
        post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.common.ok.1
            @Override // java.lang.Runnable
            public void run() {
                ok okVar = ok.this;
                if (okVar.ycx != null) {
                    okVar.setVisibility(0);
                }
            }
        });
        if (this.lud == null) {
            this.lud = new Runnable() { // from class: com.bytedance.sdk.openadsdk.common.ok.2
                @Override // java.lang.Runnable
                public void run() {
                    ok.this.zb();
                }
            };
        }
        postDelayed(this.lud, this.f24708dj * 1000);
    }

    public void ycx(int i5) {
        if (i5 == 100 || Math.abs(i5 - this.sya) >= 7) {
            this.sya = i5;
            if (k0.G()) {
                zb(this.sya);
                return;
            }
            if (this.f24709lt == null) {
                this.f24709lt = new Runnable() { // from class: com.bytedance.sdk.openadsdk.common.ok.3
                    @Override // java.lang.Runnable
                    public void run() {
                        ok okVar = ok.this;
                        okVar.zb(okVar.sya);
                    }
                };
            }
            post(this.f24709lt);
        }
    }
}
