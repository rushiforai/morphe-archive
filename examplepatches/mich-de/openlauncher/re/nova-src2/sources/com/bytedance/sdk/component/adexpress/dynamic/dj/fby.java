package com.bytedance.sdk.component.adexpress.dynamic.dj;

import android.text.TextUtils;
import b.c0;
import fq.c;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class fby {

    /* renamed from: dj, reason: collision with root package name */
    private float f23303dj;

    /* renamed from: ea, reason: collision with root package name */
    private fby f23305ea;
    private float fby;

    /* renamed from: jc, reason: collision with root package name */
    private List<fby> f23306jc;

    /* renamed from: jw, reason: collision with root package name */
    private lud f23307jw;

    /* renamed from: lt, reason: collision with root package name */
    private float f23308lt;
    private float lud;

    /* renamed from: ok, reason: collision with root package name */
    private List<List<fby>> f23309ok;

    /* renamed from: ry, reason: collision with root package name */
    private String f23310ry;
    private float sya;

    /* renamed from: ul, reason: collision with root package name */
    private float f23311ul;
    private boolean xkz;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f23312zb;
    private Map<String, String> syc = new HashMap();

    /* renamed from: dy, reason: collision with root package name */
    private Map<Integer, String> f23304dy = new HashMap();

    public float dj() {
        return this.f23303dj;
    }

    public boolean dv() {
        return this.f23307jw.lud().ufy() < 0 || this.f23307jw.lud().nzi() < 0 || this.f23307jw.lud().xf() < 0 || this.f23307jw.lud().tx() < 0;
    }

    public float dy() {
        lt ltVarLud = this.f23307jw.lud();
        return (ltVarLud.ok() * 2.0f) + ltVarLud.xkz() + ltVarLud.wie() + xkz();
    }

    public List<fby> ea() {
        return this.f23306jc;
    }

    public float fby() {
        return this.f23308lt;
    }

    public Map<String, String> htf() {
        return this.syc;
    }

    public lud jc() {
        return this.f23307jw;
    }

    public float jw() {
        return this.f23311ul;
    }

    public float lt() {
        return this.f23312zb;
    }

    public float lud() {
        return this.lud;
    }

    public fby ok() {
        return this.f23305ea;
    }

    public boolean pmi() {
        List<fby> list = this.f23306jc;
        return list == null || list.size() <= 0;
    }

    public int ry() {
        lt ltVarLud = this.f23307jw.lud();
        return ltVarLud.bba() + ltVarLud.zr();
    }

    public String sya() {
        return this.ycx;
    }

    public float syc() {
        lt ltVarLud = this.f23307jw.lud();
        return (ltVarLud.ok() * 2.0f) + ltVarLud.dy() + ltVarLud.syc() + ry();
    }

    public void thx() {
        List<List<fby>> list = this.f23309ok;
        if (list == null || list.size() <= 0) {
            return;
        }
        ArrayList arrayList = new ArrayList();
        for (List<fby> list2 : this.f23309ok) {
            if (list2 != null && list2.size() > 0) {
                arrayList.add(list2);
            }
        }
        this.f23309ok = arrayList;
    }

    public String tn() {
        return this.f23307jw.lud().tn();
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder("DynamicLayoutUnit{id='");
        sb2.append(this.ycx);
        sb2.append("', x=");
        sb2.append(this.f23312zb);
        sb2.append(", y=");
        sb2.append(this.sya);
        sb2.append(", width=");
        sb2.append(this.f23308lt);
        sb2.append(", height=");
        sb2.append(this.f23311ul);
        sb2.append(", remainWidth=");
        sb2.append(this.fby);
        sb2.append(", rootBrick=");
        sb2.append(this.f23307jw);
        sb2.append(", childrenBrickUnits=");
        return c.e(sb2, this.f23306jc, AbstractJsonLexerKt.END_OBJ);
    }

    public boolean uh() {
        return this.xkz;
    }

    public float ul() {
        return this.sya;
    }

    public List<List<fby>> wie() {
        return this.f23309ok;
    }

    public boolean wwx() {
        return TextUtils.equals(this.f23307jw.lud().bhi(), "flex");
    }

    public int xkz() {
        lt ltVarLud = this.f23307jw.lud();
        return ltVarLud.rl() + ltVarLud.xym();
    }

    public String ycx() {
        return this.f23310ry;
    }

    public Map<Integer, String> zb() {
        return this.f23304dy;
    }

    public void dj(float f11) {
        this.sya = f11;
    }

    public void lt(float f11) {
        this.f23311ul = f11;
    }

    public void lud(float f11) {
        this.f23308lt = f11;
    }

    public void sya(float f11) {
        this.f23312zb = f11;
    }

    public void ul(float f11) {
        this.fby = f11;
    }

    public void ycx(String str) {
        this.f23310ry = str;
    }

    public void zb(String str) {
        this.ycx = str;
    }

    public void sya(String str) {
        this.f23307jw.lud().lt(str);
    }

    public void ycx(JSONArray jSONArray) {
        if (jSONArray != null) {
            try {
                if (jSONArray.length() == 0) {
                    return;
                }
                for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                    JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
                    this.f23304dy.put(Integer.valueOf(jSONObjectOptJSONObject.optInt("id")), jSONObjectOptJSONObject.optString("value"));
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX60nX+sh", "f/cjlA61auuBU9hImCSuIU8=", "SOs5twSRaNOFWN5cgDKlJk/rP7YCsGrkj0bYTw==", 54);
            }
        }
    }

    public void zb(float f11) {
        this.lud = f11;
    }

    public void zb(List<List<fby>> list) {
        this.f23309ok = list;
    }

    public void ycx(float f11) {
        this.f23303dj = f11;
    }

    public void ycx(lud ludVar) {
        this.f23307jw = ludVar;
    }

    public void ycx(List<fby> list) {
        this.f23306jc = list;
    }

    public void ycx(fby fbyVar) {
        this.f23305ea = fbyVar;
    }

    public void ycx(boolean z11) {
        this.xkz = z11;
    }

    public void ycx(String str, String str2) {
        this.syc.put(str, str2);
    }

    public String ycx(int i5) {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f23307jw.zb());
        sb2.append(":");
        sb2.append(this.ycx);
        if (this.f23307jw.lud() != null) {
            sb2.append(":");
            sb2.append(this.f23307jw.lud().ci());
        }
        return c0.p(sb2, ":", i5);
    }
}
