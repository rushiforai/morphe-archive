package com.bytedance.sdk.openadsdk.core.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lud {
    private ArrayList<ycx> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private dj f25696zb;

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        private Set<com.bytedance.sdk.openadsdk.core.xkz.jc> f25697dj;
        private com.bytedance.sdk.openadsdk.core.xkz.dj sya;
        private final String ycx;

        /* renamed from: zb, reason: collision with root package name */
        private final String f25698zb;

        public ycx(JSONObject jSONObject) {
            this.ycx = jSONObject.optString("vast_url");
            this.f25698zb = jSONObject.optString("vast_content");
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("videoTrackers");
            if (jSONObjectOptJSONObject != null) {
                com.bytedance.sdk.openadsdk.core.xkz.dj djVar = new com.bytedance.sdk.openadsdk.core.xkz.dj();
                this.sya = djVar;
                djVar.ycx(jSONObjectOptJSONObject);
            }
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("viewabilityVendor");
            if (jSONArrayOptJSONArray != null) {
                this.f25697dj = com.bytedance.sdk.openadsdk.core.xkz.jc.ycx(jSONArrayOptJSONArray);
            }
        }

        public String dj() {
            return this.f25698zb;
        }

        public String sya() {
            return this.ycx;
        }

        public com.bytedance.sdk.openadsdk.core.xkz.dj ycx() {
            return this.sya;
        }

        public Set<com.bytedance.sdk.openadsdk.core.xkz.jc> zb() {
            return this.f25697dj;
        }

        public void ycx(com.bytedance.sdk.openadsdk.core.xkz.dj djVar) {
            this.sya = djVar;
        }

        public void ycx(Set<com.bytedance.sdk.openadsdk.core.xkz.jc> set) {
            this.f25697dj = set;
        }
    }

    public lud(JSONArray jSONArray) {
        if (jSONArray == null) {
            return;
        }
        for (int i5 = 0; i5 < jSONArray.length(); i5++) {
            ycx ycxVar = new ycx(jSONArray.optJSONObject(i5));
            if (this.ycx == null) {
                this.ycx = new ArrayList<>();
            }
            this.ycx.add(ycxVar);
        }
    }

    public static boolean ycx(tn tnVar) {
        if (tnVar == null || tnVar.aeu()) {
            return false;
        }
        int iAn = tnVar.an();
        int iPk = tnVar.pk();
        return (iAn == 3 || iAn == 7 || iAn == 8) && (iPk == 5 || iPk == 15 || iPk == 50);
    }

    public boolean sya() {
        ArrayList<ycx> arrayList = this.ycx;
        return (arrayList == null || arrayList.isEmpty()) ? false : true;
    }

    public dj zb() {
        if (this.f25696zb == null) {
            this.f25696zb = new dj();
            ArrayList<ycx> arrayList = this.ycx;
            if (arrayList != null) {
                Iterator<ycx> it = arrayList.iterator();
                while (it.hasNext()) {
                    ycx next = it.next();
                    com.bytedance.sdk.openadsdk.core.xkz.dj djVarYcx = next.ycx();
                    Set<com.bytedance.sdk.openadsdk.core.xkz.jc> setZb = next.zb();
                    if (djVarYcx != null) {
                        this.f25696zb.ycx().ycx(djVarYcx);
                    }
                    if (setZb != null) {
                        this.f25696zb.zb().addAll(setZb);
                    }
                }
            }
        }
        return this.f25696zb;
    }

    public ArrayList<ycx> ycx() {
        return this.ycx;
    }
}
