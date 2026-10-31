package com.bytedance.adsdk.ugeno.lud;

import android.content.Context;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class ycx implements fby {
    @Override // com.bytedance.adsdk.ugeno.lud.fby
    public List<ul> ycx() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(new ul("slide") { // from class: com.bytedance.adsdk.ugeno.lud.ycx.1
            @Override // com.bytedance.adsdk.ugeno.lud.ul
            public com.bytedance.adsdk.ugeno.lud.dj.sya ycx(Context context) {
                return new com.bytedance.adsdk.ugeno.lud.dj.lud(context);
            }
        });
        arrayList.add(new ul("tap") { // from class: com.bytedance.adsdk.ugeno.lud.ycx.2
            @Override // com.bytedance.adsdk.ugeno.lud.ul
            public com.bytedance.adsdk.ugeno.lud.dj.sya ycx(Context context) {
                return new com.bytedance.adsdk.ugeno.lud.dj.jw(context);
            }
        });
        arrayList.add(new ul("timer") { // from class: com.bytedance.adsdk.ugeno.lud.ycx.3
            @Override // com.bytedance.adsdk.ugeno.lud.ul
            public com.bytedance.adsdk.ugeno.lud.dj.sya ycx(Context context) {
                return new com.bytedance.adsdk.ugeno.lud.dj.jc(context);
            }
        });
        arrayList.add(new ul("touchStart") { // from class: com.bytedance.adsdk.ugeno.lud.ycx.4
            @Override // com.bytedance.adsdk.ugeno.lud.ul
            public com.bytedance.adsdk.ugeno.lud.dj.sya ycx(Context context) {
                return new com.bytedance.adsdk.ugeno.lud.dj.xkz(context);
            }
        });
        arrayList.add(new ul("touchEnd") { // from class: com.bytedance.adsdk.ugeno.lud.ycx.5
            @Override // com.bytedance.adsdk.ugeno.lud.ul
            public com.bytedance.adsdk.ugeno.lud.dj.sya ycx(Context context) {
                return new com.bytedance.adsdk.ugeno.lud.dj.ry(context);
            }
        });
        arrayList.add(new ul("animateState") { // from class: com.bytedance.adsdk.ugeno.lud.ycx.6
            @Override // com.bytedance.adsdk.ugeno.lud.ul
            public com.bytedance.adsdk.ugeno.lud.dj.sya ycx(Context context) {
                return new com.bytedance.adsdk.ugeno.lud.dj.zb(context);
            }
        });
        arrayList.add(new ul("timerState") { // from class: com.bytedance.adsdk.ugeno.lud.ycx.7
            @Override // com.bytedance.adsdk.ugeno.lud.ul
            public com.bytedance.adsdk.ugeno.lud.dj.sya ycx(Context context) {
                return new com.bytedance.adsdk.ugeno.lud.dj.ok(context);
            }
        });
        return arrayList;
    }
}
