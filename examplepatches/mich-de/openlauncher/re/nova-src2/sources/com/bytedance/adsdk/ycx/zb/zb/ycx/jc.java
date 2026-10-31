package com.bytedance.adsdk.ycx.zb.zb.ycx;

import java.util.Map;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class jc implements com.bytedance.adsdk.ycx.zb.zb.ycx {

    /* renamed from: dj, reason: collision with root package name */
    private boolean f22826dj;
    private com.bytedance.adsdk.ycx.zb.ycx.ycx sya;
    private com.bytedance.adsdk.ycx.zb.zb.ycx[] ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f22827zb;

    public jc(String str) {
        this.f22827zb = str;
    }

    public boolean sya() {
        return this.f22826dj;
    }

    public void ycx(com.bytedance.adsdk.ycx.zb.zb.ycx[] ycxVarArr) {
        this.ycx = ycxVarArr;
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public String zb() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.f22827zb);
        sb2.append("(");
        com.bytedance.adsdk.ycx.zb.zb.ycx[] ycxVarArr = this.ycx;
        if (ycxVarArr != null && ycxVarArr.length > 0) {
            int i5 = 0;
            while (true) {
                com.bytedance.adsdk.ycx.zb.zb.ycx[] ycxVarArr2 = this.ycx;
                if (i5 >= ycxVarArr2.length) {
                    break;
                }
                sb2.append(ycxVarArr2[i5].zb());
                sb2.append(",");
                i5++;
            }
        }
        sb2.append(")");
        return sb2.toString();
    }

    public void ycx(boolean z11) {
        this.f22826dj = z11;
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public Object ycx(Map<String, JSONObject> map) {
        com.bytedance.adsdk.ycx.zb.ycx.ycx ycxVar = new com.bytedance.adsdk.ycx.zb.ycx.ycx();
        this.sya = ycxVar;
        ycxVar.ycx(this.f22827zb);
        Object[] objArr = new Object[this.ycx.length];
        int i5 = 0;
        while (true) {
            com.bytedance.adsdk.ycx.zb.zb.ycx[] ycxVarArr = this.ycx;
            if (i5 < ycxVarArr.length) {
                com.bytedance.adsdk.ycx.zb.zb.ycx ycxVar2 = ycxVarArr[i5];
                if (ycxVar2 != null) {
                    objArr[i5] = ycxVar2.ycx(map);
                }
                i5++;
            } else {
                this.sya.ycx(objArr);
                return com.bytedance.adsdk.ycx.wwx.ycx(this.f22827zb).ycx(map.get("default_key"), objArr);
            }
        }
    }

    @Override // com.bytedance.adsdk.ycx.zb.zb.ycx
    public com.bytedance.adsdk.ycx.zb.dj.lud ycx() {
        return com.bytedance.adsdk.ycx.zb.dj.zb.METHOD;
    }
}
