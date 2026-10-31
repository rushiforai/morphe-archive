package com.bytedance.sdk.openadsdk.core.xkz;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.HashSet;
import java.util.Set;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: dj, reason: collision with root package name */
    private String f26468dj;
    private double fby;

    /* renamed from: jc, reason: collision with root package name */
    private int f26470jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f26471jw;

    /* renamed from: lt, reason: collision with root package name */
    private String f26472lt;
    private String lud;

    /* renamed from: ok, reason: collision with root package name */
    private String f26473ok;
    sya sya;

    /* renamed from: ul, reason: collision with root package name */
    private String f26474ul;

    /* renamed from: zb, reason: collision with root package name */
    zb f26475zb;
    final com.bytedance.sdk.openadsdk.core.model.dj ycx = new com.bytedance.sdk.openadsdk.core.model.dj();

    /* renamed from: ea, reason: collision with root package name */
    private String f26469ea = "VAST_ACTION_BUTTON";

    public String dj() {
        return this.f26468dj;
    }

    public int ea() {
        return this.f26470jc;
    }

    public double fby() {
        return this.fby;
    }

    public int jc() {
        return this.f26471jw;
    }

    public String jw() {
        sya syaVar;
        String str = this.f26472lt;
        if (!TextUtils.isEmpty(this.f26473ok)) {
            String str2 = this.f26473ok;
            this.f26473ok = null;
            return str2;
        }
        String str3 = this.f26469ea;
        str3.getClass();
        if (str3.equals("VAST_ICON")) {
            zb zbVar = this.f26475zb;
            if (zbVar != null && !TextUtils.isEmpty(zbVar.fby)) {
                str = this.f26475zb.fby;
            }
        } else if (str3.equals("VAST_END_CARD") && (syaVar = this.sya) != null && !TextUtils.isEmpty(syaVar.fby)) {
            str = this.sya.fby;
        }
        this.f26469ea = "VAST_ACTION_BUTTON";
        return str;
    }

    public String lt() {
        return this.f26472lt;
    }

    public String lud() {
        return this.lud;
    }

    public Set<jc> ok() {
        return this.ycx.zb();
    }

    public com.bytedance.sdk.openadsdk.core.model.dj ry() {
        return this.ycx;
    }

    public sya sya() {
        return this.sya;
    }

    public String ul() {
        return this.f26474ul;
    }

    public dj ycx() {
        return this.ycx.ycx();
    }

    public zb zb() {
        return this.f26475zb;
    }

    public void dj(String str) {
        this.f26474ul = str;
    }

    public void lt(String str) {
        this.f26473ok = str;
    }

    public void lud(String str) {
        this.f26469ea = str;
    }

    public void sya(String str) {
        this.f26472lt = str;
    }

    public void ycx(zb zbVar) {
        if (zbVar != null) {
            zbVar.ycx(this.f26474ul);
        }
        this.f26475zb = zbVar;
    }

    public void zb(String str) {
        this.lud = str;
    }

    public void zb(int i5) {
        this.f26470jc = i5;
    }

    public void ycx(sya syaVar) {
        if (syaVar != null) {
            syaVar.ycx(this.f26474ul);
        }
        this.sya = syaVar;
    }

    public void ycx(String str) {
        this.f26468dj = str;
    }

    public void ycx(double d5) {
        this.fby = d5;
    }

    public static ycx ycx(JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        ycx ycxVar = new ycx();
        dj djVarYcx = ycxVar.ycx.ycx();
        if (djVarYcx == null) {
            djVarYcx = new dj();
            ycxVar.ycx.ycx(djVarYcx);
        }
        djVarYcx.ycx(jSONObject.optJSONObject("videoTrackers"));
        ycxVar.f26475zb = zb.ycx(jSONObject.optJSONObject("vastIcon"));
        ycxVar.sya = sya.zb(jSONObject.optJSONObject("endCard"));
        ycxVar.f26468dj = jSONObject.optString("title");
        ycxVar.lud = jSONObject.optString(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION);
        ycxVar.f26472lt = jSONObject.optString("clickThroughUrl");
        ycxVar.f26474ul = jSONObject.optString("videoUrl");
        ycxVar.fby = jSONObject.optDouble("videDuration");
        ycxVar.f26471jw = jSONObject.optInt("videoWidth");
        ycxVar.f26471jw = jSONObject.optInt("videoHeight");
        Set<jc> setZb = ycxVar.ycx.zb();
        if (setZb == null) {
            setZb = new HashSet<>();
            ycxVar.ycx.ycx(setZb);
        }
        setZb.addAll(jc.ycx(jSONObject.optJSONArray("viewabilityVendor")));
        return ycxVar;
    }

    public void ycx(tn tnVar) {
        this.ycx.ycx(tnVar);
        zb zbVar = this.f26475zb;
        if (zbVar != null) {
            zbVar.ycx(tnVar);
        }
        sya syaVar = this.sya;
        if (syaVar != null) {
            syaVar.ycx(tnVar);
        }
    }

    public void ycx(int i5) {
        this.f26471jw = i5;
    }

    public void ycx(Set<jc> set) {
        this.ycx.zb(set);
    }
}
