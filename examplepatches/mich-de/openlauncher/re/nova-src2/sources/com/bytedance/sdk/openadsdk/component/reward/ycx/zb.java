package com.bytedance.sdk.openadsdk.component.reward.ycx;

import android.app.Activity;
import android.content.Context;
import android.os.SystemClock;
import android.view.View;
import com.bytedance.sdk.component.utils.tru;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.jw;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb {
    public final xkz aeu;

    /* renamed from: aq, reason: collision with root package name */
    public boolean f25170aq;

    /* renamed from: av, reason: collision with root package name */
    public com.bytedance.sdk.openadsdk.ry.jc f25171av;
    public int bba;

    /* renamed from: bh, reason: collision with root package name */
    public boolean f25172bh;
    public final dj bhi;
    public com.bytedance.sdk.openadsdk.component.reward.top.sya bjp;
    public final boolean dc;
    private long dfk;

    /* renamed from: dj, reason: collision with root package name */
    public final boolean f25173dj;
    public boolean dqs;
    public int duz;

    /* renamed from: dv, reason: collision with root package name */
    public final com.bytedance.sdk.openadsdk.component.reward.view.jw f25174dv;
    public final com.bytedance.sdk.openadsdk.core.syc.dj.zb dwi;

    /* renamed from: dy, reason: collision with root package name */
    public final AtomicBoolean f25175dy;

    /* renamed from: ea, reason: collision with root package name */
    public final AtomicBoolean f25176ea;
    public int fby;
    public com.bytedance.sdk.openadsdk.utils.xkz giw;

    /* renamed from: hf, reason: collision with root package name */
    public final ea f25177hf;
    public boolean hpv;
    public final AtomicBoolean htf;
    public final com.bytedance.sdk.openadsdk.component.reward.view.fby ifb;

    /* renamed from: iq, reason: collision with root package name */
    public int f25178iq;

    /* renamed from: jc, reason: collision with root package name */
    public final AtomicBoolean f25179jc;

    /* renamed from: jw, reason: collision with root package name */
    public final AtomicBoolean f25180jw;
    public final com.bytedance.sdk.openadsdk.component.reward.view.ea kgy;

    /* renamed from: lt, reason: collision with root package name */
    public final int f25181lt;
    public final String lud;

    /* renamed from: lv, reason: collision with root package name */
    public boolean f25182lv;

    /* renamed from: mp, reason: collision with root package name */
    public float f25183mp;
    public final tru nji;
    public boolean nzi;
    public final Context oby;

    /* renamed from: ok, reason: collision with root package name */
    public final AtomicBoolean f25184ok;
    public final ok oty;
    public final AtomicBoolean pmi;

    /* renamed from: py, reason: collision with root package name */
    private long f25185py;
    private int qn;

    /* renamed from: rl, reason: collision with root package name */
    public int f25186rl;
    public final pmi rmf;
    public final lt rmy;

    /* renamed from: ry, reason: collision with root package name */
    public final AtomicBoolean f25187ry;

    /* renamed from: sg, reason: collision with root package name */
    public boolean f25188sg;
    public final boolean sya;
    public final AtomicBoolean syc;
    public String sz;
    public final wie thx;

    /* renamed from: tn, reason: collision with root package name */
    public final jw f25189tn;
    public final ul tru;

    /* renamed from: tx, reason: collision with root package name */
    public boolean f25190tx;

    /* renamed from: uf, reason: collision with root package name */
    public int f25191uf;
    public boolean ufy;

    /* renamed from: uh, reason: collision with root package name */
    public final AtomicBoolean f25192uh;

    /* renamed from: ui, reason: collision with root package name */
    public long f25193ui;
    private String ujb;

    /* renamed from: ul, reason: collision with root package name */
    public int f25194ul;

    /* renamed from: ur, reason: collision with root package name */
    public com.bytedance.sdk.openadsdk.component.reward.zb.zb f25195ur;

    /* renamed from: uu, reason: collision with root package name */
    public com.bytedance.sdk.openadsdk.activity.single.fby f25196uu;

    /* renamed from: uz, reason: collision with root package name */
    public boolean f25197uz;
    public final AtomicBoolean wie;

    /* renamed from: wk, reason: collision with root package name */
    public boolean f25198wk;

    /* renamed from: wr, reason: collision with root package name */
    public boolean f25199wr;
    public final lud wwx;

    /* renamed from: xf, reason: collision with root package name */
    public com.bytedance.sdk.openadsdk.component.reward.ok f25200xf;
    public final AtomicBoolean xkz;
    public boolean xym;

    /* renamed from: xz, reason: collision with root package name */
    public final ry f25201xz;
    public final int ycx;

    /* renamed from: yi, reason: collision with root package name */
    public boolean f25202yi;
    public final Activity yzp;

    /* renamed from: zb, reason: collision with root package name */
    public tn f25203zb;

    /* renamed from: zk, reason: collision with root package name */
    private int f25204zk;

    /* renamed from: zr, reason: collision with root package name */
    public boolean f25205zr;

    public zb(Activity activity, tru truVar, tn tnVar, com.bytedance.sdk.openadsdk.core.syc.dj.zb zbVar, int i5) {
        this(activity, truVar, tnVar, zbVar, i5, null);
    }

    private void jc() {
        com.bytedance.sdk.openadsdk.utils.xkz xkzVarYcx = com.bytedance.sdk.openadsdk.utils.jw.ycx(this.yzp, new jw.ycx() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.zb.1
            @Override // com.bytedance.sdk.openadsdk.utils.jw.ycx
            public View ycx() {
                com.bytedance.sdk.openadsdk.component.reward.view.ea eaVar = zb.this.kgy;
                if (eaVar != null) {
                    return eaVar.ea();
                }
                return null;
            }

            @Override // com.bytedance.sdk.openadsdk.utils.jw.ycx
            public void zb() {
                ry ryVar = zb.this.f25201xz;
                if (ryVar != null) {
                    ryVar.lud();
                }
            }
        });
        this.giw = xkzVarYcx;
        xkzVarYcx.ycx(new com.bytedance.sdk.openadsdk.utils.syc() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.zb.2
            @Override // com.bytedance.sdk.openadsdk.utils.syc
            public void ycx() {
                com.bytedance.sdk.openadsdk.component.dj.zb.ycx("force_button_tracker", "show", zb.this.f25203zb);
            }
        });
    }

    public void dj() {
        this.f25185py = SystemClock.elapsedRealtime();
    }

    public com.bytedance.sdk.openadsdk.dj.ul fby() {
        if (!this.f25203zb.lt()) {
            com.bytedance.sdk.openadsdk.dj.ul ulVar = new com.bytedance.sdk.openadsdk.dj.ul();
            ulVar.ycx(System.currentTimeMillis(), 1.0f);
            return ulVar;
        }
        com.bytedance.sdk.openadsdk.component.reward.view.jw jwVar = this.f25174dv;
        if (jwVar != null && jwVar.ycx() != null) {
            return this.f25174dv.ycx().getAdShowTime();
        }
        com.bytedance.sdk.openadsdk.dj.ul ulVar2 = new com.bytedance.sdk.openadsdk.dj.ul();
        ulVar2.ycx(System.currentTimeMillis(), 1.0f);
        return ulVar2;
    }

    public Map<String, Object> jw() {
        tn tnVar;
        HashMap map = new HashMap();
        if (this.f25174dv != null && (tnVar = this.f25203zb) != null && tnVar.aq() == 2) {
            map.put("dynamic_show_type", Integer.valueOf(this.f25174dv.ea()));
            JSONObject jSONObjectYcx = this.f25174dv.ycx((JSONObject) null);
            if (jSONObjectYcx != null) {
                Iterator<String> itKeys = jSONObjectYcx.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    try {
                        map.put(next, jSONObjectYcx.get(next));
                    } catch (JSONException e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCHKEmWukohw==", "aes6lBG4T9KMRvRSggWlME8=", "XOs5sBuoe8atS8c=", 276);
                    }
                }
            }
        }
        return map;
    }

    public long lt() {
        return (SystemClock.elapsedRealtime() - this.f25185py) + this.dfk;
    }

    public void lud() {
        if (this.f25185py <= 0) {
            this.f25185py = SystemClock.elapsedRealtime();
        }
        this.dfk = (SystemClock.elapsedRealtime() - this.f25185py) + this.dfk;
    }

    public boolean sya() {
        return this.qn != 0;
    }

    public boolean ul() {
        com.bytedance.sdk.openadsdk.activity.single.fby fbyVar;
        return !this.f25188sg || (fbyVar = this.f25196uu) == null || !(fbyVar instanceof com.bytedance.sdk.openadsdk.activity.single.lud) || ((com.bytedance.sdk.openadsdk.activity.single.lud) fbyVar).ycx;
    }

    public int ycx() {
        return this.qn;
    }

    public int zb() {
        return this.f25204zk;
    }

    public zb(Activity activity, tru truVar, tn tnVar, com.bytedance.sdk.openadsdk.core.syc.dj.zb zbVar, int i5, zb zbVar2) {
        this.f25194ul = 0;
        this.fby = 0;
        this.f25180jw = new AtomicBoolean(false);
        this.f25179jc = new AtomicBoolean(false);
        this.f25176ea = new AtomicBoolean(false);
        this.f25184ok = new AtomicBoolean(false);
        this.f25187ry = new AtomicBoolean(false);
        this.xkz = new AtomicBoolean(false);
        this.syc = new AtomicBoolean(false);
        this.f25175dy = new AtomicBoolean(false);
        this.wie = new AtomicBoolean(false);
        this.pmi = new AtomicBoolean(false);
        this.f25192uh = new AtomicBoolean(false);
        this.htf = new AtomicBoolean(false);
        this.xym = false;
        this.bba = 1;
        this.f25193ui = 0L;
        this.f25196uu = null;
        this.f25190tx = true;
        this.nzi = false;
        this.f25198wk = false;
        this.f25204zk = -1;
        this.ujb = b.f42142b;
        this.qn = 0;
        this.yzp = activity;
        this.dwi = zbVar;
        Context contextYcx = com.bytedance.sdk.openadsdk.core.pmi.ycx();
        this.oby = contextYcx;
        this.f25203zb = tnVar;
        this.ycx = i5;
        this.ufy = zbVar2 != null;
        this.f25199wr = i5 == 0 || i5 == 1;
        this.dc = i5 == 0 || i5 == 2;
        this.nji = truVar;
        boolean z11 = tnVar.qn().getDurationSlotType() == 7;
        this.f25173dj = z11;
        String str = z11 ? "rewarded_video" : "fullscreen_interstitial_ad";
        this.lud = str;
        this.dqs = tnVar.lt();
        int iKsy = tnVar.ksy();
        this.f25181lt = iKsy;
        this.f25202yi = com.bytedance.sdk.openadsdk.core.pmi.dj().pmi(String.valueOf(iKsy));
        this.sya = com.bytedance.sdk.openadsdk.core.settings.ea.zb().syc(String.valueOf(iKsy));
        this.oty = new ok(this);
        this.kgy = i5 == 2 ? new com.bytedance.sdk.openadsdk.component.reward.view.ok(this) : tnVar.lt() ? new com.bytedance.sdk.openadsdk.component.reward.view.ea(this) : new com.bytedance.sdk.openadsdk.component.reward.view.jc(this);
        this.ifb = new com.bytedance.sdk.openadsdk.component.reward.view.fby(this);
        this.thx = new wie(this);
        this.wwx = new lud(tnVar, str, contextYcx, activity);
        this.f25189tn = new jw(this, tnVar);
        com.bytedance.sdk.openadsdk.component.reward.view.jw jwVar = zbVar2 != null ? zbVar2.f25174dv : new com.bytedance.sdk.openadsdk.component.reward.view.jw(this);
        this.f25174dv = jwVar;
        jwVar.ycx(this);
        this.rmf = new pmi(this);
        this.aeu = new xkz(this);
        this.f25201xz = new ry(this);
        this.rmy = new lt(this);
        this.f25177hf = new ea(this);
        ul ulVar = zbVar2 != null ? zbVar2.tru : new ul(this);
        this.tru = ulVar;
        ulVar.ycx(this);
        this.bhi = new dj(this);
        this.f25171av = new com.bytedance.sdk.openadsdk.ry.jc(contextYcx);
        jc();
    }

    public void ycx(int i5, String str, int i11) {
        this.f25204zk = i5;
        this.ujb = str;
        this.qn = i11;
    }

    public void ycx(boolean z11) {
        this.f25182lv = z11;
        this.f25201xz.dj(z11);
    }
}
