package com.bytedance.sdk.openadsdk.core.dj;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.api.banner.PAGBannerAd;
import com.bytedance.sdk.openadsdk.api.banner.PAGBannerAdInteractionCallback;
import com.bytedance.sdk.openadsdk.api.banner.PAGBannerAdInteractionListener;
import com.bytedance.sdk.openadsdk.api.banner.PAGBannerSize;
import com.bytedance.sdk.openadsdk.api.model.PAGErrorModel;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.xz;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class ul extends PAGBannerAd {

    /* renamed from: dj, reason: collision with root package name */
    private boolean f25295dj;

    /* renamed from: ea, reason: collision with root package name */
    private List<com.bytedance.sdk.openadsdk.core.dj.ycx> f25296ea;
    private int fby;

    /* renamed from: jc, reason: collision with root package name */
    private final AtomicBoolean f25297jc = new AtomicBoolean(false);

    /* renamed from: jw, reason: collision with root package name */
    private int f25298jw;

    /* renamed from: lt, reason: collision with root package name */
    private lud f25299lt;
    private boolean lud;
    protected AdSlot sya;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f25300ul;
    protected Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected tn f25301zb;

    public interface ycx {
        void ycx();
    }

    public ul(Context context, tn tnVar, AdSlot adSlot) {
        this.fby = 0;
        this.f25298jw = 0;
        this.ycx = context;
        this.f25301zb = tnVar;
        this.sya = adSlot;
        this.fby = (int) adSlot.getExpressViewAcceptedWidth();
        this.f25298jw = (int) this.sya.getExpressViewAcceptedHeight();
        ycx(this.f25301zb);
        zb(tnVar);
    }

    private void zb(tn tnVar) {
        com.bytedance.sdk.openadsdk.core.model.ycx ycxVarDj;
        if (tnVar == null || (ycxVarDj = tnVar.dj()) == null) {
            return;
        }
        this.f25296ea = new ArrayList();
        int size = ycxVarDj.lud().size();
        if (!this.f25300ul) {
            this.f25296ea.add(new com.bytedance.sdk.openadsdk.core.dj.ycx(this.ycx, tnVar, this.sya, this, false));
            return;
        }
        this.f25299lt = new lud(ycxVarDj.fby(), this.ycx, this.fby, this.f25298jw);
        for (int i5 = 0; i5 < size; i5++) {
            this.sya.setExpressViewAccepted(((this.fby - dc.sya(this.ycx, ycxVarDj.fby().lud())) - dc.sya(this.ycx, ycxVarDj.fby().lt())) - (dc.sya(this.ycx, ycxVarDj.fby().ul()) * 2), this.f25298jw);
            tn tnVar2 = ycxVarDj.lud().get(i5);
            if (i5 != 0) {
                ycx(i5, tnVar2);
            }
            com.bytedance.sdk.openadsdk.core.dj.ycx ycxVar = new com.bytedance.sdk.openadsdk.core.dj.ycx(this.ycx, tnVar2, this.sya, this, true);
            ycxVar.ycx(i5);
            this.f25296ea.add(ycxVar);
        }
        this.f25299lt.ycx(this.f25296ea);
    }

    @Override // com.bytedance.sdk.openadsdk.api.banner.PAGBannerAd
    public void destroy() {
        try {
            List<com.bytedance.sdk.openadsdk.core.dj.ycx> list = this.f25296ea;
            if (list == null || list.isEmpty()) {
                return;
            }
            if (this.f25300ul) {
                this.f25299lt.ycx();
            } else {
                this.f25296ea.get(0).ul();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7CybDbl7wphaxVifAg==", "a88KtwKyZ8KSa9N0gQGs", "X+s+gRGzcA==", 261);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.api.banner.PAGBannerAd
    public PAGBannerSize getBannerSize() {
        return this.sya != null ? new PAGBannerSize(this.fby, this.f25298jw) : new PAGBannerSize(0, 0);
    }

    @Override // com.bytedance.sdk.openadsdk.api.banner.PAGBannerAd
    public View getBannerView() {
        try {
            List<com.bytedance.sdk.openadsdk.core.dj.ycx> list = this.f25296ea;
            if (list != null && !list.isEmpty()) {
                return this.f25300ul ? this.f25299lt.zb() : this.f25296ea.get(0).ycx();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7CybDbl7wphaxVifAg==", "a88KtwKyZ8KSa9N0gQGs", "XOs5twKyZ8KSfN5Ymw==", 236);
        }
        return new View(this.ycx);
    }

    @Override // com.bytedance.sdk.openadsdk.api.PangleAd
    public Object getExtraInfo(String str) {
        tn tnVar = this.f25301zb;
        if (tnVar == null || tnVar.ab() == null) {
            return null;
        }
        try {
            return this.f25301zb.ab().get(str);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7CybDbl7wphaxVifAg==", "a88KtwKyZ8KSa9N0gQGs", "XOs5sBuoe8apRNFS", PerAppFeatureCatalog.MAX_TOOLS);
            htf.sya("PAGBannerAdImpl", th2.getMessage());
            return null;
        }
    }

    @Override // com.bytedance.sdk.openadsdk.api.PangleAd
    public Map<String, Object> getMediaExtraInfo() {
        tn tnVar = this.f25301zb;
        if (tnVar != null) {
            return tnVar.ab();
        }
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGClientBidding
    public void loss(Double d5, String str, String str2) {
        if (this.lud) {
            return;
        }
        xz.ycx(this.f25301zb, d5, str, str2);
        this.lud = true;
    }

    @Override // com.bytedance.sdk.openadsdk.api.banner.PAGBannerAd
    public void setAdInteractionCallback(final PAGBannerAdInteractionCallback pAGBannerAdInteractionCallback) {
        List<com.bytedance.sdk.openadsdk.core.dj.ycx> list = this.f25296ea;
        if (list == null || list.isEmpty()) {
            return;
        }
        for (int i5 = 0; i5 < this.f25296ea.size(); i5++) {
            this.f25296ea.get(i5).ycx(new PAGBannerAdInteractionCallback() { // from class: com.bytedance.sdk.openadsdk.core.dj.ul.1
                @Override // com.bytedance.sdk.openadsdk.api.banner.PAGBannerAdInteractionCallback, com.bytedance.sdk.openadsdk.api.PAGAdListener
                public void onAdClicked() {
                    PAGBannerAdInteractionCallback pAGBannerAdInteractionCallback2 = pAGBannerAdInteractionCallback;
                    if (pAGBannerAdInteractionCallback2 != null) {
                        pAGBannerAdInteractionCallback2.onAdClicked();
                    }
                }

                @Override // com.bytedance.sdk.openadsdk.api.banner.PAGBannerAdInteractionCallback, com.bytedance.sdk.openadsdk.api.PAGAdListener
                public void onAdDismissed() {
                    PAGBannerAdInteractionCallback pAGBannerAdInteractionCallback2 = pAGBannerAdInteractionCallback;
                    if (pAGBannerAdInteractionCallback2 != null) {
                        pAGBannerAdInteractionCallback2.onAdDismissed();
                    }
                }

                @Override // com.bytedance.sdk.openadsdk.api.banner.PAGBannerAdInteractionCallback
                public void onAdShowFailed(PAGErrorModel pAGErrorModel) {
                    PAGBannerAdInteractionCallback pAGBannerAdInteractionCallback2 = pAGBannerAdInteractionCallback;
                    if (pAGBannerAdInteractionCallback2 != null) {
                        pAGBannerAdInteractionCallback2.onAdShowFailed(pAGErrorModel);
                    }
                }

                @Override // com.bytedance.sdk.openadsdk.api.banner.PAGBannerAdInteractionCallback, com.bytedance.sdk.openadsdk.api.PAGAdListener
                public void onAdShowed() {
                    PAGBannerAdInteractionCallback pAGBannerAdInteractionCallback2;
                    if (!ul.this.f25297jc.compareAndSet(false, true) || (pAGBannerAdInteractionCallback2 = pAGBannerAdInteractionCallback) == null) {
                        return;
                    }
                    pAGBannerAdInteractionCallback2.onAdShowed();
                }
            });
        }
    }

    @Override // com.bytedance.sdk.openadsdk.api.banner.PAGBannerAd
    public void setAdInteractionListener(final PAGBannerAdInteractionListener pAGBannerAdInteractionListener) {
        List<com.bytedance.sdk.openadsdk.core.dj.ycx> list = this.f25296ea;
        if (list == null || list.isEmpty()) {
            return;
        }
        for (int i5 = 0; i5 < this.f25296ea.size(); i5++) {
            this.f25296ea.get(i5).ycx(new PAGBannerAdInteractionListener() { // from class: com.bytedance.sdk.openadsdk.core.dj.ul.2
                @Override // com.bytedance.sdk.openadsdk.api.PAGAdListener
                public void onAdClicked() {
                    PAGBannerAdInteractionListener pAGBannerAdInteractionListener2 = pAGBannerAdInteractionListener;
                    if (pAGBannerAdInteractionListener2 != null) {
                        pAGBannerAdInteractionListener2.onAdClicked();
                    }
                }

                @Override // com.bytedance.sdk.openadsdk.api.PAGAdListener
                public void onAdDismissed() {
                    PAGBannerAdInteractionListener pAGBannerAdInteractionListener2 = pAGBannerAdInteractionListener;
                    if (pAGBannerAdInteractionListener2 != null) {
                        pAGBannerAdInteractionListener2.onAdDismissed();
                    }
                }

                @Override // com.bytedance.sdk.openadsdk.api.PAGAdListener
                public void onAdShowed() {
                    PAGBannerAdInteractionListener pAGBannerAdInteractionListener2;
                    if (!ul.this.f25297jc.compareAndSet(false, true) || (pAGBannerAdInteractionListener2 = pAGBannerAdInteractionListener) == null) {
                        return;
                    }
                    pAGBannerAdInteractionListener2.onAdShowed();
                }
            });
        }
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGClientBidding
    public void win(Double d5) {
        if (this.f25295dj) {
            return;
        }
        xz.ycx(this.f25301zb, d5);
        this.f25295dj = true;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void ycx(tn tnVar) {
        com.bytedance.sdk.openadsdk.core.model.ycx ycxVarDj;
        boolean z11;
        if (tnVar == null || (ycxVarDj = tnVar.dj()) == null) {
            return;
        }
        if (ycxVarDj.jw()) {
            z11 = ycxVarDj.lud().size() > 1;
        }
        this.f25300ul = z11;
    }

    public boolean ycx() {
        return this.f25300ul;
    }

    private void ycx(int i5, tn tnVar) {
        if (i5 != 0) {
            if (!TextUtils.isEmpty(tnVar.nzi())) {
                tnVar.syc("0");
            }
            Map<String, Object> mapAb = tnVar.ab();
            if (mapAb == null || !mapAb.containsKey("price")) {
                return;
            }
            mapAb.put("price", "0");
        }
    }
}
