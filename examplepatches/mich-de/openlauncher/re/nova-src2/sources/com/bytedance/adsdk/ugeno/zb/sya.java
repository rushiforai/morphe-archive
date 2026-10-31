package com.bytedance.adsdk.ugeno.zb;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;
import com.amplitude.android.migration.DatabaseConstants;
import com.bytedance.adsdk.ugeno.core.IAnimation;
import com.bytedance.adsdk.ugeno.core.dy;
import com.bytedance.adsdk.ugeno.core.ea;
import com.bytedance.adsdk.ugeno.core.fby;
import com.bytedance.adsdk.ugeno.core.jc;
import com.bytedance.adsdk.ugeno.core.pmi;
import com.bytedance.adsdk.ugeno.core.ry;
import com.bytedance.adsdk.ugeno.core.syc;
import com.bytedance.adsdk.ugeno.core.ul;
import com.bytedance.adsdk.ugeno.core.zb.dj;
import com.bytedance.adsdk.ugeno.core.zb.lt;
import com.bytedance.adsdk.ugeno.fby.ycx;
import com.bytedance.adsdk.ugeno.lud;
import com.bytedance.adsdk.ugeno.lud.jw;
import com.bytedance.adsdk.ugeno.lud.xkz;
import com.bytedance.adsdk.ugeno.zb;
import com.bytedance.adsdk.ugeno.zb.ycx;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public abstract class sya<T extends View> implements View.OnTouchListener, syc.ycx, syc.zb, lud {

    /* renamed from: ab, reason: collision with root package name */
    private long f22648ab;
    protected boolean aeu;

    /* renamed from: ag, reason: collision with root package name */
    protected jw f22649ag;

    /* renamed from: aq, reason: collision with root package name */
    protected float f22650aq;

    /* renamed from: av, reason: collision with root package name */
    protected float f22651av;
    private boolean bah;
    protected float bba;

    /* renamed from: bh, reason: collision with root package name */
    protected float f22652bh;
    protected float bhi;
    protected float bjp;

    /* renamed from: ci, reason: collision with root package name */
    private boolean f22653ci;

    /* renamed from: cu, reason: collision with root package name */
    @Deprecated
    private com.bytedance.adsdk.ugeno.core.zb.zb f22654cu;
    protected boolean dc;
    protected dy dfk;

    /* renamed from: dj, reason: collision with root package name */
    protected JSONObject f22655dj;
    protected float dqs;
    protected boolean duz;

    /* renamed from: dv, reason: collision with root package name */
    protected boolean f22656dv;

    /* renamed from: dw, reason: collision with root package name */
    private com.bytedance.adsdk.ugeno.lud.ycx.ycx f22657dw;
    protected String dwi;

    /* renamed from: dy, reason: collision with root package name */
    protected float f22658dy;

    /* renamed from: ea, reason: collision with root package name */
    protected String f22659ea;
    private xkz eai;
    protected ul.ycx fby;
    private com.bytedance.adsdk.ugeno.zb.ycx.ycx ff;

    /* renamed from: gi, reason: collision with root package name */
    private boolean f22660gi;
    protected com.bytedance.adsdk.ugeno.ycx.ycx giw;

    /* renamed from: hf, reason: collision with root package name */
    protected float f22661hf;

    @Deprecated
    private dj.ycx hfd;
    protected String hpv;
    protected float htf;
    private boolean hti;

    /* renamed from: if, reason: not valid java name */
    private boolean f4if;
    protected boolean ifb;

    /* renamed from: iq, reason: collision with root package name */
    protected int f22662iq;

    /* renamed from: jc, reason: collision with root package name */
    protected boolean f22663jc;

    /* renamed from: jp, reason: collision with root package name */
    protected ycx.C0015ycx f22664jp;

    /* renamed from: jw, reason: collision with root package name */
    protected ea f22665jw;
    private float kdr;
    protected boolean kgy;

    /* renamed from: kh, reason: collision with root package name */
    @Deprecated
    private lt f22666kh;

    /* renamed from: ko, reason: collision with root package name */
    private boolean f22667ko;

    /* renamed from: kt, reason: collision with root package name */
    protected Map<Integer, ry> f22668kt;
    private boolean liq;

    /* renamed from: lt, reason: collision with root package name */
    protected ycx<ViewGroup> f22669lt;
    protected T lud;

    /* renamed from: lv, reason: collision with root package name */
    protected float f22670lv;

    /* renamed from: mp, reason: collision with root package name */
    protected boolean f22671mp;
    private com.bytedance.adsdk.ugeno.core.ycx mue;

    /* renamed from: nc, reason: collision with root package name */
    private boolean f22672nc;
    protected float nji;

    /* renamed from: nq, reason: collision with root package name */
    private jc f22673nq;
    protected float nzi;
    protected ImageView.ScaleType oby;

    /* renamed from: ok, reason: collision with root package name */
    protected String f22674ok;
    protected boolean oty;

    /* renamed from: pg, reason: collision with root package name */
    private boolean f22675pg;

    /* renamed from: pk, reason: collision with root package name */
    private boolean f22676pk;
    private JSONObject pks;
    protected float pmi;
    private com.bytedance.adsdk.ugeno.lud.ry pvm;

    /* renamed from: py, reason: collision with root package name */
    protected syc f22677py;

    @Deprecated
    private com.bytedance.adsdk.ugeno.core.zb.sya pyn;
    protected fby qn;

    /* renamed from: qt, reason: collision with root package name */
    private boolean f22678qt;

    /* renamed from: rl, reason: collision with root package name */
    protected float f22679rl;
    protected float rmf;
    protected boolean rmy;
    protected boolean row;

    /* renamed from: rt, reason: collision with root package name */
    private boolean f22680rt;

    /* renamed from: ry, reason: collision with root package name */
    protected float f22681ry;
    private pmi rzo;

    /* renamed from: sg, reason: collision with root package name */
    protected com.bytedance.adsdk.ugeno.ycx.lt f22682sg;
    private boolean sjd;

    @Deprecated
    private com.bytedance.adsdk.ugeno.core.zb.lud skm;

    /* renamed from: sp, reason: collision with root package name */
    private boolean f22683sp;
    private String spv;
    protected JSONObject sya;
    protected float syc;
    protected boolean sz;

    /* renamed from: te, reason: collision with root package name */
    private boolean f22684te;
    protected float thx;

    /* renamed from: tn, reason: collision with root package name */
    protected boolean f22685tn;
    private boolean tpg;
    protected float tru;

    /* renamed from: tx, reason: collision with root package name */
    protected float f22686tx;

    /* renamed from: uf, reason: collision with root package name */
    protected boolean f22687uf;
    protected float ufy;

    /* renamed from: uh, reason: collision with root package name */
    protected float f22688uh;

    /* renamed from: ui, reason: collision with root package name */
    protected int f22689ui;
    protected float ujb;

    /* renamed from: ul, reason: collision with root package name */
    protected ycx<ViewGroup> f22690ul;

    /* renamed from: ur, reason: collision with root package name */
    protected boolean f22691ur;

    /* renamed from: uu, reason: collision with root package name */
    protected float f22692uu;

    /* renamed from: uz, reason: collision with root package name */
    protected boolean f22693uz;
    private boolean vbt;
    private GradientDrawable vy;
    protected com.bytedance.adsdk.ugeno.core.lt vyl;
    protected float wie;

    /* renamed from: wk, reason: collision with root package name */
    protected float f22694wk;

    /* renamed from: wr, reason: collision with root package name */
    protected ViewGroup.LayoutParams f22695wr;
    protected boolean wwx;

    /* renamed from: xf, reason: collision with root package name */
    protected float f22696xf;
    private boolean xh;
    protected float xkz;
    protected float xym;

    /* renamed from: xz, reason: collision with root package name */
    protected boolean f22697xz;
    private boolean ycx;

    /* renamed from: yi, reason: collision with root package name */
    protected float f22698yi;

    /* renamed from: yl, reason: collision with root package name */
    private boolean f22699yl;

    /* renamed from: yw, reason: collision with root package name */
    private String f22700yw;
    private com.bytedance.adsdk.ugeno.zb.zb.sya yyc;
    protected int yzp;

    /* renamed from: zb, reason: collision with root package name */
    protected Context f22701zb;

    /* renamed from: zk, reason: collision with root package name */
    protected float f22702zk;
    private boolean znc;

    /* renamed from: zr, reason: collision with root package name */
    protected float f22703zr;

    public sya(Context context) {
        this(context, null);
    }

    @Deprecated
    private void dj() throws JSONException {
        dj djVarLud;
        this.lud.setVisibility(this.f22662iq);
        float f11 = this.f22702zk;
        if (f11 != 0.0f) {
            this.lud.setRotation(f11);
        }
        ul.ycx ycxVar = this.fby;
        if (ycxVar != null && TextUtils.isEmpty(ycxVar.zb())) {
            this.lud.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.adsdk.ugeno.zb.sya.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    sya syaVar = sya.this;
                    if (syaVar.qn != null) {
                        boolean unused = syaVar.sjd;
                    }
                }
            });
        } else if (zb(1) && !this.xh) {
            this.lud.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.adsdk.ugeno.zb.sya.2
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    sya syaVar = sya.this;
                    if (syaVar.f22677py == null || !syaVar.sjd) {
                        return;
                    }
                    sya syaVar2 = sya.this;
                    syc sycVar = syaVar2.f22677py;
                    ry ryVar = syaVar2.f22668kt.get(1);
                    sya syaVar3 = sya.this;
                    sycVar.ycx(ryVar, syaVar3, syaVar3);
                }
            });
        }
        if (this.f22677py != null && zb(4)) {
            if (zb(1)) {
                rmy();
                this.bah = true;
                this.skm = new com.bytedance.adsdk.ugeno.core.zb.lud(this.f22701zb, this.f22668kt.get(4), this.f22668kt.get(1), this.bah, uf(), this.f22680rt);
            } else {
                rmy();
                this.skm = new com.bytedance.adsdk.ugeno.core.zb.lud(this.f22701zb, this.f22668kt.get(4), this.bah, uf(), this.f22680rt);
            }
        }
        if (this.f22677py != null && zb(1) && this.xh) {
            rmy();
            this.pyn = new com.bytedance.adsdk.ugeno.core.zb.sya(this.f22701zb, this.f22668kt.get(1));
        }
        jw();
        if (this.f22677py != null && zb(3) && (djVarLud = com.bytedance.adsdk.ugeno.lt.ycx().lud()) != null) {
            this.hfd = djVarLud.ycx(this.f22701zb, this);
            new Object() { // from class: com.bytedance.adsdk.ugeno.zb.sya.3
            };
        }
        if (this.f22677py != null && zb(9)) {
            lt ltVar = new lt(this.f22701zb, this.f22668kt.get(9), this);
            this.f22666kh = ltVar;
            ltVar.ycx(this.f22677py);
        }
        if (zb(10)) {
            com.bytedance.adsdk.ugeno.core.zb.zb zbVar = new com.bytedance.adsdk.ugeno.core.zb.zb(this.f22701zb, this.f22668kt.get(10), this);
            this.f22654cu = zbVar;
            zbVar.ycx(this.f22677py);
        }
    }

    private void hpv() {
        this.vy.setCornerRadii(iq());
    }

    private float[] iq() {
        float f11 = this.f22671mp ? this.xym : this.f22698yi;
        float f12 = this.f22687uf ? this.f22703zr : this.f22698yi;
        float f13 = this.duz ? this.f22679rl : this.f22698yi;
        float f14 = this.f22693uz ? this.bba : this.f22698yi;
        return new float[]{f11, f11, f12, f12, f14, f14, f13, f13};
    }

    private void jc() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f22659ea);
        this.lud.setContentDescription(sb2);
    }

    private void jw() throws JSONException {
        ry ryVar;
        if (this.f22677py == null || !zb(18) || (ryVar = this.f22668kt.get(18)) == null) {
            return;
        }
        JSONObject jSONObjectSya = ryVar.sya();
        if (jSONObjectSya != null) {
            try {
                jSONObjectSya.put("rotateZ", com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObjectSya.optString("rotateZ"), this.f22655dj));
            } catch (JSONException unused) {
            }
        }
        this.f22677py.ycx(ryVar, this, this);
    }

    private com.bytedance.adsdk.ugeno.zb.ycx.ycx lv() {
        if (this.ff == null) {
            this.ff = new com.bytedance.adsdk.ugeno.zb.ycx.ycx();
        }
        return this.ff;
    }

    private void ui() {
        com.bytedance.adsdk.ugeno.zb.ycx.ycx ycxVar = this.ff;
        if (ycxVar == null || !ycxVar.ycx()) {
            if (TextUtils.equals("dashed", this.hpv)) {
                GradientDrawable gradientDrawable = this.vy;
                float f11 = this.f22670lv;
                gradientDrawable.setStroke((int) f11, this.f22689ui, 3.0f * f11, f11);
            } else {
                if (!TextUtils.equals("dotted", this.hpv)) {
                    this.vy.setStroke((int) this.f22670lv, this.f22689ui);
                    return;
                }
                GradientDrawable gradientDrawable2 = this.vy;
                float f12 = this.f22670lv;
                gradientDrawable2.setStroke((int) f12, this.f22689ui, f12 / 2.0f, f12);
            }
        }
    }

    private void uz() {
        com.bytedance.adsdk.ugeno.zb.ycx.ycx ycxVar = this.ff;
        if (ycxVar == null || !ycxVar.zb()) {
            this.lud.setBackground(this.vy);
        } else {
            this.ff.ycx(this.lud, this.vy, this.f22670lv, iq());
        }
    }

    public boolean aeu() {
        return this.f22663jc;
    }

    public ViewGroup.LayoutParams av() {
        return this.f22695wr;
    }

    public float bba() {
        T t6 = this.lud;
        if (t6 instanceof com.bytedance.adsdk.ugeno.ycx.ul) {
            return ((com.bytedance.adsdk.ugeno.ycx.ul) t6).getRubIn();
        }
        return 0.0f;
    }

    public void bhi() {
        com.bytedance.adsdk.ugeno.lt.ycx().zb().ycx(this.f22665jw, this.dwi, new zb.ycx() { // from class: com.bytedance.adsdk.ugeno.zb.sya.4
            @Override // com.bytedance.adsdk.ugeno.zb.ycx
            public void ycx(final Bitmap bitmap) {
                if (bitmap == null) {
                    return;
                }
                sya syaVar = sya.this;
                if (!syaVar.dc) {
                    com.bytedance.adsdk.ugeno.fby.fby.ycx(new Runnable() { // from class: com.bytedance.adsdk.ugeno.zb.sya.4.2
                        @Override // java.lang.Runnable
                        public void run() {
                            sya.this.ycx(new BitmapDrawable(bitmap));
                        }
                    });
                    return;
                }
                final Bitmap bitmapYcx = com.bytedance.adsdk.ugeno.fby.fby.ycx(syaVar.f22701zb, bitmap, (int) syaVar.nji);
                if (bitmapYcx != null) {
                    com.bytedance.adsdk.ugeno.fby.fby.ycx(new Runnable() { // from class: com.bytedance.adsdk.ugeno.zb.sya.4.1
                        @Override // java.lang.Runnable
                        public void run() {
                            sya.this.ycx(new BitmapDrawable(bitmapYcx));
                        }
                    });
                }
            }
        });
    }

    public void dc() {
    }

    public jw duz() {
        return this.f22649ag;
    }

    public syc dv() {
        return this.f22677py;
    }

    public boolean dwi() {
        return this.f22691ur;
    }

    public float dy() {
        return this.bjp;
    }

    public T ea() {
        return this.lud;
    }

    public void fby() {
        jc jcVar = this.f22673nq;
        if (jcVar != null) {
            jcVar.zb();
        }
        com.bytedance.adsdk.ugeno.ycx.ycx ycxVar = this.giw;
        if (ycxVar != null) {
            ycxVar.sya();
        }
        com.bytedance.adsdk.ugeno.ycx.lt ltVar = this.f22682sg;
        if (ltVar != null) {
            ltVar.sya();
        }
        com.bytedance.adsdk.ugeno.zb.ycx.ycx ycxVar2 = this.ff;
        if (ycxVar2 != null) {
            ycxVar2.dj();
        }
        com.bytedance.adsdk.ugeno.zb.zb.sya syaVar = this.yyc;
        if (syaVar != null) {
            syaVar.dj();
        }
    }

    public JSONObject hf() {
        return this.sya;
    }

    public float htf() {
        return this.f22694wk;
    }

    public int ifb() {
        return (int) this.f22681ry;
    }

    public String kgy() {
        return this.f22674ok;
    }

    public sya<T> lt(String str) {
        return zb(str);
    }

    public sya<T> lud(String str) {
        return ycx(str);
    }

    public boolean mp() {
        return this.liq;
    }

    public com.bytedance.adsdk.ugeno.lud.ycx.ycx nji() {
        return this.f22657dw;
    }

    public int oby() {
        return this.yzp;
    }

    public JSONObject ok() {
        return this.f22655dj;
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        com.bytedance.adsdk.ugeno.core.zb.lud ludVar;
        syc sycVar;
        com.bytedance.adsdk.ugeno.core.zb.sya syaVar;
        motionEvent.toString();
        int action = motionEvent.getAction();
        if (action == 0) {
            dc();
        } else if (action == 1 || action == 3) {
            sz();
        }
        dy dyVar = this.dfk;
        if (dyVar != null) {
            dyVar.ycx(this, motionEvent);
        }
        if (zb(17) && motionEvent.getAction() == 0) {
            this.f22677py.ycx(this.f22668kt.get(17), this, this);
        }
        if (zb(1) && this.xh && (sycVar = this.f22677py) != null && (syaVar = this.pyn) != null) {
            return syaVar.ycx(sycVar, this, motionEvent);
        }
        syc sycVar2 = this.f22677py;
        if (sycVar2 != null && (ludVar = this.skm) != null) {
            return ludVar.ycx(sycVar2, this, motionEvent, uf());
        }
        jw jwVar = this.f22649ag;
        if (jwVar != null) {
            return jwVar.ycx(motionEvent);
        }
        return false;
    }

    public long oty() {
        return this.f22648ab;
    }

    public float pmi() {
        return this.f22686tx;
    }

    public float rl() {
        T t6 = this.lud;
        if (t6 instanceof com.bytedance.adsdk.ugeno.ycx.ul) {
            return ((com.bytedance.adsdk.ugeno.ycx.ul) t6).getShine();
        }
        return 0.0f;
    }

    public ul.ycx rmf() {
        return this.fby;
    }

    public String rmy() {
        return this.f22659ea;
    }

    public void ry() {
        boolean zOptBoolean = this.f22655dj.optBoolean("gesture_through_enable", false);
        ul.ycx ycxVar = this.fby;
        this.f22660gi = zOptBoolean && (ycxVar == null || ycxVar.sya());
        this.f22680rt = this.f22655dj.optBoolean("is_adapt_two_finger", false);
    }

    public float syc() {
        return this.f22650aq;
    }

    public void sz() {
    }

    public float thx() {
        return this.f22702zk;
    }

    public float tn() {
        return this.f22698yi;
    }

    public void tru() {
        BitmapDrawable bitmapDrawable;
        Bitmap bitmapYcx;
        if (TextUtils.isEmpty(this.dwi)) {
            if (this.row) {
                ycx(this.f22664jp);
                return;
            } else {
                this.vy.setColor(this.yzp);
                dj(this.yzp);
                return;
            }
        }
        if (!this.dwi.startsWith("local://")) {
            bhi();
            return;
        }
        String strReplace = this.dwi.replace("local://", b.f42142b);
        try {
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inPreferredConfig = this.dc ? Bitmap.Config.ARGB_4444 : Bitmap.Config.RGB_565;
            options.inPurgeable = true;
            options.inInputShareable = true;
            Bitmap bitmapDecodeStream = BitmapFactory.decodeStream(this.f22701zb.getResources().openRawResource(com.bytedance.adsdk.ugeno.fby.dj.zb(this.f22701zb, strReplace)), null, options);
            if (this.dc && (bitmapYcx = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, bitmapDecodeStream, (int) this.nji)) != null) {
                bitmapDrawable = new BitmapDrawable(this.f22701zb.getResources(), bitmapYcx);
                ycx(bitmapDrawable);
            } else {
                BitmapDrawable bitmapDrawable2 = new BitmapDrawable(this.f22701zb.getResources(), bitmapDecodeStream);
                bitmapDrawable = bitmapDrawable2;
                ycx(bitmapDrawable);
            }
        } catch (Throwable unused) {
        }
    }

    public boolean uf() {
        return this.f22660gi;
    }

    public float uh() {
        return this.nzi;
    }

    public void ul() {
        com.bytedance.adsdk.ugeno.core.ycx ycxVar = this.mue;
        if (ycxVar != null) {
            jc jcVar = new jc(this.lud, ycxVar);
            this.f22673nq = jcVar;
            jcVar.ycx();
        }
        com.bytedance.adsdk.ugeno.ycx.ycx ycxVar2 = this.giw;
        if (ycxVar2 != null) {
            ycxVar2.ycx();
        }
        com.bytedance.adsdk.ugeno.ycx.lt ltVar = this.f22682sg;
        if (ltVar != null) {
            ltVar.zb();
        }
        jw jwVar = this.f22649ag;
        if (jwVar != null) {
            jwVar.lt();
        }
        if (this.f22654cu != null && zb(10)) {
            this.f22654cu.ycx();
        }
        if (this.f22666kh != null && zb(9)) {
            this.f22666kh.ycx();
        }
        com.bytedance.adsdk.ugeno.core.zb.lud ludVar = this.skm;
        if (ludVar != null) {
            ludVar.ycx();
        }
        com.bytedance.adsdk.ugeno.zb.ycx.ycx ycxVar3 = this.ff;
        if (ycxVar3 != null) {
            ycxVar3.sya();
        }
        com.bytedance.adsdk.ugeno.zb.zb.sya syaVar = this.yyc;
        if (syaVar != null) {
            syaVar.sya();
        }
        this.f22648ab = System.currentTimeMillis();
    }

    public float wie() {
        return this.f22696xf;
    }

    public float wwx() {
        return this.ujb;
    }

    public void xkz() {
        this.lud.setPadding((int) (this.f22697xz ? this.tru : this.f22661hf), (int) (this.kgy ? this.f22651av : this.f22661hf), (int) (this.rmy ? this.bhi : this.f22661hf), (int) (this.ifb ? this.rmf : this.f22661hf));
    }

    public float xym() {
        T t6 = this.lud;
        if (t6 instanceof com.bytedance.adsdk.ugeno.ycx.ul) {
            return ((com.bytedance.adsdk.ugeno.ycx.ul) t6).getRipple();
        }
        return 0.0f;
    }

    public ycx xz() {
        return this.f22669lt;
    }

    public T ycx() {
        return null;
    }

    public boolean yi() {
        return this.dqs > 0.0f;
    }

    public int yzp() {
        return (int) this.xkz;
    }

    public void zb(JSONObject jSONObject) {
        this.f22655dj = jSONObject;
        ry();
    }

    public float zr() {
        T t6 = this.lud;
        if (t6 instanceof com.bytedance.adsdk.ugeno.ycx.ul) {
            return ((com.bytedance.adsdk.ugeno.ycx.ul) t6).getStretch();
        }
        return 0.0f;
    }

    public sya(Context context, ycx<ViewGroup> ycxVar) {
        this.f22681ry = -2.0f;
        this.xkz = -2.0f;
        this.hpv = "solid";
        this.f22662iq = 0;
        this.f22691ur = true;
        this.f22652bh = 0.0f;
        this.f22650aq = 0.0f;
        this.bjp = 0.0f;
        this.f22692uu = 1.0f;
        this.f22696xf = 1.0f;
        this.f22686tx = 1.0f;
        this.ufy = 0.0f;
        this.nzi = 0.0f;
        this.f22694wk = 0.0f;
        this.f22702zk = 0.0f;
        this.ujb = 1.0f;
        this.tpg = true;
        this.sjd = true;
        this.f22676pk = false;
        this.hti = false;
        this.f22660gi = false;
        this.f22680rt = false;
        this.kdr = 12.0f;
        this.f22701zb = context;
        this.f22669lt = ycxVar;
        this.f22668kt = new HashMap();
        this.vy = new GradientDrawable();
        this.lud = (T) ycx();
    }

    private void sya() {
        if (this.ycx) {
            this.lud.setTranslationX(this.f22650aq);
        }
        if (this.f22678qt) {
            this.lud.setTranslationY(this.bjp);
        }
        if (this.f22684te) {
            this.lud.setScaleX(this.f22696xf);
        }
        if (this.f22672nc) {
            this.lud.setScaleY(this.f22686tx);
        }
        if (this.vbt) {
            this.lud.setRotation(this.ufy);
        }
        if (this.f22675pg) {
            this.lud.setRotationX(this.nzi);
        }
        if (this.f22653ci) {
            this.lud.setRotationY(-this.f22694wk);
        }
        if (this.f22683sp) {
            this.lud.setAlpha(this.ujb);
        }
        float f11 = this.f22702zk;
        if (f11 != 0.0f) {
            this.lud.setRotation(f11);
        }
        if (this.vbt || this.f22675pg || this.f22653ci) {
            this.lud.setCameraDistance(10000.0f);
        }
    }

    public List<com.bytedance.adsdk.ugeno.lud.dj.sya> ea(String str) {
        jw jwVar;
        if (TextUtils.isEmpty(str) || (jwVar = this.f22649ag) == null) {
            return null;
        }
        return jwVar.zb(str);
    }

    @Override // com.bytedance.adsdk.ugeno.lud
    public void lt() {
        if (this.rzo == null || this.f22699yl) {
            return;
        }
        this.f22699yl = true;
    }

    @Override // com.bytedance.adsdk.ugeno.lud
    public void lud() {
        if (this.rzo == null || this.f4if) {
            return;
        }
        this.f4if = true;
    }

    public com.bytedance.adsdk.ugeno.ycx.ycx ok(String str) {
        com.bytedance.adsdk.ugeno.ycx.ycx ycxVar = this.giw;
        if (ycxVar != null && TextUtils.equals(str, ycxVar.lud())) {
            return this.giw;
        }
        com.bytedance.adsdk.ugeno.ycx.lt ltVar = this.f22682sg;
        if (ltVar != null) {
            return ltVar.ycx(str);
        }
        return null;
    }

    public void ycx(String str, Map<String, Object> map) {
    }

    public void ycx(JSONObject jSONObject) throws JSONException {
        this.f22655dj = jSONObject;
        ry();
        JSONObject jSONObject2 = this.sya;
        if (jSONObject2 == null) {
            return;
        }
        Iterator<String> itKeys = jSONObject2.keys();
        ycx.C0024ycx c0024ycxJc = this.f22669lt != null ? this.f22669lt.jc() : null;
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            String strYcx = com.bytedance.adsdk.ugeno.dj.zb.ycx(this.sya.optString(next), jSONObject);
            ycx(next, strYcx);
            if (c0024ycxJc != null) {
                c0024ycxJc.ycx(this.f22701zb, next, strYcx);
            }
        }
        if (c0024ycxJc != null) {
            ycx(c0024ycxJc.ycx());
        }
        if (this.pks == null || this.f22655dj == null) {
            return;
        }
        try {
            if (aeu()) {
                JSONObject jSONObject3 = new JSONObject();
                jSONObject3.put("i18n", this.pks);
                this.f22655dj.put("xNode", jSONObject3);
                return;
            }
            this.f22655dj.put("i18n", this.pks);
        } catch (JSONException unused) {
        }
    }

    @SuppressLint({"ClickableViewAccessibility"})
    public void zb() throws JSONException {
        tru();
        xkz();
        sya(this.f22662iq);
        sya();
        dj();
        jw jwVar = this.f22649ag;
        if (jwVar != null) {
            jwVar.ycx();
            this.f22649ag.zb();
            this.f22649ag.sya();
        }
        this.lud.setOnTouchListener(this);
        jc();
        ViewGroup viewGroup = (ViewGroup) this.lud.getParent();
        if (viewGroup != null) {
            viewGroup.setClipChildren(!this.tpg);
        }
        com.bytedance.adsdk.ugeno.ycx.ycx ycxVar = this.giw;
        if (ycxVar != null) {
            ycxVar.dj();
        }
        com.bytedance.adsdk.ugeno.ycx.lt ltVar = this.f22682sg;
        if (ltVar != null) {
            ltVar.ycx();
        }
        jw jwVar2 = this.f22649ag;
        if (jwVar2 != null) {
            jwVar2.dj();
            this.f22649ag.lud();
        }
        if (this.f22677py != null && zb(22)) {
            this.f22677py.ycx(this.f22668kt.get(22), this, this);
        }
        com.bytedance.adsdk.ugeno.zb.zb.sya syaVar = this.yyc;
        if (syaVar == null || !syaVar.ycx()) {
            return;
        }
        this.yyc.ycx(this.lud);
    }

    public void jc(String str) {
        this.f22674ok = str;
    }

    private ImageView.ScaleType ry(String str) {
        str.getClass();
        switch (str) {
            case "center":
                this.oby = ImageView.ScaleType.CENTER;
                break;
            case "fit":
                this.oby = ImageView.ScaleType.FIT_CENTER;
                break;
            case "crop":
                this.oby = ImageView.ScaleType.CENTER_CROP;
                break;
            default:
                this.oby = ImageView.ScaleType.FIT_XY;
                break;
        }
        return this.oby;
    }

    public void lt(int i5) {
        if (aeu()) {
            T t6 = this.lud;
            if (t6 instanceof zb) {
                ((zb) t6).zb(i5);
                return;
            }
            ViewParent viewParent = (ViewGroup) t6.getParent();
            if (viewParent instanceof zb) {
                ((zb) viewParent).zb(this.lud, i5);
                return;
            }
            return;
        }
        ViewGroup.LayoutParams layoutParams = this.lud.getLayoutParams();
        layoutParams.height = i5;
        this.lud.setLayoutParams(layoutParams);
    }

    public void lud(int i5) {
        if (aeu()) {
            T t6 = this.lud;
            if (t6 instanceof zb) {
                ((zb) t6).ycx(i5);
                return;
            }
            ViewParent viewParent = (ViewGroup) t6.getParent();
            if (viewParent instanceof zb) {
                ((zb) viewParent).ycx(this.lud, i5);
                return;
            }
            return;
        }
        ViewGroup.LayoutParams layoutParams = this.lud.getLayoutParams();
        layoutParams.width = i5;
        this.lud.setLayoutParams(layoutParams);
    }

    private boolean xkz(String str) {
        return TextUtils.isEmpty(str) || !TextUtils.equals(str, "hidden");
    }

    public void jw(String str) {
        this.f22659ea = str;
    }

    public sya<T> fby(String str) {
        return dj(str);
    }

    public sya<T> ul(String str) {
        return sya(str);
    }

    public void ycx(pmi pmiVar) {
        this.rzo = pmiVar;
    }

    public void sya(int i5) {
        ViewParent viewParent = (ViewGroup) this.lud.getParent();
        if (viewParent instanceof zb) {
            ((zb) viewParent).sya(this.lud, i5);
        } else {
            this.lud.setVisibility(i5);
        }
        jw jwVar = this.f22649ag;
        if (jwVar != null) {
            jwVar.ycx(i5);
        }
    }

    @Override // com.bytedance.adsdk.ugeno.lud
    public void ycx(boolean z11) {
        jw jwVar = this.f22649ag;
        if (jwVar != null) {
            jwVar.ycx(z11);
        }
    }

    public void ycx(dy dyVar) {
        this.dfk = dyVar;
    }

    public void ycx(syc sycVar) {
        this.f22677py = sycVar;
    }

    public void ycx(ycx.C0015ycx c0015ycx) {
        if (c0015ycx == null) {
            return;
        }
        this.vy.setShape(0);
        this.vy.setOrientation(c0015ycx.ycx);
        if (Build.VERSION.SDK_INT >= 29) {
            this.vy.setColors(c0015ycx.f22286zb, c0015ycx.sya);
        } else {
            this.vy.setColors(c0015ycx.f22286zb);
        }
        hpv();
        ui();
        uz();
    }

    public void sya(JSONObject jSONObject) {
        this.sya = jSONObject;
    }

    public boolean zb(int i5) {
        Map<Integer, ry> map = this.f22668kt;
        return map != null && map.containsKey(Integer.valueOf(i5));
    }

    public sya<T> sya(String str) {
        if (!TextUtils.isEmpty(this.f22674ok) && TextUtils.equals(this.f22674ok, str) && this.f22662iq == 0) {
            return this;
        }
        return null;
    }

    public sya<T> zb(String str) {
        if (TextUtils.isEmpty(this.f22674ok) || !TextUtils.equals(this.f22674ok, str)) {
            return null;
        }
        return this;
    }

    public void zb(boolean z11) {
        this.f22663jc = z11;
    }

    public void zb(String str, String str2) {
        if (TextUtils.isEmpty(str2) || this.f22668kt == null) {
            return;
        }
        try {
            int iYcx = com.bytedance.adsdk.ugeno.core.xkz.ycx(str).ycx();
            ry ryVar = new ry();
            ryVar.ycx(iYcx);
            ryVar.ycx(this);
            JSONObject jSONObject = new JSONObject(str2);
            if (iYcx == 3) {
                try {
                    this.kdr = Float.parseFloat(com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObject.optString("shakeAmplitude"), this.f22655dj));
                } catch (NumberFormatException unused) {
                    this.kdr = 12.0f;
                }
            }
            if (!(this.f22677py instanceof com.bytedance.adsdk.ugeno.core.ycx.zb)) {
                ycx(iYcx, jSONObject, ryVar);
                return;
            }
            throw null;
        } catch (JSONException unused2) {
        }
    }

    public void dj(int i5) {
        this.vy.setShape(0);
        this.vy.setColor(i5);
        hpv();
        ui();
        uz();
    }

    public void ycx(Drawable drawable) {
        this.lud.setBackground(drawable);
    }

    public void ycx(ViewGroup.LayoutParams layoutParams) {
        T t6 = this.lud;
        if (t6 != null) {
            t6.setLayoutParams(layoutParams);
        }
        this.f22695wr = layoutParams;
    }

    public sya<T> dj(String str) {
        if (ok(str) != null) {
            return this;
        }
        return null;
    }

    public void ycx(boolean z11, boolean z12) {
        if (this.lud != null) {
            ycx(this.f22695wr);
            if (z11) {
                lud((int) this.f22681ry);
            }
            if (z12) {
                lt((int) this.xkz);
            }
        }
    }

    public void ycx(ul.ycx ycxVar) {
        this.fby = ycxVar;
    }

    public sya<T> ycx(String str) {
        if (TextUtils.isEmpty(this.f22659ea) || !TextUtils.equals(this.f22659ea, str)) {
            return null;
        }
        return this;
    }

    @Override // com.bytedance.adsdk.ugeno.lud
    public void zb(Canvas canvas) {
        if (this instanceof ycx) {
            com.bytedance.adsdk.ugeno.ycx.ycx ycxVar = this.giw;
            if (ycxVar != null) {
                ycxVar.zb(canvas);
            }
            com.bytedance.adsdk.ugeno.ycx.lt ltVar = this.f22682sg;
            if (ltVar != null) {
                ltVar.zb(canvas);
            }
        }
    }

    public void ycx(ycx ycxVar) {
        this.f22669lt = ycxVar;
    }

    public void ycx(ea eaVar) {
        this.f22665jw = eaVar;
    }

    public void ycx(fby fbyVar) {
        this.qn = fbyVar;
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public void ycx(String str, String str2) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        str.getClass();
        char c11 = 65535;
        switch (str.hashCode()) {
            case -1964681502:
                if (str.equals("clickable")) {
                    c11 = 0;
                    break;
                }
                break;
            case -1901681170:
                if (str.equals("onRenderSuccess")) {
                    c11 = 1;
                    break;
                }
                break;
            case -1721943862:
                if (str.equals("translateX")) {
                    c11 = 2;
                    break;
                }
                break;
            case -1721943861:
                if (str.equals("translateY")) {
                    c11 = 3;
                    break;
                }
                break;
            case -1501175880:
                if (str.equals("paddingLeft")) {
                    c11 = 4;
                    break;
                }
                break;
            case -1375815020:
                if (str.equals("minWidth")) {
                    c11 = 5;
                    break;
                }
                break;
            case -1351184668:
                if (str.equals("onDelay")) {
                    c11 = 6;
                    break;
                }
                break;
            case -1337252761:
                if (str.equals("onShake")) {
                    c11 = 7;
                    break;
                }
                break;
            case -1337126126:
                if (str.equals("onSlide")) {
                    c11 = '\b';
                    break;
                }
                break;
            case -1336288090:
                if (str.equals("onTimer")) {
                    c11 = '\t';
                    break;
                }
                break;
            case -1335874424:
                if (str.equals("onTwist")) {
                    c11 = '\n';
                    break;
                }
                break;
            case -1332194002:
                if (str.equals("background")) {
                    c11 = 11;
                    break;
                }
                break;
            case -1291329255:
                if (str.equals(DatabaseConstants.EVENT_TABLE_NAME)) {
                    c11 = '\f';
                    break;
                }
                break;
            case -1267206133:
                if (str.equals("opacity")) {
                    c11 = '\r';
                    break;
                }
                break;
            case -1228066334:
                if (str.equals("borderTopLeftRadius")) {
                    c11 = 14;
                    break;
                }
                break;
            case -1221029593:
                if (str.equals("height")) {
                    c11 = 15;
                    break;
                }
                break;
            case -1081309778:
                if (str.equals("margin")) {
                    c11 = 16;
                    break;
                }
                break;
            case -1044792121:
                if (str.equals("marginTop")) {
                    c11 = 17;
                    break;
                }
                break;
            case -1013407967:
                if (str.equals("onDown")) {
                    c11 = 18;
                    break;
                }
                break;
            case -933876756:
                if (str.equals("backgroundDrawable")) {
                    c11 = 19;
                    break;
                }
                break;
            case -925180581:
                if (str.equals("rotate")) {
                    c11 = 20;
                    break;
                }
                break;
            case -908189618:
                if (str.equals("scaleX")) {
                    c11 = 21;
                    break;
                }
                break;
            case -908189617:
                if (str.equals("scaleY")) {
                    c11 = 22;
                    break;
                }
                break;
            case -882862153:
                if (str.equals("particleEffect")) {
                    c11 = 23;
                    break;
                }
                break;
            case -806339567:
                if (str.equals("padding")) {
                    c11 = 24;
                    break;
                }
                break;
            case -681357156:
                if (str.equals("triggerFunc")) {
                    c11 = 25;
                    break;
                }
                break;
            case -389160068:
                if (str.equals("borderGradient")) {
                    c11 = 26;
                    break;
                }
                break;
            case -289173127:
                if (str.equals("marginBottom")) {
                    c11 = 27;
                    break;
                }
                break;
            case -133587431:
                if (str.equals("minHeight")) {
                    c11 = 28;
                    break;
                }
                break;
            case 3355:
                if (str.equals("id")) {
                    c11 = 29;
                    break;
                }
                break;
            case 3176990:
                if (str.equals("i18n")) {
                    c11 = 30;
                    break;
                }
                break;
            case 3373707:
                if (str.equals(PendingUpgradeStore.KEY_NAME)) {
                    c11 = 31;
                    break;
                }
                break;
            case 87811796:
                if (str.equals("backgroundImageBlur")) {
                    c11 = ' ';
                    break;
                }
                break;
            case 90130308:
                if (str.equals("paddingTop")) {
                    c11 = '!';
                    break;
                }
                break;
            case 94750088:
                if (str.equals(TTEDPEventConstants.EDP_EVENT_NAME_CLICK)) {
                    c11 = AbstractJsonLexerKt.STRING;
                    break;
                }
                break;
            case 105871684:
                if (str.equals("onTap")) {
                    c11 = '#';
                    break;
                }
                break;
            case 108285963:
                if (str.equals("ratio")) {
                    c11 = '$';
                    break;
                }
                break;
            case 109250890:
                if (str.equals("scale")) {
                    c11 = '%';
                    break;
                }
                break;
            case 113126854:
                if (str.equals("width")) {
                    c11 = '&';
                    break;
                }
                break;
            case 197402866:
                if (str.equals("borderFog")) {
                    c11 = '\'';
                    break;
                }
                break;
            case 202355100:
                if (str.equals("paddingBottom")) {
                    c11 = '(';
                    break;
                }
                break;
            case 314070383:
                if (str.equals("animations")) {
                    c11 = ')';
                    break;
                }
                break;
            case 320386138:
                if (str.equals("onLoadMore")) {
                    c11 = '*';
                    break;
                }
                break;
            case 333432965:
                if (str.equals("borderTopRightRadius")) {
                    c11 = '+';
                    break;
                }
                break;
            case 529642498:
                if (str.equals("overflow")) {
                    c11 = AbstractJsonLexerKt.COMMA;
                    break;
                }
                break;
            case 581268560:
                if (str.equals("borderBottomLeftRadius")) {
                    c11 = '-';
                    break;
                }
                break;
            case 588239831:
                if (str.equals("borderBottomRightRadius")) {
                    c11 = '.';
                    break;
                }
                break;
            case 713848971:
                if (str.equals("paddingRight")) {
                    c11 = '/';
                    break;
                }
                break;
            case 722830999:
                if (str.equals("borderColor")) {
                    c11 = '0';
                    break;
                }
                break;
            case 737768677:
                if (str.equals("borderStyle")) {
                    c11 = '1';
                    break;
                }
                break;
            case 741115130:
                if (str.equals("borderWidth")) {
                    c11 = '2';
                    break;
                }
                break;
            case 843948038:
                if (str.equals("onExposure")) {
                    c11 = '3';
                    break;
                }
                break;
            case 975087886:
                if (str.equals("marginRight")) {
                    c11 = '4';
                    break;
                }
                break;
            case 1052832078:
                if (str.equals("translate")) {
                    c11 = '5';
                    break;
                }
                break;
            case 1087723621:
                if (str.equals("onAnimation")) {
                    c11 = '6';
                    break;
                }
                break;
            case 1118509956:
                if (str.equals("animation")) {
                    c11 = '7';
                    break;
                }
                break;
            case 1151851515:
                if (str.equals("animatorSet")) {
                    c11 = '8';
                    break;
                }
                break;
            case 1158381436:
                if (str.equals("onPullToRefresh")) {
                    c11 = '9';
                    break;
                }
                break;
            case 1287124693:
                if (str.equals("backgroundColor")) {
                    c11 = AbstractJsonLexerKt.COLON;
                    break;
                }
                break;
            case 1292595405:
                if (str.equals("backgroundImage")) {
                    c11 = ';';
                    break;
                }
                break;
            case 1301532860:
                if (str.equals("backgroundScale")) {
                    c11 = '<';
                    break;
                }
                break;
            case 1349188574:
                if (str.equals("borderRadius")) {
                    c11 = '=';
                    break;
                }
                break;
            case 1384173149:
                if (str.equals("rotateX")) {
                    c11 = '>';
                    break;
                }
                break;
            case 1384173150:
                if (str.equals("rotateY")) {
                    c11 = '?';
                    break;
                }
                break;
            case 1384173151:
                if (str.equals("rotateZ")) {
                    c11 = '@';
                    break;
                }
                break;
            case 1490730380:
                if (str.equals("onScroll")) {
                    c11 = 'A';
                    break;
                }
                break;
            case 1671308008:
                if (str.equals("disable")) {
                    c11 = 'B';
                    break;
                }
                break;
            case 1685004456:
                if (str.equals("onLongTap")) {
                    c11 = 'C';
                    break;
                }
                break;
            case 1824519034:
                if (str.equals("borderFlow")) {
                    c11 = 'D';
                    break;
                }
                break;
            case 1941332754:
                if (str.equals("visibility")) {
                    c11 = 'E';
                    break;
                }
                break;
            case 1970934485:
                if (str.equals("marginLeft")) {
                    c11 = 'F';
                    break;
                }
                break;
            case 1997542747:
                if (str.equals("availability")) {
                    c11 = 'G';
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
                this.sjd = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, true);
                break;
            case 1:
            case 6:
            case 7:
            case '\b':
            case '\t':
            case '\n':
            case 18:
            case '#':
            case '*':
            case '3':
            case '6':
            case '9':
            case 'A':
            case 'C':
                zb(str, str2);
                break;
            case 2:
                this.ycx = true;
                this.f22650aq = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                break;
            case 3:
                this.f22678qt = true;
                this.bjp = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                break;
            case 4:
                this.tru = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                this.f22697xz = true;
                break;
            case 5:
                this.htf = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case 11:
            case ':':
                if (com.bytedance.adsdk.ugeno.fby.ycx.sya(str2)) {
                    this.row = true;
                    this.f22664jp = com.bytedance.adsdk.ugeno.fby.ycx.zb(str2);
                    break;
                } else {
                    this.yzp = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2, 0);
                    this.row = false;
                    break;
                }
            case '\f':
                this.f22649ag = jw.ycx(this, str2);
                break;
            case '\r':
                this.f22683sp = true;
                this.ujb = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 1.0f);
                break;
            case 14:
                this.xym = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                this.f22671mp = true;
                break;
            case 15:
                if (TextUtils.equals(str2, "match_parent")) {
                    this.xkz = -1.0f;
                } else if (TextUtils.equals(str2, "wrap_content")) {
                    this.xkz = -2.0f;
                } else {
                    this.xkz = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                }
                this.hti = true;
                break;
            case 16:
                this.syc = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                break;
            case 17:
                this.pmi = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                this.f22656dv = true;
                break;
            case 19:
            case ';':
                this.dwi = str2;
                break;
            case 20:
                this.vbt = true;
                this.ufy = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case 21:
                this.f22684te = true;
                this.f22696xf = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case 22:
                this.f22672nc = true;
                this.f22686tx = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case 23:
                if (this.yyc == null) {
                    this.yyc = new com.bytedance.adsdk.ugeno.zb.zb.sya(this.f22701zb);
                }
                this.yyc.ycx(str2);
                break;
            case 24:
                this.f22661hf = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                this.aeu = true;
                break;
            case 25:
                this.spv = str2;
                break;
            case 26:
                lv().ycx(str2);
                break;
            case 27:
                this.f22688uh = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                this.oty = true;
                break;
            case 28:
                this.thx = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case 29:
                this.f22659ea = str2;
                break;
            case 30:
                this.pks = com.bytedance.adsdk.ugeno.fby.zb.ycx(str2, (JSONObject) null);
                break;
            case 31:
                this.f22674ok = str2;
                break;
            case ' ':
                float fYcx = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                this.nji = fYcx;
                if (fYcx > 0.0f) {
                    this.dc = true;
                    break;
                }
                break;
            case '!':
                this.f22651av = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                this.kgy = true;
                break;
            case '\"':
                this.f22700yw = str2;
                break;
            case '$':
                this.dqs = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case '%':
                this.f22684te = true;
                this.f22672nc = true;
                float[] fArrZb = com.bytedance.adsdk.ugeno.ycx.dj.zb(str2, this.f22655dj);
                this.f22696xf = fArrZb[0];
                this.f22686tx = fArrZb[1];
                break;
            case '&':
                if (TextUtils.equals(str2, "match_parent")) {
                    this.f22681ry = -1.0f;
                } else if (TextUtils.equals(str2, "wrap_content")) {
                    this.f22681ry = -2.0f;
                } else {
                    this.f22681ry = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                }
                this.f22676pk = true;
                break;
            case '\'':
                lv().ycx(str2, this.f22701zb);
                break;
            case '(':
                this.rmf = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                this.ifb = true;
                break;
            case ')':
                List<com.bytedance.adsdk.ugeno.ycx.sya> listYcx = com.bytedance.adsdk.ugeno.ycx.dj.ycx(str2, this.f22655dj);
                if (listYcx != null && !listYcx.isEmpty()) {
                    this.f22682sg = new com.bytedance.adsdk.ugeno.ycx.lt(this.f22701zb, this, listYcx);
                    break;
                }
                break;
            case '+':
                this.f22703zr = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                this.f22687uf = true;
                break;
            case ',':
                this.tpg = xkz(str2);
                break;
            case '-':
                this.f22679rl = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                this.duz = true;
                break;
            case '.':
                this.bba = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                this.f22693uz = true;
                break;
            case '/':
                this.bhi = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                this.rmy = true;
                break;
            case '0':
                this.f22689ui = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                break;
            case '1':
                this.hpv = str2;
                break;
            case '2':
                this.f22670lv = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                break;
            case '4':
                this.wie = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                this.f22685tn = true;
                break;
            case '5':
                this.ycx = true;
                this.f22678qt = true;
                float[] fArrZb2 = com.bytedance.adsdk.ugeno.ycx.dj.zb(str2, this.f22655dj);
                this.f22650aq = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, fArrZb2[0]);
                this.bjp = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, fArrZb2[1]);
                break;
            case '7':
                try {
                    this.giw = new com.bytedance.adsdk.ugeno.ycx.ycx(this.f22701zb, this, com.bytedance.adsdk.ugeno.ycx.dj.ycx(new JSONObject(str2), this.f22655dj));
                    break;
                } catch (JSONException unused) {
                    return;
                }
            case '8':
                this.mue = com.bytedance.adsdk.ugeno.core.ycx.ycx(str2, this);
                break;
            case '<':
                this.sz = true;
                this.oby = ry(str2);
                break;
            case '=':
                this.f22698yi = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                break;
            case '>':
                this.f22675pg = true;
                this.nzi = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case '?':
                this.f22653ci = true;
                this.f22694wk = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case '@':
                this.f22702zk = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case 'B':
                this.liq = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, false);
                break;
            case 'D':
                lv().zb(str2);
                break;
            case 'E':
                if (TextUtils.equals("visible", str2)) {
                    this.f22662iq = 0;
                } else if (TextUtils.equals("invisible", str2)) {
                    this.f22662iq = 4;
                } else if (TextUtils.equals("gone", str2) || TextUtils.equals("hidden", str2)) {
                    this.f22662iq = 8;
                }
                this.lud.setVisibility(this.f22662iq);
                jw jwVar = this.f22649ag;
                if (jwVar != null) {
                    jwVar.ycx(this.f22662iq);
                    break;
                }
                break;
            case 'F':
                this.f22658dy = com.bytedance.adsdk.ugeno.fby.fby.ycx(this.f22701zb, str2);
                this.wwx = true;
                break;
            case 'G':
                this.f22691ur = !TextUtils.equals(str2, "unavailable");
                break;
        }
    }

    @Override // com.bytedance.adsdk.ugeno.lud
    public void zb(int i5, int i11, int i12, int i13) {
        jc jcVar = this.f22673nq;
        if (jcVar != null) {
            jcVar.ycx(i5, i11);
        }
        com.bytedance.adsdk.ugeno.ycx.ycx ycxVar = this.giw;
        if (ycxVar != null) {
            ycxVar.ycx(i5, i11);
        }
        com.bytedance.adsdk.ugeno.ycx.lt ltVar = this.f22682sg;
        if (ltVar != null) {
            ltVar.ycx(i5, i11);
        }
    }

    public sya zb(sya syaVar) {
        return (syaVar.xz() == null && (syaVar instanceof ycx)) ? syaVar : zb(syaVar.xz());
    }

    @Deprecated
    public void ycx(int i5, JSONObject jSONObject, ry ryVar) {
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("success");
        if (jSONObjectOptJSONObject != null) {
            ry ryVar2 = new ry();
            ryVar2.ycx(jSONObjectOptJSONObject);
            ryVar2.ycx(this);
            ryVar.ycx(ryVar2);
        }
        JSONObject jSONObjectOptJSONObject2 = jSONObject.optJSONObject("fail");
        if (jSONObjectOptJSONObject2 != null) {
            ry ryVar3 = new ry();
            ryVar3.ycx(jSONObjectOptJSONObject2);
            ryVar3.ycx(this);
            ryVar.zb(ryVar3);
        }
        ryVar.ycx(jSONObject);
        this.f22668kt.put(Integer.valueOf(i5), ryVar);
    }

    @Override // com.bytedance.adsdk.ugeno.lud
    public int[] ycx(int i5, int i11) {
        if (this.dqs > 0.0f) {
            if (this.f22676pk) {
                int size = View.MeasureSpec.getSize(i5);
                float f11 = this.dqs;
                if (f11 != 0.0f) {
                    i11 = View.MeasureSpec.makeMeasureSpec((int) (size / f11), 1073741824);
                }
            } else if (this.hti) {
                int size2 = View.MeasureSpec.getSize(i11);
                float f12 = this.dqs;
                if (f12 != 0.0f) {
                    i5 = View.MeasureSpec.makeMeasureSpec((int) (size2 * f12), 1073741824);
                }
            }
        }
        if (this.rzo != null && !this.f22667ko) {
            this.f22667ko = true;
        }
        return new int[]{i5, i11};
    }

    @Override // com.bytedance.adsdk.ugeno.lud
    public void ycx(int i5, int i11, int i12, int i13) {
        if (this.rzo == null || this.znc) {
            return;
        }
        this.znc = true;
    }

    @Override // com.bytedance.adsdk.ugeno.lud
    public void ycx(Canvas canvas, IAnimation iAnimation) {
        jc jcVar = this.f22673nq;
        if (jcVar != null) {
            jcVar.ycx(canvas, iAnimation);
        }
    }

    @Override // com.bytedance.adsdk.ugeno.lud
    public void ycx(Canvas canvas) {
        if (this instanceof ycx) {
            return;
        }
        com.bytedance.adsdk.ugeno.ycx.ycx ycxVar = this.giw;
        if (ycxVar != null) {
            ycxVar.ycx(canvas);
        }
        com.bytedance.adsdk.ugeno.ycx.lt ltVar = this.f22682sg;
        if (ltVar != null) {
            ltVar.ycx(canvas);
        }
    }

    @Override // com.bytedance.adsdk.ugeno.core.syc.zb
    public void ycx(ry ryVar) {
        ycx<ViewGroup> ycxVar;
        sya<T> syaVarLud;
        if (ryVar == null || ryVar.sya() == null || !TextUtils.equals(ryVar.sya().optString(TTConst.TRACK_TYPE), "onDismiss")) {
            return;
        }
        String strOptString = ryVar.sya().optString("nodeId");
        sya(8);
        this.f22690ul = (ycx) zb(this);
        if (TextUtils.isEmpty(strOptString) || (ycxVar = this.f22690ul) == null || (syaVarLud = ycxVar.lud(strOptString)) == null) {
            return;
        }
        syaVarLud.sya(8);
    }

    public void ycx(com.bytedance.adsdk.ugeno.lud.ycx.ycx ycxVar) {
        this.f22657dw = ycxVar;
    }

    public void ycx(String str, Object... objArr) {
        List<com.bytedance.adsdk.ugeno.lud.dj.sya> listEa = ea(str);
        if (listEa == null || listEa.isEmpty()) {
            return;
        }
        for (com.bytedance.adsdk.ugeno.lud.dj.sya syaVar : listEa) {
            syaVar.ycx(this.f22649ag);
            syaVar.ycx(objArr);
        }
    }

    public void ycx(com.bytedance.adsdk.ugeno.core.lud ludVar) {
        jw jwVar = this.f22649ag;
        if (jwVar != null) {
            jwVar.ycx(ludVar);
        }
    }

    public void ycx(com.bytedance.adsdk.ugeno.core.lt ltVar) {
        this.vyl = ltVar;
    }

    public void ycx(xkz xkzVar) {
        jw jwVar = this.f22649ag;
        if (jwVar != null) {
            jwVar.ycx(xkzVar);
        }
        this.eai = xkzVar;
    }

    public void ycx(com.bytedance.adsdk.ugeno.lud.ry ryVar) {
        jw jwVar = this.f22649ag;
        if (jwVar != null) {
            jwVar.ycx(ryVar);
        }
        this.pvm = ryVar;
    }
}
