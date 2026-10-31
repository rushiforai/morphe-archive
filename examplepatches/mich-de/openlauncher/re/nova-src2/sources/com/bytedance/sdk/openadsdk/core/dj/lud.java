package com.bytedance.sdk.openadsdk.core.dj;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import com.bytedance.sdk.openadsdk.core.dj.lt;
import com.bytedance.sdk.openadsdk.core.model.wwx;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class lud {
    private final lt.ycx fby;

    /* renamed from: lt, reason: collision with root package name */
    private final lt.zb f25289lt;

    /* renamed from: ul, reason: collision with root package name */
    private final View.OnAttachStateChangeListener f25290ul;
    private wwx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private lt f25291zb;
    private List<ycx> sya = new ArrayList();

    /* renamed from: dj, reason: collision with root package name */
    private final String f25288dj = "BannerSwiperManager";
    private int lud = -1;

    public lud(wwx wwxVar, Context context, int i5, int i11) {
        lt.zb zbVar = new lt.zb() { // from class: com.bytedance.sdk.openadsdk.core.dj.lud.1
            @Override // com.bytedance.sdk.openadsdk.core.dj.lt.zb
            public void ycx(boolean z11) {
                try {
                    if (z11) {
                        lud.this.dj();
                    } else {
                        lud.this.sya();
                    }
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7CybDbl7wphaxVifAg==", "ee8jmwauWtCJWtJPoRCuKVzrP9FS", "VOAanA24ZtCmRdRInzKoKVXpKJE=", 68);
                }
            }
        };
        this.f25289lt = zbVar;
        View.OnAttachStateChangeListener onAttachStateChangeListener = new View.OnAttachStateChangeListener() { // from class: com.bytedance.sdk.openadsdk.core.dj.lud.2
            @Override // android.view.View.OnAttachStateChangeListener
            public void onViewAttachedToWindow(View view) throws Resources.NotFoundException {
                lud.this.lud();
            }

            @Override // android.view.View.OnAttachStateChangeListener
            public void onViewDetachedFromWindow(View view) throws Resources.NotFoundException {
                if (lud.this.sya != null && !lud.this.sya.isEmpty()) {
                    for (int i12 = 0; i12 < lud.this.sya.size(); i12++) {
                        ((ycx) lud.this.sya.get(i12)).lt();
                    }
                }
                lud.this.lud = -1;
                if (lud.this.f25291zb != null) {
                    lud.this.f25291zb.dj();
                }
            }
        };
        this.f25290ul = onAttachStateChangeListener;
        lt.ycx ycxVar = new lt.ycx() { // from class: com.bytedance.sdk.openadsdk.core.dj.lud.3
            @Override // com.bytedance.sdk.openadsdk.core.dj.lt.ycx
            public void ycx(boolean z11) {
                if (z11) {
                    lud.this.dj();
                } else {
                    lud.this.sya();
                }
            }
        };
        this.fby = ycxVar;
        this.ycx = wwxVar;
        lt ltVar = new lt(context);
        this.f25291zb = ltVar;
        ltVar.addOnAttachStateChangeListener(onAttachStateChangeListener);
        this.f25291zb.setSwiperWindowFocusChangedListener(zbVar);
        this.f25291zb.setSwiperVisibleChangeListener(ycxVar);
        ycx(context, i5, i11);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dj() {
        lt ltVar;
        wwx wwxVar = this.ycx;
        if (wwxVar != null && wwxVar.zb() == 1 && (ltVar = this.f25291zb) != null) {
            ltVar.lud();
        }
        int i5 = this.lud;
        if (i5 >= 0) {
            ycx(i5);
            zb(this.lud);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void lud() throws Resources.NotFoundException {
        if (this.ycx == null) {
            this.ycx = new wwx();
        }
        this.f25291zb.ycx(TextUtils.equals(this.ycx.ycx(), "vertical") ? 1 : 0).ycx("dot").sya(false).dj(this.ycx.dj() == 1).ycx(this.ycx.zb() == 1).sya(this.ycx.jw()).lud(this.ycx.jc() == 1).dj(this.ycx.fby()).zb(this.ycx.sya() == 1).jw(this.ycx.lud()).jc(this.ycx.lt()).fby(this.ycx.ul());
        this.f25291zb.setOnPageChangeListener(new com.bytedance.adsdk.ugeno.ul.sya() { // from class: com.bytedance.sdk.openadsdk.core.dj.lud.4
            @Override // com.bytedance.adsdk.ugeno.ul.sya
            public void ycx(boolean z11, int i5, float f11, int i11) {
            }

            @Override // com.bytedance.adsdk.ugeno.ul.sya
            public void ycx(boolean z11, int i5, int i11, boolean z12, boolean z13) {
                lud.this.sya(i5);
                lud.this.lud = i5;
                lud.this.ycx(i5);
                lud.this.zb(i5);
            }

            @Override // com.bytedance.adsdk.ugeno.ul.sya
            public void ycx(boolean z11, int i5) {
                if (i5 == 1 || i5 == 2) {
                    lud.this.zb(-1);
                } else if (i5 == 0) {
                    lud ludVar = lud.this;
                    ludVar.ycx(ludVar.lud);
                }
            }
        });
        zb(this.sya);
        this.f25291zb.sya();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sya() {
        lt ltVar;
        wwx wwxVar = this.ycx;
        if (wwxVar != null && wwxVar.zb() == 1 && (ltVar = this.f25291zb) != null) {
            ltVar.lt();
        }
        if (this.lud >= 0) {
            zb(-1);
        }
    }

    public void ycx(Context context, float f11, float f12) {
        int iZb = dc.zb(context, f11);
        int iZb2 = dc.zb(context, f12);
        ViewGroup.LayoutParams layoutParams = this.f25291zb.getLayoutParams();
        if (layoutParams == null) {
            layoutParams = new ViewGroup.LayoutParams(iZb, iZb2);
        }
        layoutParams.width = iZb;
        layoutParams.height = iZb2;
        this.f25291zb.setLayoutParams(layoutParams);
    }

    public void zb(int i5) {
        ycx ycxVar;
        for (int i11 = 0; i11 < this.sya.size(); i11++) {
            try {
                if (i11 != i5 && (ycxVar = this.sya.get(i11)) != null) {
                    ycxVar.jw();
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7CybDbl7wphaxVifAg==", "ee8jmwauWtCJWtJPoRCuKVzrPw==", "S+84hgaTfc+FWOFUiBSvOw==", 231);
                th2.getMessage();
                return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sya(int i5) {
        ycx ycxVar;
        try {
            int i11 = this.lud;
            if (i11 != -1 && i11 != i5 && (ycxVar = this.sya.get(i11)) != null) {
                ycxVar.dj();
                ycxVar.fby();
            }
            ycx ycxVar2 = this.sya.get(i5);
            if (ycxVar2 != null) {
                ycxVar2.lud();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7CybDbl7wphaxVifAg==", "ee8jmwauWtCJWtJPoRCuKVzrPw==", "Ses9mhGoTNGFRMM=", 191);
        }
    }

    private void zb(List<ycx> list) {
        if (list == null || list.isEmpty()) {
            return;
        }
        for (int i5 = 0; i5 < list.size(); i5++) {
            this.f25291zb.ycx((lt) list.get(i5).ycx());
        }
    }

    public void ycx(List<ycx> list) {
        this.sya = list;
    }

    public void ycx(final int i5) {
        ycx ycxVar;
        try {
            final int size = this.sya.size();
            if (i5 < size && (ycxVar = this.sya.get(i5)) != null) {
                ycxVar.ycx(new com.bytedance.sdk.openadsdk.ycx.ycx.zb() { // from class: com.bytedance.sdk.openadsdk.core.dj.lud.5
                    @Override // com.bytedance.sdk.openadsdk.ycx.ycx.zb
                    public void ycx() {
                        int i11 = i5 + 1;
                        if (i11 >= size) {
                            return;
                        }
                        lud.this.ycx(i11);
                    }
                });
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7CybDbl7wphaxVifAg==", "ee8jmwauWtCJWtJPoRCuKVzrPw==", "S+IsjCCpe9WFRMNrhRWlJw==", Sdk.SDKError.Reason.AD_RESPONSE_EMPTY_VALUE);
            th2.getMessage();
        }
    }

    public View zb() {
        return this.f25291zb;
    }

    public void ycx() {
        if (this.f25291zb != null) {
            try {
                List<ycx> list = this.sya;
                if (list != null && !list.isEmpty()) {
                    for (int i5 = 0; i5 < this.sya.size(); i5++) {
                        this.sya.get(i5).ul();
                    }
                }
                this.lud = -1;
                this.f25291zb.dj();
                this.f25291zb.setSwiperWindowFocusChangedListener(null);
                this.f25291zb.setSwiperVisibleChangeListener(null);
                this.f25291zb.removeOnAttachStateChangeListener(this.f25290ul);
                this.f25291zb = null;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7CybDbl7wphaxVifAg==", "ee8jmwauWtCJWtJPoRCuKVzrPw==", "X+s+gRGzcA==", 260);
            }
        }
    }
}
