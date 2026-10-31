package com.bytedance.sdk.openadsdk.oty.zb;

import android.view.View;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.oby;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes2.dex */
public class lud {
    private static final Map<Integer, zb> ycx = new ConcurrentHashMap();

    public static class ycx {
        public int ycx;

        /* renamed from: zb, reason: collision with root package name */
        public int f26957zb = -1;

        public ycx(int i5) {
            this.ycx = i5;
        }
    }

    private static boolean sya(tn tnVar) {
        if (tnVar == null) {
            return false;
        }
        String strYcx = oby.ycx(tnVar);
        return ((!"open_ad".equals(strYcx) && !"fullscreen_interstitial_ad".equals(strYcx) && !"rewarded_video".equals(strYcx)) || av.zb(tnVar) || tnVar.iq() == 5 || tnVar.iq() == 33 || !tn.lud(tnVar) || tnVar.ci() == null) ? false : true;
    }

    public static void ycx(View view, tn tnVar, ycx ycxVar) {
        if (view == null || tnVar == null || tnVar.aor()) {
            return;
        }
        boolean zSya = sya(tnVar);
        if (av.zb(tnVar) && ycxVar != null) {
            ycxVar.ycx = -1;
        }
        ycx(ycx(view, tnVar, zSya, ycxVar));
    }

    public static void zb(Integer num) {
        ycx.remove(num);
    }

    public static Integer zb(tn tnVar) {
        return Integer.valueOf((tnVar.ac() + tnVar.m147if()).hashCode());
    }

    private static zb ycx(View view, tn tnVar, boolean z11, ycx ycxVar) {
        if (view == null || tnVar == null || tnVar.m147if() == null) {
            return null;
        }
        Integer numZb = zb(tnVar);
        Map<Integer, zb> map = ycx;
        if (map.containsKey(numZb)) {
            zb zbVar = map.get(numZb);
            if (zbVar != null) {
                zbVar.ycx(view);
            }
            return zbVar;
        }
        zb zbVarYcx = zb.ycx(z11, numZb, view, tnVar, ycxVar);
        map.put(numZb, zbVarYcx);
        return zbVarYcx;
    }

    private static void ycx(zb zbVar) {
        if (zbVar == null) {
            return;
        }
        zbVar.ycx();
    }

    public static void ycx(tn tnVar, int i5) {
        if (tnVar == null || tnVar.m147if() == null) {
            return;
        }
        ycx(ycx.get(zb(tnVar)), i5);
    }

    public static void ycx(zb zbVar, int i5) {
        if (zbVar == null) {
            return;
        }
        zbVar.ycx(i5);
    }

    public static void ycx(tn tnVar) {
        if (tnVar == null || tnVar.m147if() == null) {
            return;
        }
        Integer numZb = zb(tnVar);
        Map<Integer, zb> map = ycx;
        zb zbVar = map.get(numZb);
        if (zbVar != null) {
            zbVar.jc();
        }
        zb(numZb);
        if (map.size() <= 0) {
            ul.ycx();
        }
    }

    public static zb ycx(Integer num) {
        return ycx.get(num);
    }
}
