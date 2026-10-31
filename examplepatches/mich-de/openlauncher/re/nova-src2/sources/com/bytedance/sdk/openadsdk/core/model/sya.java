package com.bytedance.sdk.openadsdk.core.model;

import com.bytedance.sdk.openadsdk.AdSlot;
import java.util.ArrayList;
import java.util.Collection;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya {

    /* renamed from: dj, reason: collision with root package name */
    public ArrayList<Integer> f25742dj;

    /* renamed from: lt, reason: collision with root package name */
    public String f25743lt;
    public AdSlot lud;
    public int sya = 1;

    /* renamed from: ul, reason: collision with root package name */
    public int f25744ul;
    public String ycx;

    /* renamed from: zb, reason: collision with root package name */
    public int f25745zb;

    public AdSlot dj() {
        return this.lud;
    }

    public ArrayList<Integer> lud() {
        return this.f25742dj;
    }

    public int sya() {
        return this.sya;
    }

    public String ycx() {
        return this.ycx;
    }

    public int zb() {
        return this.f25745zb;
    }

    public void sya(int i5) {
        this.f25744ul = i5;
    }

    public void ycx(String str) {
        this.ycx = str;
    }

    public void zb(int i5) {
        this.sya = i5;
    }

    public void ycx(int i5) {
        this.f25745zb = i5;
    }

    public void zb(String str) {
        this.f25743lt = str;
    }

    public void ycx(AdSlot adSlot) {
        this.lud = adSlot;
    }

    public void ycx(ArrayList<Integer> arrayList) {
        this.f25742dj = arrayList;
    }

    public static void ycx(sya syaVar) {
        int iZb;
        if (syaVar == null || syaVar.dj() == null || (iZb = syaVar.zb()) >= 0 || iZb == -8) {
            return;
        }
        com.bytedance.sdk.openadsdk.dy.dj.ycx("rd_client_custom_error", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.core.model.sya.1
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("from", sya.this.sya());
                jSONObject.put("err_code", sya.this.zb());
                jSONObject.put("err_msg", sya.this.f25743lt);
                jSONObject.put("ext_from", sya.this.f25744ul);
                jSONObject.put("server_res_str", sya.this.ycx());
                if (sya.this.lud() != null && sya.this.lud().size() > 0) {
                    jSONObject.put("mate_unavailable_code_list", new JSONArray((Collection) sya.this.lud()).toString());
                }
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("rd_client_custom_error").ycx(sya.this.dj().getDurationSlotType()).zb(jSONObject.toString());
            }
        });
    }
}
