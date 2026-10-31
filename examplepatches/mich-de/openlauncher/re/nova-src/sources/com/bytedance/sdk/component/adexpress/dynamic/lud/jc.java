package com.bytedance.sdk.component.adexpress.dynamic.lud;

import com.bytedance.sdk.component.adexpress.dynamic.lud.zb;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public class jc {
    public static float ycx(float f11) {
        return (float) Math.ceil((f11 * 16.0f) / 16.0f);
    }

    public static List<zb.ycx> ycx(float f11, List<zb.ycx> list) {
        ArrayList arrayList = new ArrayList();
        Iterator<zb.ycx> it = list.iterator();
        while (it.hasNext()) {
            arrayList.add((zb.ycx) it.next().clone());
        }
        Iterator it2 = arrayList.iterator();
        boolean z11 = true;
        int i5 = 0;
        int i11 = 0;
        while (it2.hasNext()) {
            zb.ycx ycxVar = (zb.ycx) it2.next();
            if (ycxVar.f23450zb) {
                i5 = (int) (i5 + ycxVar.ycx);
            } else {
                i11 = (int) (i11 + ycxVar.ycx);
                z11 = false;
            }
        }
        if (!z11 || f11 <= i5) {
            float f12 = i5;
            float f13 = f11 < f12 ? f11 / f12 : 1.0f;
            float f14 = f11 > f12 ? (f11 - f12) / i11 : 0.0f;
            if (f14 > 1.0f) {
                ArrayList arrayList2 = new ArrayList();
                Iterator it3 = arrayList.iterator();
                boolean z12 = false;
                while (it3.hasNext()) {
                    zb.ycx ycxVar2 = (zb.ycx) it3.next();
                    if (!ycxVar2.f23450zb) {
                        float f15 = ycxVar2.sya;
                        if (f15 != 0.0f && ycxVar2.ycx * f14 > f15) {
                            ycxVar2.ycx = f15;
                            ycxVar2.f23450zb = true;
                            z12 = true;
                        }
                    }
                    arrayList2.add(ycxVar2);
                }
                if (z12) {
                    return ycx(f11, arrayList2);
                }
            }
            Iterator it4 = arrayList.iterator();
            int i12 = 0;
            while (it4.hasNext()) {
                zb.ycx ycxVar3 = (zb.ycx) it4.next();
                if (ycxVar3.f23450zb) {
                    ycxVar3.ycx = ycx(ycxVar3.ycx * f13);
                } else {
                    ycxVar3.ycx = ycx(ycxVar3.ycx * f14);
                }
                i12 = (int) (i12 + ycxVar3.ycx);
            }
            float f16 = i12;
            if (f16 < f11) {
                float f17 = f11 - f16;
                for (int size = 0; size < arrayList.size() && f17 > 0.0f; size = (size + 1) % arrayList.size()) {
                    zb.ycx ycxVar4 = (zb.ycx) arrayList.get(size);
                    if ((f11 < f12 && ycxVar4.f23450zb) || (f11 > f12 && !ycxVar4.f23450zb)) {
                        ycxVar4.ycx += 0.0625f;
                        f17 -= 0.0625f;
                    }
                }
            }
        }
        return arrayList;
    }
}
