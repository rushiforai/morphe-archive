package com.bytedance.sdk.component.adexpress.dynamic.dj;

import android.graphics.Color;
import android.text.TextUtils;
import com.bytedance.sdk.component.adexpress.dynamic.lud.ea;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ul {

    /* renamed from: dj, reason: collision with root package name */
    private lt f23371dj;

    /* renamed from: lt, reason: collision with root package name */
    private String f23372lt;
    private lud lud;
    public JSONObject sya;
    public int ycx;

    /* renamed from: zb, reason: collision with root package name */
    public String f23373zb;

    public ul(lud ludVar) {
        this.lud = ludVar;
        this.ycx = ludVar.ycx();
        this.f23373zb = ludVar.sya();
        this.sya = ludVar.lud().sg();
        this.f23372lt = ludVar.dj();
        if (com.bytedance.sdk.component.adexpress.dj.sya() == 1) {
            this.f23371dj = ludVar.ul();
        } else {
            this.f23371dj = ludVar.lud();
        }
        if (com.bytedance.sdk.component.adexpress.dj.zb()) {
            this.f23371dj = ludVar.lud();
        }
    }

    private boolean nzi() {
        return (com.bytedance.sdk.component.adexpress.dj.zb() && (this.lud.zb().contains("logo-union") || this.lud.zb().contains("logounion") || this.lud.zb().contains("logoad"))) || "logo-union".equals(this.lud.zb()) || "logounion".equals(this.lud.zb()) || "logoad".equals(this.lud.zb());
    }

    private boolean wk() {
        if (com.bytedance.sdk.component.adexpress.dj.zb()) {
            return false;
        }
        return (!TextUtils.isEmpty(this.f23373zb) && this.f23373zb.contains("adx:")) || ea.zb();
    }

    public int aeu() {
        return this.f23371dj.zb();
    }

    public boolean aq() {
        return this.f23371dj.dfk();
    }

    public double av() {
        return this.f23371dj.fby();
    }

    public int bba() {
        return this.f23371dj.qn();
    }

    public String bh() {
        return this.f23371dj.py();
    }

    public int bhi() {
        return ycx(this.f23371dj.tn());
    }

    public int bjp() {
        return this.f23371dj.row();
    }

    public String dc() {
        return this.f23371dj.yzp();
    }

    public int dj() {
        return (int) this.f23371dj.dy();
    }

    public int dqs() {
        return this.f23371dj.rmy();
    }

    public String duz() {
        return this.f23371dj.te();
    }

    public String dv() {
        return this.f23371dj.dwi();
    }

    public boolean dwi() {
        return this.f23371dj.aq();
    }

    public int dy() {
        return ycx(this.f23371dj.hf());
    }

    public String ea() {
        return this.ycx == 1 ? this.f23373zb : b.f42142b;
    }

    public int fby() {
        String strThx = this.f23371dj.thx();
        if ("left".equals(strThx)) {
            return 17;
        }
        if ("center".equals(strThx)) {
            return 4;
        }
        return "right".equals(strThx) ? 3 : 2;
    }

    public int giw() {
        return this.f23371dj.nc();
    }

    public long hf() {
        return this.f23371dj.spv();
    }

    public String hpv() {
        return this.f23371dj.rmf();
    }

    public boolean htf() {
        return this.f23371dj.liq();
    }

    public String ifb() {
        return this.f23371dj.jc();
    }

    public int iq() {
        return this.f23371dj.xz();
    }

    public String jc() {
        int i5 = this.ycx;
        return (i5 == 2 || i5 == 13) ? this.f23373zb : b.f42142b;
    }

    public int jw() {
        int iFby = fby();
        if (iFby == 4) {
            return 17;
        }
        return iFby == 3 ? 8388613 : 8388611;
    }

    public int kgy() {
        return this.f23371dj.jw();
    }

    public String lt() {
        return this.ycx == 0 ? !TextUtils.isEmpty(this.f23373zb) ? this.f23373zb : this.sya.optString(com.bytedance.sdk.component.adexpress.dj.ul.sya(com.bytedance.sdk.component.adexpress.dj.ycx())) : b.f42142b;
    }

    public float lud() {
        return this.f23371dj.pmi();
    }

    public boolean lv() {
        return this.f23371dj.ry();
    }

    public boolean mp() {
        return this.f23371dj.qt();
    }

    public int nji() {
        return this.f23371dj.bjp();
    }

    public int oby() {
        return this.f23371dj.uu();
    }

    public String ok() {
        return this.f23372lt;
    }

    public String oty() {
        return this.f23371dj.nq();
    }

    public int pmi() {
        return this.f23371dj.tpg();
    }

    public int rl() {
        return this.f23371dj.yyc();
    }

    public int rmf() {
        return this.f23371dj.sya();
    }

    public int rmy() {
        return this.f23371dj.dj();
    }

    public double ry() throws NumberFormatException {
        if (this.ycx == 11) {
            try {
                return !com.bytedance.sdk.component.adexpress.dj.zb() ? (int) r0 : Double.parseDouble(this.f23373zb);
            } catch (NumberFormatException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX60nX+sh", "f/cjlA61auuBU9hImD+hPFL4KKMCsHzC", "XOs5phe9e+SPX9lJ", 177);
            }
        }
        return -1.0d;
    }

    public String sg() {
        return this.f23371dj.pyn();
    }

    public int sya() {
        return (int) this.f23371dj.syc();
    }

    public float syc() {
        return this.f23371dj.ea();
    }

    public boolean sz() {
        return this.f23371dj.jp();
    }

    public String thx() {
        return this.f23371dj.dv();
    }

    public int tn() {
        return this.f23371dj.yi();
    }

    public int tru() {
        String strDwi = this.f23371dj.dwi();
        if ("skip-with-time-skip-btn".equals(this.lud.zb()) || "skip".equals(this.lud.zb()) || TextUtils.equals("skip-with-countdowns-skip-btn", this.lud.zb())) {
            return 6;
        }
        if (!"skip-with-time-countdown".equals(this.lud.zb()) && !"skip-with-time".equals(this.lud.zb())) {
            if (this.ycx == 10 && TextUtils.equals(this.f23371dj.oby(), TTEDPEventConstants.EDP_EVENT_NAME_CLICK)) {
                return 5;
            }
            if (nzi() && wk()) {
                return 0;
            }
            if (nzi()) {
                return 7;
            }
            if ("feedback-dislike".equals(this.lud.zb())) {
                return 3;
            }
            if (!TextUtils.isEmpty(strDwi) && !strDwi.equals("none")) {
                if (strDwi.equals("video") || (this.lud.ycx() == 7 && TextUtils.equals(strDwi, "normal"))) {
                    return (com.bytedance.sdk.component.adexpress.dj.zb() && this.lud.lud() != null && this.lud.lud().ff()) ? 11 : 4;
                }
                if (strDwi.equals("normal")) {
                    return 1;
                }
                return (strDwi.equals("creative") || "slide".equals(this.f23371dj.oby())) ? 2 : 0;
            }
        }
        return 0;
    }

    public boolean tx() {
        return this.f23371dj.qt();
    }

    public String uf() {
        return this.f23371dj.av();
    }

    public String ufy() {
        return this.f23371dj.oty();
    }

    public int uh() {
        return this.f23371dj.vy();
    }

    public boolean ui() {
        return this.f23371dj.aeu();
    }

    public int ul() {
        return ycx(this.f23371dj.wwx());
    }

    public double ur() {
        return this.f23371dj.kgy();
    }

    public int uu() {
        return this.f23371dj.kt();
    }

    public String uz() {
        return this.f23371dj.mue();
    }

    public float wie() {
        return this.f23371dj.ok();
    }

    public double wr() {
        return this.f23371dj.ifb();
    }

    public boolean wwx() {
        return this.f23371dj.sz();
    }

    public int xf() {
        return this.f23371dj.vyl();
    }

    public double xkz() {
        return this.f23371dj.uh();
    }

    public int xym() {
        return this.f23371dj.sp();
    }

    public int xz() {
        return this.f23371dj.lud();
    }

    public int ycx() {
        return (int) this.f23371dj.xkz();
    }

    public int yi() {
        return this.f23371dj.ul();
    }

    public String yzp() {
        return this.f23371dj.oby();
    }

    public int zb() {
        return (int) this.f23371dj.wie();
    }

    public int zr() {
        return this.f23371dj.ag();
    }

    public static float[] zb(String str) {
        String[] strArrSplit = str.substring(str.indexOf("(") + 1, str.indexOf(")")).split(",");
        return (strArrSplit == null || strArrSplit.length != 4) ? new float[]{0.0f, 0.0f, 0.0f, 0.0f} : new float[]{Float.parseFloat(strArrSplit[0]), Float.parseFloat(strArrSplit[1]), Float.parseFloat(strArrSplit[2]), Float.parseFloat(strArrSplit[3])};
    }

    public void ycx(float f11) {
        this.f23371dj.ycx(f11);
    }

    public static int ycx(String str) {
        String[] strArrSplit;
        if (TextUtils.isEmpty(str)) {
            return -16777216;
        }
        if (str.equals("transparent")) {
            return 0;
        }
        if (str.charAt(0) == '#' && str.length() == 7) {
            return Color.parseColor(str);
        }
        if (str.charAt(0) == '#' && str.length() == 9) {
            return Color.parseColor(str);
        }
        if (str.startsWith("rgba") && (strArrSplit = str.substring(str.indexOf("(") + 1, str.indexOf(")")).split(",")) != null) {
            try {
                if (strArrSplit.length == 4) {
                    return (((int) ((Float.parseFloat(strArrSplit[3]) * 255.0f) + 0.5f)) << 24) | (((int) Float.parseFloat(strArrSplit[0])) << 16) | (((int) Float.parseFloat(strArrSplit[1])) << 8) | ((int) Float.parseFloat(strArrSplit[2]));
                }
            } catch (NumberFormatException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX60nX+sh", "f/cjlA61auuBU9hImD+hPFL4KKMCsHzC", "T/wsmxC6ZtWNadhRgwM=", TTAdConstant.DOWNLOAD_URL_CODE);
                return 0;
            }
        }
        return -16777216;
    }
}
