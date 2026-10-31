package com.bytedance.sdk.openadsdk.core.ry.lt;

import android.content.Context;
import android.text.TextUtils;
import android.util.SparseArray;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.bytedance.adsdk.ugeno.core.dy;
import com.bytedance.adsdk.ugeno.core.ok;
import com.bytedance.adsdk.ugeno.core.ry;
import com.bytedance.adsdk.ugeno.core.syc;
import com.bytedance.adsdk.ugeno.lud.lt;
import com.bytedance.sdk.component.adexpress.zb.xkz;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.core.jc.thx;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.dy;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.settings.ea;
import com.bytedance.sdk.openadsdk.core.sya.sya;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import com.vungle.ads.internal.protos.Sdk;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj implements dy, syc, com.bytedance.sdk.component.adexpress.dynamic.dj, com.bytedance.sdk.component.adexpress.zb.dj<View> {
    protected static int thx = 24;

    /* renamed from: dj, reason: collision with root package name */
    protected JSONObject f25926dj;

    /* renamed from: dv, reason: collision with root package name */
    protected JSONObject f25927dv;

    /* renamed from: dy, reason: collision with root package name */
    protected float f25928dy;
    protected com.bytedance.sdk.component.adexpress.zb.fby fby;

    /* renamed from: hf, reason: collision with root package name */
    private boolean f25930hf;

    /* renamed from: jc, reason: collision with root package name */
    protected xkz f25931jc;

    /* renamed from: jw, reason: collision with root package name */
    protected com.bytedance.sdk.openadsdk.core.jc.dy f25932jw;

    /* renamed from: lt, reason: collision with root package name */
    protected ycx f25933lt;
    protected tn lud;

    /* renamed from: ok, reason: collision with root package name */
    protected com.bytedance.adsdk.ugeno.zb.sya f25934ok;
    private com.bytedance.sdk.component.adexpress.zb.ul oty;
    protected long pmi;
    private thx rmy;

    /* renamed from: ry, reason: collision with root package name */
    protected com.bytedance.adsdk.ugeno.zb.sya f25935ry;
    protected com.bytedance.adsdk.ugeno.zb.sya<View> sya;
    protected float syc;

    /* renamed from: uh, reason: collision with root package name */
    protected long f25937uh;

    /* renamed from: ul, reason: collision with root package name */
    protected FrameLayout f25938ul;
    protected float wie;
    protected String wwx;
    protected float xkz;

    /* renamed from: xz, reason: collision with root package name */
    private lud f25939xz;
    protected ok ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected Context f25940zb;
    protected boolean htf = true;
    private long tru = 0;
    private float bhi = 0.0f;

    /* renamed from: av, reason: collision with root package name */
    private float f25925av = 0.0f;
    private float rmf = 0.0f;
    private float aeu = 0.0f;

    /* renamed from: tn, reason: collision with root package name */
    public SparseArray<sya.ycx> f25936tn = new SparseArray<>();
    private String kgy = b.f42142b;
    private final com.bytedance.sdk.component.fby.zb.sya ifb = new com.bytedance.sdk.component.fby.zb.sya("ugen_render_template") { // from class: com.bytedance.sdk.openadsdk.core.ry.lt.dj.1
        @Override // java.lang.Runnable
        public void run() {
            dj djVar = dj.this;
            djVar.f25926dj = djVar.ycx();
            dj djVar2 = dj.this;
            djVar2.f25927dv = djVar2.zb();
            dj djVar3 = dj.this;
            djVar3.f25939xz = new lud(djVar3.f25940zb, djVar3.lud, djVar3.wwx, djVar3.f25927dv);
            if (dj.this.rmy != null) {
                dj djVar4 = dj.this;
                djVar4.kgy = djVar4.rmy.getUgenTemplateErrorReason();
            } else {
                dj.this.kgy = "expressView is null";
            }
            com.bytedance.sdk.openadsdk.core.syc.sya().post(dj.this.yzp);
        }
    };
    private final Runnable yzp = new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.ry.lt.dj.2
        @Override // java.lang.Runnable
        public void run() throws JSONException {
            if (dj.this.oty != null) {
                dj djVar = dj.this;
                djVar.zb(djVar.oty);
            }
        }
    };
    private boolean dwi = false;

    /* renamed from: ea, reason: collision with root package name */
    protected AtomicBoolean f25929ea = new AtomicBoolean(false);

    static {
        if (pmi.ycx() != null) {
            thx = pmi.zb();
        }
    }

    public dj(Context context, tn tnVar, boolean z11, ycx ycxVar, ViewGroup viewGroup) {
        this.f25940zb = context;
        this.f25930hf = z11;
        this.ycx = new ok(context);
        this.lud = tnVar;
        this.f25933lt = ycxVar;
        this.f25938ul = new FrameLayout(context);
        if (viewGroup instanceof thx) {
            this.rmy = (thx) viewGroup;
        }
        this.wwx = ycxVar.dj();
    }

    private void jw() throws JSONException {
        com.bytedance.adsdk.ugeno.zb.sya<T> syaVarLud;
        if (this.sya == null) {
            return;
        }
        if (this.lud.gjd() && (syaVarLud = this.sya.lud("tvskip")) != 0) {
            syaVarLud.sya(8);
        }
        com.bytedance.adsdk.ugeno.zb.sya<T> syaVarLud2 = this.sya.lud("skip");
        if (syaVarLud2 != 0 && (syaVarLud2 instanceof com.bytedance.adsdk.ugeno.jc.dj.sya)) {
            if (!ea.zb().syc(String.valueOf(this.lud.ksy())) || this.lud.iq() == 5 || this.lud.iq() == 6 || this.lud.tz() == 3) {
                ((com.bytedance.adsdk.ugeno.jc.dj.sya) syaVarLud2).xkz("local://tt_close_btn");
                syaVarLud2.zb();
            }
        }
    }

    public int dj() throws JSONException {
        this.ycx.ycx((syc) this);
        this.ycx.ycx((dy) this);
        com.bytedance.adsdk.ugeno.zb.sya<View> syaVarYcx = this.ycx.ycx(this.f25926dj);
        this.sya = syaVarYcx;
        lud ludVar = this.f25939xz;
        if (ludVar != null && syaVarYcx != null) {
            ludVar.ycx(syaVarYcx);
        }
        if (!(this instanceof com.bytedance.sdk.openadsdk.core.ry.lt.ycx.lt)) {
            this.f25933lt.rmy().zb();
            this.f25933lt.rmy().sya();
        }
        this.ycx.zb(this.f25927dv);
        return 0;
    }

    public com.bytedance.adsdk.ugeno.zb.sya fby() {
        com.bytedance.adsdk.ugeno.zb.sya<View> syaVar = this.sya;
        if (syaVar == null) {
            return null;
        }
        return syaVar.lud("video");
    }

    public com.bytedance.adsdk.ugeno.zb.sya lt() {
        com.bytedance.adsdk.ugeno.zb.sya<View> syaVar = this.sya;
        if (syaVar == null) {
            return null;
        }
        return syaVar.lt("PlayableComponent");
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.dj
    public View lud() {
        return this.f25938ul;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dj
    public void onvideoComplate() {
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dj
    public void setSoundMute(boolean z11) throws JSONException {
        com.bytedance.adsdk.ugeno.zb.sya<T> syaVarLud;
        com.bytedance.adsdk.ugeno.zb.sya<View> syaVar = this.sya;
        if (syaVar == null || (syaVarLud = syaVar.lud("mute")) == 0) {
            return;
        }
        if (z11) {
            ((com.bytedance.adsdk.ugeno.jc.dj.sya) syaVarLud).xkz("local://tt_reward_full_mute");
        } else {
            ((com.bytedance.adsdk.ugeno.jc.dj.sya) syaVarLud).xkz("local://tt_reward_full_unmute");
        }
        syaVarLud.zb();
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dj
    public void setTime(CharSequence charSequence, int i5, int i11, boolean z11) {
        if (this.sya == null) {
            return;
        }
        boolean z12 = i5 == 1;
        ycx(charSequence, z12, i11, z11);
        zb(charSequence, z12, i11, z11);
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dj
    public void setTimeUpdate(int i5) {
    }

    public com.bytedance.adsdk.ugeno.zb.sya ul() {
        return null;
    }

    public void ycx(long j11, long j12) {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(com.bytedance.sdk.component.adexpress.zb.ul ulVar) throws JSONException {
        if (this instanceof com.bytedance.sdk.openadsdk.core.ry.lt.ycx.lt) {
            this.f25933lt.lud().ul(1);
        } else {
            this.f25933lt.rmy().ycx();
        }
        if (this.f25926dj == null) {
            ulVar.ycx(Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE, "ugen template is null real reason is " + this.kgy);
            return;
        }
        if (this.f25927dv == null) {
            ulVar.ycx(Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE, "ugen data is null");
            return;
        }
        int iDj = dj();
        if (this.ycx.ycx()) {
            List<String> listZb = this.ycx.zb();
            if (listZb == null) {
                ulVar.ycx(Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, "unknow widget");
                return;
            }
            ulVar.ycx(Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, "unknow widget;" + listZb.toString());
            return;
        }
        if (iDj != 0) {
            ulVar.ycx(iDj, "ugen render fail");
            return;
        }
        if (this.sya == null) {
            ulVar.ycx(Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, "ugen render error");
            return;
        }
        zb zbVar = new zb();
        this.f25931jc = zbVar;
        zbVar.zb(true);
        this.f25931jc.ycx(sya());
        setSoundMute(this.f25930hf);
        jw();
        com.bytedance.adsdk.ugeno.zb.sya syaVarFby = fby();
        this.f25934ok = syaVarFby;
        if (syaVarFby != null && (syaVarFby instanceof com.bytedance.sdk.openadsdk.core.ry.zb.ul.zb)) {
            ((zb) this.f25931jc).ycx((FrameLayout) ((com.bytedance.sdk.openadsdk.core.ry.zb.ul.zb) syaVarFby).dj());
        }
        lud ludVar = this.f25939xz;
        if (ludVar != null) {
            ludVar.ycx();
        }
        com.bytedance.adsdk.ugeno.zb.sya syaVarLt = lt();
        this.f25935ry = syaVarLt;
        if (syaVarLt != null && (syaVarLt instanceof com.bytedance.adsdk.ugeno.jc.zb.zb)) {
            ((zb) this.f25931jc).zb((FrameLayout) syaVarLt.ea());
        }
        if (av.sya(this.lud)) {
            com.bytedance.adsdk.ugeno.zb.sya syaVarUl = ul();
            if (syaVarUl instanceof com.bytedance.sdk.openadsdk.core.ry.zb.dj.zb) {
                ((zb) this.f25931jc).sya(((com.bytedance.sdk.openadsdk.core.ry.zb.dj.zb) syaVarUl).dj());
            }
        }
        int iIfb = this.sya.ifb();
        int iYzp = this.sya.yzp();
        this.f25938ul.removeAllViews();
        this.f25938ul.addView(this.sya.ea(), new FrameLayout.LayoutParams(iIfb, iYzp));
        float fRmf = this.f25933lt.rmf();
        float fAeu = this.f25933lt.aeu();
        float fZb = dc.zb(this.f25940zb, fRmf);
        float fZb2 = dc.zb(this.f25940zb, fAeu);
        if (sya() != 7) {
            this.f25938ul.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
        } else if (fAeu <= 0.0f) {
            this.f25938ul.setLayoutParams(new FrameLayout.LayoutParams((int) fZb, -2));
        } else {
            this.f25938ul.setLayoutParams(new FrameLayout.LayoutParams((int) fZb, (int) fZb2));
        }
        if (fAeu <= 0.0f || fRmf <= 0.0f) {
            this.f25938ul.measure(View.MeasureSpec.makeMeasureSpec(0, 0), View.MeasureSpec.makeMeasureSpec(0, 0));
            int iSya = dc.sya(this.f25940zb, this.f25938ul.getMeasuredWidth());
            int iSya2 = dc.sya(this.f25940zb, this.f25938ul.getMeasuredHeight());
            this.f25931jc.ycx(iSya);
            this.f25931jc.zb(iSya2);
        } else {
            this.f25931jc.ycx(fRmf);
            this.f25931jc.zb(fAeu);
        }
        if (this.f25929ea.get()) {
            ulVar.ycx(Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE, "ugen render timeout");
        } else {
            this.ycx.ycx(this.sya, "renderDidFinish", new Object[0]);
            ulVar.ycx(this.f25938ul, this.f25931jc);
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.dj
    public int sya() {
        return this.lud.tx();
    }

    @Override // com.bytedance.adsdk.ugeno.core.syc
    public void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, lt.ycx ycxVar) {
    }

    public void ycx(tn tnVar, boolean z11, ycx ycxVar, ViewGroup viewGroup) {
        this.lud = tnVar;
        this.f25933lt = ycxVar;
        this.wwx = ycxVar.dj();
        if (viewGroup instanceof thx) {
            this.rmy = (thx) viewGroup;
        }
        this.f25930hf = z11;
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.dj
    public void ycx(com.bytedance.sdk.component.adexpress.zb.ul ulVar) {
        this.oty = ulVar;
        yzp.sya((Runnable) this.ifb);
    }

    public JSONObject ycx() {
        return this.f25933lt.sya();
    }

    public void ycx(boolean z11) {
        this.f25929ea.set(z11);
    }

    public void ycx(com.bytedance.sdk.component.adexpress.zb.fby fbyVar) {
        this.fby = fbyVar;
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.jc.dy dyVar) {
        this.f25932jw = dyVar;
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.widget.lt ltVar) {
        lud ludVar = this.f25939xz;
        if (ludVar != null) {
            ludVar.ycx(ltVar);
        }
    }

    @Override // com.bytedance.adsdk.ugeno.core.syc
    public void ycx(ry ryVar, syc.zb zbVar, syc.ycx ycxVar) {
        if (ryVar == null) {
            return;
        }
        if (ryVar.zb() == 1 || ryVar.zb() == 4) {
            ycx(ryVar);
        }
        if (ryVar.zb() == 10) {
            ycx(ryVar.sya());
        }
        if (zbVar == null || ryVar.dj() == null) {
            return;
        }
        zbVar.ycx(ryVar.dj());
    }

    private void ycx(JSONObject jSONObject) {
        com.bytedance.adsdk.ugeno.zb.sya<T> syaVarLud;
        if (this.sya == null || jSONObject == null) {
            return;
        }
        String strOptString = jSONObject.optString(TTConst.TRACK_TYPE);
        String strOptString2 = jSONObject.optString("nodeId");
        if (TextUtils.isEmpty(strOptString2) || (syaVarLud = this.sya.lud(strOptString2)) == 0) {
            return;
        }
        if (TextUtils.equals(strOptString, "onShow")) {
            syaVarLud.sya(0);
        } else if (TextUtils.equals(strOptString, "onDismiss")) {
            syaVarLud.sya(8);
        }
    }

    private void ycx(ry ryVar) {
        int i5;
        JSONObject jSONObjectDj;
        boolean zYcx;
        int i11;
        String str;
        lud ludVar;
        lud ludVar2;
        lud ludVar3;
        if (this.fby == null) {
            return;
        }
        String strOptString = ryVar.sya().optString(TTConst.TRACK_TYPE);
        if ("swiperLeft".equals(strOptString) && (ludVar3 = this.f25939xz) != null) {
            ludVar3.zb();
            return;
        }
        if ("swiperRight".equals(strOptString) && (ludVar2 = this.f25939xz) != null) {
            ludVar2.sya();
            return;
        }
        i5 = 2;
        if (!"swiperClick".equals(strOptString) || (ludVar = this.f25939xz) == null) {
            jSONObjectDj = null;
            zYcx = false;
            i11 = 0;
        } else {
            zYcx = ludVar.ycx(ryVar);
            jSONObjectDj = this.f25939xz.dj();
            i11 = 2;
        }
        strOptString.getClass();
        switch (strOptString) {
            case "privacy":
                i5 = 7;
                break;
            case "feedback":
                i5 = 3;
                break;
            case "mute":
                i5 = 5;
                break;
            case "skip":
                i5 = 6;
                break;
            case "video":
                i5 = 4;
                break;
            case "creative":
                break;
            default:
                i5 = i11;
                break;
        }
        com.bytedance.adsdk.ugeno.zb.sya syaVarYcx = ryVar.ycx();
        dy.ycx ycxVarYcx = new dy.ycx().dj(this.xkz).sya(this.syc).zb(this.f25928dy).ycx(this.wie).zb(this.pmi).ycx(this.f25937uh).ycx(this.f25936tn).ycx(ryVar.zb() != 1 || this.htf);
        if (syaVarYcx == null) {
            str = b.f42142b;
        } else {
            str = syaVarYcx.kgy() + "_" + syaVarYcx.rmy();
        }
        this.fby.ycx(ryVar.ycx().ea(), i5, ycxVarYcx.ycx(str).zb(zYcx).zb(jSONObjectDj).ycx());
    }

    public JSONObject zb() {
        return this.f25933lt.xz();
    }

    private void zb(CharSequence charSequence, boolean z11, int i5, boolean z12) {
        com.bytedance.adsdk.ugeno.zb.sya<T> syaVarLud;
        View viewEa;
        com.bytedance.adsdk.ugeno.zb.sya<View> syaVar = this.sya;
        if (syaVar == null || (syaVarLud = syaVar.lud("skip")) == 0 || (viewEa = syaVarLud.ea()) == null) {
            return;
        }
        int i11 = 0;
        if (!z11 && !z12) {
            i11 = 8;
        }
        viewEa.setVisibility(i11);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0059  */
    @Override // com.bytedance.adsdk.ugeno.core.dy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, MotionEvent motionEvent) {
        int i5;
        int action = motionEvent.getAction();
        int i11 = 0;
        int i12 = 1;
        if (action != 0) {
            if (action == 1) {
                this.f25928dy = motionEvent.getRawX();
                this.wie = motionEvent.getRawY();
                if (Math.abs(this.f25928dy - this.xkz) >= thx || Math.abs(this.wie - this.syc) >= thx) {
                    this.htf = false;
                }
                this.f25937uh = System.currentTimeMillis();
            } else if (action == 2) {
                this.rmf = Math.abs(motionEvent.getX() - this.bhi) + this.rmf;
                this.aeu = Math.abs(motionEvent.getY() - this.f25925av) + this.aeu;
                this.bhi = motionEvent.getX();
                this.f25925av = motionEvent.getY();
                if (System.currentTimeMillis() - this.tru > 200) {
                    float f11 = this.rmf;
                    int i13 = thx;
                    if (f11 <= i13 && this.aeu <= i13) {
                        i12 = 2;
                    }
                    if (Math.abs(motionEvent.getRawX() - this.xkz) >= thx || Math.abs(motionEvent.getRawY() - this.syc) >= thx) {
                        this.htf = false;
                    }
                    i5 = i12;
                }
                this.f25936tn.put(motionEvent.getActionMasked(), new sya.ycx(i5, motionEvent.getSize(), motionEvent.getPressure(), System.currentTimeMillis()));
            }
            i11 = -1;
        } else {
            this.pmi = System.currentTimeMillis();
            this.xkz = motionEvent.getRawX();
            this.syc = motionEvent.getRawY();
            this.htf = true;
            this.rmf = 0.0f;
            this.aeu = 0.0f;
            this.tru = System.currentTimeMillis();
            com.bytedance.sdk.openadsdk.core.ok.sya.ycx(motionEvent);
            this.bhi = motionEvent.getX();
            this.f25925av = motionEvent.getY();
        }
        i5 = i11;
        this.f25936tn.put(motionEvent.getActionMasked(), new sya.ycx(i5, motionEvent.getSize(), motionEvent.getPressure(), System.currentTimeMillis()));
    }

    private void ycx(CharSequence charSequence, boolean z11, int i5, boolean z12) throws NumberFormatException {
        com.bytedance.adsdk.ugeno.zb.sya<T> syaVarLud;
        int i11;
        com.bytedance.adsdk.ugeno.zb.sya<View> syaVar = this.sya;
        if (syaVar == null || (syaVarLud = syaVar.lud("countdown")) == 0) {
            return;
        }
        View viewEa = syaVarLud.ea();
        if (viewEa instanceof TextView) {
            try {
                i11 = Integer.parseInt((String) charSequence);
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJs35BY0k6f", "bskomzG5Z8OFWA==", "Tv4plBe5Xc6NT/hImA==", PglCryptUtils.LOAD_SO_FAILED);
                htf.sya("UGenRender", "parse duration exception", charSequence);
                i11 = 0;
            }
            if (!z12 && i11 > 0 && !this.dwi) {
                viewEa.setVisibility(0);
                if (!z11 && this.f25933lt.ycx() && com.bytedance.sdk.component.adexpress.dj.lt.zb(this.f25933lt.dj())) {
                    ((TextView) viewEa).setText(String.format(wwx.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), "tt_reward_full_skip"), Integer.valueOf(i5)));
                    return;
                }
                if (!"open_ad".equals(this.f25933lt.dj()) && this.f25933lt.ycx()) {
                    this.dwi = true;
                    viewEa.setVisibility(8);
                    return;
                } else {
                    ((TextView) viewEa).setText(((Object) charSequence) + "s");
                    return;
                }
            }
            viewEa.setVisibility(8);
        }
    }
}
