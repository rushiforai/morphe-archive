package com.bytedance.sdk.openadsdk.core.model;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: ea, reason: collision with root package name */
    private String f25872ea;

    /* renamed from: jc, reason: collision with root package name */
    private wwx f25873jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f25874jw;

    /* renamed from: lt, reason: collision with root package name */
    private oty f25875lt;
    private tn lud;

    /* renamed from: ok, reason: collision with root package name */
    private tn f25876ok;
    private String sya;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f25878zb;

    /* renamed from: dj, reason: collision with root package name */
    private List<tn> f25871dj = new ArrayList();

    /* renamed from: ul, reason: collision with root package name */
    private JSONObject f25877ul = new JSONObject();
    private volatile boolean fby = false;

    public int dj() {
        return this.f25878zb;
    }

    public oty ea() {
        return this.f25875lt;
    }

    public wwx fby() {
        return this.f25873jc;
    }

    public tn jc() {
        return this.f25876ok;
    }

    public boolean jw() {
        return this.f25874jw == 1;
    }

    public boolean lt() {
        List<tn> list = this.f25871dj;
        return list != null && list.size() > 0;
    }

    public List<tn> lud() {
        return this.f25871dj;
    }

    public String ok() {
        return this.f25872ea;
    }

    public tn ry() {
        return this.lud;
    }

    public String sya() {
        tn tnVarUl = ul();
        return tnVarUl != null ? tnVarUl.ac() : b.f42142b;
    }

    public tn ul() {
        if (this.f25871dj.size() > 0) {
            return this.f25871dj.get(0);
        }
        return null;
    }

    public JSONObject ycx() {
        return this.f25877ul;
    }

    public String zb() {
        return this.ycx;
    }

    public void ycx(JSONObject jSONObject) {
        this.f25877ul = jSONObject;
    }

    public void zb(String str) {
        this.sya = str;
    }

    public void ycx(String str) {
        this.ycx = str;
    }

    public void zb(int i5) {
        this.f25874jw = i5;
    }

    public static ycx zb(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        try {
            ycx ycxVar = new ycx();
            ycxVar.ycx(wwx.ycx(jSONObject.optJSONObject("loop_config")));
            ycxVar.zb(jSONObject.optInt("multi_ad_style", 0));
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("creatives");
            if (jSONArrayOptJSONArray != null) {
                ArrayList arrayList = new ArrayList();
                for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                    tn tnVarYcx = com.bytedance.sdk.openadsdk.core.zb.ycx(jSONArrayOptJSONArray.optJSONObject(i5), (AdSlot) null, (tru) null, ycxVar, i5);
                    if (tnVarYcx != null) {
                        arrayList.add(tnVarYcx);
                    }
                }
                ycxVar.ycx(arrayList);
            }
            ycxVar.ycx(jSONObject.optString("request_id", b.f42142b));
            String strOptString = jSONObject.optString("multi_ad_config");
            if (!TextUtils.isEmpty(strOptString)) {
                ycxVar.ycx(oty.ycx(strOptString));
            }
            return ycxVar;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "euoEmwWz", "XfwimCmvZsk=", 201);
            com.bytedance.sdk.component.utils.htf.ycx("AdInfo", "fromJson: ", th2);
            return null;
        }
    }

    public void sya(String str) {
        this.f25872ea = str;
    }

    public void ycx(int i5) {
        this.f25878zb = i5;
    }

    public void ycx(tn tnVar) {
        this.f25871dj.add(tnVar);
        if (this.f25876ok == null) {
            this.f25876ok = tnVar;
        }
    }

    public void ycx(List<tn> list) {
        this.f25871dj = list;
        if (list.isEmpty()) {
            return;
        }
        this.f25876ok = list.get(0);
    }

    public static Map<String, tn> ycx(ycx ycxVar) {
        if (ycxVar == null) {
            return null;
        }
        HashMap map = new HashMap();
        for (tn tnVar : ycxVar.lud()) {
            if (!TextUtils.isEmpty(tnVar.dw())) {
                map.put(tnVar.dw(), tnVar);
            }
        }
        if (map.size() != 0) {
            return map;
        }
        return null;
    }

    public void ycx(wwx wwxVar) {
        this.f25873jc = wwxVar;
    }

    public void ycx(oty otyVar) {
        this.f25875lt = otyVar;
    }

    public void zb(tn tnVar) {
        this.lud = tnVar;
    }
}
