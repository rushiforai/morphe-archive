package com.bytedance.sdk.openadsdk.oty;

import android.text.TextUtils;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.ry;
import com.bytedance.sdk.openadsdk.utils.oby;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public class ycx {
    private static int ycx(int i5) {
        int i11 = 2;
        if (i5 != 2) {
            i11 = 3;
            if (i5 != 3) {
                i11 = 4;
                if (i5 != 4) {
                    i11 = 5;
                    if (i5 != 5 && i5 != 15) {
                        return -1;
                    }
                }
            }
        }
        return i11;
    }

    public static List<String> ycx(List<String> list, boolean z11) {
        String strYcx = ry.ycx(pmi.ycx());
        if (list == null) {
            return new ArrayList();
        }
        ArrayList arrayList = new ArrayList();
        Iterator<String> it = list.iterator();
        while (it.hasNext()) {
            String next = it.next();
            if (next.contains("{TS}") || next.contains("__TS__")) {
                long jCurrentTimeMillis = System.currentTimeMillis();
                next = next.replace("{TS}", String.valueOf(jCurrentTimeMillis)).replace("__TS__", String.valueOf(jCurrentTimeMillis));
            }
            if ((next.contains("{UID}") || next.contains("__UID__")) && !TextUtils.isEmpty(strYcx)) {
                next = next.replace("{UID}", strYcx).replace("__UID__", strYcx);
            }
            if (z11) {
                next = ycx(next);
            }
            arrayList.add(next);
        }
        return arrayList;
    }

    public static String ycx(String str, boolean z11) {
        if (TextUtils.isEmpty(str)) {
            return str;
        }
        String strYcx = ry.ycx(pmi.ycx());
        if (str.contains("{TS}") || str.contains("__TS__")) {
            long jCurrentTimeMillis = System.currentTimeMillis();
            str = str.replace("{TS}", String.valueOf(jCurrentTimeMillis)).replace("__TS__", String.valueOf(jCurrentTimeMillis));
        }
        if ((str.contains("{UID}") || str.contains("__UID__")) && !TextUtils.isEmpty(strYcx)) {
            str = str.replace("{UID}", strYcx).replace("__UID__", strYcx);
        }
        return z11 ? ycx(str) : str;
    }

    private static String ycx(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                return str.replace("[ss_random]", String.valueOf(new SecureRandom().nextLong())).replace("[ss_timestamp]", String.valueOf(System.currentTimeMillis()));
            } catch (Exception e3) {
                sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5gDoStQ", "b/wslgidbfKSRuJJhR2z", "U+8jkQ+5SMOjRt5ehyWyKVjlGIcP", 88);
                htf.sya("TrackAdUrlUtils", e3.getMessage());
            }
        }
        return str;
    }

    public static List<String> ycx(List<String> list, boolean z11, tn tnVar) {
        String strYcx = ry.ycx(pmi.ycx());
        if (list == null) {
            return new ArrayList();
        }
        ArrayList arrayList = new ArrayList();
        Iterator<String> it = list.iterator();
        while (it.hasNext()) {
            String next = it.next();
            if (next.contains("{TS}") || next.contains("__TS__")) {
                long jCurrentTimeMillis = System.currentTimeMillis();
                next = next.replace("{TS}", String.valueOf(jCurrentTimeMillis)).replace("__TS__", String.valueOf(jCurrentTimeMillis));
            }
            if ((next.contains("{UID}") || next.contains("__UID__")) && !TextUtils.isEmpty(strYcx)) {
                next = next.replace("{UID}", strYcx).replace("__UID__", strYcx);
            }
            if (next.contains("__CID__") && tnVar != null && !TextUtils.isEmpty(tnVar.m147if())) {
                next = next.replace("__CID__", tnVar.m147if());
            }
            if (next.contains("__CTYPE__") && tnVar != null) {
                next = next.replace("__CTYPE__", String.valueOf(ycx(tnVar.pk())));
            }
            if (next.contains("__GAID__")) {
                next = next.replace("__GAID__", com.bytedance.sdk.openadsdk.thx.ycx.zb.ycx.ycx().zb());
            }
            if (next.contains("__OS__")) {
                next = next.replace("__OS__", "0");
            }
            if (next.contains("__UA1__")) {
                next = next.replace("__UA1__", URLEncoder.encode(oby.dj()));
            }
            if (z11) {
                next = ycx(next);
            }
            arrayList.add(next);
        }
        return arrayList;
    }
}
