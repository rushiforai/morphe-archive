package com.bytedance.sdk.openadsdk.component.reward.sya;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.tru;
import com.bytedance.sdk.openadsdk.api.PAGExpressAdWrapperListener;
import com.bytedance.sdk.openadsdk.component.reward.sya.zb.zb;
import com.bytedance.sdk.openadsdk.component.reward.ycx.ok;
import com.bytedance.sdk.openadsdk.component.reward.ycx.syc;
import com.bytedance.sdk.openadsdk.core.jc.dv;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.sya.sya;
import com.bytedance.sdk.openadsdk.utils.dy;
import h6.c1;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public abstract class zb implements tru.ycx, PAGExpressAdWrapperListener, ycx, com.bytedance.sdk.openadsdk.component.reward.sya.ycx.lud {

    /* renamed from: dj, reason: collision with root package name */
    protected Activity f24932dj;

    /* renamed from: dv, reason: collision with root package name */
    private ViewGroup f24933dv;

    /* renamed from: dy, reason: collision with root package name */
    protected boolean f24934dy;

    /* renamed from: ea, reason: collision with root package name */
    protected com.bytedance.sdk.openadsdk.component.reward.sya.zb.sya f24935ea;
    protected com.bytedance.sdk.openadsdk.component.reward.sya.zb.dj fby;
    private com.bytedance.sdk.openadsdk.component.reward.sya.zb.ul htf;

    /* renamed from: jc, reason: collision with root package name */
    protected com.bytedance.sdk.openadsdk.component.reward.ycx.ycx f24937jc;

    /* renamed from: jw, reason: collision with root package name */
    protected ok f24938jw;

    /* renamed from: lt, reason: collision with root package name */
    protected String f24939lt;
    protected tn lud;
    private com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya oty;

    /* renamed from: ry, reason: collision with root package name */
    protected Context f24941ry;
    protected long syc;
    private com.bytedance.sdk.openadsdk.component.reward.sya.zb.ycx thx;

    /* renamed from: uh, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.component.reward.sya.zb.lud f24943uh;

    /* renamed from: ul, reason: collision with root package name */
    public syc f24944ul;
    protected boolean wie;
    private com.bytedance.sdk.openadsdk.core.lt.sya wwx;
    protected String ycx;

    /* renamed from: zb, reason: collision with root package name */
    public boolean f24945zb;
    private final AtomicBoolean pmi = new AtomicBoolean(false);
    protected boolean sya = false;

    /* renamed from: tn, reason: collision with root package name */
    private boolean f24942tn = false;

    /* renamed from: ok, reason: collision with root package name */
    protected final tru f24940ok = new tru(Looper.getMainLooper(), this);
    protected AtomicBoolean xkz = new AtomicBoolean(false);

    /* renamed from: hf, reason: collision with root package name */
    private AtomicBoolean f24936hf = new AtomicBoolean(false);
    private AtomicBoolean tru = new AtomicBoolean(false);
    private boolean bhi = false;

    public zb(Activity activity, Context context, tn tnVar, String str, ViewGroup viewGroup, String str2, boolean z11) {
        this.f24932dj = activity;
        this.lud = tnVar;
        this.f24939lt = str;
        this.f24941ry = context;
        this.f24945zb = z11;
        this.f24933dv = viewGroup;
        this.fby = new com.bytedance.sdk.openadsdk.component.reward.sya.zb.dj(this, activity, tnVar, str);
        this.f24944ul = new syc(viewGroup, tnVar, str, activity, activity.getApplicationContext(), this);
        this.f24938jw = new ok(activity, tnVar, tnVar.pvm(), z11, null);
        this.f24943uh = new com.bytedance.sdk.openadsdk.component.reward.sya.zb.lud(this, activity, tnVar);
        this.htf = new com.bytedance.sdk.openadsdk.component.reward.sya.zb.ul(tnVar);
        this.thx = new com.bytedance.sdk.openadsdk.component.reward.sya.zb.ycx(viewGroup, activity);
        this.f24937jc = new com.bytedance.sdk.openadsdk.component.reward.ycx.ycx(activity, tnVar, tnVar.pvm(), str);
        this.ycx = str2;
        com.bytedance.sdk.openadsdk.core.lt.sya syaVar = new com.bytedance.sdk.openadsdk.core.lt.sya(activity);
        this.wwx = syaVar;
        com.bytedance.sdk.openadsdk.component.reward.sya.zb.sya syaVar2 = new com.bytedance.sdk.openadsdk.component.reward.sya.zb.sya(activity, tnVar, syaVar, viewGroup, this.f24944ul);
        this.f24935ea = syaVar2;
        syaVar2.ycx(this);
        this.fby.ycx(this);
        this.f24944ul.ycx((PAGExpressAdWrapperListener) this);
        this.f24937jc.ycx(ycx(tnVar));
        this.f24938jw.ycx();
    }

    private void htf() {
        if (this.thx == null || this.f24944ul == null || !this.xkz.get() || !fby.ul() || this.bhi) {
            return;
        }
        this.thx.ycx(new zb.ycx() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.zb.3
            @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb.zb.ycx
            public void ycx() {
                syc sycVar = zb.this.f24944ul;
                if (sycVar != null) {
                    sycVar.ycx();
                }
                htf.ycx("BaseManagerBundle", "onSendHeartbeat: ");
            }

            @Override // com.bytedance.sdk.openadsdk.component.reward.sya.zb.zb.ycx
            public void ycx(zb.EnumC0057zb enumC0057zb) {
                htf.ycx("BaseManagerBundle", "onHeartbeatStatusChanged: ".concat(String.valueOf(enumC0057zb)));
                if (enumC0057zb != zb.EnumC0057zb.TIMEOUT || zb.this.bhi) {
                    return;
                }
                zb.this.bhi = true;
                if (zb.this.thx != null) {
                    zb.this.thx.zb();
                    zb.this.thx.ycx(zb.this.lud);
                }
            }
        });
    }

    private void thx() throws JSONException {
        if (this.fby != null) {
            JSONObject jSONObject = new JSONObject();
            syc sycVar = this.f24944ul;
            if (sycVar != null && sycVar.zb() != null) {
                jSONObject = this.f24944ul.zb().ycx(jSONObject, this.lud);
            }
            this.syc = System.currentTimeMillis();
            this.fby.ycx(jSONObject);
        }
    }

    private void uh() {
        com.bytedance.sdk.openadsdk.component.reward.ycx.ycx ycxVar = this.f24937jc;
        if (ycxVar == null) {
            return;
        }
        ycxVar.ycx();
        if (this.f24937jc.lt() != null) {
            this.f24933dv.addView(this.f24937jc.lt(), new FrameLayout.LayoutParams(-1, -1));
            this.f24937jc.sya();
        }
    }

    private void wwx() {
        htf.ycx("BaseManagerBundle", "removeLoadingPage: ");
        try {
            com.bytedance.sdk.openadsdk.component.reward.ycx.ycx ycxVar = this.f24937jc;
            if (ycxVar != null) {
                ycxVar.dj();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCBK4hXfc=", "buAkkxqeaNSFfdJfoRCuKVzrP7cWsm3LhQ==", "X+s+gRGzcOuPS9NUghaQKVzr", PglCryptUtils.COMPRESS_FAILED);
            htf.ycx("BaseManagerBundle", "removeLoadingPage: ", th2);
            com.bytedance.sdk.openadsdk.component.reward.ycx.ycx ycxVar2 = this.f24937jc;
            if (ycxVar2 == null || ycxVar2.lt() == null) {
                return;
            }
            this.f24937jc.lt().setAlpha(0.0f);
        }
    }

    public void dj() {
        if (this.f24942tn || this.lud == null) {
            return;
        }
        this.f24942tn = true;
        this.f24932dj.getWindow().getDecorView().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.zb.1
            @Override // java.lang.Runnable
            public void run() {
                float[] fArrYcx;
                boolean zZb = com.bytedance.sdk.openadsdk.core.jc.zb.ycx.zb(zb.this.f24932dj);
                if (zZb) {
                    zb zbVar = zb.this;
                    fArrYcx = ok.ycx(zbVar.f24932dj, zbVar.lud.pvm(), true);
                } else {
                    int iPvm = zb.this.lud.pvm();
                    zb zbVar2 = zb.this;
                    fArrYcx = ok.ycx(iPvm, zbVar2.f24932dj, zbVar2.lud);
                }
                htf.ycx("BaseManagerBundle", "show loading page");
                syc sycVar = zb.this.f24944ul;
                if (sycVar != null) {
                    sycVar.ycx(fArrYcx);
                    zb zbVar3 = zb.this;
                    zbVar3.f24944ul.ycx(zbVar3.f24935ea);
                    zb.this.f24944ul.ycx(fArrYcx, zZb);
                    zb.this.lud();
                    zb.this.f24944ul.lud();
                    zb.this.f24944ul.ycx(new com.bytedance.sdk.openadsdk.core.jc.lud() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.zb.1.1
                        @Override // com.bytedance.sdk.openadsdk.core.jc.lud
                        public void ycx(String str) {
                            if (zb.this.f24943uh != null) {
                                zb.this.f24943uh.ycx(str);
                            }
                        }
                    });
                }
            }
        });
    }

    public abstract void dy();

    public void ea() {
        ok();
        syc sycVar = this.f24944ul;
        if (sycVar == null || sycVar.zb() == null) {
            return;
        }
        this.f24944ul.zb().uh();
    }

    public void fby() {
        wwx();
        com.bytedance.sdk.openadsdk.component.reward.sya.zb.dj djVar = this.fby;
        if (djVar != null && djVar.ycx() && this.fby.zb() > 0 && !pmi()) {
            String strValueOf = String.valueOf(SystemClock.elapsedRealtime() - this.fby.zb());
            syc sycVar = this.f24944ul;
            com.bytedance.sdk.openadsdk.dj.sya.ycx(strValueOf, this.lud, this.f24939lt, (sycVar == null || sycVar.zb() == null) ? null : this.f24944ul.zb().getAdShowTime());
        }
        com.bytedance.sdk.openadsdk.component.reward.sya.zb.lud ludVar = this.f24943uh;
        if (ludVar != null) {
            ludVar.ycx();
        }
        syc sycVar2 = this.f24944ul;
        if (sycVar2 != null) {
            sycVar2.lt();
        }
        dy.ycx();
    }

    public void jc() {
        htf.ycx("BaseManagerBundle", "invoke callback onAdClicked, ".concat(String.valueOf(this)));
        ry();
    }

    public void jw() {
        ok okVar = this.f24938jw;
        if (okVar != null) {
            okVar.zb();
        }
    }

    public void lt() {
        htf.ycx("BaseManagerBundle", "onPause: ");
        syc sycVar = this.f24944ul;
        if (sycVar != null) {
            sycVar.dj();
        }
        com.bytedance.sdk.openadsdk.component.reward.sya.zb.ycx ycxVar = this.thx;
        if (ycxVar != null) {
            ycxVar.sya();
        }
    }

    public void lud() {
        syc sycVar = this.f24944ul;
        if (sycVar == null) {
            return;
        }
        dv dvVarZb = sycVar.zb();
        this.f24944ul.ycx((ycx) this);
        if (dvVarZb != null) {
            this.htf.ycx(dvVarZb.getWebView());
            this.f24944ul.ycx(this.htf);
            dvVarZb.setJsbLandingPageOpenListener(new com.bytedance.sdk.openadsdk.core.widget.lt() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.zb.2
                @Override // com.bytedance.sdk.openadsdk.core.widget.lt
                public void ycx() {
                    zb.this.jc();
                }
            });
        }
    }

    public abstract void ok();

    @Override // com.bytedance.sdk.openadsdk.api.PAGAdWrapperListener
    public void onAdClicked() {
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGExpressAdWrapperListener
    public void onAdDismissed() {
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGExpressAdWrapperListener
    public void onAdShow(View view, int i5) {
    }

    public void onRenderFail(View view, String str, int i5) {
        this.xkz.set(false);
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGExpressAdWrapperListener
    public void onRenderSuccess(View view, float f11, float f12) throws JSONException {
        this.xkz.set(true);
        if (!com.bytedance.sdk.openadsdk.core.model.htf.lud(this.lud)) {
            thx();
            com.bytedance.sdk.openadsdk.component.reward.ycx.ycx ycxVar = this.f24937jc;
            if (ycxVar != null) {
                ycxVar.lud();
                this.f24937jc.dj();
            }
        } else if (!this.tru.get() || this.f24936hf.get()) {
            com.bytedance.sdk.openadsdk.component.reward.ycx.ycx ycxVar2 = this.f24937jc;
            if (ycxVar2 != null) {
                ycxVar2.zb();
            }
        } else {
            this.f24936hf.set(true);
            thx();
            com.bytedance.sdk.openadsdk.component.reward.sya.zb.sya syaVar = this.f24935ea;
            if (syaVar != null) {
                syaVar.ycx();
            }
            com.bytedance.sdk.openadsdk.component.reward.ycx.ycx ycxVar3 = this.f24937jc;
            if (ycxVar3 != null) {
                ycxVar3.lud();
                this.f24937jc.dj();
            }
        }
        if (this.thx == null || !fby.ul()) {
            return;
        }
        this.thx.ycx();
        this.thx.ycx(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.zb.4
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                zb zbVar = zb.this;
                if (zbVar.f24932dj != null) {
                    syc sycVar = zbVar.f24944ul;
                    if (sycVar != null && sycVar.zb() != null) {
                        zb.this.f24944ul.zb().setDirectDestroyWebView(true);
                    }
                    zb.this.xkz();
                    zb.this.f24932dj.finish();
                }
            }
        });
        htf();
        this.f24944ul.ycx(new dj() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.zb.5
            @Override // com.bytedance.sdk.openadsdk.component.reward.sya.dj
            public void ycx() {
                if (zb.this.thx != null) {
                    zb.this.thx.dj();
                    htf.ycx("BaseManagerBundle", "responseHeartBeat: ");
                }
            }
        });
    }

    public boolean pmi() {
        syc sycVar = this.f24944ul;
        if (sycVar == null) {
            return false;
        }
        return sycVar.ul();
    }

    public abstract void ry();

    public boolean syc() {
        return this.sya;
    }

    public void ul() {
        com.bytedance.sdk.openadsdk.component.reward.sya.zb.sya syaVar = this.f24935ea;
        if (syaVar != null) {
            syaVar.sya();
        }
    }

    public void wie() {
        Activity activity;
        if (com.bytedance.sdk.openadsdk.dv.lud.jw() && (activity = this.f24932dj) != null && activity.isChangingConfigurations()) {
            htf.ycx("BVA", "callback close is invoke by config change.");
            return;
        }
        if (this.wie) {
            htf.ycx("BVA", "invoke callback onAdClose has already been called ");
            return;
        }
        this.wie = true;
        tn tnVar = this.lud;
        if (tnVar != null && !tnVar.yi()) {
            long jJw = this.lud.jw();
            if (jJw > 0) {
                long jElapsedRealtime = SystemClock.elapsedRealtime() - jJw;
                if (jElapsedRealtime > 0) {
                    this.lud.zb(jElapsedRealtime);
                }
            }
            if (this.fby != null) {
                JSONObject jSONObject = new JSONObject();
                syc sycVar = this.f24944ul;
                if (sycVar != null && sycVar.zb() != null) {
                    jSONObject = this.f24944ul.zb().ycx(jSONObject, this.lud);
                }
                this.syc = System.currentTimeMillis();
                this.fby.ycx(jSONObject);
            }
        }
        dy();
    }

    public void xkz() {
    }

    @Override // com.bytedance.sdk.component.utils.tru.ycx
    public void ycx(Message message) {
    }

    public abstract void ycx(boolean z11, int i5, String str, int i11, String str2, int i12, tn tnVar);

    public void sya(Bundle bundle) {
        if (bundle != null) {
            this.f24934dy = bundle.getBoolean("enable_new_arch", false);
            return;
        }
        Activity activity = this.f24932dj;
        if (activity == null || activity.getIntent() == null) {
            return;
        }
        this.f24934dy = this.f24932dj.getIntent().getBooleanExtra("enable_new_arch", false);
    }

    public void zb(Bundle bundle) {
        com.bytedance.sdk.openadsdk.component.reward.sya.zb.dj djVar = this.fby;
        if (djVar != null && djVar.ycx()) {
            this.lud.jc(true);
        }
        if (this.pmi.get()) {
            this.lud.fby(true);
        }
    }

    public void ycx(Bundle bundle) {
        dy.ycx(this.lud, this.f24941ry, this.f24939lt, this);
        uh();
        if (com.bytedance.sdk.openadsdk.core.model.htf.lud(this.lud)) {
            this.f24937jc.zb();
        }
        this.f24933dv.addView(this.wwx, new ViewGroup.LayoutParams(-1, -1));
        this.wwx.setVisibility(8);
    }

    public void sya() {
        dj();
        ok okVar = this.f24938jw;
        if (okVar != null) {
            okVar.ycx(this.f24940ok);
        }
        com.bytedance.sdk.openadsdk.component.reward.sya.zb.sya syaVar = this.f24935ea;
        if (syaVar != null) {
            syaVar.zb();
        }
        htf();
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.ycx
    public void zb() {
        if (this.pmi.compareAndSet(false, true)) {
            htf.ycx("BVA", "invoke callback onShow, ".concat(String.valueOf(this)));
            ea();
        }
    }

    public void zb(boolean z11) {
        this.sya = z11;
    }

    public void ycx(boolean z11) {
        if (this.fby == null || pmi()) {
            return;
        }
        syc sycVar = this.f24944ul;
        this.fby.ycx(z11, (sycVar == null || sycVar.zb() == null) ? null : this.f24944ul.zb().getAdShowTime());
        this.fby.ycx(z11, this.lud, this.f24939lt);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.ycx
    public void ycx() {
        jc();
        this.lud.goq();
        this.lud.dj(true);
        if (!tn.lud(this.lud) || pmi()) {
            return;
        }
        tn tnVar = this.lud;
        com.bytedance.sdk.openadsdk.dj.sya.zb(tnVar, this.f24939lt, tnVar.eu());
    }

    public com.bytedance.sdk.openadsdk.core.sya.lud ycx(tn tnVar) {
        if (this.oty == null) {
            this.oty = com.bytedance.sdk.openadsdk.thx.ycx.ycx.dj.ycx(this.f24932dj, this.f24939lt);
        }
        Activity activity = this.f24932dj;
        String str = this.f24939lt;
        com.bytedance.sdk.openadsdk.core.sya.lud ludVar = new com.bytedance.sdk.openadsdk.core.sya.lud(activity, tnVar, str, TextUtils.equals(str, "rewarded_video") ? 7 : 5) { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.zb.6
            @Override // com.bytedance.sdk.openadsdk.core.sya.lud
            public void ycx(View view, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, int i5, int i11, int i12, boolean z11) {
                HashMap map = new HashMap();
                c1.x(0, map, "duration", 1, "click_scence");
                ycx(map);
                zb.this.jc();
            }
        };
        ludVar.ycx(this.oty);
        return ludVar;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.sya.ycx.lud
    public void ycx(String str, int i5, int i11) throws JSONException {
        syc sycVar = this.f24944ul;
        if (sycVar != null) {
            sycVar.ycx(str, i5, i11);
            if (i5 == 2 || i5 == 3) {
                this.tru.set(true);
                if (this.xkz.get() && com.bytedance.sdk.openadsdk.core.model.htf.lud(this.lud) && !this.f24936hf.get()) {
                    this.f24936hf.set(true);
                    thx();
                    com.bytedance.sdk.openadsdk.core.lt.sya syaVar = this.wwx;
                    if (syaVar != null) {
                        syaVar.setVisibility(0);
                    }
                    com.bytedance.sdk.openadsdk.component.reward.sya.zb.sya syaVar2 = this.f24935ea;
                    if (syaVar2 != null && i5 == 2) {
                        syaVar2.ycx();
                    }
                    com.bytedance.sdk.openadsdk.component.reward.ycx.ycx ycxVar = this.f24937jc;
                    if (ycxVar != null) {
                        ycxVar.dj();
                        this.f24937jc.lud();
                        return;
                    }
                    return;
                }
                com.bytedance.sdk.openadsdk.core.lt.sya syaVar3 = this.wwx;
                if (syaVar3 != null) {
                    syaVar3.setVisibility(0);
                }
                com.bytedance.sdk.openadsdk.component.reward.sya.zb.sya syaVar4 = this.f24935ea;
                if (syaVar4 == null || i5 != 2) {
                    return;
                }
                syaVar4.ycx();
            }
        }
    }
}
