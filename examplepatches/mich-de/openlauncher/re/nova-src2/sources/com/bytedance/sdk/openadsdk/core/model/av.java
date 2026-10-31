package com.bytedance.sdk.openadsdk.core.model;

import android.text.TextUtils;
import com.bykv.vk.openvk.ycx.ycx.ycx.sya.c;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class av {

    /* renamed from: dj, reason: collision with root package name */
    private int f25596dj;

    /* renamed from: dy, reason: collision with root package name */
    private String f25597dy;

    /* renamed from: ea, reason: collision with root package name */
    private int f25598ea;
    private int fby;

    /* renamed from: jc, reason: collision with root package name */
    private boolean f25599jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f25600jw;

    /* renamed from: lt, reason: collision with root package name */
    private String f25601lt;
    private String lud;

    /* renamed from: ok, reason: collision with root package name */
    private int f25602ok;
    private String pmi;

    /* renamed from: ry, reason: collision with root package name */
    private int f25603ry;
    private boolean sya;
    private int syc;

    /* renamed from: ul, reason: collision with root package name */
    private int f25604ul;
    private String wie;
    private int xkz;
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f25605zb;

    public av(JSONObject jSONObject) {
        this.f25602ok = 5;
        this.f25603ry = 5;
        this.xkz = 10;
        this.syc = 20;
        this.f25597dy = "Next Ad";
        this.wie = "Next ad in %1$ds";
        this.pmi = "Play Now";
        if (jSONObject == null) {
            return;
        }
        this.sya = jSONObject.optBoolean("is_playable");
        this.f25596dj = jSONObject.optInt("playable_type", 0);
        this.lud = jSONObject.optString("playable_style");
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("playable");
        if (jSONObjectOptJSONObject != null) {
            this.f25601lt = jSONObjectOptJSONObject.optString("playable_url", b.f42142b);
            this.f25604ul = jSONObjectOptJSONObject.optInt("playable_orientation", 0);
            this.f25605zb = jSONObjectOptJSONObject.optInt("new_style", 0);
            this.ycx = jSONObjectOptJSONObject.optInt("close_2_app", 0);
            int iYcx = ycx(this.f25596dj);
            this.fby = jSONObjectOptJSONObject.optInt("playable_webview_timeout", iYcx);
            this.f25600jw = jSONObjectOptJSONObject.optInt("playable_js_timeout", iYcx);
            this.f25599jc = jSONObjectOptJSONObject.optInt("playable_backup_enable", 0) == 1;
            this.f25602ok = jSONObjectOptJSONObject.optInt("wait_tips_time", 5);
            this.f25603ry = jSONObjectOptJSONObject.optInt("auto_to_next_time", 5);
            this.xkz = jSONObjectOptJSONObject.optInt("next_ad_tips_show_time", 10);
            this.syc = jSONObjectOptJSONObject.optInt("max_show_time", 20);
            this.wie = jSONObjectOptJSONObject.optString("next_ad_in_xs");
            this.f25597dy = jSONObjectOptJSONObject.optString("next_ad_text");
            this.pmi = jSONObjectOptJSONObject.optString("play_now_text");
            int iOptInt = jSONObjectOptJSONObject.optInt("countdown_show_type", 0);
            this.f25598ea = iOptInt;
            if (iOptInt == 0 || iOptInt == 1 || iOptInt == 2) {
                return;
            }
            this.f25598ea = 0;
        }
    }

    private static int av(tn tnVar) {
        av avVarBhi = bhi(tnVar);
        if (avVarBhi == null) {
            return 0;
        }
        return avVarBhi.f25596dj;
    }

    private static av bhi(tn tnVar) {
        if (tnVar == null) {
            return null;
        }
        return tnVar.hpv();
    }

    public static String dv(tn tnVar) {
        av avVarBhi = bhi(tnVar);
        if (avVarBhi == null) {
            return null;
        }
        return avVarBhi.lt();
    }

    public static boolean dy(tn tnVar) {
        return false;
    }

    public static String ea(tn tnVar) {
        av avVarBhi = bhi(tnVar);
        if (avVarBhi == null) {
            return null;
        }
        return avVarBhi.f25601lt;
    }

    public static boolean fby(tn tnVar) {
        av avVarHpv = tnVar.hpv();
        return avVarHpv != null && tnVar.qq() && avVarHpv.sya && avVarHpv.f25605zb == 1;
    }

    public static int hf(tn tnVar) {
        av avVarBhi = bhi(tnVar);
        if (avVarBhi == null) {
            return 0;
        }
        return avVarBhi.sya();
    }

    public static boolean htf(tn tnVar) {
        av avVarBhi = bhi(tnVar);
        return avVarBhi != null && avVarBhi.jc();
    }

    public static String jc(tn tnVar) {
        av avVarBhi = bhi(tnVar);
        if (avVarBhi == null) {
            return null;
        }
        return avVarBhi.lud;
    }

    public static int jw(tn tnVar) {
        av avVarBhi = bhi(tnVar);
        if (avVarBhi == null) {
            return 0;
        }
        return avVarBhi.f25598ea;
    }

    public static String ok(tn tnVar) {
        if (tnVar == null) {
            return null;
        }
        av avVarHpv = tnVar.hpv();
        if (avVarHpv != null && avVarHpv.sya) {
            String str = avVarHpv.f25601lt;
            if (!TextUtils.isEmpty(str)) {
                return str;
            }
        }
        if (tnVar.iq() == 20) {
            return tnVar.kh();
        }
        if (tnVar.ci() != null) {
            return tnVar.ci().f22190h;
        }
        return null;
    }

    public static int oty(tn tnVar) {
        av avVarBhi = bhi(tnVar);
        if (avVarBhi == null) {
            return 0;
        }
        return avVarBhi.zb();
    }

    public static long pmi(tn tnVar) {
        if (bhi(tnVar) == null) {
            return 5L;
        }
        return r2.fby();
    }

    public static boolean ry(tn tnVar) {
        return true;
    }

    public static int syc(tn tnVar) {
        av avVarBhi = bhi(tnVar);
        if (avVarBhi == null) {
            return 0;
        }
        return avVarBhi.f25604ul;
    }

    public static int thx(tn tnVar) {
        av avVarBhi = bhi(tnVar);
        if (avVarBhi == null) {
            return 0;
        }
        return avVarBhi.ycx();
    }

    public static String tn(tn tnVar) {
        av avVarBhi = bhi(tnVar);
        if (avVarBhi == null) {
            return null;
        }
        return avVarBhi.ul();
    }

    public static int tru(tn tnVar) {
        av avVarBhi = bhi(tnVar);
        if (avVarBhi == null) {
            return 0;
        }
        return avVarBhi.dj();
    }

    public static long uh(tn tnVar) {
        if (bhi(tnVar) == null) {
            return 5L;
        }
        return r2.jw();
    }

    public static long wie(tn tnVar) {
        return Math.max(pmi(tnVar), uh(tnVar));
    }

    public static String wwx(tn tnVar) {
        av avVarBhi = bhi(tnVar);
        if (avVarBhi == null) {
            return null;
        }
        return avVarBhi.lud();
    }

    public static boolean xkz(tn tnVar) {
        c cVarCi = tnVar.ci();
        return cVarCi != null && cVarCi.n == 1;
    }

    private static int ycx(int i5) {
        return i5 == 1 ? 10 : 5;
    }

    public int dj() {
        return this.syc;
    }

    public String lt() {
        return this.wie;
    }

    public String lud() {
        return this.f25597dy;
    }

    public int sya() {
        return this.xkz;
    }

    public String ul() {
        return this.pmi;
    }

    public int zb() {
        return this.f25603ry;
    }

    public static boolean dj(tn tnVar) {
        return sya(tnVar) && !ul(tnVar);
    }

    public static boolean lt(tn tnVar) {
        return lud(tnVar) && av(tnVar) == 1;
    }

    public static boolean lud(tn tnVar) {
        av avVarBhi = bhi(tnVar);
        return avVarBhi != null && tnVar.qq() && avVarBhi.sya && !TextUtils.isEmpty(ok(tnVar));
    }

    public static boolean sya(tn tnVar) {
        return zb(tnVar) && av(tnVar) == 1;
    }

    public static boolean ul(tn tnVar) {
        av avVarHpv = tnVar.hpv();
        return avVarHpv != null && avVarHpv.sya && avVarHpv.f25605zb == 1;
    }

    public static boolean zb(tn tnVar) {
        av avVarBhi = bhi(tnVar);
        return (avVarBhi == null || !avVarBhi.sya || TextUtils.isEmpty(ok(tnVar))) ? false : true;
    }

    public int ycx() {
        return this.f25602ok;
    }

    public static int ycx(tn tnVar) {
        int i5;
        av avVarHpv = tnVar.hpv();
        if (avVarHpv != null && (i5 = avVarHpv.ycx) >= 0 && i5 <= 100) {
            return i5;
        }
        return 0;
    }

    public boolean jc() {
        return this.f25599jc;
    }

    public int jw() {
        return this.f25600jw;
    }

    public int fby() {
        return this.fby;
    }
}
