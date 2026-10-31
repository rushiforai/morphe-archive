package com.bytedance.sdk.openadsdk.core.model;

import android.content.Context;
import android.net.Uri;
import android.text.TextUtils;
import ar.g;
import com.amplitude.core.events.Plan;
import com.amplitude.core.utilities.http.HttpClient;
import com.bykv.vk.openvk.ycx.ycx.ycx.sya.c;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.CacheDirFactory;
import com.bytedance.sdk.openadsdk.FilterWord;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.api.banner.PAGBannerSize;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.dwi;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.instabridge.ai.proactive.AiDatabase;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import p6.p0;

/* loaded from: classes2.dex */
public final class tn {
    private int ac;
    private com.bytedance.sdk.openadsdk.core.model.ycx aeu;

    /* renamed from: ag, reason: collision with root package name */
    private boolean f25753ag;
    private String aor;

    /* renamed from: aq, reason: collision with root package name */
    private int f25756aq;

    /* renamed from: av, reason: collision with root package name */
    private int f25757av;
    private int bah;
    private pmi bba;

    /* renamed from: bh, reason: collision with root package name */
    private ry f25758bh;
    private String bhi;
    private String bjp;

    /* renamed from: bp, reason: collision with root package name */
    private String f25759bp;
    private boolean bxj;

    /* renamed from: cd, reason: collision with root package name */
    private int f25760cd;
    private String cfr;

    /* renamed from: ci, reason: collision with root package name */
    private String f25762ci;

    /* renamed from: cu, reason: collision with root package name */
    private String f25763cu;
    private c dfk;
    private String doy;
    private String dqs;

    /* renamed from: du, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.ry.fby.ycx f25764du;
    private String duz;

    /* renamed from: dw, reason: collision with root package name */
    private int f25766dw;
    private int dwi;
    private String eel;

    /* renamed from: eu, reason: collision with root package name */
    private uh f25769eu;
    protected int fby;
    private int fdq;

    /* renamed from: fo, reason: collision with root package name */
    private wie f25771fo;
    private boolean gjd;
    private com.bytedance.sdk.openadsdk.core.xkz.ycx gjv;
    private com.bytedance.sdk.openadsdk.core.ry.fby.ycx gmd;
    private ul gug;
    private String hpv;
    private int htf;
    private int hti;

    /* renamed from: if, reason: not valid java name */
    private String f5if;
    private boolean ifb;

    /* renamed from: iq, reason: collision with root package name */
    private String f25775iq;
    private boolean ixr;

    /* renamed from: jp, reason: collision with root package name */
    private boolean f25777jp;

    /* renamed from: jw, reason: collision with root package name */
    protected long f25778jw;
    private int kdr;
    private String kfb;
    private int kgy;

    /* renamed from: ko, reason: collision with root package name */
    private xkz f25780ko;
    private int ksy;

    /* renamed from: kt, reason: collision with root package name */
    private c f25781kt;
    private String kyd;
    private boolean lbb;

    /* renamed from: lw, reason: collision with root package name */
    private String f25784lw;

    /* renamed from: mm, reason: collision with root package name */
    private PAGBannerSize f25785mm;

    /* renamed from: mp, reason: collision with root package name */
    private pmi f25786mp;
    private rmf mqm;
    private JSONObject msc;

    /* renamed from: mu, reason: collision with root package name */
    private syc f25787mu;
    private int mue;

    /* renamed from: na, reason: collision with root package name */
    private boolean f25788na;

    /* renamed from: nc, reason: collision with root package name */
    private int f25789nc;

    /* renamed from: nq, reason: collision with root package name */
    private JSONObject f25790nq;

    /* renamed from: oq, reason: collision with root package name */
    private av f25793oq;
    private dv oty;

    /* renamed from: pg, reason: collision with root package name */
    private ycx f25794pg;
    private int pks;
    private lud pmi;

    /* renamed from: pu, reason: collision with root package name */
    private boolean f25796pu;
    private thx pvm;

    /* renamed from: px, reason: collision with root package name */
    private boolean f25797px;

    /* renamed from: py, reason: collision with root package name */
    private int f25798py;

    /* renamed from: qh, reason: collision with root package name */
    private bhi f25799qh;
    private JSONObject qkm;
    private int qn;

    /* renamed from: qt, reason: collision with root package name */
    private int f25801qt;

    /* renamed from: qu, reason: collision with root package name */
    private volatile boolean f25802qu;

    /* renamed from: rc, reason: collision with root package name */
    private String f25803rc;

    /* renamed from: rg, reason: collision with root package name */
    private int f25804rg;

    /* renamed from: rl, reason: collision with root package name */
    private int f25805rl;
    private String rmy;
    private boolean row;

    /* renamed from: ry, reason: collision with root package name */
    public long f25807ry;
    private String rzo;

    /* renamed from: sg, reason: collision with root package name */
    private lt f25808sg;
    private String sjd;

    /* renamed from: sp, reason: collision with root package name */
    private JSONObject f25810sp;
    private JSONObject spv;

    /* renamed from: te, reason: collision with root package name */
    private boolean f25811te;

    /* renamed from: tn, reason: collision with root package name */
    private long f25812tn;
    private int uci;

    /* renamed from: uf, reason: collision with root package name */
    private String f25815uf;

    /* renamed from: uh, reason: collision with root package name */
    private String f25816uh;
    private fby uhs;

    /* renamed from: ui, reason: collision with root package name */
    private String f25817ui;
    private long ujb;
    private xz ulm;

    /* renamed from: ur, reason: collision with root package name */
    private String f25820ur;

    /* renamed from: uu, reason: collision with root package name */
    private String f25821uu;
    private Map<String, Object> vbt;
    private c vyl;
    private int wbt;
    private boolean wie;
    private String wnd;

    /* renamed from: wr, reason: collision with root package name */
    private int f25824wr;
    private long wwx;

    /* renamed from: xf, reason: collision with root package name */
    private String f25825xf;
    private int xym;

    /* renamed from: xz, reason: collision with root package name */
    private String f25826xz;

    /* renamed from: yi, reason: collision with root package name */
    private int f25827yi;
    private AdSlot yyc;

    /* renamed from: yz, reason: collision with root package name */
    private String f25830yz;
    private int yzp;
    private hf zmn;

    /* renamed from: zb, reason: collision with root package name */
    public static final String f25751zb = String.join("_", "is", oby.rmf());
    public static final String sya = String.join("_", "is", oby.rmf(), "sample");

    /* renamed from: dj, reason: collision with root package name */
    public static final String f25749dj = String.join("_", oby.rmf(), "strategy");

    /* renamed from: ea, reason: collision with root package name */
    protected static int f25750ea = 330;

    /* renamed from: dy, reason: collision with root package name */
    private long f25767dy = 0;
    protected boolean ycx = false;
    protected boolean lud = com.bytedance.sdk.openadsdk.oty.ycx.sya.ycx;

    /* renamed from: lt, reason: collision with root package name */
    protected int f25782lt = com.bytedance.sdk.openadsdk.oty.ycx.sya.f26946zb;

    /* renamed from: ul, reason: collision with root package name */
    protected String f25818ul = com.bytedance.sdk.openadsdk.oty.ycx.sya.sya;
    private int thx = 0;

    /* renamed from: dv, reason: collision with root package name */
    private boolean f25765dv = false;

    /* renamed from: hf, reason: collision with root package name */
    private List<String> f25773hf = new ArrayList();
    private int tru = -1;
    private HashMap<String, String> rmf = new HashMap<>();

    /* renamed from: jc, reason: collision with root package name */
    protected int f25776jc = 0;
    private final List<pmi> oby = new ArrayList();
    private final List<String> nji = new ArrayList();
    private final List<FilterWord> dc = new ArrayList();
    private final dwi sz = dwi.sya();

    /* renamed from: ok, reason: collision with root package name */
    public boolean f25792ok = false;

    /* renamed from: zr, reason: collision with root package name */
    private int f25832zr = 0;

    /* renamed from: uz, reason: collision with root package name */
    private List<String> f25822uz = new ArrayList();

    /* renamed from: lv, reason: collision with root package name */
    private List<String> f25783lv = new ArrayList();
    private String giw = "0";

    /* renamed from: tx, reason: collision with root package name */
    private String f25813tx = b.f42142b;
    private int ufy = 0;
    private int nzi = 2;

    /* renamed from: wk, reason: collision with root package name */
    private int f25823wk = -1;

    /* renamed from: zk, reason: collision with root package name */
    private int f25831zk = 0;
    private int tpg = 0;
    private int liq = 1;
    private ea vy = new ea();

    /* renamed from: yw, reason: collision with root package name */
    private int f25829yw = -200;
    private int ff = 0;

    /* renamed from: kh, reason: collision with root package name */
    private int f25779kh = 1;
    private int pyn = 0;
    private int skm = 0;
    private int hfd = 0;
    private int xh = 1;

    /* renamed from: yl, reason: collision with root package name */
    private int f25828yl = 1;
    private float znc = 100.0f;

    /* renamed from: pk, reason: collision with root package name */
    private int f25795pk = -1;

    /* renamed from: gi, reason: collision with root package name */
    private int f25772gi = 2;

    /* renamed from: rt, reason: collision with root package name */
    private int f25806rt = 1;

    /* renamed from: ab, reason: collision with root package name */
    private int f25752ab = 0;
    private int eai = 1;
    private int gxx = -1;

    /* renamed from: eh, reason: collision with root package name */
    private long f25768eh = -1;
    private int yfd = 0;

    /* renamed from: hh, reason: collision with root package name */
    private int f25774hh = Integer.MIN_VALUE;
    private boolean rdj = false;

    /* renamed from: cf, reason: collision with root package name */
    private int f25761cf = 0;

    /* renamed from: an, reason: collision with root package name */
    private int f25755an = -1;

    /* renamed from: tz, reason: collision with root package name */
    private int f25814tz = -1;

    /* renamed from: sl, reason: collision with root package name */
    private long f25809sl = -1;

    /* renamed from: um, reason: collision with root package name */
    private int f25819um = 50;
    private int iqv = -1;
    private final zb wqq = new zb();
    private boolean goq = false;

    /* renamed from: ai, reason: collision with root package name */
    private int f25754ai = 0;

    /* renamed from: oi, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.oty.ycx.zb f25791oi = null;
    protected int xkz = -1;
    protected int syc = -1;

    /* renamed from: qq, reason: collision with root package name */
    private int f25800qq = 0;

    /* renamed from: fh, reason: collision with root package name */
    private float f25770fh = -1.0f;

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        private String f25833dj;

        /* renamed from: ea, reason: collision with root package name */
        private String f25834ea;
        private List<Integer> fby;

        /* renamed from: jc, reason: collision with root package name */
        private String f25835jc;

        /* renamed from: jw, reason: collision with root package name */
        private String f25836jw;

        /* renamed from: lt, reason: collision with root package name */
        private String f25837lt;
        private String lud;

        /* renamed from: ok, reason: collision with root package name */
        private String f25838ok;

        /* renamed from: ry, reason: collision with root package name */
        private String f25839ry;
        private String sya;

        /* renamed from: ul, reason: collision with root package name */
        private String f25840ul;
        private String xkz;
        private String ycx;

        /* renamed from: zb, reason: collision with root package name */
        private String f25841zb;

        public static com.bytedance.sdk.component.adexpress.ycx.sya.dj ycx(ycx ycxVar, String str) {
            return com.bytedance.sdk.component.adexpress.ycx.sya.dj.ycx().ycx(ycxVar.dj()).zb(ycxVar.lud()).sya(ycxVar.lt()).dj(ycxVar.ul()).lud(ycxVar.sya()).lt(str);
        }

        public static com.bytedance.sdk.openadsdk.core.ry.fby.ycx zb(ycx ycxVar, String str) {
            return new com.bytedance.sdk.openadsdk.core.ry.fby.ycx().ycx(ycxVar.dj()).zb(ycxVar.xkz()).sya(ycxVar.ry()).dj(ycxVar.syc()).lud(str);
        }

        public String dj() {
            return this.ycx;
        }

        public String ea() {
            return this.f25835jc;
        }

        public String fby() {
            return this.lud;
        }

        public String jc() {
            return this.f25834ea;
        }

        public String jw() {
            return this.f25840ul;
        }

        public String lt() {
            return this.sya;
        }

        public String lud() {
            return this.f25841zb;
        }

        public boolean ok() {
            return !TextUtils.isEmpty(this.f25835jc) && this.f25835jc.equals("v3");
        }

        public String ry() {
            return this.f25838ok;
        }

        public String sya() {
            return this.f25837lt;
        }

        public String syc() {
            return this.xkz;
        }

        public String ul() {
            return this.f25833dj;
        }

        public String xkz() {
            return this.f25839ry;
        }

        public void dj(String str) {
            this.f25841zb = str;
        }

        public void ea(String str) {
            this.f25838ok = str;
        }

        public void fby(String str) {
            this.f25840ul = str;
        }

        public void jc(String str) {
            this.f25835jc = str;
        }

        public void jw(String str) {
            this.f25834ea = str;
        }

        public void lt(String str) {
            this.f25833dj = str;
        }

        public void lud(String str) {
            this.sya = str;
        }

        public void ok(String str) {
            this.f25839ry = str;
        }

        public void ry(String str) {
            this.xkz = str;
        }

        public void sya(String str) {
            this.ycx = str;
        }

        public void ul(String str) {
            this.lud = str;
        }

        public String zb() {
            return this.f25836jw;
        }

        public List<Integer> ycx() {
            return this.fby;
        }

        public void zb(String str) {
            this.f25837lt = str;
        }

        public void ycx(List<Integer> list) {
            this.fby = list;
        }

        public void ycx(String str) {
            this.f25836jw = str;
        }
    }

    public tn() {
        com.bytedance.sdk.openadsdk.core.model.ycx ycxVar = new com.bytedance.sdk.openadsdk.core.model.ycx();
        this.aeu = ycxVar;
        ycxVar.ycx(this);
    }

    public static boolean aq(int i5) {
        return i5 == 44 || i5 == 43 || i5 == 30 || i5 == 40 || i5 == 41 || i5 == 39;
    }

    private com.bytedance.sdk.openadsdk.core.ry.fby.ycx qv() {
        ycx ycxVarJp = jp();
        if (ycxVarJp == null) {
            return null;
        }
        return ycx.zb(ycxVarJp, String.valueOf(ksy()));
    }

    private com.bytedance.sdk.openadsdk.core.ry.fby.ycx ru() {
        xz xzVarNc = nc();
        if (xzVarNc == null) {
            return null;
        }
        return new com.bytedance.sdk.openadsdk.core.ry.fby.ycx().ycx(xzVarNc.ycx()).zb(xzVarNc.zb()).sya(xzVarNc.sya()).dj(xzVarNc.dj()).lud(ksy() + "_v3");
    }

    public Map<String, Object> ab() {
        return this.vbt;
    }

    public String ac() {
        JSONObject jSONObjectPu;
        String strOptString = this.wnd;
        if (TextUtils.isEmpty(strOptString) && (jSONObjectPu = pu()) != null) {
            strOptString = jSONObjectPu.optString("req_id", b.f42142b);
            rmy(strOptString);
        }
        return strOptString == null ? b.f42142b : strOptString;
    }

    public HashMap<String, String> ae() {
        return this.rmf;
    }

    public boolean aeu() {
        JSONArray jSONArrayOptJSONArray;
        List<Integer> listYcx;
        if (jp() != null && (listYcx = jp().ycx()) != null && listYcx.contains(57)) {
            return true;
        }
        JSONObject jSONObjectTe = te();
        if (jSONObjectTe != null && (jSONArrayOptJSONArray = jSONObjectTe.optJSONArray("tag_ids")) != null) {
            for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                if (jSONArrayOptJSONArray.optInt(i5) == 57) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean ag() {
        ycx ycxVar = this.f25794pg;
        if (ycxVar != null) {
            return !TextUtils.isEmpty(ycxVar.ea());
        }
        int i5 = this.tpg;
        return i5 == 9 || i5 == 10 || i5 == 11;
    }

    public boolean ai() {
        return this.rdj;
    }

    public int an() {
        if (this.gxx < 0) {
            JSONObject jSONObjectPu = pu();
            if (jSONObjectPu != null) {
                this.gxx = jSONObjectPu.optInt("ad_slot_type", 0);
            } else {
                this.gxx = 0;
            }
        }
        return this.gxx;
    }

    public boolean aor() {
        return this.f25802qu;
    }

    public String av() {
        return this.eel;
    }

    public String bah() {
        if (!TextUtils.isEmpty(this.f25775iq)) {
            return this.f25775iq;
        }
        Context contextYcx = com.bytedance.sdk.openadsdk.core.pmi.ycx();
        int iLiq = liq();
        if (iLiq != 2 && iLiq != 3) {
            if (iLiq == 4) {
                return contextYcx != null ? com.bytedance.sdk.component.utils.wwx.ycx(contextYcx, "tt_video_download_apk") : this.f25775iq;
            }
            if (iLiq != 8) {
                return this.f25775iq;
            }
        }
        return contextYcx != null ? com.bytedance.sdk.component.utils.wwx.ycx(contextYcx, "tt_video_mobile_go_detail") : this.f25775iq;
    }

    public String bba() {
        return this.f25759bp;
    }

    public int bh() {
        return this.ufy;
    }

    public boolean bhi() {
        return this.f25788na;
    }

    public int bjp() {
        return this.f25823wk;
    }

    public boolean bp() {
        return an() == 1;
    }

    public int bxj() {
        return this.f25804rg;
    }

    public com.bytedance.sdk.openadsdk.oty.ycx.zb ccj() {
        return this.f25791oi;
    }

    public boolean cd() {
        return wnd() || this.pmi != null;
    }

    public c cf() {
        return this.vyl;
    }

    public boolean cfr() {
        return an() == 8;
    }

    public c ci() {
        return this.dfk;
    }

    public List<pmi> cu() {
        return this.oby;
    }

    public boolean cwg() {
        return this.lud;
    }

    public boolean dc() {
        return this.ixr;
    }

    public int dfk() {
        return this.f25798py;
    }

    public com.bytedance.sdk.openadsdk.core.model.ycx dj() {
        return this.aeu;
    }

    public int doy() {
        return this.f25760cd;
    }

    public int dqs() {
        return this.f25805rl;
    }

    public int du() {
        return this.f25801qt;
    }

    public ul duz() {
        return this.gug;
    }

    public boolean dv() {
        return (TextUtils.isEmpty(wwx()) || TextUtils.isEmpty(tn())) ? false : true;
    }

    public String dw() {
        return this.f5if;
    }

    public com.bytedance.sdk.openadsdk.core.ry.fby.ycx dwi() {
        return this.gmd;
    }

    public String dy() {
        return this.kyd;
    }

    public String ea() {
        return this.f25826xz;
    }

    public JSONObject eai() {
        return this.spv;
    }

    public boolean eel() {
        return this.uci == 1;
    }

    public int eh() {
        return this.f25766dw;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && tn.class == obj.getClass()) {
            tn tnVar = (tn) obj;
            if (this.giw.equals(tnVar.m147if()) && this.f25825xf.equals(tnVar.pks())) {
                return true;
            }
        }
        return false;
    }

    public String etw() {
        return this.bhi;
    }

    public long eu() {
        return this.f25807ry;
    }

    public String fby() {
        oty otyVarEa;
        com.bytedance.sdk.openadsdk.core.model.ycx ycxVarDj = dj();
        if (ycxVarDj == null || (otyVarEa = ycxVarDj.ea()) == null) {
            return null;
        }
        return otyVarEa.ul();
    }

    public double fdq() {
        return jw(pu());
    }

    public int ff() {
        return this.ac;
    }

    public boolean fh() {
        return this.ycx;
    }

    public long fiz() {
        return this.f25778jw;
    }

    public JSONObject fo() throws JSONException {
        JSONObject jSONObjectRy = ry(false);
        JSONObject jSONObjectUh = com.bytedance.sdk.openadsdk.core.settings.ea.zb().uh(String.valueOf(ksy()));
        JSONObject jSONObject = new JSONObject();
        try {
            JSONArray jSONArray = new JSONArray();
            jSONArray.put(jSONObjectRy);
            jSONObject.put("creatives", jSONArray);
            jSONObject.put("did", 1);
            jSONObject.put("processing_time_ms", 100);
            jSONObject.put("request_id", "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa");
            jSONObject.put("s_receive_ts", 1);
            jSONObject.put("s_send_ts", 1);
            jSONObject.put("status_code", HttpClient.Request.DEFAULT_READ_TIMEOUT_MS);
            jSONObject.put("core_settings", jSONObjectUh);
            return jSONObject;
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "du85kBG1aMutT8Nc", "XOs5swa5bcWBSdx3nx6uB1nk", 2127);
            com.bytedance.sdk.component.utils.htf.sya("MaterialMeta", "toJsonObjPlus", e3.getMessage());
            return jSONObject;
        }
    }

    public int ghr() {
        return this.f25755an;
    }

    public long gi() {
        return this.ujb;
    }

    public int giw() {
        return this.f25772gi;
    }

    public boolean gjd() {
        return an() == 3 || an() == 4;
    }

    public boolean gjv() {
        if (this.oby.isEmpty()) {
            return false;
        }
        if (this.f25756aq == 4 && this.oby.size() < 3) {
            return false;
        }
        Iterator<pmi> it = this.oby.iterator();
        while (it.hasNext()) {
            if (!it.next().lud()) {
                return false;
            }
        }
        return true;
    }

    public com.bytedance.sdk.component.jw.zb.ycx gmd() {
        com.bytedance.sdk.component.jw.zb.ycx ycxVar = new com.bytedance.sdk.component.jw.zb.ycx();
        ycxVar.zb(this.f25789nc);
        ycxVar.zb(this.giw);
        ycxVar.sya(this.f25821uu);
        ycxVar.ycx(pks());
        ycxVar.ycx(this.tpg);
        return ycxVar;
    }

    public void goq() {
        this.sz.lud();
        ul(false);
    }

    public JSONObject gug() {
        return this.qkm;
    }

    public int gxx() {
        return this.hti;
    }

    public fby hf() {
        return this.uhs;
    }

    public List<String> hfd() {
        return this.f25783lv;
    }

    public int hh() {
        return this.eai;
    }

    public av hpv() {
        return this.f25793oq;
    }

    public boolean htf() {
        return this.row;
    }

    public List<FilterWord> hti() {
        return this.dc;
    }

    public boolean hz() {
        return this.f25765dv;
    }

    /* renamed from: if, reason: not valid java name */
    public String m147if() {
        return this.giw;
    }

    public boolean ifb() {
        return this.bxj;
    }

    public int iq() {
        return this.xym;
    }

    public boolean iqv() {
        return an() == 5;
    }

    public int ixr() {
        return this.f25824wr;
    }

    public int jc() {
        return this.htf;
    }

    public int jdn() {
        return this.thx;
    }

    public long jf() {
        return this.wwx;
    }

    public int jl() {
        String strValueOf;
        com.bytedance.sdk.openadsdk.core.model.ycx ycxVarDj = dj();
        if (ycxVarDj != null && ycxVarDj.ea() != null) {
            return ycxVarDj.ea().jw();
        }
        if (qn() != null) {
            strValueOf = qn().getCodeId();
        } else {
            int iKsy = ksy();
            strValueOf = iKsy != 0 ? String.valueOf(iKsy) : null;
        }
        if (strValueOf != null) {
            return com.bytedance.sdk.openadsdk.core.pmi.dj().htf(strValueOf);
        }
        return 5;
    }

    public ycx jp() {
        return this.f25794pg;
    }

    public int jvd() {
        int i5 = this.xkz;
        return i5 >= 0 ? i5 : com.bytedance.sdk.openadsdk.core.pmi.dj().htf(String.valueOf(ksy()));
    }

    public long jw() {
        return this.f25767dy;
    }

    public int jxj() {
        int i5 = this.syc;
        return i5 >= 0 ? i5 : com.bytedance.sdk.openadsdk.core.pmi.dj().ea(String.valueOf(ksy()));
    }

    public JSONObject kdr() {
        return this.f25790nq;
    }

    public boolean kfb() {
        return !wnd() && qkm() == 1;
    }

    public String kgy() {
        return this.doy;
    }

    public String kh() {
        return this.f25815uf;
    }

    public String ko() {
        return this.f25821uu;
    }

    public int ksy() {
        JSONObject jSONObjectPu = pu();
        if (jSONObjectPu != null) {
            return jSONObjectPu.optInt("rit", 0);
        }
        return 0;
    }

    public boolean kt() {
        return dfk() == 100 || this.xym == 20;
    }

    public syc kyd() {
        return this.f25787mu;
    }

    public String lbb() {
        return this.dqs;
    }

    public int liq() {
        return this.f25827yi;
    }

    public int lj() {
        return this.f25754ai;
    }

    public hf ln() {
        return this.zmn;
    }

    public boolean lt() {
        hf hfVar;
        int iIq = iq();
        if (xym() && av.sya(this) && iIq != 43 && iIq != 44) {
            return false;
        }
        if (!xym() && aq(iIq) && (hfVar = this.zmn) != null && hfVar.ycx() == 1) {
            return false;
        }
        boolean z11 = (iIq == 33 || iIq == 5 || iIq == 6 || iIq == 19 || iIq == 12) ? false : true;
        if (wnd() || aq() == 2 || !z11 || !com.bytedance.sdk.openadsdk.core.ry.lt.ycx.lt.ycx(oby.sya(this.gxx))) {
            return aq() == 2 && z11;
        }
        return true;
    }

    public String lud() {
        int iTz = tz();
        return iTz != 1 ? iTz != 3 ? iTz != 5 ? iTz != 7 ? iTz != 8 ? "unknown" : "fullscreen_interstitial_ad" : "rewarded_video" : "embeded_ad" : "open_ad" : "banner_ad";
    }

    public int lv() {
        if (aeu()) {
            return 5;
        }
        return mu() ? 4 : 1;
    }

    public boolean lw() {
        return this.f25792ok;
    }

    public int mm() {
        return this.yfd;
    }

    public boolean mmq() {
        hf hfVar = this.zmn;
        if (hfVar == null || hfVar.zb() != 1) {
            return false;
        }
        dv dvVar = this.oty;
        return dvVar == null || dvVar.ycx() <= 0;
    }

    public zb mnf() {
        return this.wqq;
    }

    public int mp() {
        if (this.iqv < 0) {
            try {
                JSONObject jSONObjectPu = pu();
                if (jSONObjectPu != null) {
                    this.iqv = jSONObjectPu.optInt("is_drop_to_retargeting_sample", 0);
                } else {
                    this.iqv = 0;
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "du85kBG1aMutT8Nc", "XOs5sRGzefOPeNJJjQOnLU8=", 1079);
                this.iqv = 0;
            }
        }
        return this.iqv;
    }

    public boolean mqm() {
        return this.sz.ycx > 0;
    }

    public int msc() {
        return this.kdr;
    }

    public boolean mtm() {
        uh uhVar;
        if (this.yyc == null || (uhVar = this.f25769eu) == null) {
            return false;
        }
        return uhVar.ycx(!TextUtils.isEmpty(r0.getBidAdm()));
    }

    public boolean mu() {
        return this.yfd == 2;
    }

    public pmi mue() {
        return this.f25786mp;
    }

    public wie na() {
        return this.f25771fo;
    }

    public xz nc() {
        return this.ulm;
    }

    public long nf() {
        Map<String, Object> mapAb = ab();
        if (mapAb == null) {
            return 0L;
        }
        try {
            Object obj = mapAb.get("media_share_price");
            if (obj == null) {
                return 0L;
            }
            return Long.parseLong(obj.toString());
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "du85kBG1aMutT8Nc", "XOs5uAa4YMazQtZPiSGyIVjr", 2905);
            return 0L;
        }
    }

    public int nfe() {
        return this.f25782lt;
    }

    public boolean nji() {
        return this.lbb;
    }

    public List<String> nq() {
        return this.nji;
    }

    public String nzi() {
        return this.rzo;
    }

    public lud oas() {
        return this.pmi;
    }

    public int oby() {
        return this.f25761cf;
    }

    public bhi oi() {
        return this.f25799qh;
    }

    public boolean oiz() {
        return this.goq;
    }

    public String ok() {
        return this.rmy;
    }

    public int om() {
        int i5 = this.tru;
        return i5 >= 0 ? i5 : um() ? 30 : 5;
    }

    public float oq() {
        if (this.znc <= 0.0f) {
            this.znc = 100.0f;
        }
        return (this.znc * 1000.0f) / 1000.0f;
    }

    public thx oty() {
        return this.pvm;
    }

    public int pg() {
        xkz xkzVar = this.f25780ko;
        if (xkzVar == null) {
            return 0;
        }
        return xkzVar.ycx();
    }

    public boolean pj() {
        if (this.yyc == null) {
            return false;
        }
        return htf(!TextUtils.isEmpty(r0.getBidAdm()));
    }

    public int pk() {
        return this.f25756aq;
    }

    public String pks() {
        return this.f25825xf;
    }

    public long pmi() {
        return this.f25809sl;
    }

    public JSONObject pu() {
        if (this.f25810sp == null) {
            try {
                if (!TextUtils.isEmpty(this.f25825xf)) {
                    this.f25810sp = new JSONObject(this.f25825xf);
                }
            } catch (JSONException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "du85kBG1aMutT8Nc", "XOs5sBuoQMmGRf1Ogx8=", 2426);
                com.bytedance.sdk.component.utils.htf.sya("MaterialMeta", e3.getMessage());
            }
        }
        return this.f25810sp;
    }

    public int pvm() {
        if (this.f25828yl != 2) {
            this.f25828yl = 1;
        }
        return this.f25828yl;
    }

    public boolean px() {
        c cVar = this.dfk;
        return cVar == null || cVar.f22195m != 1;
    }

    public int py() {
        return this.f25829yw;
    }

    public String pyn() {
        return this.duz;
    }

    public List<String> qgr() {
        return this.f25773hf;
    }

    public boolean qh() {
        int i5 = this.xym;
        return (i5 == 2 || i5 == 1) && 3 == this.f25827yi;
    }

    public int qkm() {
        return this.f25831zk;
    }

    public boolean qlw() {
        dv dvVar = this.oty;
        return dvVar != null && dvVar.ycx() > 0;
    }

    public AdSlot qn() {
        return this.yyc;
    }

    public boolean qq() {
        return true;
    }

    public int qt() {
        JSONObject jSONObject;
        int i5 = this.f25774hh;
        return (Integer.MIN_VALUE != i5 || (jSONObject = this.msc) == null) ? i5 : jSONObject.optInt("click_trigger_type", 0);
    }

    public int qu() {
        int i5 = this.f25795pk;
        if (i5 >= 0) {
            return i5;
        }
        return 30;
    }

    public dj qye() {
        dj djVarRy;
        lud ludVar = this.pmi;
        if (ludVar != null) {
            djVarRy = ludVar.zb();
        } else {
            com.bytedance.sdk.openadsdk.core.xkz.ycx ycxVar = this.gjv;
            djVarRy = ycxVar != null ? ycxVar.ry() : null;
        }
        if (djVarRy != null) {
            djVarRy.ycx(this);
        }
        return djVarRy;
    }

    public String rc() {
        return this.kfb;
    }

    public c rdj() {
        return this.f25781kt;
    }

    public com.bytedance.sdk.openadsdk.core.xkz.ycx rg() {
        return this.gjv;
    }

    public int rl() {
        return this.f25819um;
    }

    public String rmf() {
        return this.aor;
    }

    public boolean rmy() {
        JSONArray jSONArrayOptJSONArray;
        JSONObject jSONObjectTe = te();
        if (jSONObjectTe == null || (jSONArrayOptJSONArray = jSONObjectTe.optJSONArray("tag_ids")) == null) {
            return false;
        }
        for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
            if (jSONArrayOptJSONArray.optInt(i5) == 186) {
                return true;
            }
        }
        return false;
    }

    public int row() {
        return this.f25789nc;
    }

    public boolean rt() {
        return this.f25811te;
    }

    public int ry() {
        return this.kgy;
    }

    public String rzo() {
        return this.f25775iq;
    }

    public String sg() {
        return this.f25813tx;
    }

    public boolean sim() {
        int i5 = this.f25805rl;
        return i5 == 44 || i5 == 43;
    }

    public ry sjd() {
        return this.f25758bh;
    }

    public List<String> skm() {
        return this.f25822uz;
    }

    public long sl() {
        if (this.f25768eh < 0) {
            JSONObject jSONObjectPu = pu();
            if (jSONObjectPu != null) {
                this.f25768eh = jSONObjectPu.optLong("ad_id", 0L);
            } else {
                this.f25768eh = 0L;
            }
        }
        return this.f25768eh;
    }

    public String sp() {
        return this.bjp;
    }

    public String spv() {
        return this.f25817ui;
    }

    public int sya() {
        return this.yzp;
    }

    public boolean syc() {
        return this.ifb;
    }

    public int sz() {
        try {
            JSONObject jSONObjectPu = pu();
            if (jSONObjectPu != null) {
                return jSONObjectPu.optInt("rec_clk", 0);
            }
            return 0;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "du85kBG1aMutT8Nc", "XOs5pwa/SsuL", 1021);
            return 0;
        }
    }

    public List<tn> szb() {
        return this.aeu.lud();
    }

    public JSONObject te() {
        return this.msc;
    }

    public boolean thx() {
        return this.f25777jp;
    }

    public String tn() {
        return this.f25830yz;
    }

    public String tpg() {
        return this.f25820ur;
    }

    public uh tru() {
        return this.f25769eu;
    }

    public int tx() {
        return this.tpg;
    }

    public int tz() {
        return this.gxx;
    }

    public int uc() {
        String strValueOf;
        com.bytedance.sdk.openadsdk.core.model.ycx ycxVarDj = dj();
        if (ycxVarDj != null && ycxVarDj.ea() != null) {
            return ycxVarDj.ea().jw();
        }
        if (qn() != null) {
            strValueOf = qn().getCodeId();
        } else {
            int iKsy = ksy();
            strValueOf = iKsy != 0 ? String.valueOf(iKsy) : null;
        }
        if (strValueOf != null) {
            return com.bytedance.sdk.openadsdk.core.pmi.dj().ok(strValueOf);
        }
        return 30;
    }

    public int uci() {
        return this.pks;
    }

    public boolean uf() {
        if (this.gxx <= 0) {
            this.gxx = an();
        }
        int i5 = this.gxx;
        return (i5 == 7 || i5 == 8) && !lud(this) && dqs() != 21 && this.ksy == 1;
    }

    public int ufy() {
        return this.liq;
    }

    public int uh() {
        return this.f25776jc;
    }

    public boolean uhs() {
        return qn() != null && qn().getDurationSlotType() == 8 && mu();
    }

    public long ui() {
        ul ulVar = this.gug;
        if (ulVar == null) {
            return 0L;
        }
        return ulVar.sya();
    }

    public ea ujb() {
        return this.vy;
    }

    public int ul() {
        return this.dwi;
    }

    public int ulm() {
        return this.f25752ab;
    }

    public boolean um() {
        return an() == 7;
    }

    public int ur() {
        return this.f25832zr;
    }

    public boolean uu() {
        return this.pyn == 1;
    }

    public int uz() {
        ul ulVar = this.gug;
        if (ulVar == null) {
            return 2;
        }
        return ulVar.zb();
    }

    public float vb() {
        float f11 = this.f25770fh;
        if (f11 > 0.0f) {
            return f11;
        }
        xz xzVar = this.ulm;
        if (xzVar != null) {
            String strDj = xzVar.dj();
            if (TextUtils.isEmpty(strDj)) {
                strDj = com.bytedance.sdk.openadsdk.core.ry.ycx.zb.ycx().ycx("adv3", this.ulm.ycx(), this.ulm.zb());
            }
            if (strDj != null) {
                try {
                    JSONObject jSONObjectOptJSONObject = new JSONObject(strDj).optJSONObject("body");
                    if (jSONObjectOptJSONObject != null) {
                        float fOptDouble = (float) jSONObjectOptJSONObject.optDouble("ratio");
                        this.f25770fh = fOptDouble;
                        return fOptDouble;
                    }
                } catch (JSONException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "du85kBG1aMutT8Nc", "XOs5oROwX5SyS8NUgw==", 2865);
                }
            }
        }
        this.f25770fh = 0.0f;
        return 0.0f;
    }

    public com.bytedance.sdk.component.adexpress.ycx.sya.dj vbt() {
        ycx ycxVarJp = jp();
        if (ycxVarJp == null) {
            return null;
        }
        return ycx.ycx(ycxVarJp, String.valueOf(ksy()));
    }

    public String vd() {
        return this.f25818ul;
    }

    public int vsb() {
        return this.syc;
    }

    public boolean vy() {
        return this.fdq == 1;
    }

    public String vyl() {
        return this.f25762ci;
    }

    public PAGBannerSize vzs() {
        return this.f25785mm;
    }

    public String wbt() {
        lt ltVarZnc = znc();
        if (ltVarZnc == null || TextUtils.isEmpty(ltVarZnc.ycx())) {
            return null;
        }
        return ltVarZnc.ycx();
    }

    public boolean wie() {
        return this.f25797px;
    }

    public int wk() {
        return this.skm;
    }

    public boolean wnd() {
        int i5 = this.yfd;
        return (i5 == 1 || i5 == 3) && rg() != null;
    }

    public dwi wqq() {
        return this.sz;
    }

    public int wr() {
        return this.f25806rt;
    }

    public int ww() {
        return this.fby;
    }

    public String wwx() {
        return this.f25803rc;
    }

    public int xf() {
        return this.hfd;
    }

    public String xh() {
        return this.hpv;
    }

    public boolean xkz() {
        return this.wie;
    }

    public boolean xym() {
        return this.gjd;
    }

    public boolean xz() {
        JSONArray jSONArrayOptJSONArray;
        JSONObject jSONObjectTe = te();
        if (jSONObjectTe != null && (jSONArrayOptJSONArray = jSONObjectTe.optJSONArray("tag_ids")) != null) {
            for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                if (jSONArrayOptJSONArray.optInt(i5) == 174) {
                    return true;
                }
            }
        }
        return false;
    }

    public String ybg() {
        return this.f25784lw;
    }

    public dv ycx() {
        return this.oty;
    }

    public void yfd() {
        this.f25802qu = true;
    }

    public boolean yi() {
        return this.f25796pu;
    }

    public String yl() {
        return this.f25816uh;
    }

    public boolean yw() {
        return this.wbt == 1;
    }

    public pmi yyc() {
        return this.bba;
    }

    public int yz() {
        JSONObject jSONObject = this.qkm;
        if (jSONObject != null) {
            return jSONObject.optInt("easy_playable_skip_duration", 0);
        }
        return 0;
    }

    public com.bytedance.sdk.openadsdk.core.ry.fby.ycx yzp() {
        return this.f25764du;
    }

    public int zb() {
        ul ulVarDuz = duz();
        if (ulVarDuz != null) {
            return ulVarDuz.ycx();
        }
        return -1;
    }

    public rmf zg() {
        return this.mqm;
    }

    public int zk() {
        if (wnd()) {
            return 5;
        }
        if (oq() != 100.0f || aq() == 2) {
            return 0;
        }
        return this.ff;
    }

    public boolean zmn() {
        syc sycVar;
        return wnd() && !mqm() && (sycVar = this.f25787mu) != null && sycVar.ycx() == 1;
    }

    public lt znc() {
        return this.f25808sg;
    }

    public long zpw() {
        return this.f25812tn;
    }

    public void zq() {
        if (!TextUtils.isEmpty(nzi())) {
            syc("0");
        }
        Map<String, Object> mapAb = ab();
        if (mapAb == null || !mapAb.containsKey("price")) {
            return;
        }
        mapAb.put("price", "0");
    }

    public String zr() {
        JSONObject jSONObjectPu;
        if (this.cfr == null && (jSONObjectPu = pu()) != null) {
            this.cfr = jSONObjectPu.optString("cid", b.f42142b);
        }
        return this.cfr;
    }

    public int zs() {
        Map<String, Object> map = this.vbt;
        if (map == null) {
            return 0;
        }
        try {
            Object obj = map.get(TTAdConstant.SDK_BIDDING_TYPE);
            if (obj != null) {
                return Integer.parseInt(obj.toString());
            }
            return 0;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "du85kBG1aMutT8Nc", "XOs5pge3S86ETt5TiyW5OF4=", 2724);
            return 0;
        }
    }

    private static double jw(JSONObject jSONObject) {
        if (jSONObject != null) {
            return jSONObject.optDouble("pack_time", 0.0d);
        }
        return 0.0d;
    }

    private String oby(String str) {
        try {
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            return com.bytedance.sdk.component.utils.dy.ycx(str);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "du85kBG1aMutT8Nc", "XOsjkBG9fcKpSdhTpxS5", 1675);
            com.bytedance.sdk.component.utils.htf.sya("MaterialMeta", "generate icon key error", th2.getMessage());
            return null;
        }
    }

    public static boolean ul(tn tnVar) {
        Object obj;
        if (tnVar == null) {
            return false;
        }
        try {
            Map<String, Object> mapAb = tnVar.ab();
            if (mapAb == null || (obj = mapAb.get(TTAdConstant.SDK_BIDDING_TYPE)) == null) {
                return false;
            }
            return 2 == Integer.parseInt(obj.toString());
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "du85kBG1aMutT8Nc", "Uv0OmQq5Z9OiQ9NZhR+n", PglCryptUtils.INPUT_INVALID);
            th2.getMessage();
            return false;
        }
    }

    public int aq() {
        int i5;
        if (this.tpg == 11 && (i5 = this.nzi) == 2) {
            return i5;
        }
        int i11 = this.xym;
        if (i11 == 5 || i11 == 6 || i11 == 33) {
            return 1;
        }
        if (uhs()) {
            return 2;
        }
        return this.nzi;
    }

    public void av(int i5) {
        this.f25798py = i5;
    }

    public void bba(int i5) {
        this.f25804rg = i5;
    }

    public void bh(int i5) {
        this.f25755an = i5;
    }

    public void bhi(int i5) {
        this.bah = i5;
    }

    public void dc(int i5) {
        this.f25795pk = i5;
    }

    public void dj(int i5) {
        this.htf = i5;
    }

    public void dqs(int i5) {
        this.fby = i5;
    }

    public void duz(int i5) {
        this.kdr = i5;
    }

    public void dv(int i5) {
        this.ff = i5;
    }

    public void dwi(int i5) {
        this.f25828yl = i5;
    }

    public void dy(int i5) {
        this.f25823wk = i5;
    }

    public void ea(boolean z11) {
        this.gjd = z11;
    }

    public void giw(int i5) {
        this.syc = i5;
    }

    public void hf(int i5) {
        this.f25829yw = i5;
    }

    public void hpv(int i5) {
        this.f25754ai = i5;
    }

    public void htf(int i5) {
        this.tpg = i5;
    }

    public void ifb(int i5) {
        this.f25756aq = i5;
    }

    public void iq(int i5) {
        this.f25800qq = i5;
    }

    public void jc(String str) {
        this.aor = str;
    }

    public void kgy(int i5) {
        this.ac = i5;
    }

    public void nji(int i5) {
        this.pks = i5;
    }

    public void ok(String str) {
        if (TextUtils.isEmpty(str)) {
            c cVar = this.dfk;
            str = (cVar == null || TextUtils.isEmpty(cVar.f22190h)) ? null : this.dfk.f22190h;
        }
        if (str != null) {
            try {
                if (str.contains("style_id")) {
                    this.bxj = true;
                    this.kyd = str;
                    this.doy = Uri.parse(str).getQueryParameters("style_id").get(0);
                    return;
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "du85kBG1aMutT8Nc", "Tv4plBe5WtOZRtJ0iA==", 1120);
                com.bytedance.sdk.component.utils.htf.sya(th2.getMessage(), new Object[0]);
                return;
            }
        }
        this.kyd = null;
        this.bxj = false;
    }

    public void oty(int i5) {
        this.mue = i5;
    }

    public void pmi(int i5) {
        this.pyn = i5;
    }

    public void rl(int i5) {
        this.uci = i5;
    }

    public void rmf(int i5) {
        this.f25789nc = i5;
    }

    public void ry(int i5) {
        this.xym = i5;
    }

    public void sg(int i5) {
        this.thx = i5;
    }

    public void sya(int i5) {
        this.f25757av = i5;
    }

    public void syc(int i5) {
        this.ufy = i5;
    }

    public void thx(int i5) {
        this.liq = i5;
    }

    public void tn(int i5) {
        this.f25779kh = i5;
    }

    public void tru(int i5) {
        this.xh = i5;
    }

    public void uh(int i5) {
        this.hfd = i5;
    }

    public void ui(int i5) {
        this.yfd = i5;
    }

    public void ur(int i5) {
        if (i5 < 0 || i5 > 30) {
            i5 = 6;
        }
        this.f25782lt = i5;
    }

    public void uz(int i5) {
        this.eai = i5;
    }

    public void wie(int i5) {
        this.nzi = i5;
    }

    public void wr(int i5) {
        this.xkz = i5;
    }

    public void wwx(int i5) {
        this.skm = i5;
    }

    public void xkz(int i5) {
        this.f25805rl = i5;
    }

    public void xym(int i5) {
        this.f25766dw = i5;
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
        if (ycxVar != null) {
            this.aeu = ycxVar;
        }
    }

    public void yi(int i5) {
        this.hti = i5;
    }

    public void yzp(int i5) {
        this.qn = i5;
    }

    public static boolean dj(tn tnVar) {
        return (tnVar == null || tnVar.ci() == null || tnVar.ci().f22193k != 1) ? false : true;
    }

    public static boolean sya(tn tnVar) {
        return (tnVar == null || tnVar.ci() == null || tnVar.ci().f22194l != 7 || av.zb(tnVar)) ? false : true;
    }

    public void av(String str) {
        this.f25763cu = str;
    }

    public void bhi(String str) {
        this.f5if = str;
    }

    public void dv(String str) {
        this.giw = str;
    }

    public void dwi(String str) {
        this.bhi = str;
    }

    public void dy(String str) {
        this.f25762ci = str;
    }

    public void ea(String str) {
        this.f25759bp = str;
    }

    public void hf(String str) {
        this.f25816uh = str;
    }

    public void htf(String str) {
        this.duz = str;
    }

    public void ifb(String str) {
        if (TextUtils.isEmpty(str)) {
            this.f25818ul = com.bytedance.sdk.openadsdk.oty.ycx.sya.sya;
        } else {
            this.f25818ul = str;
        }
    }

    public void jc(boolean z11) {
        this.f25796pu = z11;
    }

    public void jw(String str) {
        this.eel = str;
    }

    public void kgy(String str) {
        this.f25784lw = str;
    }

    public void lv(int i5) {
        this.f25824wr = i5;
    }

    public void oty(String str) {
        this.f25821uu = str;
    }

    public void pmi(String str) {
        this.f25820ur = str;
    }

    public void rmf(String str) {
        this.kfb = str;
    }

    public void ry(String str) {
        this.f25813tx = str;
    }

    public void syc(String str) {
        this.rzo = str;
    }

    public void thx(String str) {
        this.f25817ui = str;
    }

    public void tn(String str) {
        this.f25775iq = str;
    }

    public void tru(String str) {
        this.f25825xf = str;
    }

    public void uh(String str) {
        this.f25815uf = str;
    }

    public void wie(String str) {
        this.bjp = str;
    }

    public void wwx(String str) {
        this.hpv = str;
    }

    public void xkz(String str) {
        this.sjd = str;
    }

    public void ycx(int i5) {
        this.yzp = i5;
    }

    public void yzp(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.f25773hf.add(str);
    }

    public void zb(int i5) {
        this.dwi = i5;
    }

    private static long fby(JSONObject jSONObject) {
        if (jSONObject != null) {
            return jSONObject.optLong("uid", 0L);
        }
        return 0L;
    }

    private boolean htf(boolean z11) {
        if (z11) {
            int i5 = this.f25800qq;
            return i5 == 1 || i5 == 3;
        }
        int i11 = this.f25800qq;
        return i11 == 2 || i11 == 3;
    }

    public static boolean zb(tn tnVar) {
        return (ycx(tnVar) || sya(tnVar)) ? false : true;
    }

    public void dy(boolean z11) {
        this.ycx = z11;
    }

    public void ea(int i5) {
        ycx(i5, -1);
    }

    public void jc(int i5) {
        this.ksy = i5;
    }

    public void jw(boolean z11) {
        this.ixr = z11;
    }

    public void pmi(boolean z11) {
        this.lud = z11;
    }

    public JSONObject ry(boolean z11) throws JSONException {
        try {
            String strYbg = ybg();
            if (TextUtils.isEmpty(strYbg)) {
                return null;
            }
            JSONObject jSONObject = new JSONObject();
            if (z11) {
                jSONObject.put("raw_response_info", strYbg);
            }
            JSONArray jSONArrayOptJSONArray = new JSONObject(strYbg).optJSONArray("creatives");
            if (jSONArrayOptJSONArray != null && sya() >= 0 && sya() < jSONArrayOptJSONArray.length()) {
                JSONObject jSONObjectOptJSONObject = jSONArrayOptJSONArray.optJSONObject(sya());
                if (jSONObjectOptJSONObject != null) {
                    Iterator<String> itKeys = jSONObjectOptJSONObject.keys();
                    while (itKeys.hasNext()) {
                        String next = itKeys.next();
                        jSONObject.put(next, jSONObjectOptJSONObject.get(next));
                    }
                }
                AdSlot adSlotQn = qn();
                if (adSlotQn != null) {
                    jSONObject.put("adslot", adSlotQn.toJsonObj());
                }
                if (!TextUtils.isEmpty(this.eel)) {
                    jSONObject.put("gdid_encrypted", this.eel);
                }
                jSONObject.put("hasReportShow", this.f25796pu);
                jSONObject.put("isMrcReportFinish", this.f25802qu);
                return jSONObject;
            }
            return null;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "du85kBG1aMutT8Nc", "XOs5uAaoaO2TRdlyjhs=", 2103);
            com.bytedance.sdk.component.utils.htf.ycx("MaterialMeta", "toJsonObj error", e3);
            return null;
        }
    }

    public void syc(boolean z11) {
        this.rdj = z11;
    }

    public void sz(int i5) {
        this.tru = i5;
    }

    public void uh(boolean z11) {
        this.f25765dv = z11;
    }

    public void wie(boolean z11) {
        this.goq = z11;
    }

    public void xkz(boolean z11) {
        this.f25792ok = z11;
    }

    public void ycx(long j11) {
        this.f25767dy = j11;
    }

    public static boolean ycx(tn tnVar, boolean z11, boolean z12, boolean z13, boolean z14) {
        if (ycx(tnVar) || z14 || tnVar == null || tnVar.ci() == null || TextUtils.isEmpty(tnVar.ci().f22190h)) {
            return false;
        }
        return sya(tnVar) ? z13 : (tnVar.ci() == null || tnVar.ci().f22193k != 1) ? z11 : z12;
    }

    public static double zb(String str) {
        return jw(sya(str));
    }

    public void fby(String str) {
        this.f25830yz = str;
    }

    public void jw(int i5) {
        this.f25819um = i5;
    }

    public void rmy(int i5) {
        this.wbt = i5;
    }

    public void xz(int i5) {
        this.f25827yi = i5;
    }

    public void zr(int i5) {
        this.f25760cd = Math.max(0, i5);
    }

    public static int dj(String str) {
        return ycx(sya(str));
    }

    public static JSONObject sya(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            return new JSONObject(str);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "du85kBG1aMutT8Nc", "WPwolBe5TN+UWNZ0ghevAmjBA7oBtmzElA==", 435);
            com.bytedance.sdk.component.utils.htf.sya("MaterialMeta", e3.getMessage());
            return null;
        }
    }

    public void fby(int i5) {
        this.f25761cf = i5;
    }

    public void oby(int i5) {
        this.f25831zk = i5;
    }

    public void rmy(String str) {
        this.wnd = str;
    }

    public void uf(int i5) {
        this.f25752ab = i5;
    }

    public String xz(String str) {
        JSONObject jSONObjectPu = pu();
        return jSONObjectPu != null ? jSONObjectPu.optString("rit", str) : str;
    }

    public static com.bytedance.sdk.openadsdk.core.syc.ycx.zb lt(tn tnVar) {
        String strH;
        String strE;
        int i5;
        boolean z11 = false;
        tnVar.uf(0);
        int iAn = tnVar.an();
        int i11 = 4;
        if (iAn == 3 || iAn == 4) {
            strH = ((g) CacheDirFactory.getICacheDir()).h();
        } else {
            if (iAn == 7) {
                strE = ((g) CacheDirFactory.getICacheDir()).e();
                i5 = 1;
            } else if (iAn != 8) {
                strE = ((g) CacheDirFactory.getICacheDir()).c();
                i5 = 3;
            } else {
                strH = ((g) CacheDirFactory.getICacheDir()).e();
                i11 = 2;
            }
            com.bytedance.sdk.openadsdk.core.syc.ycx.zb zbVar = new com.bytedance.sdk.openadsdk.core.syc.ycx.zb(strE, tnVar.rdj(), tnVar.cf(), tnVar.ulm(), tnVar.msc(), i5, tnVar.an());
            zbVar.ycx(com.bytedance.sdk.openadsdk.dv.lud.ycx("video_error_conf", 0));
            String strDy = zbVar.dy();
            if (p0.f82234f && strDy != null && strDy.endsWith(".mp4")) {
                z11 = true;
            }
            zbVar.sya(z11);
            return zbVar;
        }
        strE = strH;
        i5 = i11;
        com.bytedance.sdk.openadsdk.core.syc.ycx.zb zbVar2 = new com.bytedance.sdk.openadsdk.core.syc.ycx.zb(strE, tnVar.rdj(), tnVar.cf(), tnVar.ulm(), tnVar.msc(), i5, tnVar.an());
        zbVar2.ycx(com.bytedance.sdk.openadsdk.dv.lud.ycx("video_error_conf", 0));
        String strDy2 = zbVar2.dy();
        if (p0.f82234f) {
            z11 = true;
        }
        zbVar2.sya(z11);
        return zbVar2;
    }

    public static String zb(Context context, tn tnVar) {
        if (context != null && tnVar != null) {
            try {
                if (tnVar.liq() != 8) {
                    if (tnVar.hf().ycx()) {
                    }
                }
                String strYcx = com.bytedance.sdk.openadsdk.core.ycx.ycx.ycx(context);
                if (TextUtils.isEmpty(strYcx)) {
                    return null;
                }
                return strYcx;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "du85kBG1aMutT8Nc", "Uv0MlhePfNeQRcVJ", 482);
                com.bytedance.sdk.component.utils.htf.sya("MaterialMeta", th2.getMessage());
            }
        }
        return null;
    }

    public void dj(boolean z11) {
        this.row = z11;
    }

    public void fby(boolean z11) {
        this.lbb = z11;
    }

    public void ul(int i5) {
        this.f25776jc = i5;
    }

    public static boolean lud(tn tnVar) {
        if (tnVar == null) {
            return false;
        }
        int iPk = tnVar.pk();
        return tnVar.wnd() || iPk == 5 || iPk == 15 || iPk == 50;
    }

    public void aeu(int i5) {
        this.fdq = i5;
    }

    public void dj(JSONObject jSONObject) {
        this.spv = jSONObject;
    }

    public void mp(int i5) {
        this.f25801qt = i5;
    }

    public void ul(String str) {
        this.f25803rc = str;
    }

    public void aeu(String str) {
        this.dqs = str;
    }

    public void dj(long j11) {
        this.f25807ry = j11;
    }

    public void ul(boolean z11) {
        this.f25788na = z11;
    }

    public void lud(String str) {
        this.f25826xz = str;
    }

    public void sya(boolean z11) {
        this.f25797px = z11;
    }

    public void ul(JSONObject jSONObject) {
        this.wqq.ycx(jSONObject);
    }

    public void lud(int i5) {
        this.kgy = i5;
    }

    public void sya(pmi pmiVar) {
        PAGBannerSize pAGBannerSizeVzs = vzs();
        if (pAGBannerSizeVzs != null && pAGBannerSizeVzs.getWidth() > 0 && pAGBannerSizeVzs.getHeight() > 0) {
            ycx(pmiVar, dc.zb(com.bytedance.sdk.openadsdk.core.pmi.ycx(), pAGBannerSizeVzs.getWidth()), dc.zb(com.bytedance.sdk.openadsdk.core.pmi.ycx(), pAGBannerSizeVzs.getHeight()));
        }
        this.oby.add(pmiVar);
    }

    public void ul(long j11) {
        this.f25812tn = j11;
    }

    public static boolean ycx(tn tnVar) {
        return (tnVar == null || tnVar.ci() == null || tnVar.ci().f22194l != 1) ? false : true;
    }

    public void lud(boolean z11) {
        this.f25777jp = z11;
    }

    public void zb(boolean z11) {
        this.ifb = z11;
    }

    public void lud(JSONObject jSONObject) {
        if (jSONObject == null) {
            return;
        }
        this.f25827yi = 4;
        this.giw = jSONObject.optString("id");
        this.bjp = jSONObject.optString(Plan.AMP_PLAN_SOURCE);
        lt ltVar = new lt();
        this.f25808sg = ltVar;
        ltVar.sya(jSONObject.optString("pkg_name"));
        this.f25808sg.zb(jSONObject.optString(PendingUpgradeStore.KEY_NAME));
        this.f25808sg.ycx(jSONObject.optString("download_url"));
    }

    public void zb(long j11) {
        this.f25809sl = j11;
    }

    public static long ycx(String str) {
        return fby(sya(str));
    }

    public void zb(com.bytedance.sdk.openadsdk.core.ry.fby.ycx ycxVar) {
        this.gmd = ycxVar;
        com.bytedance.sdk.openadsdk.core.ry.ycx.zb.ycx().ycx(ycxVar, "endcard");
    }

    public static int ycx(JSONObject jSONObject) {
        if (jSONObject != null) {
            return jSONObject.optInt("ut", 0);
        }
        return 0;
    }

    public void zb(double d5) {
        if (d5 != 2.0d && d5 != 1.0d) {
            this.f25772gi = 2;
        } else {
            this.f25772gi = (int) d5;
        }
    }

    public static String ycx(Context context, tn tnVar) {
        if (context == null || tnVar == null || !((tnVar.an() == 8 || tnVar.an() == 7) && tnVar.kt())) {
            return null;
        }
        String strZb = zb(context, tnVar);
        if (TextUtils.isEmpty(strZb) || com.bytedance.sdk.openadsdk.core.ycx.ycx.ycx() != 1) {
            return null;
        }
        return strZb;
    }

    public void sya(long j11) {
        this.ujb = j11;
    }

    public void lt(String str) {
        this.rmy = str;
    }

    public void ok(int i5) {
        this.f25832zr = i5;
    }

    public void sya(JSONObject jSONObject) {
        this.f25790nq = jSONObject;
    }

    public void zb(JSONObject jSONObject) {
        this.msc = jSONObject;
    }

    public void lt(int i5) {
        this.f25814tz = i5;
    }

    public void ok(boolean z11) {
        this.f25811te = z11;
    }

    public void sya(c cVar) {
        this.vyl = cVar;
    }

    public void zb(pmi pmiVar) {
        this.f25786mp = pmiVar;
    }

    public void lt(boolean z11) {
        this.f25753ag = z11;
    }

    public void lud(long j11) {
        this.f25778jw = j11;
    }

    public void zb(c cVar) {
        this.f25781kt = cVar;
    }

    public static void zb(tn tnVar, JSONObject jSONObject) throws JSONException {
        lt ltVarZnc = tnVar.znc();
        if (ltVarZnc != null) {
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("app_name", ltVarZnc.zb());
            jSONObject2.put("package_name", ltVarZnc.sya());
            jSONObject2.put("download_url", ltVarZnc.ycx());
            jSONObject2.put(AiDatabase.COL_INSIGHT_SCORE, ltVarZnc.dj());
            jSONObject2.put("comment_num", ltVarZnc.lud());
            jSONObject2.put("app_size", ltVarZnc.lt());
            jSONObject2.put("app_category", ltVarZnc.ul());
            jSONObject.put("app", jSONObject2);
        }
    }

    public void lt(JSONObject jSONObject) {
        this.qkm = jSONObject;
    }

    public void ycx(boolean z11) {
        this.wie = z11;
    }

    public void lt(long j11) {
        this.wwx = j11;
    }

    public void ycx(fby fbyVar) {
        this.uhs = fbyVar;
    }

    public void ycx(thx thxVar) {
        this.pvm = thxVar;
    }

    public void ycx(uh uhVar) {
        this.f25769eu = uhVar;
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.ry.fby.ycx ycxVar) {
        this.f25764du = ycxVar;
        com.bytedance.sdk.openadsdk.core.ry.ycx.zb.ycx().ycx(ycxVar, "endcard");
    }

    public void ycx(ul ulVar) {
        this.gug = ulVar;
    }

    public void ycx(av avVar) {
        this.f25793oq = avVar;
    }

    public void ycx(int i5, int i11) {
        this.f25805rl = i5;
        this.xym = i5;
        if (this.yyc == null) {
            this.xym = 0;
            return;
        }
        if (i11 <= 0) {
            i11 = an();
        }
        if (this.yyc.getDurationSlotType() != 3 && i11 != 3) {
            if (this.yyc.getDurationSlotType() != 7 && this.yyc.getDurationSlotType() != 8 && i11 != 7 && i11 != 8) {
                if (!this.gjd && av.zb(this)) {
                    this.xym = 4;
                    return;
                }
                if (this.f25805rl == 4 && !av.zb(this)) {
                    this.xym = 0;
                }
                int i12 = this.f25805rl;
                if (i12 == 41) {
                    this.xym = 41;
                    return;
                }
                if (i5 >= 5) {
                    this.xym = 0;
                    return;
                }
                if (i12 == 2 && liq() != 3) {
                    this.xym = 0;
                    return;
                } else {
                    if (i5 == 0 || (i5 == 1 && liq() != 3)) {
                        this.xym = 0;
                        return;
                    }
                    return;
                }
            }
            if (!this.gjd) {
                if (av.sya(this)) {
                    this.xym = 12;
                    return;
                } else if (av.zb(this)) {
                    this.xym = 9;
                    return;
                }
            }
            if (this.f25805rl == 5 && !htf.dj(this)) {
                this.xym = 7;
            }
            if (this.f25805rl == 6 && !htf.zb(this)) {
                this.xym = 7;
            }
            if (this.f25805rl == 8 && dfk() != 100) {
                this.xym = 7;
            }
            if (this.f25805rl == 19 && TextUtils.isEmpty(this.f25815uf)) {
                this.xym = 7;
            }
            if (this.f25805rl == 20 && TextUtils.isEmpty(this.f25815uf)) {
                this.xym = 7;
            }
            if (this.f25805rl == 38 && !htf.sya(this)) {
                this.xym = 7;
            }
            if (i5 < 5) {
                this.xym = 7;
                return;
            }
            return;
        }
        this.xym = 14;
    }

    public void ycx(double d5) {
        if (d5 != 2.0d && d5 != 1.0d) {
            this.f25806rt = 1;
        } else {
            this.f25806rt = (int) d5;
        }
    }

    public void ycx(ea eaVar) {
        this.vy = eaVar;
    }

    public void ycx(AdSlot adSlot) {
        this.yyc = adSlot;
    }

    public void ycx(ycx ycxVar) {
        this.f25794pg = ycxVar;
        com.bytedance.sdk.component.adexpress.ycx.sya.dj djVarVbt = vbt();
        if (djVarVbt != null && !ag()) {
            com.bytedance.sdk.component.adexpress.ycx.zb.zb.ycx(djVarVbt);
        }
        if (ycxVar == null || TextUtils.isEmpty(ycxVar.ry())) {
            return;
        }
        com.bytedance.sdk.openadsdk.core.ry.ycx.zb.ycx().ycx(qv(), "ad");
    }

    public void ycx(xz xzVar) {
        this.ulm = xzVar;
        if (xzVar == null || TextUtils.isEmpty(xzVar.sya())) {
            return;
        }
        com.bytedance.sdk.openadsdk.core.ry.ycx.zb.ycx().ycx(ru(), "adv3");
    }

    public void ycx(c cVar) {
        this.dfk = cVar;
    }

    public void ycx(xkz xkzVar) {
        this.f25780ko = xkzVar;
    }

    public void ycx(pmi pmiVar) {
        ycx(pmiVar, f25750ea);
        String strOby = oby(pmiVar.ycx());
        if (!TextUtils.isEmpty(strOby)) {
            pmiVar.zb(strOby);
        }
        this.bba = pmiVar;
    }

    private void ycx(pmi pmiVar, int i5) {
        if (pmiVar != null) {
            try {
                if (TextUtils.isEmpty(pmiVar.ycx())) {
                    return;
                }
                if (pmiVar.zb() == 0 && pmiVar.sya() == 0) {
                    pmiVar.ycx(i5);
                    pmiVar.zb(i5);
                    return;
                }
                if (pmiVar.zb() == 0) {
                    if (pmiVar.sya() > i5) {
                        pmiVar.zb(i5);
                        pmiVar.ycx(i5);
                        return;
                    } else {
                        pmiVar.ycx(pmiVar.sya());
                        return;
                    }
                }
                if (pmiVar.sya() == 0) {
                    if (pmiVar.zb() > i5) {
                        pmiVar.zb(i5);
                        pmiVar.ycx(i5);
                        return;
                    } else {
                        pmiVar.zb(pmiVar.zb());
                        return;
                    }
                }
                if (pmiVar.zb() > pmiVar.sya()) {
                    if (pmiVar.zb() > i5) {
                        pmiVar.zb((int) (i5 / (pmiVar.zb() / pmiVar.sya())));
                        pmiVar.ycx(i5);
                        return;
                    }
                    return;
                }
                if (pmiVar.sya() > i5) {
                    pmiVar.ycx((int) (i5 * (pmiVar.zb() / pmiVar.sya())));
                    pmiVar.zb(i5);
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "du85kBG1aMutT8Nc", "WOYsmwS5QMSPRORUlhQ=", 1724);
            }
        }
    }

    private void ycx(pmi pmiVar, int i5, int i11) {
        try {
            if (pmiVar.sya() >= i11) {
                pmiVar.ycx((int) ((pmiVar.zb() / pmiVar.sya()) * i11));
                pmiVar.zb(i11);
            } else if (pmiVar.zb() >= i5) {
                pmiVar.ycx((int) ((i5 / i11) * pmiVar.sya()));
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "du85kBG1aMutT8Nc", "WOYsmwS5QMqBTdJuhQul", 1741);
        }
    }

    public void ycx(lt ltVar) {
        this.f25808sg = ltVar;
    }

    public void ycx(ry ryVar) {
        this.f25758bh = ryVar;
    }

    public void ycx(FilterWord filterWord) {
        this.dc.add(filterWord);
    }

    public void ycx(Map<String, Object> map) {
        this.vbt = map;
    }

    public void ycx(float f11) {
        this.znc = f11;
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.xkz.ycx ycxVar) {
        this.gjv = ycxVar;
    }

    public void ycx(wie wieVar) {
        this.f25771fo = wieVar;
    }

    public void ycx(syc sycVar) {
        this.f25787mu = sycVar;
    }

    public void ycx(bhi bhiVar) {
        this.f25799qh = bhiVar;
    }

    public void ycx(PAGBannerSize pAGBannerSize) {
        this.f25785mm = pAGBannerSize;
    }

    public void ycx(hf hfVar) {
        this.zmn = hfVar;
    }

    public void ycx(com.bytedance.sdk.openadsdk.oty.ycx.zb zbVar) {
        this.f25791oi = zbVar;
    }

    public void ycx(rmf rmfVar) {
        this.mqm = rmfVar;
    }

    public void ycx(lud ludVar) {
        this.pmi = ludVar;
    }

    public void ycx(dv dvVar) {
        this.oty = dvVar;
    }

    public void ycx(HashMap<String, String> map) {
        if (map == null || map.isEmpty()) {
            return;
        }
        this.rmf = map;
    }

    public static void ycx(tn tnVar, JSONObject jSONObject) throws JSONException {
        List<pmi> listCu = tnVar.cu();
        if (listCu != null) {
            JSONArray jSONArray = new JSONArray();
            for (pmi pmiVar : listCu) {
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, pmiVar.ycx());
                jSONObject2.put("height", pmiVar.sya());
                jSONObject2.put("width", pmiVar.zb());
                jSONObject2.put("image_preview", pmiVar.lt());
                jSONObject2.put("image_key", pmiVar.ul());
                jSONArray.put(jSONObject2);
            }
            jSONObject.put("image", jSONArray);
        }
    }
}
