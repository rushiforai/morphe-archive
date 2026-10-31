package com.bytedance.sdk.openadsdk.core.xkz.sya;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.google.android.gms.internal.measurement.k2;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/* loaded from: classes2.dex */
public class sya {

    /* renamed from: dj, reason: collision with root package name */
    private static boolean f26451dj = false;
    private static SimpleDateFormat ycx;
    private final Map<zb, String> sya;

    /* renamed from: zb, reason: collision with root package name */
    private final List<String> f26452zb;

    public sya(List<String> list, tn tnVar) {
        int iAn;
        this.f26452zb = list;
        HashMap map = new HashMap();
        this.sya = map;
        map.put(zb.CACHEBUSTING, sya());
        map.put(zb.TIMESTAMP, zb());
        map.put(zb.APPBUNDLE, pmi.ycx().getPackageName());
        zb zbVar = zb.PLAYERSTATE;
        map.put(zbVar, b.f42142b);
        if (tnVar != null && ((iAn = tnVar.an()) == 3 || iAn == 7 || iAn == 8)) {
            map.put(zbVar, "fullscreen");
        }
        map.put(zb.SERVERSIDE, "0");
    }

    private String sya() {
        return String.format(Locale.US, "%08d", Long.valueOf(Math.round(Math.random() * 1.0E8d)));
    }

    private String zb() {
        if (ycx == null) {
            ycx = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSX", Locale.getDefault());
        }
        String str = ycx.format(new Date());
        if (!f26451dj) {
            return str;
        }
        int iHf = oby.hf();
        if (iHf < 0) {
            if (iHf > -10) {
                StringBuilder sbK = k2.k(str, "-0");
                sbK.append(-iHf);
                return sbK.toString();
            }
            return str + iHf;
        }
        if (iHf < 10) {
            return str + "+0" + iHf;
        }
        return str + "+" + iHf;
    }

    public List<String> ycx() {
        ArrayList arrayList = new ArrayList();
        for (String strReplaceAll : this.f26452zb) {
            if (!TextUtils.isEmpty(strReplaceAll)) {
                for (zb zbVar : zb.values()) {
                    String str = this.sya.get(zbVar);
                    if (str == null) {
                        str = b.f42142b;
                    }
                    strReplaceAll = zbVar == zb.__MRC_IMPRESSION_ID__ ? strReplaceAll.replaceAll(zbVar.name(), str) : strReplaceAll.replaceAll("\\[" + zbVar.name() + "\\]", str);
                }
                arrayList.add(strReplaceAll);
            }
        }
        return arrayList;
    }

    public sya ycx(com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx ycxVar) {
        if (ycxVar != null) {
            this.sya.put(zb.ERRORCODE, ycxVar.ycx());
        }
        return this;
    }

    public sya ycx(long j11) {
        if (j11 >= 0) {
            String strZb = zb(j11);
            if (!TextUtils.isEmpty(strZb)) {
                this.sya.put(zb.CONTENTPLAYHEAD, strZb);
            }
        }
        return this;
    }

    public sya ycx(String str) {
        if (!TextUtils.isEmpty(str)) {
            this.sya.put(zb.__MRC_IMPRESSION_ID__, str);
        }
        return this;
    }

    public sya zb(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                str = URLEncoder.encode(str, "UTF-8");
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGF/J804lGxA==", "be8+gS69atWPYtJRnBSy", "TOc5nSKvesKUf8VU", 146);
            }
            this.sya.put(zb.ASSETURI, str);
        }
        return this;
    }

    private String zb(long j11) {
        Locale locale = Locale.getDefault();
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        return String.format(locale, "%02d:%02d:%02d.%03d", Long.valueOf(timeUnit.toHours(j11)), Long.valueOf(timeUnit.toMinutes(j11) % TimeUnit.HOURS.toMinutes(1L)), Long.valueOf(timeUnit.toSeconds(j11) % TimeUnit.MINUTES.toSeconds(1L)), Long.valueOf(j11 % 1000));
    }
}
