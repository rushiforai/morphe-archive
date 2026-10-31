package com.bytedance.adsdk.ugeno.lud;

import b.c9;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt {
    private ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private List<ycx> f22479zb;
    private boolean sya = false;

    /* renamed from: dj, reason: collision with root package name */
    private int f22478dj = 0;

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        private String f22480dj;

        /* renamed from: lt, reason: collision with root package name */
        private Map<String, Object> f22481lt;
        private Map<String, Object> lud;
        private String sya = "global";
        private String ycx;

        /* renamed from: zb, reason: collision with root package name */
        private String f22482zb;

        public String dj() {
            return this.ycx;
        }

        public String lud() {
            return this.f22482zb;
        }

        public Map<String, Object> sya() {
            return this.lud;
        }

        public String toString() {
            StringBuilder sb2 = new StringBuilder("Action{scheme='");
            sb2.append(this.sya);
            sb2.append("', name='");
            sb2.append(this.f22480dj);
            sb2.append("', params=");
            sb2.append(this.lud);
            sb2.append(", host='");
            sb2.append(this.f22482zb);
            sb2.append("', origin='");
            sb2.append(this.ycx);
            sb2.append("', extra=");
            return c9.l(sb2, this.f22481lt, AbstractJsonLexerKt.END_OBJ);
        }

        public String ycx() {
            return this.sya;
        }

        public String zb() {
            return this.f22480dj;
        }

        public void dj(String str) {
            this.f22482zb = str;
        }

        public void sya(String str) {
            this.ycx = str;
        }

        public void ycx(String str) {
            this.sya = str;
        }

        public void zb(String str) {
            this.f22480dj = str;
        }

        public void ycx(Map<String, Object> map) {
            this.lud = map;
        }

        public void zb(Map<String, Object> map) {
            this.f22481lt = map;
        }
    }

    public int dj() {
        return this.f22478dj;
    }

    public boolean sya() {
        return this.sya;
    }

    public ycx ycx() {
        return this.ycx;
    }

    public List<ycx> zb() {
        return this.f22479zb;
    }

    public static lt ycx(JSONObject jSONObject, JSONObject jSONObject2) {
        ycx ycxVarYcx;
        if (jSONObject == null) {
            return null;
        }
        lt ltVar = new lt();
        Object objOpt = jSONObject.opt("on");
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("handlers");
        ycx ycxVarYcx2 = objOpt instanceof String ? ok.ycx((String) objOpt, jSONObject2) : objOpt instanceof JSONObject ? ok.ycx((JSONObject) objOpt, jSONObject2) : null;
        if (ycxVarYcx2 != null) {
            ltVar.ycx = ycxVarYcx2;
        }
        if (jSONArrayOptJSONArray == null || jSONArrayOptJSONArray.length() <= 0) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
            Object objOpt2 = jSONArrayOptJSONArray.opt(i5);
            if (objOpt2 instanceof String) {
                ycx ycxVarYcx3 = ok.ycx((String) objOpt2, jSONObject2);
                if (ycxVarYcx3 != null) {
                    arrayList.add(ycxVarYcx3);
                }
            } else if ((objOpt2 instanceof JSONObject) && (ycxVarYcx = ok.ycx((JSONObject) objOpt2, jSONObject2)) != null) {
                arrayList.add(ycxVarYcx);
            }
        }
        ltVar.f22479zb = arrayList;
        if (jSONObject.has("delay")) {
            ltVar.f22478dj = com.bytedance.adsdk.ugeno.fby.sya.ycx(com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObject.optString("delay"), jSONObject2), 0);
        }
        if (jSONObject.has("disable")) {
            ltVar.sya = com.bytedance.adsdk.ugeno.fby.sya.ycx(com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObject.optString("disable"), jSONObject2), false);
        }
        return ltVar;
    }
}
