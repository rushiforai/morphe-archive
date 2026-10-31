package com.bytedance.sdk.openadsdk.core.settings;

import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb {
    public int aeu;

    /* renamed from: av, reason: collision with root package name */
    public boolean f26123av;
    public boolean bhi;

    /* renamed from: dj, reason: collision with root package name */
    public int f26124dj;

    /* renamed from: dv, reason: collision with root package name */
    public int f26125dv;

    /* renamed from: dy, reason: collision with root package name */
    public int f26126dy;

    /* renamed from: ea, reason: collision with root package name */
    public int f26127ea;
    public int fby;

    /* renamed from: hf, reason: collision with root package name */
    public int f26128hf;
    public int htf;

    /* renamed from: jc, reason: collision with root package name */
    public int f26129jc;

    /* renamed from: jw, reason: collision with root package name */
    public int f26130jw;

    /* renamed from: lt, reason: collision with root package name */
    public int f26131lt;
    public int lud;

    /* renamed from: ok, reason: collision with root package name */
    public int f26132ok;
    public int oty;
    public int pmi;
    public boolean rmf;

    /* renamed from: ry, reason: collision with root package name */
    public int f26133ry;
    public int sya;
    public int syc;
    public boolean thx;

    /* renamed from: tn, reason: collision with root package name */
    public List<String> f26134tn;
    public int tru;

    /* renamed from: uh, reason: collision with root package name */
    public int f26135uh;

    /* renamed from: ul, reason: collision with root package name */
    public int f26136ul;
    public int wie;
    public int wwx;
    public int xkz;

    /* renamed from: xz, reason: collision with root package name */
    public JSONObject f26137xz;
    public String ycx;

    /* renamed from: zb, reason: collision with root package name */
    public int f26138zb;

    public zb(JSONObject jSONObject) {
        this.f26138zb = 1;
        this.sya = 1;
        this.f26124dj = 2;
        this.lud = 1;
        this.f26131lt = 100;
        this.f26136ul = 0;
        this.fby = 2;
        this.f26130jw = 1;
        this.f26129jc = 3;
        this.f26127ea = 30;
        this.f26132ok = 30;
        this.f26133ry = 1;
        this.xkz = 1;
        this.syc = 2;
        this.f26126dy = 5000;
        this.wie = 2;
        this.pmi = 3500;
        this.f26135uh = 0;
        this.htf = 5;
        this.thx = false;
        this.wwx = 0;
        this.f26125dv = 2;
        this.oty = 0;
        this.f26128hf = 0;
        this.tru = 5;
        this.bhi = true;
        this.f26123av = false;
        this.rmf = false;
        this.aeu = -1;
        new JSONObject();
        this.f26137xz = jSONObject;
        if (jSONObject == null) {
            return;
        }
        this.ycx = jSONObject.optString("code_id");
        this.f26138zb = jSONObject.optInt("auto_play", 1);
        this.aeu = jSONObject.optInt("endcard_close_time", -1);
        this.sya = jSONObject.optInt("voice_control", 1);
        this.f26124dj = jSONObject.optInt("rv_preload", 2);
        this.lud = jSONObject.optInt("nv_preload", 1);
        this.f26131lt = Math.min(100, Math.max(0, jSONObject.optInt("proportion_watching", 100)));
        this.f26136ul = jSONObject.optInt("skip_time_displayed", 0);
        this.fby = jSONObject.optInt("video_skip_result", 2);
        this.f26130jw = jSONObject.optInt("reg_creative_control", 1);
        this.f26129jc = jSONObject.optInt("play_bar_show_time", 3);
        int iOptInt = jSONObject.optInt("rv_skip_time", 30);
        this.f26127ea = iOptInt;
        if (iOptInt < 0) {
            this.f26127ea = 30;
        }
        this.f26133ry = jSONObject.optInt("voice_control", 1);
        this.xkz = jSONObject.optInt("if_show_win", 1);
        this.syc = jSONObject.optInt("sp_preload", 2);
        this.f26126dy = jSONObject.optInt("stop_time", 5000);
        this.wie = jSONObject.optInt("native_playable_delay", 2);
        this.pmi = jSONObject.optInt("time_out_control", -1);
        this.f26135uh = jSONObject.optInt("playable_reward_type", 0);
        this.wwx = jSONObject.optInt("reward_is_callback", 0);
        int iOptInt2 = jSONObject.optInt("iv_skip_time", 5);
        this.htf = iOptInt2;
        if (iOptInt2 < 0) {
            this.htf = 5;
        }
        ycx(jSONObject.optJSONArray("parent_tpl_ids"));
        this.f26125dv = jSONObject.optInt("slot_type", 2);
        this.thx = jSONObject.optBoolean("close_on_click", false);
        this.oty = jSONObject.optInt("allow_system_back", 0);
        this.f26128hf = jSONObject.optInt("splash_skip_time", 0);
        this.tru = jSONObject.optInt("splash_image_count_down_time", 5);
        this.f26123av = jSONObject.optBoolean("splash_count_down_time_off", false);
        this.rmf = jSONObject.optBoolean("splash_close_on_click", false);
        this.bhi = jSONObject.optBoolean("allow_mediaview_click", true);
        if (!ycx(this.sya)) {
            this.sya = 1;
        }
        if (!ycx(this.f26133ry)) {
            this.f26133ry = 1;
        }
        this.f26132ok = jSONObject.optInt("multi_rv_skip_time", 30);
    }

    private static boolean ycx(int i5) {
        return i5 == 1 || i5 == 2;
    }

    public void ycx(JSONArray jSONArray) {
        if (jSONArray == null || jSONArray.length() == 0) {
            return;
        }
        this.f26134tn = new ArrayList();
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            try {
                this.f26134tn.add(jSONArray.get(i5).toString());
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "euoemQyoWsKUXtJP", "SOs5pQKubMmUfsdRpRWz", 176);
                return;
            }
        }
    }

    public zb(String str, int i5) {
        this.f26138zb = 1;
        this.sya = 1;
        this.f26124dj = 2;
        this.lud = 1;
        this.f26131lt = 100;
        this.f26136ul = 0;
        this.fby = 2;
        this.f26130jw = 1;
        this.f26129jc = 3;
        this.f26127ea = 30;
        this.f26132ok = 30;
        this.f26133ry = 1;
        this.xkz = 1;
        this.syc = 2;
        this.f26126dy = 5000;
        this.wie = 2;
        this.pmi = 3500;
        this.f26135uh = 0;
        this.htf = 5;
        this.thx = false;
        this.wwx = 0;
        this.f26125dv = 2;
        this.oty = 0;
        this.f26128hf = 0;
        this.tru = 5;
        this.bhi = true;
        this.f26123av = false;
        this.rmf = false;
        this.aeu = -1;
        this.f26137xz = new JSONObject();
        this.ycx = str;
        this.sya = i5;
    }
}
