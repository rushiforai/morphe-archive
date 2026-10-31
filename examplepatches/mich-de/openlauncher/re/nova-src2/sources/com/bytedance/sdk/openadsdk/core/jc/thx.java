package com.bytedance.sdk.openadsdk.core.jc;

import android.app.Activity;
import android.content.Context;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.SparseArray;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import b.c0;
import b.u4;
import com.bytedance.sdk.component.adexpress.zb.jc;
import com.bytedance.sdk.component.adexpress.zb.ry;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.TTDislikeDialogAbstract;
import com.bytedance.sdk.openadsdk.activity.single.IABLandingPageActivity;
import com.bytedance.sdk.openadsdk.activity.single.TTDelegateActivity;
import com.bytedance.sdk.openadsdk.activity.single.TTWebsiteActivity;
import com.bytedance.sdk.openadsdk.api.PAGExpressAdWrapperListener;
import com.bytedance.sdk.openadsdk.core.dj.ul;
import com.bytedance.sdk.openadsdk.core.ifb;
import com.bytedance.sdk.openadsdk.core.kgy;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.ry.lt.ycx;
import com.bytedance.sdk.openadsdk.core.sya.sya;
import com.bytedance.sdk.openadsdk.core.sya.ycx;
import com.bytedance.sdk.openadsdk.core.yzp;
import com.bytedance.sdk.openadsdk.oty.zb.lud;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.ycx;
import com.moloco.sdk.internal.services.init.i;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class thx extends com.bytedance.sdk.openadsdk.core.lt.sya implements com.bytedance.sdk.component.adexpress.dynamic.dj, com.bytedance.sdk.component.adexpress.zb.fby, com.bytedance.sdk.component.adexpress.zb.syc, dy, ycx.InterfaceC0083ycx {
    private float aeu;

    /* renamed from: aq, reason: collision with root package name */
    private float f25450aq;

    /* renamed from: av, reason: collision with root package name */
    public com.bytedance.sdk.component.adexpress.zb.dj<? extends View> f25451av;
    private final Runnable bba;

    /* renamed from: bh, reason: collision with root package name */
    private float f25452bh;
    protected com.bytedance.sdk.component.adexpress.zb.zb bhi;
    private long bjp;
    private tn dc;

    /* renamed from: dj, reason: collision with root package name */
    private TTDislikeDialogAbstract f25453dj;
    private com.bytedance.sdk.component.adexpress.zb.ry dqs;
    private List<com.bytedance.sdk.component.adexpress.zb.jc> duz;

    /* renamed from: dv, reason: collision with root package name */
    int f25454dv;
    private String dwi;

    /* renamed from: dy, reason: collision with root package name */
    protected com.bytedance.sdk.component.adexpress.zb.sya f25455dy;

    /* renamed from: ea, reason: collision with root package name */
    protected AdSlot f25456ea;
    private String fby;
    private float giw;

    /* renamed from: hf, reason: collision with root package name */
    public com.bytedance.sdk.openadsdk.dj.ul f25457hf;
    private com.bytedance.sdk.openadsdk.core.ry.lt.dj hpv;
    protected String htf;
    private boolean ifb;

    /* renamed from: iq, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.zb.jw f25458iq;

    /* renamed from: jc, reason: collision with root package name */
    protected String f25459jc;

    /* renamed from: jw, reason: collision with root package name */
    protected final Context f25460jw;
    private com.bytedance.sdk.openadsdk.core.ry.sya.zb kgy;

    /* renamed from: lt, reason: collision with root package name */
    private jw f25461lt;
    private PAGExpressAdWrapperListener lud;

    /* renamed from: lv, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.zb.lt f25462lv;

    /* renamed from: mp, reason: collision with root package name */
    private tru f25463mp;
    private boolean nji;
    private ul.ycx oby;

    /* renamed from: ok, reason: collision with root package name */
    protected com.bytedance.sdk.openadsdk.core.model.tn f25464ok;
    boolean oty;
    boolean pmi;

    /* renamed from: rl, reason: collision with root package name */
    private final Runnable f25465rl;
    protected Activity rmf;
    private String rmy;

    /* renamed from: ry, reason: collision with root package name */
    public FrameLayout f25466ry;

    /* renamed from: sg, reason: collision with root package name */
    private float f25467sg;
    private com.bytedance.sdk.openadsdk.sya.sya sya;
    protected boolean syc;
    private final AtomicBoolean sz;
    protected HashSet<String> thx;

    /* renamed from: tn, reason: collision with root package name */
    public boolean f25468tn;
    long tru;

    /* renamed from: tx, reason: collision with root package name */
    private final Runnable f25469tx;

    /* renamed from: uf, reason: collision with root package name */
    private jc.ycx f25470uf;

    /* renamed from: uh, reason: collision with root package name */
    protected int f25471uh;

    /* renamed from: ui, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.ry.zb.ul f25472ui;

    /* renamed from: ul, reason: collision with root package name */
    private jc f25473ul;

    /* renamed from: ur, reason: collision with root package name */
    private int f25474ur;

    /* renamed from: uu, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.dj.jw f25475uu;

    /* renamed from: uz, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.zb.dy f25476uz;
    protected com.bytedance.sdk.openadsdk.dj.dj.lud wie;

    /* renamed from: wr, reason: collision with root package name */
    private final SparseArray<sya.ycx> f25477wr;
    protected ViewGroup wwx;

    /* renamed from: xf, reason: collision with root package name */
    private ycx.zb f25478xf;
    protected boolean xkz;
    private final ViewTreeObserver.OnScrollChangedListener xym;

    /* renamed from: xz, reason: collision with root package name */
    private float f25479xz;
    private boolean ycx;

    /* renamed from: yi, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.jc.sya f25480yi;
    private final ycx yzp;

    /* renamed from: zb, reason: collision with root package name */
    private int f25481zb;

    /* renamed from: zr, reason: collision with root package name */
    private final Runnable f25482zr;

    public static final class sya {
        private boolean sya;
        private boolean ycx;

        /* renamed from: zb, reason: collision with root package name */
        private boolean f25484zb;

        private sya() {
            this.ycx = true;
            this.f25484zb = true;
            this.sya = false;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void ycx(boolean z11, boolean z12, boolean z13) {
            this.sya = z11;
            this.f25484zb = z12;
            this.ycx = z13;
        }
    }

    public static final class ycx {

        /* renamed from: dj, reason: collision with root package name */
        private final Set<String> f25485dj;
        private zb lud;
        private boolean sya;
        private boolean ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final sya f25486zb;

        private ycx() {
            this.ycx = false;
            this.f25486zb = new sya();
            this.sya = false;
            this.f25485dj = new HashSet();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void dj() {
            this.lud = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public boolean sya() {
            return (this.ycx || this.sya || ycx()) ? false : true;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public boolean zb() {
            return (this.f25486zb.ycx && this.f25486zb.f25484zb && this.f25486zb.sya) ? false : true;
        }

        private boolean ycx() {
            return !this.f25485dj.isEmpty();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void ycx(String str, String str2, boolean z11) {
            this.lud = new zb(str, str2, z11);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void ycx(boolean z11, boolean z12, boolean z13) {
            this.ycx = false;
            this.sya = false;
            this.f25485dj.clear();
            this.f25486zb.ycx(z11, z12, z13);
            dj();
        }
    }

    public static final class zb {
        final boolean sya;
        final String ycx;

        /* renamed from: zb, reason: collision with root package name */
        final String f25487zb;

        private zb(String str, String str2, boolean z11) {
            this.ycx = str;
            this.f25487zb = str2;
            this.sya = z11;
        }
    }

    public thx(Activity activity, Context context, com.bytedance.sdk.openadsdk.core.model.tn tnVar, AdSlot adSlot, String str) {
        super(context);
        this.ycx = true;
        this.f25481zb = 0;
        this.f25459jc = "embeded_ad";
        this.fby = null;
        this.syc = false;
        this.pmi = true;
        this.f25471uh = -1;
        this.rmy = b.f42142b;
        this.yzp = new ycx();
        this.f25468tn = false;
        this.nji = true;
        this.f25454dv = -1;
        this.f25457hf = new com.bytedance.sdk.openadsdk.dj.ul();
        this.tru = 0L;
        this.sz = new AtomicBoolean(false);
        this.xym = new ViewTreeObserver.OnScrollChangedListener() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.1
            @Override // android.view.ViewTreeObserver.OnScrollChangedListener
            public void onScrollChanged() {
                thx thxVar = thx.this;
                if (thxVar.pmi && thxVar.jc()) {
                    thx.this.av();
                    thx thxVar2 = thx.this;
                    thxVar2.removeCallbacks(thxVar2.f25465rl);
                    thx thxVar3 = thx.this;
                    thxVar3.postDelayed(thxVar3.f25465rl, 500L);
                }
            }
        };
        this.f25465rl = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.3
            @Override // java.lang.Runnable
            public void run() {
                if (!ifb.ycx(thx.this, 0, 5, false)) {
                    thx.this.lt(8);
                } else {
                    thx thxVar = thx.this;
                    thxVar.lt(thxVar.getVisibility());
                }
            }
        };
        this.f25482zr = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.4
            @Override // java.lang.Runnable
            public void run() {
                thx.this.lt(0);
            }
        };
        this.bba = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.5
            @Override // java.lang.Runnable
            public void run() {
                thx.this.lt(8);
            }
        };
        this.f25474ur = 8;
        this.f25477wr = new SparseArray<>();
        this.giw = -1.0f;
        this.f25467sg = -1.0f;
        this.f25452bh = -1.0f;
        this.f25450aq = -1.0f;
        this.bjp = 0L;
        this.f25469tx = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.10
            @Override // java.lang.Runnable
            public void run() {
                thx.this.dj("delayed_confirm");
            }
        };
        this.rmf = activity;
        this.f25459jc = str;
        this.f25460jw = context;
        this.f25464ok = tnVar;
        this.f25456ea = adSlot;
        this.f25468tn = false;
        ul();
    }

    private void aeu() {
        List<com.bytedance.sdk.component.adexpress.zb.jc> list = this.duz;
        if (list == null) {
            return;
        }
        Iterator<com.bytedance.sdk.component.adexpress.zb.jc> it = list.iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void av() {
        if (this.sz.get()) {
            this.f25457hf.ycx(System.currentTimeMillis(), ifb.ycx(this));
        }
    }

    private void bhi() {
        thx thxVar;
        com.bytedance.sdk.openadsdk.core.ry.lt.dj djVar;
        com.bytedance.sdk.openadsdk.core.model.tn tnVar;
        com.bytedance.sdk.openadsdk.core.model.tn tnVar2 = this.f25464ok;
        if (tnVar2 == null || tnVar2.an() != 1 || this.f25464ok.aq() == 2) {
            if (!com.bytedance.sdk.openadsdk.core.ry.lt.ycx.lt.ycx(this.f25459jc) || (tnVar = this.f25464ok) == null || tnVar.aq() == 2) {
                com.bytedance.sdk.openadsdk.core.fby.ycx.ycx ycxVar = new com.bytedance.sdk.openadsdk.core.fby.ycx.ycx();
                int i5 = this.f25481zb;
                if (i5 != 0) {
                    if (i5 == 3) {
                        com.bytedance.sdk.component.adexpress.dynamic.lud.ul ulVar = new com.bytedance.sdk.component.adexpress.dynamic.lud.ul();
                        Context applicationContext = this.f25460jw.getApplicationContext();
                        com.bytedance.sdk.component.adexpress.zb.ry ryVar = this.dqs;
                        boolean z11 = this.f25468tn;
                        com.bytedance.sdk.component.adexpress.zb.zb zbVar = new com.bytedance.sdk.component.adexpress.zb.zb(applicationContext, ryVar, z11, ulVar, this, ycxVar, new ul(this.f25460jw, z11, ulVar, ryVar, ycxVar));
                        this.bhi = zbVar;
                        this.duz.add(zbVar);
                        return;
                    }
                    if (i5 == 7) {
                        com.bytedance.sdk.openadsdk.core.ry.lt.dj djVar2 = new com.bytedance.sdk.openadsdk.core.ry.lt.dj(this.f25460jw, this.f25464ok, this.f25468tn, (com.bytedance.sdk.openadsdk.core.ry.lt.ycx) this.dqs, this);
                        this.hpv = djVar2;
                        com.bytedance.sdk.openadsdk.core.ry.zb.ul ulVar2 = new com.bytedance.sdk.openadsdk.core.ry.zb.ul(this.f25460jw, djVar2, this, this.dqs);
                        this.f25472ui = ulVar2;
                        ulVar2.ycx(this);
                        this.duz.add(this.f25472ui);
                        return;
                    }
                    switch (i5) {
                        case 10:
                            if (!this.ifb || (djVar = this.hpv) == null) {
                                thxVar = this;
                                thxVar.hpv = new com.bytedance.sdk.openadsdk.core.ry.lt.ul(this.f25460jw, this.f25464ok, this.f25468tn, (com.bytedance.sdk.openadsdk.core.ry.lt.ycx) this.dqs, this);
                            } else {
                                djVar.ycx(this.f25464ok, this.f25468tn, (com.bytedance.sdk.openadsdk.core.ry.lt.ycx) this.dqs, this);
                                thxVar = this;
                            }
                            com.bytedance.sdk.openadsdk.core.ry.zb.ul ulVar3 = new com.bytedance.sdk.openadsdk.core.ry.zb.ul(thxVar.f25460jw, thxVar.hpv, this, thxVar.dqs);
                            thxVar.f25472ui = ulVar3;
                            ulVar3.ycx(this);
                            thxVar.duz.add(thxVar.f25472ui);
                            break;
                        case 11:
                            oty otyVar = new oty(this.f25460jw, this.dqs, this.wie, this.f25464ok);
                            this.f25463mp = otyVar;
                            otyVar.zb(this.rmf);
                            com.bytedance.sdk.component.adexpress.zb.dy dyVar = new com.bytedance.sdk.component.adexpress.zb.dy(this.f25460jw, this.dqs, this.f25463mp, this);
                            this.f25476uz = dyVar;
                            this.duz.add(dyVar);
                            break;
                    }
                    return;
                }
                tru truVar = new tru(this.f25460jw, this.dqs, this.wie, this.f25464ok);
                this.f25463mp = truVar;
                com.bytedance.sdk.component.adexpress.zb.dy dyVar2 = new com.bytedance.sdk.component.adexpress.zb.dy(this.f25460jw, this.dqs, truVar, this);
                this.f25476uz = dyVar2;
                this.duz.add(dyVar2);
            }
        }
    }

    private void dy() {
        if (this.f25464ok.an() == 1 && this.f25464ok.wnd()) {
            pmi();
            this.f25470uf = new com.bytedance.sdk.component.adexpress.zb.ok(this.duz, this.f25458iq);
            return;
        }
        if (rmy()) {
            wie();
            return;
        }
        try {
            tru();
            tru truVar = new tru(this.f25460jw, this.dqs, this.wie, this.f25464ok);
            this.f25463mp = truVar;
            com.bytedance.sdk.component.adexpress.zb.dy dyVar = new com.bytedance.sdk.component.adexpress.zb.dy(this.f25460jw, this.dqs, truVar, this);
            this.f25476uz = dyVar;
            this.duz.add(dyVar);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "UuAkgTG5Z8OFWPRVjRiu", 614);
            com.bytedance.sdk.component.utils.htf.ycx("NativeExpressView", "NativeExpressView dynamicRender fail", e3);
        }
        pmi();
        this.f25470uf = new com.bytedance.sdk.component.adexpress.zb.ok(this.duz, this.f25458iq);
    }

    private boolean ifb() {
        return this.yzp.sya();
    }

    private boolean kgy() {
        return this.yzp.zb();
    }

    private void pmi() {
        if (com.bytedance.sdk.openadsdk.core.ry.lt.ycx.lt.ycx(this.f25459jc)) {
            com.bytedance.sdk.openadsdk.core.ry.lt.ycx.lt ltVar = new com.bytedance.sdk.openadsdk.core.ry.lt.ycx.lt(this.f25460jw, this.f25464ok, this.f25468tn, (com.bytedance.sdk.openadsdk.core.ry.lt.ycx) this.dqs, this, this.aeu, this.f25479xz, this.syc, this.f25459jc);
            com.bytedance.sdk.openadsdk.core.ry.zb.ul ulVar = new com.bytedance.sdk.openadsdk.core.ry.zb.ul(this.f25460jw, ltVar, this, this.dqs);
            ltVar.ycx((dy) this);
            this.duz.add(ulVar);
            return;
        }
        com.bytedance.sdk.component.adexpress.zb.lt ltVar2 = new com.bytedance.sdk.component.adexpress.zb.lt(this.f25460jw, this.dqs, new wwx(this, this.dqs));
        this.f25462lv = ltVar2;
        this.duz.add(ltVar2);
    }

    private boolean rmf() {
        return com.bytedance.sdk.openadsdk.core.model.tn.lud(this.f25464ok);
    }

    private boolean rmy() {
        return TextUtils.equals(this.f25459jc, "fullscreen_interstitial_ad") || TextUtils.equals(this.f25459jc, "rewarded_video") || TextUtils.equals("open_ad", this.f25459jc) || tru.zb(this.f25459jc) || TextUtils.equals(this.f25459jc, "embeded_ad");
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00ad  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00c7  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00cb  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00d6  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00fa  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void syc() {
        long jOptLong;
        boolean z11;
        ry.ycx ycxVar;
        tn.ycx ycxVarJp;
        fby();
        this.f25458iq = new xkz(this.wie, this.f25459jc, this.f25464ok, this.fby, this.ifb);
        final boolean zAg = this.f25464ok.ag();
        try {
            ycxVarJp = this.f25464ok.jp();
        } catch (Exception e3) {
            try {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "UuAkgTG5Z8OFWOVYnQSlO08=", 481);
            } catch (Exception e11) {
                e = e11;
                jOptLong = 0;
                z11 = false;
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "UuAkgTG5Z8OFWOVYnQSlO08=", 495);
                long jMin = Math.min(Math.max(jOptLong, 0L), h.f42227c);
                int renderTimeout = getRenderTimeout();
                if (this.f25464ok.ci() == null) {
                }
                int i5 = this.f25454dv;
                this.oty = i5 == -1 && i5 < ((int) d);
                if (com.bytedance.sdk.openadsdk.core.ry.lt.ycx(this.f25464ok)) {
                    ycx.C0076ycx c0076ycx = new ycx.C0076ycx();
                    if (com.bytedance.sdk.openadsdk.core.ry.lt.ycx(this.f25464ok)) {
                    }
                    c0076ycx.ycx((com.bytedance.adsdk.ugeno.core.pmi) this.f25458iq);
                    c0076ycx.ycx(this.aeu);
                    c0076ycx.zb(this.f25479xz);
                    c0076ycx.ul(this.ifb);
                    ycxVar = c0076ycx;
                }
                ycxVar.lud(zAg);
                ycxVar.ycx(this.f25459jc).zb(this.f25464ok.m147if()).sya(this.f25464ok.wbt()).dj(this.f25464ok.pks()).ycx(this.f25458iq).dj(this.f25464ok.bxj()).ycx(renderTimeout).zb(this.f25464ok.kfb()).sya(this.nji).zb(this.f25464ok.wk()).ycx(jMin).sya(this.f25464ok.liq()).ycx(com.bytedance.sdk.openadsdk.core.jc.zb.sya.zb(this.f25464ok)).dj(z11).lud(this.f25454dv).ycx(this.oty).ycx(d).lt(com.bytedance.sdk.openadsdk.core.settings.ea.zb().uh()).lt(com.bytedance.sdk.openadsdk.dv.lud.ycx("inject_data_reuse_open", 0)).ul(this.f25464ok.mnf().ycx()).fby(this.f25464ok.mnf().zb()).ycx(new com.bytedance.sdk.component.adexpress.zb.lud() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.6
                    @Override // com.bytedance.sdk.component.adexpress.zb.lud
                    public JSONObject ycx() {
                        try {
                            thx thxVar = thx.this;
                            com.bytedance.sdk.openadsdk.core.model.tn tnVar = thxVar.f25464ok;
                            if (tnVar == null) {
                                thxVar.rmy = "material is null";
                                return null;
                            }
                            if (zAg) {
                                thxVar.dc = new tn();
                                float f11 = thx.this.aeu;
                                float f12 = thx.this.f25479xz;
                                thx thxVar2 = thx.this;
                                JSONObject jSONObjectYcx = com.bytedance.sdk.openadsdk.core.jc.zb.sya.ycx(f11, f12, thxVar2.syc, thxVar2.f25464ok, thxVar2.f25459jc, thxVar2.dc);
                                thx.this.rmy = com.bytedance.sdk.openadsdk.core.jc.zb.sya.ycx();
                                return jSONObjectYcx;
                            }
                            if (!com.bytedance.sdk.openadsdk.core.ry.lt.ycx(tnVar)) {
                                float f13 = thx.this.aeu;
                                float f14 = thx.this.f25479xz;
                                thx thxVar3 = thx.this;
                                JSONObject jSONObjectYcx2 = com.bytedance.sdk.openadsdk.core.jc.zb.sya.ycx(f13, f14, thxVar3.syc, thxVar3.f25464ok);
                                thx.this.sya(jSONObjectYcx2);
                                return jSONObjectYcx2;
                            }
                            thx.this.dc = new tn();
                            thx thxVar4 = thx.this;
                            JSONObject jSONObjectYcx3 = com.bytedance.sdk.openadsdk.core.ry.lt.ycx(thxVar4.f25464ok, thxVar4.dc);
                            thx.this.rmy = com.bytedance.sdk.openadsdk.core.ry.lt.ycx();
                            return jSONObjectYcx3;
                        } catch (Throwable th2) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUyqeA==", "XOs5oQaxecuBXtJ0ghc=", 570);
                            return null;
                        }
                    }
                });
                ycx(ycxVar);
                this.dqs = ycxVar.ycx();
            }
        }
        if (ycxVarJp != null) {
            String strJw = ycxVarJp.jw();
            jOptLong = !TextUtils.isEmpty(strJw) ? new JSONObject(strJw).optLong("render_delay_time") : 0L;
            try {
                if (!com.bytedance.sdk.openadsdk.core.model.tn.lud(this.f25464ok)) {
                    z11 = com.bytedance.sdk.openadsdk.core.pmi.dj().xkz(this.fby) == 1;
                    try {
                        if (!com.bytedance.sdk.openadsdk.core.settings.ea.zb().syc(this.fby) || this.f25464ok.iq() == 5 || this.f25464ok.iq() == 6) {
                            z11 = true;
                        } else if (this.f25464ok.tz() == 3) {
                        }
                    } catch (Exception e12) {
                        e = e12;
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "UuAkgTG5Z8OFWOVYnQSlO08=", 495);
                        long jMin2 = Math.min(Math.max(jOptLong, 0L), h.f42227c);
                        int renderTimeout2 = getRenderTimeout();
                        if (this.f25464ok.ci() == null) {
                        }
                        int i52 = this.f25454dv;
                        this.oty = i52 == -1 && i52 < ((int) d);
                        if (com.bytedance.sdk.openadsdk.core.ry.lt.ycx(this.f25464ok)) {
                        }
                        ycxVar.lud(zAg);
                        ycxVar.ycx(this.f25459jc).zb(this.f25464ok.m147if()).sya(this.f25464ok.wbt()).dj(this.f25464ok.pks()).ycx(this.f25458iq).dj(this.f25464ok.bxj()).ycx(renderTimeout2).zb(this.f25464ok.kfb()).sya(this.nji).zb(this.f25464ok.wk()).ycx(jMin2).sya(this.f25464ok.liq()).ycx(com.bytedance.sdk.openadsdk.core.jc.zb.sya.zb(this.f25464ok)).dj(z11).lud(this.f25454dv).ycx(this.oty).ycx(d).lt(com.bytedance.sdk.openadsdk.core.settings.ea.zb().uh()).lt(com.bytedance.sdk.openadsdk.dv.lud.ycx("inject_data_reuse_open", 0)).ul(this.f25464ok.mnf().ycx()).fby(this.f25464ok.mnf().zb()).ycx(new com.bytedance.sdk.component.adexpress.zb.lud() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.6
                            @Override // com.bytedance.sdk.component.adexpress.zb.lud
                            public JSONObject ycx() {
                                try {
                                    thx thxVar = thx.this;
                                    com.bytedance.sdk.openadsdk.core.model.tn tnVar = thxVar.f25464ok;
                                    if (tnVar == null) {
                                        thxVar.rmy = "material is null";
                                        return null;
                                    }
                                    if (zAg) {
                                        thxVar.dc = new tn();
                                        float f11 = thx.this.aeu;
                                        float f12 = thx.this.f25479xz;
                                        thx thxVar2 = thx.this;
                                        JSONObject jSONObjectYcx = com.bytedance.sdk.openadsdk.core.jc.zb.sya.ycx(f11, f12, thxVar2.syc, thxVar2.f25464ok, thxVar2.f25459jc, thxVar2.dc);
                                        thx.this.rmy = com.bytedance.sdk.openadsdk.core.jc.zb.sya.ycx();
                                        return jSONObjectYcx;
                                    }
                                    if (!com.bytedance.sdk.openadsdk.core.ry.lt.ycx(tnVar)) {
                                        float f13 = thx.this.aeu;
                                        float f14 = thx.this.f25479xz;
                                        thx thxVar3 = thx.this;
                                        JSONObject jSONObjectYcx2 = com.bytedance.sdk.openadsdk.core.jc.zb.sya.ycx(f13, f14, thxVar3.syc, thxVar3.f25464ok);
                                        thx.this.sya(jSONObjectYcx2);
                                        return jSONObjectYcx2;
                                    }
                                    thx.this.dc = new tn();
                                    thx thxVar4 = thx.this;
                                    JSONObject jSONObjectYcx3 = com.bytedance.sdk.openadsdk.core.ry.lt.ycx(thxVar4.f25464ok, thxVar4.dc);
                                    thx.this.rmy = com.bytedance.sdk.openadsdk.core.ry.lt.ycx();
                                    return jSONObjectYcx3;
                                } catch (Throwable th2) {
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUyqeA==", "XOs5oQaxecuBXtJ0ghc=", 570);
                                    return null;
                                }
                            }
                        });
                        ycx(ycxVar);
                        this.dqs = ycxVar.ycx();
                    }
                }
            } catch (Exception e13) {
                e = e13;
                z11 = false;
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "UuAkgTG5Z8OFWOVYnQSlO08=", 495);
                long jMin22 = Math.min(Math.max(jOptLong, 0L), h.f42227c);
                int renderTimeout22 = getRenderTimeout();
                if (this.f25464ok.ci() == null) {
                }
                int i522 = this.f25454dv;
                this.oty = i522 == -1 && i522 < ((int) d);
                if (com.bytedance.sdk.openadsdk.core.ry.lt.ycx(this.f25464ok)) {
                }
                ycxVar.lud(zAg);
                ycxVar.ycx(this.f25459jc).zb(this.f25464ok.m147if()).sya(this.f25464ok.wbt()).dj(this.f25464ok.pks()).ycx(this.f25458iq).dj(this.f25464ok.bxj()).ycx(renderTimeout22).zb(this.f25464ok.kfb()).sya(this.nji).zb(this.f25464ok.wk()).ycx(jMin22).sya(this.f25464ok.liq()).ycx(com.bytedance.sdk.openadsdk.core.jc.zb.sya.zb(this.f25464ok)).dj(z11).lud(this.f25454dv).ycx(this.oty).ycx(d).lt(com.bytedance.sdk.openadsdk.core.settings.ea.zb().uh()).lt(com.bytedance.sdk.openadsdk.dv.lud.ycx("inject_data_reuse_open", 0)).ul(this.f25464ok.mnf().ycx()).fby(this.f25464ok.mnf().zb()).ycx(new com.bytedance.sdk.component.adexpress.zb.lud() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.6
                    @Override // com.bytedance.sdk.component.adexpress.zb.lud
                    public JSONObject ycx() {
                        try {
                            thx thxVar = thx.this;
                            com.bytedance.sdk.openadsdk.core.model.tn tnVar = thxVar.f25464ok;
                            if (tnVar == null) {
                                thxVar.rmy = "material is null";
                                return null;
                            }
                            if (zAg) {
                                thxVar.dc = new tn();
                                float f11 = thx.this.aeu;
                                float f12 = thx.this.f25479xz;
                                thx thxVar2 = thx.this;
                                JSONObject jSONObjectYcx = com.bytedance.sdk.openadsdk.core.jc.zb.sya.ycx(f11, f12, thxVar2.syc, thxVar2.f25464ok, thxVar2.f25459jc, thxVar2.dc);
                                thx.this.rmy = com.bytedance.sdk.openadsdk.core.jc.zb.sya.ycx();
                                return jSONObjectYcx;
                            }
                            if (!com.bytedance.sdk.openadsdk.core.ry.lt.ycx(tnVar)) {
                                float f13 = thx.this.aeu;
                                float f14 = thx.this.f25479xz;
                                thx thxVar3 = thx.this;
                                JSONObject jSONObjectYcx2 = com.bytedance.sdk.openadsdk.core.jc.zb.sya.ycx(f13, f14, thxVar3.syc, thxVar3.f25464ok);
                                thx.this.sya(jSONObjectYcx2);
                                return jSONObjectYcx2;
                            }
                            thx.this.dc = new tn();
                            thx thxVar4 = thx.this;
                            JSONObject jSONObjectYcx3 = com.bytedance.sdk.openadsdk.core.ry.lt.ycx(thxVar4.f25464ok, thxVar4.dc);
                            thx.this.rmy = com.bytedance.sdk.openadsdk.core.ry.lt.ycx();
                            return jSONObjectYcx3;
                        } catch (Throwable th2) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUyqeA==", "XOs5oQaxecuBXtJ0ghc=", 570);
                            return null;
                        }
                    }
                });
                ycx(ycxVar);
                this.dqs = ycxVar.ycx();
            }
        }
        long jMin222 = Math.min(Math.max(jOptLong, 0L), h.f42227c);
        int renderTimeout222 = getRenderTimeout();
        double d5 = this.f25464ok.ci() == null ? this.f25464ok.ci().f22186d * this.f25464ok.ci().f22198r : 0.0d;
        int i5222 = this.f25454dv;
        this.oty = i5222 == -1 && i5222 < ((int) d5);
        if (!com.bytedance.sdk.openadsdk.core.ry.lt.ycx(this.f25464ok) || com.bytedance.sdk.openadsdk.core.ry.lt.zb(this.f25464ok) || com.bytedance.sdk.openadsdk.core.ry.lt.ycx.lt.ycx(this.f25459jc)) {
            ycx.C0076ycx c0076ycx2 = new ycx.C0076ycx();
            if (com.bytedance.sdk.openadsdk.core.ry.lt.ycx(this.f25464ok)) {
                c0076ycx2.ycx(com.bytedance.sdk.openadsdk.core.ry.lt.ycx(this.f25464ok, this.f25459jc));
            }
            c0076ycx2.ycx((com.bytedance.adsdk.ugeno.core.pmi) this.f25458iq);
            c0076ycx2.ycx(this.aeu);
            c0076ycx2.zb(this.f25479xz);
            c0076ycx2.ul(this.ifb);
            ycxVar = c0076ycx2;
        } else {
            ycxVar = new ry.ycx();
        }
        ycxVar.lud(zAg);
        ycxVar.ycx(this.f25459jc).zb(this.f25464ok.m147if()).sya(this.f25464ok.wbt()).dj(this.f25464ok.pks()).ycx(this.f25458iq).dj(this.f25464ok.bxj()).ycx(renderTimeout222).zb(this.f25464ok.kfb()).sya(this.nji).zb(this.f25464ok.wk()).ycx(jMin222).sya(this.f25464ok.liq()).ycx(com.bytedance.sdk.openadsdk.core.jc.zb.sya.zb(this.f25464ok)).dj(z11).lud(this.f25454dv).ycx(this.oty).ycx(d5).lt(com.bytedance.sdk.openadsdk.core.settings.ea.zb().uh()).lt(com.bytedance.sdk.openadsdk.dv.lud.ycx("inject_data_reuse_open", 0)).ul(this.f25464ok.mnf().ycx()).fby(this.f25464ok.mnf().zb()).ycx(new com.bytedance.sdk.component.adexpress.zb.lud() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.6
            @Override // com.bytedance.sdk.component.adexpress.zb.lud
            public JSONObject ycx() {
                try {
                    thx thxVar = thx.this;
                    com.bytedance.sdk.openadsdk.core.model.tn tnVar = thxVar.f25464ok;
                    if (tnVar == null) {
                        thxVar.rmy = "material is null";
                        return null;
                    }
                    if (zAg) {
                        thxVar.dc = new tn();
                        float f11 = thx.this.aeu;
                        float f12 = thx.this.f25479xz;
                        thx thxVar2 = thx.this;
                        JSONObject jSONObjectYcx = com.bytedance.sdk.openadsdk.core.jc.zb.sya.ycx(f11, f12, thxVar2.syc, thxVar2.f25464ok, thxVar2.f25459jc, thxVar2.dc);
                        thx.this.rmy = com.bytedance.sdk.openadsdk.core.jc.zb.sya.ycx();
                        return jSONObjectYcx;
                    }
                    if (!com.bytedance.sdk.openadsdk.core.ry.lt.ycx(tnVar)) {
                        float f13 = thx.this.aeu;
                        float f14 = thx.this.f25479xz;
                        thx thxVar3 = thx.this;
                        JSONObject jSONObjectYcx2 = com.bytedance.sdk.openadsdk.core.jc.zb.sya.ycx(f13, f14, thxVar3.syc, thxVar3.f25464ok);
                        thx.this.sya(jSONObjectYcx2);
                        return jSONObjectYcx2;
                    }
                    thx.this.dc = new tn();
                    thx thxVar4 = thx.this;
                    JSONObject jSONObjectYcx3 = com.bytedance.sdk.openadsdk.core.ry.lt.ycx(thxVar4.f25464ok, thxVar4.dc);
                    thx.this.rmy = com.bytedance.sdk.openadsdk.core.ry.lt.ycx();
                    return jSONObjectYcx3;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUyqeA==", "XOs5oQaxecuBXtJ0ghc=", 570);
                    return null;
                }
            }
        });
        ycx(ycxVar);
        this.dqs = ycxVar.ycx();
    }

    private void tru() {
        if (com.bytedance.sdk.openadsdk.core.syc.lud()) {
            return;
        }
        ry.ycx();
    }

    private void wie() {
        this.f25481zb = this.f25464ok.tx();
        try {
            tru();
            bhi();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "UuAkgTG5Z8OFWA==", 627);
            com.bytedance.sdk.component.utils.htf.ycx("NativeExpressView", "NativeExpressView dynamicRender fail", e3);
        }
        this.ycx = this.f25464ok.ufy() == 1;
        boolean zYcx = com.bytedance.sdk.openadsdk.component.reward.sya.fby.ycx(this.f25464ok);
        if (this.ycx && !zYcx) {
            pmi();
        }
        Objects.toString(this.duz);
        this.f25470uf = new com.bytedance.sdk.component.adexpress.zb.ok(this.duz, this.f25458iq);
    }

    private void xkz() {
        tn.ycx ycxVarJp = this.f25464ok.jp();
        if (!TextUtils.equals(this.f25459jc, "embeded_ad") || ycxVarJp == null) {
            return;
        }
        String strJc = ycxVarJp.jc();
        if (TextUtils.isEmpty(strJc)) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject(strJc);
            int iOptInt = jSONObject.optInt("width");
            int iOptInt2 = jSONObject.optInt("height");
            if (iOptInt == 0 || iOptInt2 == 0) {
                return;
            }
            this.f25479xz = iOptInt2;
            this.aeu = iOptInt;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "UuAkgSW5bMOlUsdPiQKzCVjtKIUXj2DdhQ==", 448);
        }
    }

    private void xz() {
        List<com.bytedance.sdk.component.adexpress.zb.jc> list = this.duz;
        if (list == null) {
            return;
        }
        Iterator<com.bytedance.sdk.component.adexpress.zb.jc> it = list.iterator();
        while (it.hasNext()) {
            it.next();
        }
    }

    private void yzp() {
        kgy jsObject = getJsObject();
        if (jsObject == null) {
            return;
        }
        jsObject.ycx(new kgy.lud() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.2
            @Override // com.bytedance.sdk.openadsdk.core.kgy.lud
            public void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
                thx.this.ycx(tnVar);
            }
        });
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.syc
    public void a_(int i5) {
        com.bytedance.sdk.component.adexpress.zb.jw jwVar = this.f25458iq;
        if (jwVar != null) {
            if (!this.ycx) {
                jwVar.ul();
            }
            this.f25458iq.fby();
            ((xkz) this.f25458iq).jc();
        }
        PAGExpressAdWrapperListener pAGExpressAdWrapperListener = this.lud;
        if (pAGExpressAdWrapperListener != null) {
            pAGExpressAdWrapperListener.onRenderFail(this, com.bytedance.sdk.openadsdk.core.jw.ycx(i5), i5);
        }
        tn tnVar = this.dc;
        if (tnVar != null) {
            tnVar.ycx(this.f25464ok, this.f25459jc);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        int i5;
        jw jwVar = this.f25461lt;
        if (jwVar != null) {
            jwVar.zb(motionEvent.getDeviceId());
            this.f25461lt.ycx(motionEvent.getSource());
            this.f25461lt.sya(motionEvent.getToolType(0));
        }
        jc jcVar = this.f25473ul;
        if (jcVar != null) {
            jcVar.zb(motionEvent.getDeviceId());
            this.f25473ul.ycx(motionEvent.getSource());
            this.f25473ul.sya(motionEvent.getToolType(0));
        }
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked != 0) {
            int i11 = 3;
            if (actionMasked == 1) {
                i5 = i11;
            } else if (actionMasked != 2) {
                i11 = actionMasked != 3 ? -1 : 4;
                i5 = i11;
            } else {
                this.f25452bh = Math.abs(motionEvent.getX() - this.giw) + this.f25452bh;
                this.f25450aq = Math.abs(motionEvent.getY() - this.f25467sg) + this.f25450aq;
                this.giw = motionEvent.getX();
                this.f25467sg = motionEvent.getY();
                i5 = (System.currentTimeMillis() - this.bjp <= 200 || (this.f25452bh <= 8.0f && this.f25450aq <= 8.0f)) ? 2 : 1;
            }
        } else {
            this.giw = motionEvent.getRawX();
            this.f25467sg = motionEvent.getRawY();
            this.bjp = System.currentTimeMillis();
            com.bytedance.sdk.openadsdk.core.ok.sya.ycx(motionEvent);
            i5 = 0;
        }
        SparseArray<sya.ycx> sparseArray = this.f25477wr;
        if (sparseArray != null) {
            sparseArray.put(motionEvent.getActionMasked(), new sya.ycx(i5, motionEvent.getSize(), motionEvent.getPressure(), System.currentTimeMillis()));
        }
        try {
            return super.dispatchTouchEvent(motionEvent);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "X+c+hQKoas+0RcJehDS2LVX6", 1007);
            return false;
        }
    }

    public long dj() {
        return 0L;
    }

    public void dv() {
        com.bytedance.sdk.openadsdk.core.model.dj djVarQye;
        com.bytedance.sdk.openadsdk.core.xkz.dj djVarYcx;
        com.bytedance.sdk.openadsdk.core.model.tn tnVar = this.f25464ok;
        if (tnVar == null || (djVarQye = tnVar.qye()) == null || (djVarYcx = djVarQye.ycx()) == null) {
            return;
        }
        djVarYcx.lud(getVideoProgress());
    }

    public void ea() {
        tru truVar = this.f25463mp;
        if (truVar == null || truVar.lud() == null) {
            return;
        }
        this.f25463mp.jw();
    }

    public void fby() {
        this.wie = new com.bytedance.sdk.openadsdk.dj.uh(1, this.f25459jc, this.f25464ok);
    }

    public com.bytedance.sdk.openadsdk.dj.ul getAdShowTime() {
        return this.f25457hf;
    }

    public com.bytedance.sdk.openadsdk.core.jc.sya getBrandBannerController() {
        return this.f25480yi;
    }

    public jw getClickCreativeListener() {
        return this.f25461lt;
    }

    public jc getClickListener() {
        return this.f25473ul;
    }

    public String getClosedListenerKey() {
        return this.dwi;
    }

    public int getDynamicShowType() {
        com.bytedance.sdk.component.adexpress.zb.dj<? extends View> djVar = this.f25451av;
        if (djVar != null) {
            return djVar.sya();
        }
        return 0;
    }

    public int getExpectExpressHeight() {
        return Float.valueOf(this.f25479xz).intValue();
    }

    public int getExpectExpressWidth() {
        return Float.valueOf(this.aeu).intValue();
    }

    public PAGExpressAdWrapperListener getExpressInteractionListener() {
        return this.lud;
    }

    public kgy getJsObject() {
        tru truVar = this.f25463mp;
        if (truVar != null) {
            return truVar.oty();
        }
        return null;
    }

    public int getRenderEngineCacheType() {
        ea eaVarDv;
        com.bytedance.sdk.component.adexpress.zb.dj<? extends View> djVar = this.f25451av;
        if (!(djVar instanceof tru) || (eaVarDv = ((tru) djVar).dv()) == null) {
            return 0;
        }
        return eaVarDv.ycx();
    }

    public int getRenderTimeout() {
        return com.bytedance.sdk.openadsdk.core.pmi.dj().rmy();
    }

    public String getUgenTemplateErrorReason() {
        return this.rmy;
    }

    @Override // com.bytedance.sdk.openadsdk.core.sya.ycx.InterfaceC0083ycx
    public long getVideoProgress() {
        com.bytedance.sdk.openadsdk.core.dj.jw jwVar = this.f25475uu;
        if (jwVar != null) {
            return jwVar.getVideoProgress();
        }
        return 0L;
    }

    public com.bytedance.sdk.component.jw.fby getWebView() {
        tru truVar = this.f25463mp;
        if (truVar == null) {
            return null;
        }
        return truVar.dj();
    }

    public void hf() {
        com.bytedance.sdk.openadsdk.core.ry.sya.zb zbVar = new com.bytedance.sdk.openadsdk.core.ry.sya.zb(this.f25460jw, this.f25464ok);
        this.kgy = zbVar;
        zbVar.ycx(this);
        this.kgy.ycx(new com.bytedance.sdk.openadsdk.core.ry.sya.ycx() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.9
            @Override // com.bytedance.sdk.openadsdk.core.ry.sya.ycx
            public void ycx(View view, int i5, com.bytedance.sdk.component.adexpress.sya syaVar) {
                ycx(view, i5, syaVar);
            }
        });
    }

    public boolean htf() {
        return true;
    }

    public boolean jc() {
        return true;
    }

    public boolean jw() {
        return true;
    }

    public void lt() {
    }

    public int lud() {
        return 0;
    }

    public void ok() {
        tru truVar = this.f25463mp;
        if (truVar == null || truVar.lud() == null) {
            return;
        }
        this.f25463mp.uh();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.yzp.f25486zb.sya = true;
        sya("onAttachedToWindow");
        av();
        aeu();
        getViewTreeObserver().addOnScrollChangedListener(this.xym);
        com.bytedance.sdk.openadsdk.core.jc.zb().ycx(this.dwi, this.oby);
        this.f25478xf = new ycx.zb() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.8
            @Override // com.bytedance.sdk.openadsdk.utils.ycx.zb
            public void ycx() {
                thx.zb(thx.this, "appForeground");
                if (thx.this.yzp.ycx) {
                    thx.this.yzp.ycx = false;
                    thx thxVar = thx.this;
                    thxVar.removeCallbacks(thxVar.f25469tx);
                    thx thxVar2 = thx.this;
                    thxVar2.postDelayed(thxVar2.f25469tx, 100L);
                }
            }

            @Override // com.bytedance.sdk.openadsdk.utils.ycx.zb
            public void zb() {
                thx.zb(thx.this, "appBackground");
                if (thx.this.yzp.ycx) {
                    return;
                }
                thx.this.yzp.ycx = true;
                thx thxVar = thx.this;
                thxVar.removeCallbacks(thxVar.f25469tx);
                thx.this.zb(true, "app_background");
            }
        };
        com.bytedance.sdk.openadsdk.core.dy.ycx().lud().ycx(this.f25478xf);
        Objects.toString(this.f25478xf);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.yzp.f25486zb.sya = false;
        sya("onDetachedFromWindow");
        getViewTreeObserver().removeOnScrollChangedListener(this.xym);
        com.bytedance.sdk.openadsdk.core.jc.zb().lt(this.dwi);
        xz();
        ycx(8, true, true);
        if (this.f25478xf != null) {
            com.bytedance.sdk.openadsdk.core.dy.ycx().lud().zb(this.f25478xf);
            this.f25478xf = null;
        }
    }

    @Override // android.view.View
    public void onFinishTemporaryDetach() {
        super.onFinishTemporaryDetach();
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        av();
    }

    @Override // android.view.View
    public void onStartTemporaryDetach() {
        super.onStartTemporaryDetach();
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        if (z11) {
            boolean unused = this.yzp.sya;
        }
        this.yzp.f25486zb.ycx = z11;
        sya("onWindowFocusChanged:".concat(String.valueOf(z11)));
        onWindowVisibilityChanged(z11 ? getVisibility() : 8);
        av();
        com.bytedance.sdk.openadsdk.oty.ycx.sya.ycx(this.f25464ok, z11);
        if (com.bytedance.sdk.openadsdk.component.reward.sya.fby.ycx(this.f25464ok)) {
            return;
        }
        if (z11) {
            com.bytedance.sdk.openadsdk.oty.zb.lud.ycx(this.f25464ok, 4);
        } else {
            com.bytedance.sdk.openadsdk.oty.zb.lud.ycx(this.f25464ok, 8);
        }
    }

    @Override // android.view.View
    public void onWindowVisibilityChanged(int i5) {
        super.onWindowVisibilityChanged(i5);
        if (i5 == 0) {
            boolean unused = this.yzp.sya;
        }
        this.yzp.f25486zb.f25484zb = i5 == 0;
        sya("onWindowVisibilityChanged:".concat(String.valueOf(i5)));
        if (htf()) {
            ycx(i5, true, false);
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dj
    public void onvideoComplate() {
    }

    public boolean oty() {
        return this.sz.get();
    }

    public void ry() {
        try {
            fby("destory");
            com.bytedance.sdk.openadsdk.core.jc.sya syaVar = this.f25480yi;
            if (syaVar != null) {
                syaVar.zb();
            }
            dv();
            removeAllViews();
            if (getParent() != null) {
                ((ViewGroup) getParent()).removeView(this);
            }
            List<com.bytedance.sdk.component.adexpress.zb.jc> list = this.duz;
            if (list != null) {
                Iterator<com.bytedance.sdk.component.adexpress.zb.jc> it = list.iterator();
                while (it.hasNext()) {
                    it.next().ycx();
                }
            }
            com.bytedance.sdk.openadsdk.oty.zb.lud.ycx(this.f25464ok);
            com.bytedance.sdk.openadsdk.oty.ycx.sya.zb(this.f25464ok);
            this.sya = null;
            this.f25453dj = null;
            this.f25456ea = null;
            this.f25464ok = null;
            this.lud = null;
            this.f25461lt = null;
            this.f25455dy = null;
            this.f25473ul = null;
            com.bytedance.sdk.openadsdk.core.ry.sya.zb zbVar = this.kgy;
            if (zbVar != null) {
                zbVar.dj();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "X+s+gRGzcA==", 1361);
            com.bytedance.sdk.component.utils.htf.ycx("NativeExpressView", "detach error", th2);
        }
    }

    public void setActivity(Activity activity) {
        this.rmf = activity;
    }

    public void setBackupListener(com.bytedance.sdk.component.adexpress.zb.sya syaVar) {
        this.f25455dy = syaVar;
        com.bytedance.sdk.component.adexpress.zb.lt ltVar = this.f25462lv;
        if (ltVar != null) {
            ltVar.ycx(syaVar);
        }
    }

    public void setBannerClickClosedListener(ul.ycx ycxVar) {
        this.oby = ycxVar;
    }

    public void setClickCreativeListener(jw jwVar) {
        this.f25461lt = jwVar;
        if (jwVar != null) {
            jwVar.ycx((ycx.InterfaceC0083ycx) this);
        }
    }

    public void setClickListener(jc jcVar) {
        this.f25473ul = jcVar;
    }

    public void setClosedListenerKey(String str) {
        this.dwi = str;
        com.bytedance.sdk.openadsdk.core.jc.sya syaVar = this.f25480yi;
        if (syaVar != null) {
            syaVar.ycx(str);
        }
    }

    public void setDirectDestroyWebView(boolean z11) {
        com.bytedance.sdk.component.adexpress.zb.dj<? extends View> djVar = this.f25451av;
        if (djVar instanceof com.bytedance.sdk.component.adexpress.lud.ycx) {
            ((com.bytedance.sdk.component.adexpress.lud.ycx) djVar).zb(z11);
        }
    }

    public void setDislike(com.bytedance.sdk.openadsdk.sya.sya syaVar) {
        com.bytedance.sdk.openadsdk.core.jc.ycx ycxVar;
        com.bytedance.sdk.component.adexpress.zb.dj<? extends View> djVar = this.f25451av;
        if (djVar != null && (djVar instanceof wwx) && (ycxVar = (com.bytedance.sdk.openadsdk.core.jc.ycx) djVar.lud()) != null) {
            ycxVar.setDislikeInner(syaVar);
        }
        com.bytedance.sdk.openadsdk.core.jc.sya syaVar2 = this.f25480yi;
        if (syaVar2 != null) {
            syaVar2.ycx(syaVar);
        }
        this.sya = syaVar;
    }

    public void setExpressInteractionListener(PAGExpressAdWrapperListener pAGExpressAdWrapperListener) {
        this.lud = pAGExpressAdWrapperListener;
        com.bytedance.sdk.openadsdk.core.jc.sya syaVar = this.f25480yi;
        if (syaVar != null) {
            syaVar.ycx(pAGExpressAdWrapperListener);
        }
    }

    public void setJsbLandingPageOpenListener(com.bytedance.sdk.openadsdk.core.widget.lt ltVar) {
        if (this.f25463mp != null && getJsObject() != null) {
            getJsObject().ycx(ltVar);
        }
        com.bytedance.sdk.openadsdk.core.ry.lt.dj djVar = this.hpv;
        if (djVar != null) {
            djVar.ycx(ltVar);
        }
    }

    public void setOuterDislike(TTDislikeDialogAbstract tTDislikeDialogAbstract) {
        com.bytedance.sdk.openadsdk.core.jc.ycx ycxVar;
        com.bytedance.sdk.component.adexpress.zb.dj<? extends View> djVar = this.f25451av;
        if (djVar != null && (djVar instanceof wwx) && (ycxVar = (com.bytedance.sdk.openadsdk.core.jc.ycx) djVar.lud()) != null) {
            ycxVar.setDislikeOuter(tTDislikeDialogAbstract);
        }
        com.bytedance.sdk.openadsdk.core.jc.sya syaVar = this.f25480yi;
        if (syaVar != null) {
            syaVar.ycx(tTDislikeDialogAbstract);
        }
        this.f25453dj = tTDislikeDialogAbstract;
    }

    public void setSoundMute(boolean z11) {
        this.f25468tn = z11;
        com.bytedance.sdk.component.adexpress.zb.zb zbVar = this.bhi;
        if (zbVar != null && zbVar.zb() != null) {
            this.bhi.zb().setSoundMute(z11);
        }
        com.bytedance.sdk.component.adexpress.zb.dj<? extends View> djVar = this.f25451av;
        if (djVar instanceof com.bytedance.sdk.openadsdk.core.ry.lt.dj) {
            ((com.bytedance.sdk.openadsdk.core.ry.lt.dj) djVar).setSoundMute(z11);
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dj
    public void setTime(CharSequence charSequence, int i5, int i11, boolean z11) throws NumberFormatException {
        try {
            int i12 = Integer.parseInt(String.valueOf(charSequence));
            zb(i12, i5);
            com.bytedance.sdk.openadsdk.core.ry.sya.zb zbVar = this.kgy;
            if (zbVar != null) {
                zbVar.ycx(i12);
            }
        } catch (NumberFormatException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "SOs5oQqxbA==", 1672);
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dj
    public void setTimeUpdate(int i5) {
    }

    public void setVastVideoHelper(com.bytedance.sdk.openadsdk.core.dj.jw jwVar) {
        this.f25475uu = jwVar;
    }

    public void setVideoBusiness(com.bytedance.sdk.openadsdk.core.syc.dj.zb zbVar) {
        tru truVar = this.f25463mp;
        if (truVar != null) {
            truVar.ycx(zbVar);
        }
    }

    public void setVideoFrameChangeListener(com.bytedance.sdk.openadsdk.ry.fby fbyVar) {
        if (this.f25463mp == null || getJsObject() == null) {
            return;
        }
        getJsObject().ycx(fbyVar);
    }

    public long sya() {
        return 0L;
    }

    public void thx() {
        if (this.f25464ok == null) {
            return;
        }
        fby("render");
        this.tru = SystemClock.elapsedRealtime();
        if (this.f25464ok.mu()) {
            com.bytedance.sdk.openadsdk.core.jc.sya syaVar = this.f25480yi;
            if (syaVar == null) {
                a_(106);
                return;
            } else {
                syaVar.ycx((com.bytedance.sdk.component.adexpress.zb.syc) this);
                this.f25480yi.ycx();
                return;
            }
        }
        this.wie.ycx();
        jc.ycx ycxVar = this.f25470uf;
        if (ycxVar != null) {
            ycxVar.ycx(this);
        }
        try {
            this.f25470uf.ycx();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "SesjkQau", 944);
        }
    }

    public boolean tn() {
        com.bytedance.sdk.component.adexpress.zb.dj<? extends View> djVar = this.f25451av;
        return djVar != null && (djVar instanceof wwx);
    }

    public void uh() {
        com.bytedance.sdk.openadsdk.core.model.dj djVarQye;
        com.bytedance.sdk.openadsdk.core.xkz.dj djVarYcx;
        com.bytedance.sdk.component.adexpress.zb.dj<? extends View> djVar = this.f25451av;
        if (djVar instanceof tru) {
            if (djVar == null) {
                return;
            }
            ((tru) djVar).ea();
            ycx("show", "adShow", "notifyAdShow");
            com.bytedance.sdk.component.utils.jw.zb().postDelayed(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.7
                @Override // java.lang.Runnable
                public void run() {
                    thx.this.lud(1);
                }
            }, (this.f25464ok != null ? r0.tru().dj() : 5) * 1000);
        } else if (djVar instanceof com.bytedance.sdk.openadsdk.core.ry.lt.ul) {
            ((com.bytedance.sdk.openadsdk.core.ry.lt.ul) djVar).ea();
        }
        com.bytedance.sdk.openadsdk.core.model.tn tnVar = this.f25464ok;
        if (tnVar != null && (djVarQye = tnVar.qye()) != null && (djVarYcx = djVarQye.ycx()) != null) {
            djVarYcx.ycx(0L);
        }
        if ((this.f25451av instanceof com.bytedance.sdk.openadsdk.core.ry.lt.ul) && com.bytedance.sdk.openadsdk.core.model.wie.ycx(this.f25464ok)) {
            ycx(this.f25451av);
        }
    }

    public void wwx() {
        try {
            FrameLayout frameLayout = this.f25466ry;
            if (frameLayout == null || frameLayout.getParent() == null) {
                return;
            }
            removeView(this.f25466ry);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "We8unhasTcKTXsVSlQ==", 1371);
        }
    }

    public void ycx() {
    }

    public void zb() {
    }

    private void fby(String str) {
        removeCallbacks(this.f25469tx);
        this.yzp.ycx(getWindowToken() != null, getWindowVisibility() == 0, hasWindowFocus());
        ul(str);
        boolean unused = this.yzp.f25486zb.sya;
        boolean unused2 = this.yzp.f25486zb.f25484zb;
        boolean unused3 = this.yzp.f25486zb.ycx;
    }

    private void lt(String str) {
    }

    public void sya(JSONObject jSONObject) {
    }

    public void ul() {
        this.thx = new HashSet<>();
        AdSlot adSlot = this.f25456ea;
        if (adSlot != null) {
            this.aeu = adSlot.getExpressViewAcceptedWidth();
            this.f25479xz = this.f25456ea.getExpressViewAcceptedHeight();
            xkz();
            this.fby = this.f25456ea.getCodeId();
            if (TextUtils.equals(this.f25459jc, "fullscreen_interstitial_ad")) {
                this.f25454dv = this.f25464ok.jvd();
            } else if (TextUtils.equals(this.f25459jc, "rewarded_video")) {
                this.f25454dv = this.f25464ok.jxj();
            } else if (TextUtils.equals(this.f25459jc, "open_ad")) {
                com.bytedance.sdk.openadsdk.core.model.tn tnVar = this.f25464ok;
                if (tnVar == null || tnVar.zb() < 0) {
                    this.f25454dv = com.bytedance.sdk.openadsdk.core.pmi.dj().tn(this.fby);
                } else {
                    this.f25454dv = this.f25464ok.zb();
                }
                if (this.f25454dv < 0) {
                    this.f25454dv = 5;
                }
            }
        }
        setBackgroundColor(0);
        if (this.f25464ok.mu()) {
            this.f25480yi = new com.bytedance.sdk.openadsdk.core.jc.sya(this.f25460jw, this, this.f25464ok, this.f25459jc);
            return;
        }
        syc();
        this.duz = new ArrayList();
        dy();
        com.bytedance.sdk.component.adexpress.zb.dy dyVar = this.f25476uz;
        if (dyVar != null) {
            this.f25463mp = (tru) dyVar.zb();
        }
        kgy jsObject = getJsObject();
        if (jsObject != null) {
            jsObject.lt(this.f25459jc);
        }
    }

    public void ycx(int i5) {
    }

    public void zb(int i5) {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dj(String str) {
        if (this.yzp.ycx) {
            lt("confirmSystemInterruptState ignore: in background");
            return;
        }
        boolean zKgy = kgy();
        if (this.yzp.sya == zKgy) {
            lt("confirmSystemInterruptState ignore: same interrupt state");
        } else {
            zb(zKgy, "raw_confirm:".concat(String.valueOf(str)));
        }
    }

    public static /* synthetic */ void zb(thx thxVar, String str) {
    }

    public void lud(int i5) {
        if (com.bytedance.sdk.openadsdk.core.model.htf.sya(this.f25464ok)) {
            com.bytedance.sdk.component.adexpress.zb.dj<? extends View> djVar = this.f25451av;
            if (djVar instanceof tru) {
                ((tru) djVar).zb(i5);
            }
        }
    }

    public void ycx(int i5, com.bytedance.sdk.component.adexpress.zb.xkz xkzVar) {
    }

    public void lt(int i5) {
        com.bytedance.sdk.component.adexpress.zb.dj<? extends View> djVar = this.f25451av;
        if (djVar == null || !(djVar instanceof tru)) {
            return;
        }
        ((tru) djVar).ycx(i5);
        this.f25474ur = i5;
    }

    public void ycx(int i5, String str) {
    }

    public boolean zb(com.bytedance.sdk.component.adexpress.zb.xkz xkzVar) {
        return true;
    }

    private boolean lud(String str) {
        return "privacy".equals(str) || "reward_popup".equals(str) || "feedback".equals(str);
    }

    public lud.ycx sya(int i5) {
        return new lud.ycx(i5);
    }

    public void ycx(ry.ycx ycxVar) {
    }

    public boolean zb(JSONObject jSONObject) {
        return false;
    }

    private void sya(String str) {
        boolean zKgy = kgy();
        removeCallbacks(this.f25469tx);
        if (zKgy) {
            postDelayed(this.f25469tx, 100L);
        } else {
            dj("raw_clear:".concat(String.valueOf(str)));
        }
    }

    private void ycx(String str, String str2, String str3, boolean z11) {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(boolean z11, String str) {
        if (this.yzp.sya != z11) {
            this.yzp.sya = z11;
            ycx("system_interrupt", z11 ? "adDismiss" : "adShow", str);
        } else {
            lt("dispatchSystemInterrupt ignore no state change, reason=".concat(String.valueOf(str)));
        }
    }

    public void ycx(String str, JSONObject jSONObject) {
    }

    public void ycx(boolean z11, String str) {
    }

    public boolean ycx(JSONObject jSONObject) {
        return false;
    }

    public void zb(int i5, int i11) {
        int iMin;
        if (TextUtils.equals(this.f25459jc, "banner_ad")) {
            return;
        }
        int i12 = this.f25454dv;
        int i13 = ((i11 < i12 || i12 < 0 || !(this.oty || TextUtils.equals(this.f25459jc, "open_ad"))) && !((i5 == 0 && TextUtils.equals(this.f25459jc, "open_ad")) || lud() == 5)) ? 0 : 1;
        if (i11 <= this.f25454dv) {
            com.bytedance.sdk.openadsdk.core.model.tn tnVar = this.f25464ok;
            if (tnVar != null && tnVar.ci() != null) {
                iMin = (int) (Math.min(this.f25454dv, this.f25464ok.ci().f22186d * this.f25464ok.ci().f22198r) - i11);
            } else {
                iMin = this.f25454dv - i11;
            }
        } else {
            iMin = 0;
        }
        com.bytedance.sdk.component.adexpress.zb.zb zbVar = this.bhi;
        if (zbVar != null && zbVar.zb() != null) {
            this.bhi.zb().setTime(String.valueOf(i5), i13, iMin, false);
        }
        com.bytedance.sdk.component.adexpress.zb.dj<? extends View> djVar = this.f25451av;
        if (djVar instanceof com.bytedance.sdk.openadsdk.core.ry.lt.dj) {
            ((com.bytedance.sdk.openadsdk.core.ry.lt.dj) djVar).setTime(String.valueOf(i5), i13, iMin, false);
        }
    }

    private void ycx(String str, String str2, String str3) {
        com.bytedance.sdk.component.adexpress.zb.dj<? extends View> djVar = this.f25451av;
        if (djVar instanceof tru) {
            try {
                kgy kgyVarOty = ((tru) djVar).oty();
                if (kgyVarOty == null) {
                    return;
                }
                boolean zIfb = ifb();
                if (ycx(str, str2, zIfb, str3)) {
                    return;
                }
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("adVisible", zIfb);
                jSONObject.put("status", str2);
                jSONObject.put(TTConst.TRACK_TYPE, str);
                kgyVarOty.ycx("adShowAndStatus", jSONObject);
                this.yzp.ycx(str, str2, zIfb);
                ycx(str3, str, str2, zIfb);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "SOsjkSK4Ws+PXfZTiCK0KU/7Pg==", 795);
            }
        }
    }

    public void ycx(int i5, boolean z11, boolean z12) {
        this.pmi = z11;
        removeCallbacks(this.bba);
        removeCallbacks(this.f25482zr);
        if (i5 == 0) {
            if (z12) {
                this.f25482zr.run();
                return;
            } else {
                postDelayed(this.f25482zr, 50L);
                return;
            }
        }
        if (z12) {
            this.bba.run();
        } else {
            postDelayed(this.bba, 50L);
        }
    }

    public void zb(int i5, String str) throws JSONException {
        kgy kgyVarOty;
        com.bytedance.sdk.component.adexpress.zb.dj<? extends View> djVar = this.f25451av;
        if (djVar == null || !(djVar instanceof tru) || (kgyVarOty = ((tru) djVar).oty()) == null) {
            return;
        }
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("time", i5);
            jSONObject.put("flag", str);
            kgyVarOty.ycx("onVideoPaused", jSONObject);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "VeE5nAWlX86ET9htjQSzLV8=", 1771);
        }
    }

    public void ul(int i5) {
        com.bytedance.sdk.component.adexpress.zb.dj<? extends View> djVar = this.f25451av;
        if ((djVar instanceof com.bytedance.sdk.openadsdk.core.ry.lt.ul) && i5 == 4) {
            ((com.bytedance.sdk.openadsdk.core.ry.lt.ul) djVar).jc();
        }
    }

    private void ul(String str) {
        this.yzp.dj();
        lt("resetLastAdVisibleEventState, reason=".concat(String.valueOf(str)));
    }

    public void ycx(View view, int i5, com.bytedance.sdk.component.adexpress.sya syaVar) throws JSONException {
        JSONObject jSONObject;
        View view2 = view;
        com.bytedance.sdk.component.utils.htf.ycx("ClickCreativeListener", "trigger Class2 method1", Integer.valueOf(i5));
        if (i5 == -1 || syaVar == null) {
            return;
        }
        HashMap map = new HashMap();
        if (av.sya(this.f25464ok)) {
            map.put("click_scence", 3);
        } else {
            map.put("click_scence", 1);
        }
        map.put("dynamic_show_type", Integer.valueOf(getDynamicShowType()));
        com.bytedance.sdk.openadsdk.core.model.dy dyVar = (com.bytedance.sdk.openadsdk.core.model.dy) syaVar;
        if (com.bytedance.sdk.openadsdk.component.reward.sya.fby.ycx(this.f25464ok)) {
            map.put("duration", Integer.valueOf(dyVar.wie));
        }
        if (com.bytedance.sdk.openadsdk.core.model.htf.sya(this.f25464ok)) {
            try {
                JSONObject jSONObject2 = dyVar.f25623ry;
                if (jSONObject2 != null) {
                    int iOptInt = jSONObject2.optInt("click_type", 0);
                    JSONObject jSONObject3 = new JSONObject();
                    jSONObject3.put("click_type", iOptInt);
                    map.put("pag_json_data", jSONObject3.toString());
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "VOAOmQq/YuKWT9lJ", 1043);
                com.bytedance.sdk.component.utils.htf.sya(th2.toString(), new Object[0]);
            }
        }
        jw jwVar = this.f25461lt;
        if (jwVar != null) {
            jwVar.dj(getDynamicShowType());
            this.f25461lt.ycx(map);
        }
        jc jcVar = this.f25473ul;
        if (jcVar != null) {
            jcVar.dj(getDynamicShowType());
            this.f25473ul.ycx(map);
        }
        float f11 = dyVar.ycx;
        float f12 = dyVar.f25625zb;
        float f13 = dyVar.sya;
        float f14 = dyVar.f25616dj;
        boolean z11 = dyVar.f25618ea;
        SparseArray<sya.ycx> sparseArray = dyVar.f25619jc;
        if (sparseArray == null || sparseArray.size() == 0) {
            sparseArray = this.f25477wr;
        }
        SparseArray<sya.ycx> sparseArray2 = sparseArray;
        String str = dyVar.f25624ul;
        JSONObject jSONObjectYcx = null;
        if (view2 == null) {
            view2 = this;
        } else if (view2 != this) {
            jSONObjectYcx = ycx(view2);
        }
        JSONObject jSONObject4 = jSONObjectYcx;
        dyVar.fby = i5;
        if (jSONObject4 != null && dyVar.f25620jw == null) {
            dyVar.f25620jw = jSONObject4;
        }
        switch (i5) {
            case 1:
                FrameLayout frameLayout = this.f25466ry;
                if (frameLayout != null) {
                    frameLayout.dispatchTouchEvent(MotionEvent.obtain(0L, 0L, 0, 0.0f, 0.0f, 0));
                }
                com.bytedance.sdk.openadsdk.core.model.tn tnVar = this.f25464ok;
                if (tnVar == null || tnVar.wr() != 1 || z11) {
                    jc jcVar2 = this.f25473ul;
                    if (jcVar2 != null) {
                        jcVar2.ycx(dyVar);
                        this.f25473ul.ycx(str);
                        this.f25473ul.ycx(view2, f11, f12, f13, f14, sparseArray2, z11);
                    }
                    PAGExpressAdWrapperListener pAGExpressAdWrapperListener = this.lud;
                    if (pAGExpressAdWrapperListener != null && !dyVar.xkz) {
                        pAGExpressAdWrapperListener.onAdClicked();
                        break;
                    }
                }
                break;
            case 2:
                if (dyVar.f25622ok > 0) {
                    yzp.ycx(true);
                }
                jw jwVar2 = this.f25461lt;
                if (jwVar2 != null) {
                    jwVar2.ycx(dyVar);
                    this.f25461lt.ycx(str);
                    if (this.f25451av instanceof oty) {
                        this.f25461lt.zb(!((oty) r3).dy());
                    }
                    if (com.bytedance.sdk.openadsdk.core.model.htf.sya(this.f25464ok) && (jSONObject = dyVar.f25623ry) != null) {
                        this.f25461lt.lud(jSONObject.optBoolean("is_ceiling_page", false));
                    }
                    this.f25461lt.ycx(view2, f11, f12, f13, f14, sparseArray2, z11);
                }
                PAGExpressAdWrapperListener pAGExpressAdWrapperListener2 = this.lud;
                if (pAGExpressAdWrapperListener2 != null && !dyVar.xkz) {
                    pAGExpressAdWrapperListener2.onAdClicked();
                }
                yzp.ycx(false);
                if (!com.bytedance.sdk.openadsdk.component.reward.sya.fby.ycx(this.f25464ok)) {
                    com.bytedance.sdk.openadsdk.oty.zb.lud.ycx(this.f25464ok, 9);
                    break;
                }
                break;
            case 3:
                TTDislikeDialogAbstract tTDislikeDialogAbstract = this.f25453dj;
                if (tTDislikeDialogAbstract != null) {
                    tTDislikeDialogAbstract.show();
                    break;
                } else {
                    com.bytedance.sdk.openadsdk.sya.sya syaVar2 = this.sya;
                    if (syaVar2 != null) {
                        syaVar2.ycx();
                        break;
                    } else {
                        TTDelegateActivity.ycx(this.f25464ok, this.dwi);
                        break;
                    }
                }
            case 4:
                FrameLayout frameLayout2 = this.f25466ry;
                if (frameLayout2 != null) {
                    frameLayout2.dispatchTouchEvent(MotionEvent.obtain(0L, 0L, 0, 0.0f, 0.0f, 0));
                }
                com.bytedance.sdk.openadsdk.core.model.tn tnVar2 = this.f25464ok;
                if (tnVar2 == null || tnVar2.wr() != 1 || z11) {
                    oby.sya(this.f25464ok);
                    if ("embeded_ad".equals(this.f25459jc) && rmf() && !this.xkz && oby.sya(this.f25464ok)) {
                        jw jwVar3 = this.f25461lt;
                        if (jwVar3 != null) {
                            jwVar3.ycx(dyVar);
                            this.f25461lt.ycx(str);
                            this.f25461lt.ycx(view2, f11, f12, f13, f14, sparseArray2, z11);
                        }
                    } else {
                        jc jcVar3 = this.f25473ul;
                        if (jcVar3 != null) {
                            jcVar3.ycx(dyVar);
                            this.f25473ul.ycx(str);
                            this.f25473ul.ycx(view2, f11, f12, f13, f14, sparseArray2, z11);
                        }
                    }
                    PAGExpressAdWrapperListener pAGExpressAdWrapperListener3 = this.lud;
                    if (pAGExpressAdWrapperListener3 != null && !dyVar.xkz) {
                        pAGExpressAdWrapperListener3.onAdClicked();
                        break;
                    }
                }
                break;
            case 5:
                ycx(!this.f25468tn, "dynamicClick");
                break;
            case 6:
                ycx();
                break;
            case 7:
                ycx(this.f25464ok);
                break;
            default:
                switch (i5) {
                    case 13:
                        int i11 = dyVar.syc;
                        if (i11 >= 0) {
                            JSONObject jSONObject5 = new JSONObject();
                            try {
                                jSONObject5.put("switch", i11);
                                ycx(jSONObject5);
                                break;
                            } catch (Throwable th3) {
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "VOAOmQq/YuKWT9lJ", 1183);
                                return;
                            }
                        }
                        break;
                    case 14:
                        ycx(2);
                        break;
                    case 15:
                        ycx(3);
                        break;
                }
        }
    }

    public void zb(String str) {
        if (!lud(str)) {
            lt("exitBizState ignore: unsupported type=".concat(String.valueOf(str)));
        } else if (this.yzp.f25485dj.remove(str)) {
            ycx(str, "adShow", "exitBizState:".concat(String.valueOf(str)));
        } else {
            lt("exitBizState ignore: not active, type=".concat(String.valueOf(str)));
        }
    }

    public thx(Context context, com.bytedance.sdk.openadsdk.core.model.tn tnVar, AdSlot adSlot, String str) {
        super(context);
        this.ycx = true;
        this.f25481zb = 0;
        this.f25459jc = "embeded_ad";
        this.fby = null;
        this.syc = false;
        this.pmi = true;
        this.f25471uh = -1;
        this.rmy = b.f42142b;
        this.yzp = new ycx();
        this.f25468tn = false;
        this.nji = true;
        this.f25454dv = -1;
        this.f25457hf = new com.bytedance.sdk.openadsdk.dj.ul();
        this.tru = 0L;
        this.sz = new AtomicBoolean(false);
        this.xym = new ViewTreeObserver.OnScrollChangedListener() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.1
            @Override // android.view.ViewTreeObserver.OnScrollChangedListener
            public void onScrollChanged() {
                thx thxVar = thx.this;
                if (thxVar.pmi && thxVar.jc()) {
                    thx.this.av();
                    thx thxVar2 = thx.this;
                    thxVar2.removeCallbacks(thxVar2.f25465rl);
                    thx thxVar3 = thx.this;
                    thxVar3.postDelayed(thxVar3.f25465rl, 500L);
                }
            }
        };
        this.f25465rl = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.3
            @Override // java.lang.Runnable
            public void run() {
                if (!ifb.ycx(thx.this, 0, 5, false)) {
                    thx.this.lt(8);
                } else {
                    thx thxVar = thx.this;
                    thxVar.lt(thxVar.getVisibility());
                }
            }
        };
        this.f25482zr = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.4
            @Override // java.lang.Runnable
            public void run() {
                thx.this.lt(0);
            }
        };
        this.bba = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.5
            @Override // java.lang.Runnable
            public void run() {
                thx.this.lt(8);
            }
        };
        this.f25474ur = 8;
        this.f25477wr = new SparseArray<>();
        this.giw = -1.0f;
        this.f25467sg = -1.0f;
        this.f25452bh = -1.0f;
        this.f25450aq = -1.0f;
        this.bjp = 0L;
        this.f25469tx = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.10
            @Override // java.lang.Runnable
            public void run() {
                thx.this.dj("delayed_confirm");
            }
        };
        this.f25459jc = str;
        this.f25460jw = context;
        this.f25464ok = tnVar;
        this.f25456ea = adSlot;
        this.f25468tn = false;
        ul();
    }

    public thx(Context context, com.bytedance.sdk.openadsdk.core.model.tn tnVar, AdSlot adSlot, String str, boolean z11, boolean z12) {
        super(context);
        this.ycx = true;
        this.f25481zb = 0;
        this.f25459jc = "embeded_ad";
        this.fby = null;
        this.syc = false;
        this.pmi = true;
        this.f25471uh = -1;
        this.rmy = b.f42142b;
        this.yzp = new ycx();
        this.f25468tn = false;
        this.nji = true;
        this.f25454dv = -1;
        this.f25457hf = new com.bytedance.sdk.openadsdk.dj.ul();
        this.tru = 0L;
        this.sz = new AtomicBoolean(false);
        this.xym = new ViewTreeObserver.OnScrollChangedListener() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.1
            @Override // android.view.ViewTreeObserver.OnScrollChangedListener
            public void onScrollChanged() {
                thx thxVar = thx.this;
                if (thxVar.pmi && thxVar.jc()) {
                    thx.this.av();
                    thx thxVar2 = thx.this;
                    thxVar2.removeCallbacks(thxVar2.f25465rl);
                    thx thxVar3 = thx.this;
                    thxVar3.postDelayed(thxVar3.f25465rl, 500L);
                }
            }
        };
        this.f25465rl = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.3
            @Override // java.lang.Runnable
            public void run() {
                if (!ifb.ycx(thx.this, 0, 5, false)) {
                    thx.this.lt(8);
                } else {
                    thx thxVar = thx.this;
                    thxVar.lt(thxVar.getVisibility());
                }
            }
        };
        this.f25482zr = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.4
            @Override // java.lang.Runnable
            public void run() {
                thx.this.lt(0);
            }
        };
        this.bba = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.5
            @Override // java.lang.Runnable
            public void run() {
                thx.this.lt(8);
            }
        };
        this.f25474ur = 8;
        this.f25477wr = new SparseArray<>();
        this.giw = -1.0f;
        this.f25467sg = -1.0f;
        this.f25452bh = -1.0f;
        this.f25450aq = -1.0f;
        this.bjp = 0L;
        this.f25469tx = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.thx.10
            @Override // java.lang.Runnable
            public void run() {
                thx.this.dj("delayed_confirm");
            }
        };
        this.f25459jc = str;
        this.f25460jw = context;
        this.f25464ok = tnVar;
        this.f25456ea = adSlot;
        this.f25468tn = z11;
        this.nji = z12;
        ul();
    }

    public static JSONObject ycx(View view) throws JSONException {
        try {
            int[] iArr = new int[2];
            view.getLocationOnScreen(iArr);
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("width", view.getWidth());
            jSONObject.put("height", view.getHeight());
            jSONObject.put("left", iArr[0]);
            jSONObject.put("top", iArr[1]);
            return jSONObject;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "XOs5pwa/fe6OTNg=", 1215);
            return null;
        }
    }

    public void ycx(com.bytedance.sdk.component.adexpress.zb.dj<? extends View> djVar, com.bytedance.sdk.component.adexpress.zb.xkz xkzVar) {
        com.bytedance.sdk.openadsdk.core.model.tn tnVar;
        this.sz.set(true);
        this.f25451av = djVar;
        yzp();
        djVar.sya();
        if (this.f25474ur != getWindowVisibility() && jw()) {
            lt(getWindowVisibility());
        }
        if (djVar.sya() == 3 && (tnVar = this.f25464ok) != null && tnVar.iq() == 1) {
            this.f25464ok.ry(0);
        }
        if (djVar.sya() != 1 || (djVar instanceof com.bytedance.sdk.openadsdk.core.ry.lt.dj)) {
            View viewLud = djVar.lud();
            if (viewLud.getParent() != null) {
                ((ViewGroup) viewLud.getParent()).removeView(viewLud);
            }
            ArrayList arrayList = new ArrayList();
            for (int i5 = 0; i5 < getChildCount(); i5++) {
                arrayList.add(getChildAt(i5));
            }
            for (int i11 = 0; i11 < arrayList.size(); i11++) {
                if (arrayList.get(i11) instanceof com.bytedance.sdk.component.jw.fby) {
                    removeView((View) arrayList.get(i11));
                }
            }
            if (com.bytedance.sdk.openadsdk.core.model.htf.sya(this.f25464ok)) {
                addView(djVar.lud(), new FrameLayout.LayoutParams(-1, -1));
            } else {
                addView(djVar.lud());
            }
        }
        com.bytedance.sdk.openadsdk.core.model.tn tnVar2 = this.f25464ok;
        if (tnVar2 != null) {
            com.bytedance.sdk.openadsdk.dy.dj.ycx(tnVar2.jw(), this.tru, this.f25459jc, djVar.sya());
        }
        com.bytedance.sdk.component.adexpress.zb.jw jwVar = this.f25458iq;
        if (jwVar != null) {
            ((xkz) jwVar).jc();
        }
        PAGExpressAdWrapperListener pAGExpressAdWrapperListener = this.lud;
        if (pAGExpressAdWrapperListener != null) {
            pAGExpressAdWrapperListener.onRenderSuccess(this, (float) xkzVar.dj(), (float) xkzVar.lud());
        }
        if ((this.f25451av instanceof com.bytedance.sdk.openadsdk.core.ry.lt.ul) && com.bytedance.sdk.openadsdk.core.model.wie.ycx(this.f25464ok)) {
            hf();
        }
        if (!com.bytedance.sdk.openadsdk.component.reward.sya.fby.ycx(this.f25464ok) && zb(xkzVar)) {
            com.bytedance.sdk.openadsdk.oty.zb.lud.ycx(this, this.f25464ok, sya(getDynamicShowType()));
        }
        tn tnVar3 = this.dc;
        if (tnVar3 != null) {
            tnVar3.ycx(this.f25464ok, this.f25459jc);
        }
        com.bytedance.sdk.openadsdk.core.model.tn tnVar4 = this.f25464ok;
        if (tnVar4 != null) {
            tnVar4.bh(djVar.sya());
        }
    }

    public JSONObject ycx(JSONObject jSONObject, com.bytedance.sdk.openadsdk.core.model.tn tnVar) throws JSONException {
        if (!(this.f25451av instanceof tru)) {
            return null;
        }
        if (jSONObject == null) {
            jSONObject = new JSONObject();
        }
        try {
            int renderEngineCacheType = getRenderEngineCacheType();
            if (tnVar != null) {
                if (tnVar.jp() != null && tnVar.jp().ok()) {
                    jSONObject.put("engine_version", tnVar.jp().ea());
                } else if (tnVar.nc() != null) {
                    if (com.bytedance.sdk.openadsdk.component.reward.sya.fby.ycx(tnVar)) {
                        jSONObject.put("engine_version", "v4");
                    } else {
                        jSONObject.put("engine_version", "v3");
                    }
                } else if (com.bytedance.sdk.openadsdk.component.reward.sya.fby.ycx(tnVar) && com.bytedance.sdk.openadsdk.core.model.htf.lud(tnVar)) {
                    jSONObject.put("engine_version", "v4");
                } else {
                    jSONObject.put("engine_version", i.f38066a);
                }
            }
            jSONObject.put("engine_type", renderEngineCacheType);
            return jSONObject;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "XOs5o1CObMmET8VtjQOhJUg=", 1541);
            e3.getMessage();
            return jSONObject;
        }
    }

    public void ycx(com.bytedance.sdk.component.adexpress.zb.dj djVar) {
        if (this.kgy == null) {
            return;
        }
        try {
            if (djVar instanceof com.bytedance.sdk.openadsdk.core.ry.lt.ul) {
                ViewGroup viewGroup = (ViewGroup) ((com.bytedance.sdk.openadsdk.core.ry.lt.ul) djVar).lt().ea();
                this.wwx = viewGroup;
                if (viewGroup != null) {
                    this.kgy.zb();
                    View viewSya = this.kgy.sya();
                    if (viewSya != null) {
                        ViewGroup viewGroup2 = (ViewGroup) viewSya.getParent();
                        if (viewGroup2 != null) {
                            viewGroup2.removeView(viewSya);
                        }
                        this.wwx.addView(viewSya, new ViewGroup.LayoutParams(-1, -1));
                    }
                }
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "de85nBW5TN+QWNJOnyepLUw=", "SesjkQauTMaTU+dRjQihKlfr", 1809);
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, AdSlot adSlot, String str, boolean z11, boolean z12) {
        if (tnVar == null) {
            return;
        }
        this.f25459jc = str;
        this.f25464ok = tnVar;
        this.f25456ea = adSlot;
        this.f25468tn = z11;
        this.nji = z12;
        int iTx = tnVar.tx();
        this.f25481zb = iTx;
        if (iTx != 10) {
            return;
        }
        this.ifb = true;
        ul();
        thx();
        this.ifb = false;
    }

    public void ycx(String str) {
        if (!lud(str)) {
            lt("enterBizState ignore: unsupported type=".concat(String.valueOf(str)));
        } else if (this.yzp.f25485dj.add(str)) {
            removeCallbacks(this.f25469tx);
            ycx(str, "adDismiss", "enterBizState:".concat(String.valueOf(str)));
        } else {
            lt("enterBizState ignore: already active, type=".concat(String.valueOf(str)));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        if (this.f25460jw == null || tnVar == null) {
            return;
        }
        String strYcx = com.bytedance.sdk.openadsdk.core.widget.lud.ycx();
        com.bytedance.sdk.openadsdk.core.widget.lud.ycx(strYcx, this);
        if (com.bytedance.sdk.openadsdk.utils.zb.lud() && com.bytedance.sdk.openadsdk.core.pmi.dj().av()) {
            IABLandingPageActivity.ycx(this.f25460jw, tnVar, this.f25459jc, strYcx, "privacy");
        } else {
            TTWebsiteActivity.ycx(this.f25460jw, tnVar, this.f25459jc, strYcx, "privacy");
        }
    }

    private boolean ycx(String str, String str2, boolean z11, String str3) {
        zb zbVar = this.yzp.lud;
        if (zbVar == null || !TextUtils.equals("system_interrupt", str) || !TextUtils.equals(zbVar.f25487zb, str2) || zbVar.sya != z11) {
            return false;
        }
        StringBuilder sbK = u4.k("sendAdShowAndStatus skip duplicate system_interrupt, reason=", str3, ", lastType=");
        c0.D(sbK, zbVar.ycx, ", currentType=", str, ", status=");
        sbK.append(str2);
        sbK.append(", adVisible=");
        sbK.append(z11);
        lt(sbK.toString());
        return true;
    }
}
