package com.bytedance.adsdk.ugeno.lud;

import com.bytedance.adsdk.ugeno.lud.lt;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class lud implements sya {
    @Override // com.bytedance.adsdk.ugeno.lud.sya
    public List<zb> ycx() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new zb("update") { // from class: com.bytedance.adsdk.ugeno.lud.lud.1
            @Override // com.bytedance.adsdk.ugeno.lud.zb
            public com.bytedance.adsdk.ugeno.lud.zb.ycx ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, lt.ycx ycxVar) {
                return new com.bytedance.adsdk.ugeno.lud.zb.lt(syaVar, str, ycxVar);
            }
        });
        arrayList.add(new zb("emit") { // from class: com.bytedance.adsdk.ugeno.lud.lud.2
            @Override // com.bytedance.adsdk.ugeno.lud.zb
            public com.bytedance.adsdk.ugeno.lud.zb.ycx ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, lt.ycx ycxVar) {
                return new com.bytedance.adsdk.ugeno.lud.zb.zb(syaVar, str, ycxVar);
            }
        });
        arrayList.add(new zb("startAnimate") { // from class: com.bytedance.adsdk.ugeno.lud.lud.3
            @Override // com.bytedance.adsdk.ugeno.lud.zb
            public com.bytedance.adsdk.ugeno.lud.zb.ycx ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, lt.ycx ycxVar) {
                return new com.bytedance.adsdk.ugeno.lud.zb.dj(syaVar, str, ycxVar);
            }
        });
        arrayList.add(new zb("startTimer") { // from class: com.bytedance.adsdk.ugeno.lud.lud.4
            @Override // com.bytedance.adsdk.ugeno.lud.zb
            public com.bytedance.adsdk.ugeno.lud.zb.ycx ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, lt.ycx ycxVar) {
                return new com.bytedance.adsdk.ugeno.lud.zb.lud(syaVar, str, ycxVar);
            }
        });
        return arrayList;
    }
}
