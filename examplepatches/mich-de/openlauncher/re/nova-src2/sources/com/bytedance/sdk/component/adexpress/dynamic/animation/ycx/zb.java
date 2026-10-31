package com.bytedance.sdk.component.adexpress.dynamic.animation.ycx;

import android.view.View;
import com.bytedance.sdk.component.adexpress.dynamic.dynamicview.kgy;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public class zb implements kgy {
    List<dj> ycx = new ArrayList();

    public zb(View view, List<com.bytedance.sdk.component.adexpress.dynamic.dj.ycx> list) {
        Iterator<com.bytedance.sdk.component.adexpress.dynamic.dj.ycx> it = list.iterator();
        while (it.hasNext()) {
            dj djVarYcx = sya.ycx().ycx(view, it.next());
            if (djVarYcx != null) {
                this.ycx.add(djVarYcx);
            }
        }
    }

    public void ycx() {
        Iterator<dj> it = this.ycx.iterator();
        while (it.hasNext()) {
            try {
                it.next().sya();
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6EmUuMsgQqzZ4mBRN5QjQWpJ1X9", "euAkmAKoYMiOedJJnw==", "S+IsjCKyYMqBXt5Sgg==", 28);
            }
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.dynamicview.kgy
    public void zb() {
        Iterator<dj> it = this.ycx.iterator();
        while (it.hasNext()) {
            try {
                it.next().zb();
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6EmUuMsgQqzZ4mBRN5QjQWpJ1X9", "euAkmAKoYMiOedJJnw==", "SeshkAKvbOaOQ9pcmBivJg==", 61);
            }
        }
    }
}
