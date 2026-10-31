package com.bytedance.sdk.openadsdk.activity.single;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Point;
import android.os.Build;
import android.os.Bundle;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.view.DisplayCutout;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.ImageView;
import androidx.room.o;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.tru;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.ApmHelper;
import com.bytedance.sdk.openadsdk.FilterWord;
import com.bytedance.sdk.openadsdk.common.TTAdDislikeToast;
import com.bytedance.sdk.openadsdk.common.wie;
import com.bytedance.sdk.openadsdk.component.reward.ycx.ok;
import com.bytedance.sdk.openadsdk.component.reward.ycx.uh;
import com.bytedance.sdk.openadsdk.core.av;
import com.bytedance.sdk.openadsdk.core.bhi;
import com.bytedance.sdk.openadsdk.core.jc.ry;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.settings.ea;
import com.bytedance.sdk.openadsdk.core.syc;
import com.bytedance.sdk.openadsdk.core.syc.dj.ycx;
import com.bytedance.sdk.openadsdk.dj.jc;
import com.bytedance.sdk.openadsdk.oty.zb.lud;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.dwi;
import com.bytedance.sdk.openadsdk.utils.jw;
import com.bytedance.sdk.openadsdk.utils.xkz;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class TTAppOpenAdActivity extends TTBaseActivity implements tru.ycx, ycx.InterfaceC0086ycx {

    /* renamed from: jw, reason: collision with root package name */
    private static com.bytedance.sdk.openadsdk.ycx.dj.zb f24305jw;
    private long aeu;

    /* renamed from: av, reason: collision with root package name */
    private AdSlot f24306av;
    private com.bytedance.sdk.openadsdk.component.sya bhi;

    /* renamed from: dv, reason: collision with root package name */
    private int f24308dv;

    /* renamed from: dy, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.dj.ul f24309dy;

    /* renamed from: ea, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.component.lt.zb f24310ea;
    protected boolean fby;

    /* renamed from: hf, reason: collision with root package name */
    private FrameLayout f24311hf;
    private int htf;
    private boolean ifb;

    /* renamed from: ok, reason: collision with root package name */
    private wie f24314ok;
    private int oty;
    private float pmi;

    /* renamed from: ry, reason: collision with root package name */
    private TTAdDislikeToast f24315ry;
    private tn thx;
    private boolean tru;

    /* renamed from: uh, reason: collision with root package name */
    private boolean f24317uh;
    private float wie;
    private com.bytedance.sdk.openadsdk.ycx.dj.zb wwx;

    /* renamed from: xz, reason: collision with root package name */
    private ImageView f24319xz;
    private xkz yzp;
    protected final AtomicBoolean ycx = new AtomicBoolean(false);

    /* renamed from: zb, reason: collision with root package name */
    protected final tru f24320zb = new tru(Looper.getMainLooper(), this);
    final AtomicBoolean sya = new AtomicBoolean(false);

    /* renamed from: dj, reason: collision with root package name */
    final AtomicBoolean f24307dj = new AtomicBoolean(false);

    /* renamed from: jc, reason: collision with root package name */
    private final com.bytedance.sdk.openadsdk.component.fby.ycx f24312jc = new com.bytedance.sdk.openadsdk.component.fby.ycx();
    protected boolean lud = false;
    private final AtomicBoolean xkz = new AtomicBoolean(false);
    private dwi syc = dwi.sya();

    /* renamed from: tn, reason: collision with root package name */
    private final AtomicBoolean f24316tn = new AtomicBoolean(false);

    /* renamed from: lt, reason: collision with root package name */
    long f24313lt = 0;
    private volatile boolean rmf = false;

    /* renamed from: ul, reason: collision with root package name */
    int f24318ul = -1;
    private final com.bytedance.sdk.openadsdk.component.ycx dwi = new com.bytedance.sdk.openadsdk.component.ycx() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTAppOpenAdActivity.1
        @Override // com.bytedance.sdk.openadsdk.component.ycx
        public void dj() {
            TTAppOpenAdActivity.this.fby();
            TTAppOpenAdActivity.this.syc.lud();
            TTAppOpenAdActivity.this.thx();
            if (TTAppOpenAdActivity.this.f24317uh) {
                TTAppOpenAdActivity.this.ry();
            }
            if (TTAppOpenAdActivity.this.bhi.fby() != null && TTAppOpenAdActivity.this.bhi.fby().zb() != null) {
                TTAppOpenAdActivity.this.bhi.fby().zb().ycx(TTAppOpenAdActivity.this);
            }
            if (com.bytedance.sdk.openadsdk.core.jc.zb.ycx.sya(TTAppOpenAdActivity.this)) {
                TTAppOpenAdActivity.this.ul();
            }
        }

        @Override // com.bytedance.sdk.openadsdk.component.ycx
        public void lt() {
            TTAppOpenAdActivity.this.dv();
        }

        @Override // com.bytedance.sdk.openadsdk.component.ycx
        public void lud() {
            jc.ycx(TTAppOpenAdActivity.this.thx, "show_ad_fail", "open_ad", "render_failed");
            TTAppOpenAdActivity.this.finish();
        }

        @Override // com.bytedance.sdk.openadsdk.component.ycx, com.bytedance.sdk.openadsdk.component.lt.ycx
        public void sya() {
            TTAppOpenAdActivity.this.rmf = true;
            if (com.bytedance.sdk.openadsdk.dv.lud.ycx("splash_auto_close_switch", 0) == 0) {
                TTAppOpenAdActivity.this.jw();
                TTAppOpenAdActivity.this.finish();
            }
        }

        @Override // com.bytedance.sdk.openadsdk.component.ycx, ob.c
        public void ycx() {
            TTAppOpenAdActivity.this.av();
            TTAppOpenAdActivity.this.oty();
            jc.ycx(TTAppOpenAdActivity.this.thx, "show_ad_fail", "open_ad", "play_video_time_out");
            TTAppOpenAdActivity.this.finish();
        }

        @Override // com.bytedance.sdk.openadsdk.component.ycx, ob.c
        public void zb(long j11, int i5) {
            com.bytedance.sdk.openadsdk.component.fby.sya syaVarFby;
            StringBuilder sb2 = new StringBuilder("onError() called with: totalPlayTime = [");
            sb2.append(j11);
            sb2.append("], percent = [");
            sb2.append(i5);
            sb2.append("]");
            if (TTAppOpenAdActivity.this.bhi != null && (syaVarFby = TTAppOpenAdActivity.this.bhi.fby()) != null) {
                TTAppOpenAdActivity.this.av();
                syaVarFby.ycx(true);
            }
            TTAppOpenAdActivity.this.oty();
            jc.ycx(TTAppOpenAdActivity.this.thx, "show_ad_fail", "open_ad", "play_video_error");
            TTAppOpenAdActivity.this.finish();
        }

        @Override // com.bytedance.sdk.openadsdk.component.ycx, ob.c
        public void ycx(long j11, long j12) {
            TTAppOpenAdActivity.this.f24312jc.sya(j11);
            TTAppOpenAdActivity tTAppOpenAdActivity = TTAppOpenAdActivity.this;
            if (!tTAppOpenAdActivity.lud && tTAppOpenAdActivity.bhi != null && TTAppOpenAdActivity.this.bhi.fby() != null && TTAppOpenAdActivity.this.bhi.fby().lud()) {
                TTAppOpenAdActivity.this.bhi.fby().fby();
            }
            TTAppOpenAdActivity.this.xkz();
            if (TTAppOpenAdActivity.this.bhi instanceof com.bytedance.sdk.openadsdk.component.zb) {
                ((com.bytedance.sdk.openadsdk.component.zb) TTAppOpenAdActivity.this.bhi).ycx(j11, j12);
            }
        }

        @Override // com.bytedance.sdk.openadsdk.component.ycx, com.bytedance.sdk.openadsdk.component.lt.ycx
        public void zb(View view) {
            TTAppOpenAdActivity.this.zb();
            com.bytedance.sdk.openadsdk.component.dj.ycx.ycx(TTAppOpenAdActivity.this.thx, TTAppOpenAdActivity.this.htf());
        }

        @Override // com.bytedance.sdk.openadsdk.component.ycx, com.bytedance.sdk.openadsdk.component.lt.ycx
        public void ycx(View view) throws JSONException {
            TTAppOpenAdActivity.this.hf();
        }

        @Override // com.bytedance.sdk.openadsdk.component.ycx, com.bytedance.sdk.openadsdk.component.lt.ycx
        public void ycx(int i5, boolean z11) {
            if (TTAppOpenAdActivity.this.bhi != null) {
                TTAppOpenAdActivity.this.bhi.ycx(i5, z11);
            }
            if (TTAppOpenAdActivity.this.f24317uh || !(TTAppOpenAdActivity.this.bhi instanceof com.bytedance.sdk.openadsdk.component.zb) || TTAppOpenAdActivity.this.f24310ea == null || TTAppOpenAdActivity.this.f24310ea.ycx() <= 0) {
                return;
            }
            ((com.bytedance.sdk.openadsdk.component.zb) TTAppOpenAdActivity.this.bhi).ycx(TTAppOpenAdActivity.this.f24312jc.sya(), (long) (TTAppOpenAdActivity.this.f24312jc.zb() * 1000.0f));
        }
    };
    private final Runnable oby = new Runnable() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTAppOpenAdActivity.5
        @Override // java.lang.Runnable
        public void run() throws JSONException {
            com.bytedance.sdk.openadsdk.core.model.dj djVarQye;
            com.bytedance.sdk.openadsdk.core.xkz.dj djVarYcx;
            if (TTAppOpenAdActivity.this.xkz.get()) {
                jc.ycx(TTAppOpenAdActivity.this.thx, "show_ad_fail", "open_ad", "repeat_play");
                return;
            }
            if (TTAppOpenAdActivity.this.thx != null && (djVarQye = TTAppOpenAdActivity.this.thx.qye()) != null && (djVarYcx = djVarQye.ycx()) != null) {
                djVarYcx.ycx(0L);
            }
            TTAppOpenAdActivity.this.f24309dy = new com.bytedance.sdk.openadsdk.dj.ul();
            TTAppOpenAdActivity.this.f24309dy.ycx(System.currentTimeMillis(), 1.0f);
            TTAppOpenAdActivity.this.syc.lud();
            if (TTAppOpenAdActivity.this.f24310ea != null) {
                TTAppOpenAdActivity.this.f24310ea.zb();
            }
            if (TTAppOpenAdActivity.this.bhi != null) {
                TTAppOpenAdActivity.this.bhi.lt();
            }
            TTAppOpenAdActivity.this.tn();
            View viewFindViewById = TTAppOpenAdActivity.this.findViewById(16908290);
            JSONObject jSONObject = new JSONObject();
            if (viewFindViewById != null) {
                try {
                    jSONObject.put("width", viewFindViewById.getWidth());
                    jSONObject.put("height", viewFindViewById.getHeight());
                    jSONObject.put("alpha", viewFindViewById.getAlpha());
                } catch (JSONException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oMhROTecKOa9N8jwWpPlL6NNFW", "Sfsj", 841);
                    Log.e("TTAppOpenAdActivity", "run: ", e3);
                    jc.ycx(TTAppOpenAdActivity.this.thx, "show_ad_fail", "open_ad", "show_report_failed");
                    TTAppOpenAdActivity.this.finish();
                    return;
                }
            }
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("root_view", jSONObject.toString());
            jSONObject2.put("ad_root", TTAppOpenAdActivity.this.f24308dv);
            jSONObject2.put("openad_creative_type", TTAppOpenAdActivity.this.f24317uh ? "video_normal_ad" : "image_normal_ad");
            if (com.bytedance.sdk.openadsdk.component.jw.fby.sya() == null) {
                jSONObject2.put("appicon_acquirefail", "1");
            }
            if (TTAppOpenAdActivity.this.tru || TTAppOpenAdActivity.this.thx.mu()) {
                if (TTAppOpenAdActivity.this.wwx() || com.bytedance.sdk.openadsdk.component.ul.ycx.ea()) {
                    jSONObject2.put("dynamic_show_type", TTAppOpenAdActivity.this.htf());
                } else {
                    jSONObject2.put("dynamic_show_type", 1);
                }
                TTAppOpenAdActivity.this.ycx(jSONObject2);
            }
            jSONObject2.put("is_icon_only", TTAppOpenAdActivity.this.thx.aeu() ? 1 : 0);
            JSONObject jSONObject3 = new JSONObject();
            if (TTAppOpenAdActivity.this.f24308dv == 1) {
                jSONObject3.putOpt("cache_duration", Long.valueOf(System.currentTimeMillis() - TTAppOpenAdActivity.this.aeu));
            }
            if (TTAppOpenAdActivity.this.thx != null) {
                int iJc = TTAppOpenAdActivity.this.thx.jc();
                jSONObject3.putOpt("start_type", Integer.valueOf(iJc == 1 ? 1 : 2));
                jSONObject3.putOpt("load_index", Integer.valueOf(iJc));
            }
            jSONObject3.putOpt("start_type_backup", Integer.valueOf(com.bytedance.sdk.openadsdk.component.ul.ycx.dj()));
            jSONObject3.putOpt("app_running_time", Long.valueOf(com.bytedance.sdk.openadsdk.component.ul.ycx.zb()));
            com.bytedance.sdk.openadsdk.dj.sya.ycx(TTAppOpenAdActivity.this.thx, "open_ad", jSONObject2, jSONObject3);
            com.bytedance.sdk.openadsdk.oty.zb.lud.ycx(TTAppOpenAdActivity.this.findViewById(16908290), TTAppOpenAdActivity.this.thx, new lud.ycx(TTAppOpenAdActivity.this.htf()));
            com.bytedance.sdk.openadsdk.oty.ycx.sya.ycx(TTAppOpenAdActivity.this.thx);
            TTAppOpenAdActivity.this.xkz.set(true);
        }
    };

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity
    public boolean dj() {
        return true;
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void finish() {
        super.finish();
        overridePendingTransition(0, 0);
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity
    public void h_() throws JSONException {
        uh();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        dc.zb((Activity) this);
        getWindow().getDecorView().setOnSystemUiVisibilityChangeListener(new View.OnSystemUiVisibilityChangeListener() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTAppOpenAdActivity.6
            @Override // android.view.View.OnSystemUiVisibilityChangeListener
            public void onSystemUiVisibilityChange(int i5) {
                if (i5 == 0) {
                    try {
                        if (TTAppOpenAdActivity.this.isFinishing()) {
                            return;
                        }
                        TTAppOpenAdActivity.this.getWindow().getDecorView().postDelayed(new Runnable() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTAppOpenAdActivity.6.1
                            @Override // java.lang.Runnable
                            public void run() {
                                dc.zb((Activity) TTAppOpenAdActivity.this);
                            }
                        }, 2500L);
                    } catch (Exception e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oMhROTecKOa9N8jwWpPlL6NNFV", "VOAejBCobMq1Q+FUnxiiIVfnOYwgtGjJh08=", o.MAX_BIND_PARAMETER_CNT);
                        htf.sya("TTAppOpenAdActivity", e3.getMessage());
                        jc.ycx(TTAppOpenAdActivity.this.thx, "show_ad_fail", "open_ad", "attach_to_window_failed");
                    }
                }
            }
        });
    }

    @Override // android.app.Activity
    public void onBackPressed() throws JSONException {
        uh();
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onCreate(Bundle bundle) {
        tn tnVar;
        super.onCreate(bundle);
        pmi.zb(getApplicationContext());
        this.ifb = bundle != null ? bundle.getBoolean("enable_new_arch", false) : getIntent() != null && getIntent().getBooleanExtra("enable_new_arch", false);
        htf.ycx("BVA", "onCreate: isEnableNewArch = " + this.ifb);
        if (!zb(bundle)) {
            jc.ycx(this.thx, "show_ad_fail", "open_ad", "init_view_crash");
            finish();
            return;
        }
        if (!syc.lud()) {
            jc.ycx(this.thx, "show_ad_fail", "open_ad", "init_view_crash");
            finish();
            return;
        }
        if (bundle != null) {
            com.bytedance.sdk.openadsdk.dj.sya.zb(this.thx, "open_ad", (JSONObject) null, (JSONObject) null);
        }
        this.f24317uh = tn.lud(this.thx);
        new StringBuilder("onCreate: isVideo is ").append(this.f24317uh);
        if (!this.f24317uh || (tnVar = this.thx) == null) {
            this.f24312jc.ycx(pmi.dj().dv(String.valueOf(this.htf)));
        } else {
            this.f24312jc.ycx((float) tnVar.ci().f22186d);
        }
        com.bytedance.sdk.openadsdk.component.lt.zb zbVar = new com.bytedance.sdk.openadsdk.component.lt.zb(this.f24312jc);
        this.f24310ea = zbVar;
        zbVar.ycx(this.dwi);
        jc();
        if (com.bytedance.sdk.openadsdk.dv.lud.ycx("aoa_ad_report_enable", 0) == 1) {
            jc.ycx(this.thx, "on_create", "open_ad", "activity_on_create");
        }
        FrameLayout frameLayout = new FrameLayout(this);
        this.f24311hf = frameLayout;
        frameLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        try {
            pmi();
            setContentView(this.f24311hf);
            this.f24311hf.post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTAppOpenAdActivity.2
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        if (TTAppOpenAdActivity.this.thx == null) {
                            TTAppOpenAdActivity.this.finish();
                            return;
                        }
                        int iTx = TTAppOpenAdActivity.this.thx.tx();
                        if (com.bytedance.sdk.openadsdk.component.ul.ycx.ea()) {
                            TTAppOpenAdActivity.this.tru = iTx != 1;
                            TTAppOpenAdActivity tTAppOpenAdActivity = TTAppOpenAdActivity.this;
                            tTAppOpenAdActivity.bhi = new com.bytedance.sdk.openadsdk.component.zb(tTAppOpenAdActivity, tTAppOpenAdActivity.thx, TTAppOpenAdActivity.this.f24311hf, TTAppOpenAdActivity.this.dwi, TTAppOpenAdActivity.this.oty, TTAppOpenAdActivity.this.f24317uh, TTAppOpenAdActivity.this.f24312jc, TTAppOpenAdActivity.this.f24310ea);
                            if (!TTAppOpenAdActivity.this.tru || !TTAppOpenAdActivity.this.wwx()) {
                                TTAppOpenAdActivity.this.thx.htf(1);
                                TTAppOpenAdActivity.this.thx.thx(1);
                            }
                        } else {
                            TTAppOpenAdActivity tTAppOpenAdActivity2 = TTAppOpenAdActivity.this;
                            if (tTAppOpenAdActivity2.thx.aq() == 2 && iTx != 1) {
                                z = true;
                            }
                            tTAppOpenAdActivity2.tru = z;
                            if (TTAppOpenAdActivity.this.tru && TTAppOpenAdActivity.this.wwx()) {
                                TTAppOpenAdActivity tTAppOpenAdActivity3 = TTAppOpenAdActivity.this;
                                tTAppOpenAdActivity3.bhi = new com.bytedance.sdk.openadsdk.component.zb(tTAppOpenAdActivity3, tTAppOpenAdActivity3.thx, TTAppOpenAdActivity.this.f24311hf, TTAppOpenAdActivity.this.dwi, TTAppOpenAdActivity.this.oty, TTAppOpenAdActivity.this.f24317uh, TTAppOpenAdActivity.this.f24312jc, TTAppOpenAdActivity.this.f24310ea);
                            } else {
                                TTAppOpenAdActivity tTAppOpenAdActivity4 = TTAppOpenAdActivity.this;
                                tTAppOpenAdActivity4.bhi = new com.bytedance.sdk.openadsdk.component.sya(tTAppOpenAdActivity4, tTAppOpenAdActivity4.thx, TTAppOpenAdActivity.this.f24311hf, TTAppOpenAdActivity.this.dwi, TTAppOpenAdActivity.this.oty, TTAppOpenAdActivity.this.f24317uh, TTAppOpenAdActivity.this.f24312jc);
                                TTAppOpenAdActivity.this.bhi.ycx(TTAppOpenAdActivity.this.pmi, TTAppOpenAdActivity.this.wie);
                            }
                        }
                        TTAppOpenAdActivity.this.bhi.ycx((ViewGroup) TTAppOpenAdActivity.this.f24311hf);
                        TTAppOpenAdActivity.this.bhi.zb();
                        TTAppOpenAdActivity.this.bhi.sya();
                        TTAppOpenAdActivity tTAppOpenAdActivity5 = TTAppOpenAdActivity.this;
                        com.bytedance.sdk.openadsdk.tn.ycx.ycx.ycx(tTAppOpenAdActivity5, tTAppOpenAdActivity5.f24311hf, com.bytedance.sdk.openadsdk.tn.ycx.ycx.ycx(TTAppOpenAdActivity.this.thx.ac()));
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oMhROTecKOa9N8jwWpPlL6NNFR", "Sfsj", 362);
                        jc.ycx(TTAppOpenAdActivity.this.thx, "show_ad_fail", "open_ad", "init_view_crash");
                        TTAppOpenAdActivity.this.finish();
                        htf.sya("TTAppOpenAdActivity", th2.getMessage());
                    }
                }
            });
            try {
                if (!com.bytedance.sdk.openadsdk.core.jc.zb.ycx.sya(this)) {
                    final View decorView = getWindow().getDecorView();
                    if (Build.VERSION.SDK_INT >= 35) {
                        this.fby = true;
                        decorView.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTAppOpenAdActivity.3
                            @Override // android.view.View.OnApplyWindowInsetsListener
                            public WindowInsets onApplyWindowInsets(View view, WindowInsets windowInsets) {
                                List boundingRects;
                                try {
                                    DisplayCutout displayCutout = windowInsets.getDisplayCutout();
                                    if (displayCutout == null || (boundingRects = displayCutout.getBoundingRects()) == null || boundingRects.isEmpty()) {
                                        return windowInsets;
                                    }
                                    decorView.setPadding(displayCutout.getSafeInsetLeft(), displayCutout.getSafeInsetTop(), displayCutout.getSafeInsetRight(), displayCutout.getSafeInsetBottom());
                                    return windowInsets;
                                } catch (Throwable th2) {
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oMhROTecKOa9N8jwWpPlL6NNFQ", "VOAMhROwcPCJRNNSmziuO176Pg==", 385);
                                    jc.ycx(TTAppOpenAdActivity.this.thx, "show_ad_fail", "open_ad", "init_view_crash");
                                    return windowInsets;
                                }
                            }
                        });
                    }
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oMhROTecKOa9N8jwWpPlL6NA==", "VOAOhwa9fcI=", 393);
                jc.ycx(this.thx, "show_ad_fail", "open_ad", "init_view_crash");
            }
            tru();
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oMhROTecKOa9N8jwWpPlL6NA==", "VOAOhwa9fcI=", 323);
            com.bytedance.sdk.openadsdk.dy.dj.zb();
            jc.ycx(this.thx, "show_ad_fail", "open_ad", "init_view_crash");
            finish();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onDestroy() throws JSONException {
        AdSlot adSlot;
        super.onDestroy();
        if (this.thx != null) {
            com.bytedance.sdk.openadsdk.lt.zb.ycx().ycx("videoForceBreak", this.thx);
        }
        this.f24320zb.removeCallbacksAndMessages(null);
        com.bytedance.sdk.openadsdk.component.lt.zb zbVar = this.f24310ea;
        if (zbVar != null) {
            zbVar.lud();
        }
        xkz xkzVar = this.yzp;
        if (xkzVar != null) {
            xkzVar.sya();
        }
        com.bytedance.sdk.openadsdk.oty.zb.lud.ycx(this.thx);
        com.bytedance.sdk.openadsdk.oty.ycx.sya.zb(this.thx);
        if (this.f24317uh) {
            com.bytedance.sdk.openadsdk.component.dj.zb.ycx(this.thx, this.f24312jc.dj(), this.f24312jc.zb(), true);
        } else {
            com.bytedance.sdk.openadsdk.component.dj.zb.ycx(this.thx, -1L, this.f24312jc.zb(), false);
        }
        if (this.syc.lt() && this.xkz.get()) {
            com.bytedance.sdk.openadsdk.dj.sya.ycx(String.valueOf(this.syc.dj()), this.thx, "open_ad", this.f24309dy);
            this.syc = dwi.sya();
        }
        com.bytedance.sdk.openadsdk.component.sya syaVar = this.bhi;
        if (syaVar != null) {
            syaVar.dj();
        }
        jw();
        f24305jw = null;
        if (this.ifb && !TextUtils.isEmpty(this.kgy)) {
            av.ycx().ycx(this.kgy, isFinishing(), isChangingConfigurations());
        }
        this.wwx = null;
        wie wieVar = this.f24314ok;
        if (wieVar != null) {
            wieVar.setCallback(null);
        }
        tn tnVar = this.thx;
        if (tnVar != null && !tn.ul(tnVar) && !this.thx.oiz() && (adSlot = this.f24306av) != null) {
            adSlot.setCacheScene(1);
            com.bytedance.sdk.openadsdk.component.lt.ycx(pmi.ycx()).ycx(this.f24306av);
        }
        com.bytedance.sdk.openadsdk.component.dj.ycx.ycx(this.thx);
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onPause() throws IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException {
        super.onPause();
        this.lud = false;
        lud();
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onResume() throws IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException {
        com.bytedance.sdk.openadsdk.component.sya syaVar;
        super.onResume();
        this.lud = true;
        if (this.ycx.getAndSet(true)) {
            if (!this.f24316tn.get()) {
                sya();
                return;
            }
            oty();
            if (this.f24317uh && (syaVar = this.bhi) != null && syaVar.fby() != null) {
                av();
                this.bhi.fby().ycx(3);
            }
            jc.ycx(this.thx, "show_ad_fail", "open_ad", "activity_on_resume_skip");
            finish();
        }
    }

    @Override // android.app.Activity
    public void onSaveInstanceState(Bundle bundle) {
        if (bundle == null) {
            bundle = new Bundle();
        }
        try {
            this.f24318ul = this.thx != null ? av.ycx().ycx(this.thx) : -1;
            if (!TextUtils.isEmpty(this.kgy)) {
                bundle.putString("single_process_listener_key", this.kgy);
            }
            bundle.putBoolean("enable_new_arch", this.ifb);
            bundle.putInt("meta_index", this.f24318ul);
            bundle.putInt("ad_source", this.f24308dv);
            bundle.putLong("start_show_time", this.f24313lt);
            bundle.putLong("cache_time", this.aeu);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oMhROTecKOa9N8jwWpPlL6NA==", "VOAelBW5QMmTXtZTjxSTPFr6KA==", 1155);
            htf.sya("TTAppOpenAdActivity", th2.getMessage());
            jc.ycx(this.thx, "show_ad_fail", "open_ad", "save_instance_state_failed");
        }
        if (!this.ifb) {
            f24305jw = this.wwx;
        }
        super.onSaveInstanceState(bundle);
    }

    @Override // android.app.Activity
    public void onStart() {
        super.onStart();
        if (this.f24318ul >= 0) {
            av.ycx().sya(this.f24318ul);
            this.f24318ul = -1;
        }
        com.bytedance.sdk.openadsdk.utils.dj.ycx(this, this.thx);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onWindowFocusChanged(boolean z11) {
        super.onWindowFocusChanged(z11);
        if (z11) {
            if (!this.tru) {
                this.syc.lud();
            }
            tn tnVar = this.thx;
            if (tnVar != null && tnVar.mqm() && !this.thx.bhi()) {
                this.thx.ul(true);
                tn tnVar2 = this.thx;
                com.bytedance.sdk.openadsdk.dj.sya.ycx(tnVar2, "open_ad", tnVar2.wqq());
            }
        } else if (this.xkz.get()) {
            if (this.syc.lt()) {
                com.bytedance.sdk.openadsdk.dj.sya.ycx(String.valueOf(this.syc.dj()), this.thx, "open_ad", this.f24309dy);
            }
            this.syc = dwi.sya();
        }
        com.bytedance.sdk.openadsdk.oty.zb.lud.ycx(this.thx, z11 ? 4 : 8);
        com.bytedance.sdk.openadsdk.oty.ycx.sya.ycx(this.thx, z11);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void av() {
        tn tnVar;
        try {
            if (this.f24310ea == null || (tnVar = this.thx) == null || tnVar.zg() == null) {
                return;
            }
            int iZb = this.thx.zg().zb();
            if (iZb == 1 || iZb == 2) {
                this.f24310ea.ycx(iZb, this.thx.zg().ycx(), false);
                com.bytedance.sdk.openadsdk.component.sya syaVar = this.bhi;
                if (syaVar == null || syaVar.fby() == null) {
                    return;
                }
                this.bhi.fby().zb().ycx(this.f24312jc.ycx());
                this.bhi.fby().zb().ycx(1.0f);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oMhROTecKOa9N8jwWpPlL6NA==", "WO8hmTCoZtehSdRYgBSyKU/r", 1202);
            htf.sya("TTAppOpenAdActivity", th2.getMessage());
        }
    }

    private int bhi() {
        tn tnVar = this.thx;
        return (tnVar == null || tnVar.zb() < 0) ? pmi.dj().tn(String.valueOf(this.htf)) : this.thx.zb();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dv() {
        com.bytedance.sdk.openadsdk.component.fby.sya syaVarFby;
        com.bytedance.sdk.openadsdk.ycx.dj.zb zbVar = this.wwx;
        if (zbVar != null) {
            zbVar.onAdClicked();
        }
        if (ea.zb().oty(String.valueOf(this.htf))) {
            this.f24316tn.set(true);
        }
        com.bytedance.sdk.openadsdk.component.sya syaVar = this.bhi;
        if (syaVar == null || (syaVarFby = syaVar.fby()) == null) {
            return;
        }
        syaVarFby.dy();
    }

    private void dy() {
        this.f24315ry.show(TTAdDislikeToast.getDislikeTip());
    }

    private void ea() {
        int iMin;
        int iMax;
        new StringBuilder("changeScreenOrientation: mOrientation=").append(this.oty);
        uh.ycx(this, this.oty, lt(), 2);
        if (this.oty == 2 || !dc.dj((Activity) this)) {
            getWindow().addFlags(1024);
        }
        Point pointZb = dc.zb(getApplicationContext());
        if (this.oty == 2) {
            iMin = Math.max(pointZb.x, pointZb.y);
            iMax = Math.min(pointZb.x, pointZb.y);
        } else {
            iMin = Math.min(pointZb.x, pointZb.y);
            iMax = Math.max(pointZb.x, pointZb.y);
        }
        this.wie = iMax;
        this.pmi = iMin;
        float fYcx = dc.ycx();
        if (dc.dj((Activity) this)) {
            int i5 = this.oty;
            if (i5 == 1) {
                this.wie -= fYcx;
            } else if (i5 == 2) {
                this.pmi -= fYcx;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void fby() {
        int iBhi = bhi();
        this.f24310ea.ycx(this.f24312jc.zb());
        this.f24310ea.zb(iBhi);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hf() throws JSONException {
        com.bytedance.sdk.openadsdk.core.model.dj djVarQye;
        com.bytedance.sdk.openadsdk.core.xkz.dj djVarYcx;
        com.bytedance.sdk.openadsdk.component.sya syaVar;
        bhi.sya(this.htf);
        oty();
        if (this.f24317uh && (syaVar = this.bhi) != null && syaVar.fby() != null) {
            av();
            this.bhi.fby().ycx(4);
        }
        com.bytedance.sdk.openadsdk.component.dj.zb.ycx(this.thx, (int) this.f24312jc.sya(), this.f24310ea.ycx(), this.f24312jc.zb());
        tn tnVar = this.thx;
        if (tnVar != null && (djVarQye = tnVar.qye()) != null && (djVarYcx = djVarQye.ycx()) != null) {
            com.bytedance.sdk.openadsdk.component.sya syaVar2 = this.bhi;
            long jRy = (syaVar2 == null || syaVar2.fby() == null) ? 0L : this.bhi.fby().ry();
            djVarYcx.lt(jRy);
            djVarYcx.lud(jRy);
        }
        finish();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int htf() {
        if (this.thx.mu()) {
            return 5;
        }
        if (this.tru) {
            return this.bhi.lud();
        }
        return -1;
    }

    private void jc() {
        this.oty = ok.ycx(this, this.thx);
        if (com.bytedance.sdk.openadsdk.core.jc.zb.ycx.sya(this)) {
            float[] fArrYcx = ok.ycx((Activity) this, this.oty, false);
            this.pmi = (int) fArrYcx[0];
            this.wie = (int) fArrYcx[1];
        } else {
            ea();
        }
        com.bytedance.sdk.openadsdk.component.sya syaVar = this.bhi;
        if (syaVar != null) {
            syaVar.ycx(this.pmi, this.wie);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void jw() {
        htf.ycx("TTAppOpenAdActivity", "invoke callback onAdDismiss, ".concat(String.valueOf(this)));
        com.bytedance.sdk.openadsdk.ycx.dj.zb zbVar = this.wwx;
        if (zbVar != null) {
            zbVar.sya();
        }
    }

    private void ok() {
        if (this.f24314ok == null) {
            wie wieVar = new wie(this, this.thx);
            this.f24314ok = wieVar;
            wieVar.setDislikeSource("video_player");
            this.f24314ok.setCallback(new wie.ycx() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTAppOpenAdActivity.4
                @Override // com.bytedance.sdk.openadsdk.common.wie.ycx
                public void ycx(View view) {
                    TTAppOpenAdActivity.this.sya.set(true);
                    TTAppOpenAdActivity.this.lud();
                    com.bytedance.sdk.openadsdk.oty.ycx.sya.ycx(TTAppOpenAdActivity.this.thx, 8);
                }

                @Override // com.bytedance.sdk.openadsdk.common.wie.ycx
                public void zb(View view) {
                    TTAppOpenAdActivity.this.sya.set(false);
                    TTAppOpenAdActivity.this.sya();
                    com.bytedance.sdk.openadsdk.oty.ycx.sya.ycx(TTAppOpenAdActivity.this.thx, 4);
                }

                @Override // com.bytedance.sdk.openadsdk.common.wie.ycx
                public void ycx(FilterWord filterWord) {
                    if (TTAppOpenAdActivity.this.f24307dj.get() || filterWord == null || filterWord.hasSecondOptions()) {
                        return;
                    }
                    TTAppOpenAdActivity.this.f24307dj.set(true);
                    TTAppOpenAdActivity.this.wie();
                }
            });
        }
        FrameLayout frameLayout = (FrameLayout) findViewById(16908290);
        frameLayout.addView(this.f24314ok);
        if (this.f24315ry == null) {
            TTAdDislikeToast tTAdDislikeToast = new TTAdDislikeToast(this);
            this.f24315ry = tTAdDislikeToast;
            frameLayout.addView(tTAdDislikeToast);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void oty() {
        com.bytedance.sdk.openadsdk.ycx.dj.zb zbVar = this.wwx;
        if (zbVar != null) {
            zbVar.zb();
        } else {
            jc.ycx(this.thx, n.f39150d, 0);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ry() {
        if (!this.f24317uh || this.thx.aeu() || this.rmf) {
            return;
        }
        this.f24320zb.sendEmptyMessageDelayed(100, pmi.dj().zr() * 1000);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void thx() {
        if (this.xkz.get()) {
            jc.ycx(this.thx, "show_ad_fail", "open_ad", "repeat_play");
            return;
        }
        try {
            getWindow().getDecorView().post(this.oby);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oMhROTecKOa9N8jwWpPlL6NA==", "SO0lkAepZcKyT8dSngWTIFT5GZQQtw==", 872);
            jc.ycx(this.thx, "show_ad_fail", "open_ad", "show_report_failed");
            finish();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void tn() {
        com.bytedance.sdk.openadsdk.ycx.dj.zb zbVar = this.wwx;
        if (zbVar != null) {
            zbVar.ycx();
        } else {
            jc.ycx(this.thx, "show", 0);
        }
        com.bytedance.sdk.openadsdk.component.dj.ycx.zb(this.thx, htf());
    }

    private void tru() {
        if (com.bytedance.sdk.openadsdk.dv.lud.ycx("aoa_force_show_close_enable", false)) {
            com.bytedance.sdk.openadsdk.core.widget.ul ulVar = new com.bytedance.sdk.openadsdk.core.widget.ul(this, 33, 0.0f);
            this.f24319xz = ulVar;
            ulVar.setImageDrawable(wwx.sya(this, "tt_ad_close_backup"));
            this.f24319xz.setContentDescription(wwx.ycx(this, "tt_close_backup_button_text"));
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
            layoutParams.gravity = 8388661;
            layoutParams.topMargin = dc.zb(this, 27.0f);
            layoutParams.rightMargin = dc.zb(this, 9.0f);
            this.f24319xz.setVisibility(8);
            this.f24311hf.addView(this.f24319xz, layoutParams);
            this.f24319xz.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTAppOpenAdActivity.7
                @Override // android.view.View.OnClickListener
                public void onClick(View view) throws JSONException {
                    TTAppOpenAdActivity.this.hf();
                }
            });
            xkz xkzVarYcx = com.bytedance.sdk.openadsdk.utils.jw.ycx(this, new jw.ycx() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTAppOpenAdActivity.8
                @Override // com.bytedance.sdk.openadsdk.utils.jw.ycx
                public View ycx() {
                    return TTAppOpenAdActivity.this.f24319xz;
                }

                @Override // com.bytedance.sdk.openadsdk.utils.jw.ycx
                public void zb() {
                }
            });
            this.yzp = xkzVarYcx;
            xkzVarYcx.ycx(com.bytedance.sdk.openadsdk.dv.lud.ycx("aoa_force_close_delay_time", 5000));
            this.yzp.ycx(new com.bytedance.sdk.openadsdk.utils.syc() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTAppOpenAdActivity.9
                @Override // com.bytedance.sdk.openadsdk.utils.syc
                public void ycx() throws JSONException {
                    JSONObject jSONObject = new JSONObject();
                    try {
                        if (TTAppOpenAdActivity.this.thx != null) {
                            jSONObject.putOpt("render_sequence", Integer.valueOf(TTAppOpenAdActivity.this.thx.tx()));
                        }
                        if (TTAppOpenAdActivity.this.bhi != null) {
                            jSONObject.putOpt("dynamic_show_type", Integer.valueOf(TTAppOpenAdActivity.this.bhi.lud()));
                        }
                    } catch (JSONException e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oMhROTecKOa9N8jwWpPlL6NNFa", "VOAOmQyvbOWVXsNSgiKoJ0w=", 1085);
                        htf.sya("TTAppOpenAdActivity", e3.getMessage());
                    }
                    com.bytedance.sdk.openadsdk.component.dj.zb.ycx("aoa_backup_close_show", TTAppOpenAdActivity.this.thx, jSONObject);
                }
            });
            this.yzp.ycx((long) (Math.min(bhi(), this.f24312jc.zb()) * 1000.0f));
        }
    }

    private void uh() throws JSONException {
        if (pmi.dj().wwx(String.valueOf(this.htf)) == 1) {
            if (this.f24312jc.sya() >= pmi.dj().tn(String.valueOf(this.htf)) * 1000) {
                hf();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void wie() {
        this.f24315ry.show(TTAdDislikeToast.getDislikeSendTip());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean wwx() {
        if (!this.thx.rmy()) {
            return false;
        }
        int iTx = this.thx.tx();
        return ((iTx == 0 || iTx == 9) && (com.bytedance.sdk.component.adexpress.ycx.zb.sya.ycx(ry.sya(), "3.1.78") || com.bytedance.sdk.component.adexpress.ycx.zb.sya.ycx(ry.dj(), "3.1.78"))) ? false : true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void xkz() {
        if (!this.f24317uh || this.thx.aeu()) {
            return;
        }
        this.f24320zb.removeMessages(100);
    }

    public boolean lt() {
        try {
            return getIntent().getIntExtra("orientation_angle", 0) == 3;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oMhROTecKOa9N8jwWpPlL6NA==", "Uv0fkBW5e9SF", 1212);
            htf.sya("TTAppOpenAdActivity", e3.getMessage());
            return false;
        }
    }

    public void lud() {
        if (this.f24317uh) {
            com.bytedance.sdk.openadsdk.component.sya syaVar = this.bhi;
            if (syaVar != null && syaVar.fby() != null && this.bhi.fby().lud()) {
                this.bhi.fby().fby();
            }
            xkz();
        }
        com.bytedance.sdk.openadsdk.component.lt.zb zbVar = this.f24310ea;
        if (zbVar != null) {
            zbVar.dj();
        }
        xkz xkzVar = this.yzp;
        if (xkzVar != null) {
            xkzVar.zb();
        }
    }

    public void sya() {
        if (this.sya.get()) {
            return;
        }
        if (this.f24317uh) {
            com.bytedance.sdk.openadsdk.component.sya syaVar = this.bhi;
            if (syaVar != null && syaVar.fby() != null && this.bhi.fby().lt()) {
                this.bhi.fby().ea();
            }
            ry();
        }
        com.bytedance.sdk.openadsdk.component.lt.zb zbVar = this.f24310ea;
        if (zbVar != null) {
            zbVar.sya();
        }
        xkz xkzVar = this.yzp;
        if (xkzVar != null) {
            xkzVar.ycx();
        }
    }

    public void ul() {
        com.bytedance.sdk.openadsdk.component.sya syaVar;
        com.bytedance.sdk.openadsdk.component.jw.zb zbVarYcx;
        if (this.f24319xz == null || (syaVar = this.bhi) == null || !(syaVar instanceof com.bytedance.sdk.openadsdk.component.zb) || (zbVarYcx = ((com.bytedance.sdk.openadsdk.component.zb) syaVar).ycx()) == null) {
            return;
        }
        ViewParent parent = this.f24319xz.getParent();
        if (parent instanceof ViewGroup) {
            ((ViewGroup) parent).removeView(this.f24319xz);
        }
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
        layoutParams.gravity = 8388661;
        layoutParams.topMargin = dc.zb(this, 27.0f);
        layoutParams.rightMargin = dc.zb(this, 9.0f);
        zbVarYcx.addView(this.f24319xz, layoutParams);
    }

    public void zb() {
        if (isFinishing()) {
            return;
        }
        if (this.f24307dj.get()) {
            dy();
            return;
        }
        if (this.f24314ok == null) {
            try {
                ok();
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oMhROTecKOa9N8jwWpPlL6NA==", "SOYigie1esuJQdJ5hRCsJ1w=", PglCryptUtils.ENCRYPT_FAILED);
                ApmHelper.reportCustomError("initDislike error", "TTAppOpenAdActivity", th2);
            }
        }
        wie wieVar = this.f24314ok;
        if (wieVar != null) {
            wieVar.ycx();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public JSONObject ycx(JSONObject jSONObject) {
        if (htf() == 0) {
            return this.bhi.ycx(jSONObject);
        }
        return null;
    }

    public void ycx(Intent intent) {
        if (intent != null) {
            this.f24308dv = intent.getIntExtra("ad_source", 0);
            this.aeu = intent.getLongExtra("cache_time", 0L);
            this.f24313lt = intent.getLongExtra("start_show_time", 0L);
        }
    }

    public void ycx(Bundle bundle) {
        if (bundle != null) {
            if (!this.ifb && this.wwx == null) {
                this.wwx = f24305jw;
                f24305jw = null;
            }
            try {
                int i5 = bundle.getInt("meta_index", -1);
                this.f24308dv = bundle.getInt("ad_source", 0);
                this.f24313lt = bundle.getLong("start_show_time", 0L);
                this.aeu = bundle.getLong("cache_time", 0L);
                this.thx = av.ycx().ycx(i5);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oMhROTecKOa9N8jwWpPlL6NA==", "XOs5vA26ZuGSRdp/mR+kJF4=", 1133);
                htf.sya("TTAppOpenAdActivity", th2.getMessage());
                jc.ycx(this.thx, "show_ad_fail", "open_ad", "get_bundle_info_failed");
            }
        }
    }

    private boolean zb(Bundle bundle) {
        String stringExtra;
        this.thx = av.ycx().ycx(av.ycx(getIntent()));
        if (this.ifb) {
            if (bundle != null) {
                stringExtra = bundle.getString("single_process_listener_key");
            } else {
                stringExtra = getIntent() != null ? getIntent().getStringExtra("single_process_listener_key") : null;
            }
            this.kgy = stringExtra;
            this.wwx = (com.bytedance.sdk.openadsdk.ycx.dj.zb) av.ycx().ycx(this.kgy, com.bytedance.sdk.openadsdk.ycx.dj.zb.class);
        } else {
            this.wwx = av.ycx().dj();
        }
        av.ycx().lud();
        ycx(getIntent());
        ycx(bundle);
        tn tnVar = this.thx;
        if (tnVar == null) {
            finish();
            return false;
        }
        this.f24306av = tnVar.qn();
        this.thx.ycx(this.f24313lt);
        this.htf = this.thx.ksy();
        com.bytedance.sdk.openadsdk.utils.zb.ycx(this.thx);
        return true;
    }

    @Override // com.bytedance.sdk.component.utils.tru.ycx
    public void ycx(Message message) {
        com.bytedance.sdk.openadsdk.core.model.dj djVarQye;
        com.bytedance.sdk.openadsdk.core.xkz.dj djVarYcx;
        com.bytedance.sdk.openadsdk.component.sya syaVar;
        if (message.what == 100) {
            if (this.f24317uh && (syaVar = this.bhi) != null && syaVar.fby() != null) {
                av();
                this.bhi.fby().ycx(1);
            }
            tn tnVar = this.thx;
            if (tnVar != null && (djVarQye = tnVar.qye()) != null && (djVarYcx = djVarQye.ycx()) != null) {
                djVarYcx.ycx(com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx.GENERAL_LINEAR_AD_ERROR);
            }
            oty();
            jc.ycx(this.thx, "show_ad_fail", "open_ad", "play_video_time_out");
            finish();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.core.syc.dj.ycx.InterfaceC0086ycx
    public void ycx(int i5) {
        if (i5 == 2 || i5 == 3 || i5 == 4) {
            av();
        }
    }
}
