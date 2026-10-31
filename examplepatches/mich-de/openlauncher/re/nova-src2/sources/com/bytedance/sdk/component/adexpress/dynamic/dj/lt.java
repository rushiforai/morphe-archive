package com.bytedance.sdk.component.adexpress.dynamic.dj;

import com.amplitude.android.migration.DatabaseConstants;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt {
    private String aeu;

    /* renamed from: ag, reason: collision with root package name */
    private double f23318ag;

    /* renamed from: aq, reason: collision with root package name */
    private int f23319aq;

    /* renamed from: av, reason: collision with root package name */
    private double f23320av;
    private String bah;
    private int bba;

    /* renamed from: bh, reason: collision with root package name */
    private int f23321bh;
    private double bhi;
    private String bjp;

    /* renamed from: ci, reason: collision with root package name */
    private JSONObject f23322ci;

    /* renamed from: cu, reason: collision with root package name */
    private boolean f23323cu;
    private int dc;
    private boolean dfk;

    /* renamed from: dj, reason: collision with root package name */
    private float f23324dj;
    private boolean dqs;
    private boolean duz;

    /* renamed from: dv, reason: collision with root package name */
    private String f23325dv;
    private int dwi;

    /* renamed from: dy, reason: collision with root package name */
    private String f23326dy;

    /* renamed from: ea, reason: collision with root package name */
    private double f23327ea;
    private float fby;
    private String ff;
    private int giw;

    /* renamed from: hf, reason: collision with root package name */
    private int f23328hf;
    private int hfd;
    private JSONObject hpv;
    private String htf;
    private boolean ifb;

    /* renamed from: iq, reason: collision with root package name */
    private int f23329iq;

    /* renamed from: jc, reason: collision with root package name */
    private float f23330jc;

    /* renamed from: jp, reason: collision with root package name */
    private boolean f23331jp;

    /* renamed from: jw, reason: collision with root package name */
    private float f23332jw;
    private String kgy;

    /* renamed from: kh, reason: collision with root package name */
    private String f23333kh;

    /* renamed from: kt, reason: collision with root package name */
    private boolean f23334kt;
    private int liq;

    /* renamed from: lt, reason: collision with root package name */
    private float f23335lt;
    private boolean lud;

    /* renamed from: lv, reason: collision with root package name */
    private boolean f23336lv;

    /* renamed from: mp, reason: collision with root package name */
    private String f23337mp;
    private boolean mue;

    /* renamed from: nc, reason: collision with root package name */
    private int f23338nc;
    private int nji;

    /* renamed from: nq, reason: collision with root package name */
    private String f23339nq;
    private int nzi;
    private int oby;

    /* renamed from: ok, reason: collision with root package name */
    private double f23340ok;
    private boolean oty;

    /* renamed from: pg, reason: collision with root package name */
    private boolean f23341pg;
    private String pmi;

    /* renamed from: py, reason: collision with root package name */
    private int f23342py;
    private int pyn;
    private int qn;

    /* renamed from: qt, reason: collision with root package name */
    private JSONObject f23343qt;

    /* renamed from: rl, reason: collision with root package name */
    private int f23344rl;
    private String rmf;
    private String rmy;
    private int row;

    /* renamed from: ry, reason: collision with root package name */
    private String f23345ry;
    private String rzo;

    /* renamed from: sg, reason: collision with root package name */
    private int f23346sg;
    private int skm;

    /* renamed from: sp, reason: collision with root package name */
    private int f23347sp;
    private String spv;
    private float sya;
    private String syc;
    private double sz;

    /* renamed from: te, reason: collision with root package name */
    private JSONObject f23348te;
    private String thx;

    /* renamed from: tn, reason: collision with root package name */
    private String f23349tn;
    private int tpg;
    private int tru;

    /* renamed from: tx, reason: collision with root package name */
    private int f23350tx;

    /* renamed from: uf, reason: collision with root package name */
    private boolean f23351uf;
    private int ufy;

    /* renamed from: uh, reason: collision with root package name */
    private String f23352uh;

    /* renamed from: ui, reason: collision with root package name */
    private String f23353ui;
    private int ujb;

    /* renamed from: ul, reason: collision with root package name */
    private float f23354ul;

    /* renamed from: ur, reason: collision with root package name */
    private int f23355ur;

    /* renamed from: uu, reason: collision with root package name */
    private String f23356uu;

    /* renamed from: uz, reason: collision with root package name */
    private boolean f23357uz;
    private String vbt;
    private int vy;
    private boolean vyl;
    private String wie;

    /* renamed from: wk, reason: collision with root package name */
    private List<ycx> f23358wk;

    /* renamed from: wr, reason: collision with root package name */
    private int f23359wr;
    private String wwx;

    /* renamed from: xf, reason: collision with root package name */
    private boolean f23360xf;
    private long xh = -1;
    private String xkz;
    private boolean xym;

    /* renamed from: xz, reason: collision with root package name */
    private String f23361xz;
    private float ycx;

    /* renamed from: yi, reason: collision with root package name */
    private int f23362yi;

    /* renamed from: yw, reason: collision with root package name */
    private int f23363yw;
    private int yyc;
    private int yzp;

    /* renamed from: zb, reason: collision with root package name */
    private float f23364zb;

    /* renamed from: zk, reason: collision with root package name */
    private int f23365zk;

    /* renamed from: zr, reason: collision with root package name */
    private boolean f23366zr;

    private void tru(String str) {
        this.bah = str;
    }

    public static lt ycx(JSONObject jSONObject) throws JSONException {
        if (jSONObject == null) {
            return null;
        }
        lt ltVar = new lt();
        ltVar.zb(jSONObject.optString("adType", "embeded"));
        ltVar.syc(jSONObject.optString("clickArea", "creative"));
        ltVar.dy(jSONObject.optString("clickTigger", TTEDPEventConstants.EDP_EVENT_NAME_CLICK));
        ltVar.sya(jSONObject.optString("fontFamily", "PingFangSC"));
        ltVar.dj(jSONObject.optString("textAlign", "left"));
        ltVar.lud(jSONObject.optString("color", "#999999"));
        ltVar.lt(jSONObject.optString("bgColor", "transparent"));
        ltVar.ul(jSONObject.optString("bgImgUrl", b.f42142b));
        ltVar.tru(jSONObject.optString("bgImgData", b.f42142b));
        ltVar.fby(jSONObject.optString("borderColor", "#000000"));
        ltVar.jw(jSONObject.optString("borderStyle", "solid"));
        ltVar.jc(jSONObject.optString("heightMode", TTConst.TRACK_TYPE_AUTO));
        ltVar.ea(jSONObject.optString("widthMode", "fixed"));
        ltVar.ok(jSONObject.optString("interactText", b.f42142b));
        ltVar.sya(jSONObject.optBoolean("isShowBgControl", false));
        ltVar.ry(jSONObject.optString("interactBgColor", b.f42142b));
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("interactPosition");
        if (jSONObjectOptJSONObject != null) {
            ltVar.ul(jSONObjectOptJSONObject.optInt("translateY", 0));
            ltVar.fby(jSONObjectOptJSONObject.optInt("translateX", 0));
            ltVar.dj(jSONObjectOptJSONObject.optDouble("scaleX", 0.0d));
            ltVar.lud(jSONObjectOptJSONObject.optDouble("scaleY", 0.0d));
        }
        ltVar.xkz(jSONObject.optString("interactType", b.f42142b));
        ltVar.lud(jSONObject.optInt("interactSlideDirection", -1));
        ltVar.wie(jSONObject.optString("justifyHorizontal", "space-around"));
        ltVar.pmi(jSONObject.optString("justifyVertical", "flex-start"));
        ltVar.zb(jSONObject.optDouble("timingStart"));
        ltVar.sya(jSONObject.optDouble("timingEnd"));
        ltVar.dj((float) jSONObject.optDouble("width", 0.0d));
        ltVar.sya((float) jSONObject.optDouble("height", 0.0d));
        ltVar.ycx((float) jSONObject.optDouble("borderRadius", 0.0d));
        ltVar.zb((float) jSONObject.optDouble("borderSize", 0.0d));
        ltVar.zb(jSONObject.optBoolean("interactValidate", false));
        ltVar.jw((float) jSONObject.optDouble("fontSize", 0.0d));
        ltVar.lud((float) jSONObject.optDouble("paddingBottom", 0.0d));
        ltVar.lt((float) jSONObject.optDouble("paddingLeft", 0.0d));
        ltVar.ul((float) jSONObject.optDouble("paddingRight", 0.0d));
        ltVar.fby((float) jSONObject.optDouble("paddingTop", 0.0d));
        ltVar.dj(jSONObject.optBoolean("lineFeed", false));
        ltVar.jw(jSONObject.optInt("lineCount", 0));
        ltVar.lt(jSONObject.optDouble("lineHeight", 1.2d));
        ltVar.xkz(jSONObject.optInt("letterSpacing", 0));
        ltVar.lud(jSONObject.optBoolean("isDataFixed", false));
        ltVar.syc(jSONObject.optInt("fontWeight"));
        ltVar.lt(jSONObject.optBoolean("lineLimit"));
        ltVar.dy(jSONObject.optInt("position"));
        ltVar.uh(jSONObject.optString("align"));
        ltVar.ul(jSONObject.optBoolean("useLeft"));
        ltVar.fby(jSONObject.optBoolean("useRight"));
        ltVar.jw(jSONObject.optBoolean("useTop"));
        ltVar.jc(jSONObject.optBoolean("useBottom"));
        ltVar.htf(jSONObject.optString("data"));
        ltVar.zb(jSONObject.optJSONObject("i18n"));
        ltVar.ok(jSONObject.optInt("marginLeft"));
        ltVar.ry(jSONObject.optInt("marginRight"));
        ltVar.jc(jSONObject.optInt("marginTop"));
        ltVar.ea(jSONObject.optInt("marginBottom"));
        ltVar.wie(jSONObject.optInt("tagMaxCount"));
        ltVar.ea(jSONObject.optBoolean("allowTextFlow"));
        ltVar.pmi(jSONObject.optInt("textFlowType"));
        ltVar.uh(jSONObject.optInt("textFlowDuration"));
        ltVar.htf(jSONObject.optInt("left"));
        ltVar.thx(jSONObject.optInt("right"));
        ltVar.wwx(jSONObject.optInt("top"));
        ltVar.tn(jSONObject.optInt("bottom"));
        ltVar.thx(jSONObject.optString("alignItems", "flex-start"));
        ltVar.wwx(jSONObject.optString("direction", b.f42142b));
        ltVar.ycx(jSONObject.optBoolean("loop", false));
        ltVar.dv(jSONObject.optInt("zIndex"));
        ltVar.av(jSONObject.optInt("interactVisibleTime"));
        ltVar.oty(jSONObject.optInt("interactHiddenTime"));
        ltVar.ry(jSONObject.optBoolean("interactEnableMask"));
        ltVar.xkz(jSONObject.optBoolean("interactWontHide"));
        ltVar.ycx(jSONObject.optString("bgGradient"));
        ltVar.aeu(jSONObject.optInt("areaType"));
        ltVar.xz(jSONObject.optInt("interactSlideThreshold", 0));
        ltVar.ifb(jSONObject.optInt("interactBottomDistance", com.bytedance.sdk.component.adexpress.dj.zb() ? 0 : 120));
        ltVar.pmi(jSONObject.optBoolean("openPlayableLandingPage", false));
        ltVar.sya(jSONObject.optJSONObject("video"));
        ltVar.dj(jSONObject.optJSONObject("image"));
        ltVar.rmy(jSONObject.optInt("borderShadowExtent"));
        ltVar.syc(jSONObject.optBoolean("bgGauseBlur"));
        ltVar.kgy(jSONObject.optInt("bgGauseBlurRadius"));
        ltVar.dy(jSONObject.optBoolean("showTimeProgress", false));
        ltVar.wie(jSONObject.optBoolean("showPlayButton", false));
        ltVar.ycx(jSONObject.optDouble("bgColorCg", 0.0d));
        ltVar.lt(jSONObject.optInt("bgMaterialCenterCalcColor", 0));
        ltVar.zb(jSONObject.optInt("borderTopLeftRadius", 0));
        ltVar.ycx(jSONObject.optInt("borderTopRightRadius", 0));
        ltVar.dj(jSONObject.optInt("borderBottomLeftRadius", 0));
        ltVar.sya(jSONObject.optInt("borderBottomRightRadius", 0));
        ltVar.lud(jSONObject.optJSONObject("interactI18n"));
        ltVar.dv(jSONObject.optString("imageObjectFit"));
        ltVar.oty(jSONObject.optString("interactTitle"));
        ltVar.rmf(jSONObject.optInt("interactTextPositionTop"));
        ltVar.tn(jSONObject.optString("imageLottieTosPath"));
        ltVar.ok(jSONObject.optBoolean("animationsLoop"));
        ltVar.hf(jSONObject.optInt("lottieAppNameMaxLength"));
        ltVar.bhi(jSONObject.optInt("lottieAdDescMaxLength"));
        ltVar.tru(jSONObject.optInt("lottieAdTitleMaxLength"));
        try {
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("animations");
            if (jSONArrayOptJSONArray != null) {
                ArrayList arrayList = new ArrayList();
                for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                    JSONObject jSONObject2 = jSONArrayOptJSONArray.getJSONObject(i5);
                    ycx ycxVar = new ycx();
                    ycxVar.sya(jSONObject2.optString("animationType"));
                    ycxVar.ycx(jSONObject2.optDouble("animationDuration"));
                    ycxVar.zb(jSONObject2.optDouble("animationScaleX"));
                    ycxVar.sya(jSONObject2.optDouble("animationScaleY"));
                    ycxVar.dj(jSONObject2.optString("animationTimeFunction"));
                    ycxVar.dj(jSONObject2.optDouble("animationDelay"));
                    ycxVar.lt(jSONObject2.optInt("animationIterationCount"));
                    ycxVar.lud(jSONObject2.optString("animationDirection"));
                    ycxVar.lud(jSONObject2.optDouble("animationInterval"));
                    ycxVar.ycx(jSONObject2.optInt("animationBorderWidth"));
                    ycxVar.ycx(jSONObject2.optLong(DatabaseConstants.KEY_FIELD));
                    ycxVar.zb(jSONObject2.optInt("animationEffectWidth"));
                    ycxVar.sya(jSONObject2.optInt("animationSwing", 1));
                    ycxVar.dj(jSONObject2.optInt("animationTranslateX"));
                    ycxVar.lud(jSONObject2.optInt("animationTranslateY"));
                    ycxVar.zb(jSONObject2.optString("animationRippleBackgroundColor"));
                    ycxVar.ycx(jSONObject2.optString("animationScaleDirection"));
                    ycxVar.ul(jSONObject2.optInt("animationFadeStart"));
                    ycxVar.fby(jSONObject2.optInt("animationFadeEnd"));
                    ycxVar.lt(jSONObject2.optString("animationFillMode"));
                    ycxVar.jw(jSONObject2.optInt("animationBounceHeight"));
                    if (ltVar.uh() > 0.0d) {
                        ycxVar.dj(ycxVar.xkz() + ltVar.uh());
                    }
                    arrayList.add(ycxVar);
                }
                ltVar.ycx(arrayList);
            }
            if (jSONObject.has("triggerSlideMinDistance")) {
                ltVar.hf(jSONObject.optString("triggerSlideDirection", "0"));
                ltVar.ycx(jSONObject.optLong("triggerSlideMinDistance", 0L));
            }
            return ltVar;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX60nX+sh", "f/cjlA61auuBU9hImDOyIVjlG5QPqWw=", "XvY5hwK/feuBU9hImDOyIVjlG5QPqWw=", 344);
            return ltVar;
        }
    }

    public boolean aeu() {
        return this.oty;
    }

    public int ag() {
        return this.nzi;
    }

    public boolean aq() {
        return this.dqs;
    }

    public String av() {
        return this.f23349tn;
    }

    public int bba() {
        return this.dc;
    }

    public int bh() {
        return this.f23329iq;
    }

    public String bhi() {
        return this.wwx;
    }

    public int bjp() {
        return this.f23355ur;
    }

    public int ci() {
        return this.f23365zk;
    }

    public JSONObject cu() {
        return this.f23348te;
    }

    public String dc() {
        return this.kgy;
    }

    public boolean dfk() {
        return this.f23323cu;
    }

    public int dj() {
        return this.vy;
    }

    public boolean dqs() {
        return this.duz;
    }

    public boolean duz() {
        return this.xym;
    }

    public String dv() {
        return this.pmi;
    }

    public String dwi() {
        return this.aeu;
    }

    public float dy() {
        return this.fby;
    }

    public float ea() {
        return this.ycx;
    }

    public double fby() {
        return this.f23318ag;
    }

    public boolean ff() {
        return this.f23334kt;
    }

    public String giw() {
        return this.f23353ui;
    }

    public String hf() {
        return this.f23352uh;
    }

    public void hfd() {
        ycx(this, this.f23348te);
    }

    public String hpv() {
        return this.f23337mp;
    }

    public double htf() {
        return this.f23340ok;
    }

    public double ifb() {
        return this.f23320av;
    }

    public boolean iq() {
        return this.f23351uf;
    }

    public String jc() {
        return this.rzo;
    }

    public boolean jp() {
        return this.mue;
    }

    public int jw() {
        return this.f23347sp;
    }

    public double kgy() {
        return this.bhi;
    }

    public boolean kh() {
        return this.f23331jp;
    }

    public int kt() {
        return this.skm;
    }

    public boolean liq() {
        return this.dfk;
    }

    public JSONObject lt() {
        return this.f23322ci;
    }

    public int lud() {
        return this.f23363yw;
    }

    public boolean lv() {
        return this.f23366zr;
    }

    public double mp() {
        return this.sz;
    }

    public String mue() {
        return this.vbt;
    }

    public int nc() {
        return this.yyc;
    }

    public String nji() {
        return this.rmy;
    }

    public String nq() {
        return this.spv;
    }

    public int nzi() {
        return this.f23319aq;
    }

    public String oby() {
        return this.f23361xz;
    }

    public float ok() {
        return this.f23364zb;
    }

    public String oty() {
        return this.bah;
    }

    public int pg() {
        List<ycx> list = this.f23358wk;
        if (list == null) {
            return 0;
        }
        for (ycx ycxVar : list) {
            if ("translate".equals(ycxVar.jw()) && ycxVar.ul() < 0) {
                return -ycxVar.ul();
            }
        }
        return 0;
    }

    public float pmi() {
        return this.f23330jc;
    }

    public String py() {
        return this.f23333kh;
    }

    public String pyn() {
        return this.f23339nq;
    }

    public int qn() {
        return this.ufy;
    }

    public boolean qt() {
        return this.f23341pg;
    }

    public int rl() {
        return this.oby;
    }

    public String rmf() {
        return this.f23325dv;
    }

    public int rmy() {
        return this.tru;
    }

    public int row() {
        return this.hfd;
    }

    public boolean ry() {
        return this.lud;
    }

    public JSONObject sg() {
        return this.hpv;
    }

    public void skm() {
        ycx(this, this.f23343qt);
    }

    public int sp() {
        return this.ujb;
    }

    public long spv() {
        return this.xh;
    }

    public int sya() {
        return this.liq;
    }

    public float syc() {
        return this.f23354ul;
    }

    public boolean sz() {
        return this.ifb;
    }

    public String te() {
        return this.ff;
    }

    public String thx() {
        return this.syc;
    }

    public String tn() {
        return this.wie;
    }

    public int tpg() {
        return this.qn;
    }

    public int tx() {
        return this.f23346sg;
    }

    public int uf() {
        return this.f23362yi;
    }

    public int ufy() {
        return this.f23321bh;
    }

    public double uh() {
        return this.f23327ea;
    }

    public int ui() {
        return this.bba;
    }

    public int ujb() {
        return this.f23350tx;
    }

    public int ul() {
        return this.f23338nc;
    }

    public boolean ur() {
        return this.f23357uz;
    }

    public int uu() {
        return this.f23359wr;
    }

    public int uz() {
        return this.f23344rl;
    }

    public List<ycx> vbt() {
        return this.f23358wk;
    }

    public int vy() {
        return this.f23342py;
    }

    public int vyl() {
        return this.pyn;
    }

    public float wie() {
        return this.f23332jw;
    }

    public String wk() {
        return this.bjp;
    }

    public boolean wr() {
        return this.f23336lv;
    }

    public String wwx() {
        return this.f23326dy;
    }

    public int xf() {
        return this.giw;
    }

    public float xkz() {
        return this.f23335lt;
    }

    public int xym() {
        return this.dwi;
    }

    public int xz() {
        return this.f23328hf;
    }

    public int yi() {
        return this.yzp;
    }

    public boolean yw() {
        return this.vyl;
    }

    public int yyc() {
        return this.row;
    }

    public String yzp() {
        return this.rmf;
    }

    public int zb() {
        return this.tpg;
    }

    public String zk() {
        return this.f23356uu;
    }

    public int zr() {
        return this.nji;
    }

    public void aeu(int i5) {
        this.f23365zk = i5;
    }

    public void av(int i5) {
        this.nzi = i5;
    }

    public void bhi(int i5) {
        this.hfd = i5;
    }

    public void dj(int i5) {
        this.f23363yw = i5;
    }

    public void dv(int i5) {
        this.f23350tx = i5;
    }

    public void dy(String str) {
        this.f23361xz = str;
    }

    public void ea(String str) {
        this.wwx = str;
    }

    public void fby(float f11) {
        this.f23332jw = f11;
    }

    public void hf(int i5) {
        this.pyn = i5;
    }

    public void htf(String str) {
        this.f23353ui = str;
    }

    public void ifb(int i5) {
        this.row = i5;
    }

    public void jc(String str) {
        this.thx = str;
    }

    public void jw(float f11) {
        this.f23330jc = f11;
    }

    public void kgy(int i5) {
        this.f23342py = i5;
    }

    public void lt(int i5) {
        this.f23347sp = i5;
    }

    public void lud(int i5) {
        this.f23338nc = i5;
    }

    public void ok(String str) {
        this.f23349tn = str;
    }

    public void oty(int i5) {
        this.ufy = i5;
    }

    public void pmi(String str) {
        this.kgy = str;
    }

    public void rmf(int i5) {
        this.yyc = i5;
    }

    public void rmy(int i5) {
        this.qn = i5;
    }

    public void ry(String str) {
        this.f23325dv = str;
    }

    public void sya(int i5) {
        this.vy = i5;
    }

    public void syc(String str) {
        this.aeu = str;
    }

    public void thx(int i5) {
        this.f23346sg = i5;
    }

    public void tn(int i5) {
        this.f23319aq = i5;
    }

    public String tru() {
        return this.thx;
    }

    public void uh(String str) {
        this.f23337mp = str;
    }

    public void ul(float f11) {
        this.fby = f11;
    }

    public void wie(String str) {
        this.rmy = str;
    }

    public void wwx(int i5) {
        this.f23321bh = i5;
    }

    public void xkz(String str) {
        this.rmf = str;
    }

    public void xz(int i5) {
        this.ujb = i5;
    }

    public void zb(int i5) {
        this.liq = i5;
    }

    public void dj(float f11) {
        this.f23324dj = f11;
    }

    public void dv(String str) {
        this.ff = str;
    }

    public void dy(int i5) {
        this.bba = i5;
    }

    public void ea(int i5) {
        this.oby = i5;
    }

    public void fby(String str) {
        this.f23352uh = str;
    }

    public void hf(String str) {
        this.spv = str;
    }

    public void htf(int i5) {
        this.giw = i5;
    }

    public void jc(int i5) {
        this.dwi = i5;
    }

    public void jw(String str) {
        this.htf = str;
    }

    public void lt(float f11) {
        this.f23354ul = f11;
    }

    public void lud(float f11) {
        this.f23335lt = f11;
    }

    public void ok(int i5) {
        this.nji = i5;
    }

    public void oty(String str) {
        this.f23339nq = str;
    }

    public void pmi(int i5) {
        this.f23355ur = i5;
    }

    public void ry(int i5) {
        this.dc = i5;
    }

    public void sya(float f11) {
        this.sya = f11;
    }

    public void syc(int i5) {
        this.f23344rl = i5;
    }

    public void thx(String str) {
        this.bjp = str;
    }

    public void tn(String str) {
        this.f23333kh = str;
    }

    public void tru(int i5) {
        this.skm = i5;
    }

    public void uh(int i5) {
        this.f23359wr = i5;
    }

    public void ul(String str) {
        this.pmi = str;
    }

    public void wie(int i5) {
        this.f23329iq = i5;
    }

    public void wwx(String str) {
        this.f23356uu = str;
    }

    public void xkz(int i5) {
        this.f23362yi = i5;
    }

    public void zb(float f11) {
        this.f23364zb = f11;
    }

    public void dj(String str) {
        this.syc = str;
    }

    public void dy(boolean z11) {
        this.vyl = z11;
    }

    public void ea(boolean z11) {
        this.dqs = z11;
    }

    public void fby(int i5) {
        this.tru = i5;
    }

    public void jc(boolean z11) {
        this.f23336lv = z11;
    }

    public void jw(int i5) {
        this.yzp = i5;
    }

    public void lt(String str) {
        this.wie = str;
    }

    public void lud(String str) {
        this.f23326dy = str;
    }

    public void ok(boolean z11) {
        this.f23323cu = z11;
    }

    public void pmi(boolean z11) {
        this.f23331jp = z11;
    }

    public void ry(boolean z11) {
        this.mue = z11;
    }

    public void sya(double d5) {
        this.f23340ok = d5;
    }

    public void syc(boolean z11) {
        this.dfk = z11;
    }

    public void ul(int i5) {
        this.f23328hf = i5;
    }

    public void wie(boolean z11) {
        this.f23334kt = z11;
    }

    public void xkz(boolean z11) {
        this.f23341pg = z11;
    }

    public void zb(boolean z11) {
        this.lud = z11;
    }

    public void dj(double d5) {
        this.bhi = d5;
    }

    public void fby(boolean z11) {
        this.duz = z11;
    }

    public void jw(boolean z11) {
        this.f23357uz = z11;
    }

    public void lt(double d5) {
        this.sz = d5;
    }

    public void lud(double d5) {
        this.f23320av = d5;
    }

    public void sya(String str) {
        this.xkz = str;
    }

    public void ul(boolean z11) {
        this.f23351uf = z11;
    }

    public void zb(double d5) {
        this.f23327ea = d5;
    }

    public void dj(boolean z11) {
        this.ifb = z11;
    }

    public void lt(boolean z11) {
        this.f23366zr = z11;
    }

    public void lud(boolean z11) {
        this.xym = z11;
    }

    public void sya(boolean z11) {
        this.oty = z11;
    }

    public void zb(String str) {
        this.f23345ry = str;
    }

    public void dj(JSONObject jSONObject) {
        this.f23348te = jSONObject;
    }

    public void lud(JSONObject jSONObject) {
        this.f23322ci = jSONObject;
    }

    public void sya(JSONObject jSONObject) {
        this.f23343qt = jSONObject;
    }

    public void zb(JSONObject jSONObject) {
        this.hpv = jSONObject;
    }

    public boolean ycx() {
        return this.f23360xf;
    }

    public void ycx(boolean z11) {
        this.f23360xf = z11;
    }

    public void ycx(int i5) {
        this.tpg = i5;
    }

    public void ycx(double d5) {
        this.f23318ag = d5;
    }

    public void ycx(String str) {
        this.rzo = str;
    }

    public void ycx(float f11) {
        this.ycx = f11;
    }

    public void ycx(List<ycx> list) {
        this.f23358wk = list;
    }

    public void ycx(long j11) {
        this.xh = j11;
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    private void ycx(lt ltVar, JSONObject jSONObject) {
        if (ltVar == null || jSONObject == null) {
            return;
        }
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            next.getClass();
            char c11 = 65535;
            switch (next.hashCode()) {
                case -2067713583:
                    if (next.equals("isShowBgControl")) {
                        c11 = 0;
                        break;
                    }
                    break;
                case -1965619659:
                    if (next.equals("clickArea")) {
                        c11 = 1;
                        break;
                    }
                    break;
                case -1912831834:
                    if (next.equals("triggerSlideDirection")) {
                        c11 = 2;
                        break;
                    }
                    break;
                case -1885934767:
                    if (next.equals("bgImgUrl")) {
                        c11 = 3;
                        break;
                    }
                    break;
                case -1822062213:
                    if (next.equals("lineCount")) {
                        c11 = 4;
                        break;
                    }
                    break;
                case -1821293778:
                    if (next.equals("openPlayableLandingPage")) {
                        c11 = 5;
                        break;
                    }
                    break;
                case -1813937113:
                    if (next.equals("lineLimit")) {
                        c11 = 6;
                        break;
                    }
                    break;
                case -1578250488:
                    if (next.equals("interactBgColor")) {
                        c11 = 7;
                        break;
                    }
                    break;
                case -1501175880:
                    if (next.equals("paddingLeft")) {
                        c11 = '\b';
                        break;
                    }
                    break;
                case -1422965251:
                    if (next.equals("adType")) {
                        c11 = '\t';
                        break;
                    }
                    break;
                case -1383228885:
                    if (next.equals("bottom")) {
                        c11 = '\n';
                        break;
                    }
                    break;
                case -1224696685:
                    if (next.equals("fontFamily")) {
                        c11 = 11;
                        break;
                    }
                    break;
                case -1221029593:
                    if (next.equals("height")) {
                        c11 = '\f';
                        break;
                    }
                    break;
                case -1065511464:
                    if (next.equals("textAlign")) {
                        c11 = '\r';
                        break;
                    }
                    break;
                case -1063257157:
                    if (next.equals("alignItems")) {
                        c11 = 14;
                        break;
                    }
                    break;
                case -1046708884:
                    if (next.equals("interactValidate")) {
                        c11 = 15;
                        break;
                    }
                    break;
                case -1044792121:
                    if (next.equals("marginTop")) {
                        c11 = 16;
                        break;
                    }
                    break;
                case -1019884910:
                    if (next.equals("useBottom")) {
                        c11 = 17;
                        break;
                    }
                    break;
                case -1005195314:
                    if (next.equals("triggerSlideMinDistance")) {
                        c11 = 18;
                        break;
                    }
                    break;
                case -962590849:
                    if (next.equals("direction")) {
                        c11 = 19;
                        break;
                    }
                    break;
                case -912366651:
                    if (next.equals("tagMaxCount")) {
                        c11 = 20;
                        break;
                    }
                    break;
                case -848877971:
                    if (next.equals("interactHiddenTime")) {
                        c11 = 21;
                        break;
                    }
                    break;
                case -836058546:
                    if (next.equals("useTop")) {
                        c11 = 22;
                        break;
                    }
                    break;
                case -734428249:
                    if (next.equals("fontWeight")) {
                        c11 = 23;
                        break;
                    }
                    break;
                case -731417480:
                    if (next.equals("zIndex")) {
                        c11 = 24;
                        break;
                    }
                    break;
                case -709393864:
                    if (next.equals("timingStart")) {
                        c11 = 25;
                        break;
                    }
                    break;
                case -515807685:
                    if (next.equals("lineHeight")) {
                        c11 = 26;
                        break;
                    }
                    break;
                case -321658193:
                    if (next.equals("textFlowDuration")) {
                        c11 = 27;
                        break;
                    }
                    break;
                case -295409451:
                    if (next.equals("useRight")) {
                        c11 = 28;
                        break;
                    }
                    break;
                case -289173127:
                    if (next.equals("marginBottom")) {
                        c11 = 29;
                        break;
                    }
                    break;
                case -204859874:
                    if (next.equals("bgColor")) {
                        c11 = 30;
                        break;
                    }
                    break;
                case -148259282:
                    if (next.equals("useLeft")) {
                        c11 = 31;
                        break;
                    }
                    break;
                case -51738487:
                    if (next.equals("widthMode")) {
                        c11 = ' ';
                        break;
                    }
                    break;
                case 115029:
                    if (next.equals("top")) {
                        c11 = '!';
                        break;
                    }
                    break;
                case 3076010:
                    if (next.equals("data")) {
                        c11 = AbstractJsonLexerKt.STRING;
                        break;
                    }
                    break;
                case 3317767:
                    if (next.equals("left")) {
                        c11 = '#';
                        break;
                    }
                    break;
                case 3327652:
                    if (next.equals("loop")) {
                        c11 = '$';
                        break;
                    }
                    break;
                case 90130308:
                    if (next.equals("paddingTop")) {
                        c11 = '%';
                        break;
                    }
                    break;
                case 92903173:
                    if (next.equals("align")) {
                        c11 = '&';
                        break;
                    }
                    break;
                case 94842723:
                    if (next.equals("color")) {
                        c11 = '\'';
                        break;
                    }
                    break;
                case 108511772:
                    if (next.equals("right")) {
                        c11 = '(';
                        break;
                    }
                    break;
                case 113126854:
                    if (next.equals("width")) {
                        c11 = ')';
                        break;
                    }
                    break;
                case 164611121:
                    if (next.equals("timingEnd")) {
                        c11 = '*';
                        break;
                    }
                    break;
                case 202355100:
                    if (next.equals("paddingBottom")) {
                        c11 = '+';
                        break;
                    }
                    break;
                case 247204452:
                    if (next.equals("allowTextFlow")) {
                        c11 = AbstractJsonLexerKt.COMMA;
                        break;
                    }
                    break;
                case 302841174:
                    if (next.equals("interactWontHide")) {
                        c11 = '-';
                        break;
                    }
                    break;
                case 365601008:
                    if (next.equals("fontSize")) {
                        c11 = '.';
                        break;
                    }
                    break;
                case 428975654:
                    if (next.equals("justifyVertical")) {
                        c11 = '/';
                        break;
                    }
                    break;
                case 439444041:
                    if (next.equals("interactVisibleTime")) {
                        c11 = '0';
                        break;
                    }
                    break;
                case 713848971:
                    if (next.equals("paddingRight")) {
                        c11 = '1';
                        break;
                    }
                    break;
                case 722830999:
                    if (next.equals("borderColor")) {
                        c11 = '2';
                        break;
                    }
                    break;
                case 737768677:
                    if (next.equals("borderStyle")) {
                        c11 = '3';
                        break;
                    }
                    break;
                case 747804969:
                    if (next.equals("position")) {
                        c11 = '4';
                        break;
                    }
                    break;
                case 791643104:
                    if (next.equals("isDataFixed")) {
                        c11 = '5';
                        break;
                    }
                    break;
                case 975087886:
                    if (next.equals("marginRight")) {
                        c11 = '6';
                        break;
                    }
                    break;
                case 1110826708:
                    if (next.equals("justifyHorizontal")) {
                        c11 = '7';
                        break;
                    }
                    break;
                case 1122368895:
                    if (next.equals("interactPosition")) {
                        c11 = '8';
                        break;
                    }
                    break;
                case 1188229042:
                    if (next.equals("lineFeed")) {
                        c11 = '9';
                        break;
                    }
                    break;
                case 1332036739:
                    if (next.equals("interactText")) {
                        c11 = AbstractJsonLexerKt.COLON;
                        break;
                    }
                    break;
                case 1332055696:
                    if (next.equals("interactType")) {
                        c11 = ';';
                        break;
                    }
                    break;
                case 1349188574:
                    if (next.equals("borderRadius")) {
                        c11 = '<';
                        break;
                    }
                    break;
                case 1360828714:
                    if (next.equals("clickTigger")) {
                        c11 = '=';
                        break;
                    }
                    break;
                case 1490178922:
                    if (next.equals("heightMode")) {
                        c11 = '>';
                        break;
                    }
                    break;
                case 1761274325:
                    if (next.equals("textFlowType")) {
                        c11 = '?';
                        break;
                    }
                    break;
                case 1824903757:
                    if (next.equals("borderSize")) {
                        c11 = '@';
                        break;
                    }
                    break;
                case 1970934485:
                    if (next.equals("marginLeft")) {
                        c11 = 'A';
                        break;
                    }
                    break;
                case 2111078717:
                    if (next.equals("letterSpacing")) {
                        c11 = 'B';
                        break;
                    }
                    break;
            }
            switch (c11) {
                case 0:
                    ltVar.sya(jSONObject.optBoolean(next, false));
                    break;
                case 1:
                    ltVar.syc(jSONObject.optString(next));
                    break;
                case 2:
                    ltVar.hf(jSONObject.optString(next));
                    break;
                case 3:
                    ltVar.ul(jSONObject.optString(next));
                    break;
                case 4:
                    ltVar.jw(jSONObject.optInt(next));
                    break;
                case 5:
                    ltVar.pmi(jSONObject.optBoolean(next));
                    break;
                case 6:
                    ltVar.lt(jSONObject.optBoolean(next));
                    break;
                case 7:
                    ltVar.ry(jSONObject.optString(next));
                    break;
                case '\b':
                    ltVar.lt((float) jSONObject.optDouble(next));
                    break;
                case '\t':
                    ltVar.zb(jSONObject.optString(next));
                    break;
                case '\n':
                    ltVar.tn(jSONObject.optInt(next));
                    break;
                case 11:
                    ltVar.sya(jSONObject.optString(next));
                    break;
                case '\f':
                    ltVar.sya((float) jSONObject.optDouble(next));
                    break;
                case '\r':
                    ltVar.dj(jSONObject.optString(next));
                    break;
                case 14:
                    ltVar.thx(jSONObject.optString(next));
                    break;
                case 15:
                    ltVar.zb(jSONObject.optBoolean(next));
                    break;
                case 16:
                    ltVar.jc(jSONObject.optInt(next));
                    break;
                case 17:
                    ltVar.jc(jSONObject.optBoolean(next));
                    break;
                case 18:
                    ltVar.ycx(jSONObject.optLong(next));
                    break;
                case 19:
                    ltVar.wwx(jSONObject.optString(next));
                    break;
                case 20:
                    ltVar.wie(jSONObject.optInt(next));
                    break;
                case 21:
                    ltVar.oty(jSONObject.optInt(next));
                    break;
                case 22:
                    ltVar.jw(jSONObject.optBoolean(next));
                    break;
                case 23:
                    ltVar.syc(jSONObject.optInt(next));
                    break;
                case 24:
                    ltVar.dv(jSONObject.optInt(next));
                    break;
                case 25:
                    ltVar.zb(jSONObject.optDouble(next));
                    break;
                case 26:
                    ltVar.lt(jSONObject.optDouble(next));
                    break;
                case 27:
                    ltVar.uh(jSONObject.optInt(next));
                    break;
                case 28:
                    ltVar.fby(jSONObject.optBoolean(next));
                    break;
                case 29:
                    ltVar.ea(jSONObject.optInt(next));
                    break;
                case 30:
                    ltVar.lt(jSONObject.optString(next));
                    break;
                case 31:
                    ltVar.ul(jSONObject.optBoolean(next));
                    break;
                case ' ':
                    ltVar.ea(jSONObject.optString(next));
                    break;
                case '!':
                    ltVar.wwx(jSONObject.optInt(next));
                    break;
                case '\"':
                    ltVar.htf(jSONObject.optString(next));
                    break;
                case '#':
                    ltVar.htf(jSONObject.optInt(next));
                    break;
                case '$':
                    ltVar.ycx(jSONObject.optBoolean(next));
                    break;
                case '%':
                    ltVar.fby((float) jSONObject.optDouble(next));
                    break;
                case '&':
                    ltVar.uh(jSONObject.optString(next));
                    break;
                case '\'':
                    ltVar.lud(jSONObject.optString(next));
                    break;
                case '(':
                    ltVar.thx(jSONObject.optInt(next));
                    break;
                case ')':
                    ltVar.dj((float) jSONObject.optDouble(next));
                    break;
                case '*':
                    ltVar.sya(jSONObject.optDouble(next));
                    break;
                case '+':
                    ltVar.lud((float) jSONObject.optDouble(next));
                    break;
                case ',':
                    ltVar.ea(jSONObject.optBoolean(next));
                    break;
                case '-':
                    ltVar.xkz(jSONObject.optBoolean(next));
                    break;
                case '.':
                    ltVar.jw((float) jSONObject.optDouble(next));
                    break;
                case '/':
                    ltVar.pmi(jSONObject.optString(next));
                    break;
                case '0':
                    ltVar.av(jSONObject.optInt(next));
                    break;
                case '1':
                    ltVar.ul((float) jSONObject.optDouble(next));
                    break;
                case '2':
                    ltVar.fby(jSONObject.optString(next));
                    break;
                case '3':
                    ltVar.jw(jSONObject.optString(next));
                    break;
                case '4':
                    ltVar.dy(jSONObject.optInt(next));
                    break;
                case '5':
                    ltVar.lud(jSONObject.optBoolean(next));
                    break;
                case '6':
                    ltVar.ry(jSONObject.optInt(next));
                    break;
                case '7':
                    ltVar.wie(jSONObject.optString(next));
                    break;
                case '8':
                    JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject(next);
                    if (jSONObjectOptJSONObject == null) {
                        break;
                    } else {
                        ltVar.ul(jSONObjectOptJSONObject.optInt("translateY", 0));
                        ltVar.fby(jSONObjectOptJSONObject.optInt("translateX", 0));
                        ltVar.dj(jSONObjectOptJSONObject.optDouble("scaleX", 0.0d));
                        ltVar.lud(jSONObjectOptJSONObject.optDouble("scaleY", 0.0d));
                        break;
                    }
                case '9':
                    ltVar.dj(jSONObject.optBoolean(next));
                    break;
                case ':':
                    ltVar.ok(jSONObject.optString(next));
                    break;
                case ';':
                    ltVar.xkz(jSONObject.optString(next));
                    break;
                case '<':
                    ltVar.ycx((float) jSONObject.optDouble(next));
                    break;
                case '=':
                    ltVar.dy(jSONObject.optString(next));
                    break;
                case '>':
                    ltVar.jc(jSONObject.optString(next));
                    break;
                case '?':
                    ltVar.pmi(jSONObject.optInt(next));
                    break;
                case '@':
                    ltVar.zb((float) jSONObject.optDouble(next));
                    break;
                case 'A':
                    ltVar.ok(jSONObject.optInt(next));
                    break;
                case 'B':
                    ltVar.xkz(jSONObject.optInt(next));
                    break;
            }
        }
    }
}
