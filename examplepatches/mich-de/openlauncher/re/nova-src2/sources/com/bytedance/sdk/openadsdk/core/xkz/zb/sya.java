package com.bytedance.sdk.openadsdk.core.xkz.zb;

import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.bytedance.sdk.component.utils.hf;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.xkz.zb.ycx;
import com.bytedance.sdk.openadsdk.core.xkz.zb.zb;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya {
    private static final Map<String, zb> ycx = new ConcurrentHashMap();

    /* renamed from: zb, reason: collision with root package name */
    private static final AtomicBoolean f26492zb = new AtomicBoolean(false);

    /* renamed from: dj, reason: collision with root package name */
    private final boolean f26493dj;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f26494lt;
    private EnumC0092sya lud;
    private final String sya;

    /* renamed from: com.bytedance.sdk.openadsdk.core.xkz.zb.sya$sya, reason: collision with other inner class name */
    public enum EnumC0092sya {
        TRACKING_URL,
        QUARTILE_EVENT
    }

    public static class ycx {
        private final String ycx;

        /* renamed from: zb, reason: collision with root package name */
        private EnumC0092sya f26502zb = EnumC0092sya.TRACKING_URL;
        private boolean sya = false;

        public ycx(String str) {
            this.ycx = str;
        }

        public ycx ycx(boolean z11) {
            this.sya = z11;
            return this;
        }

        public sya ycx() {
            return new sya(this.ycx, this.f26502zb, Boolean.valueOf(this.sya));
        }
    }

    public static class zb {
        float sya;
        final tn ycx;

        /* renamed from: zb, reason: collision with root package name */
        String f26503zb;

        public zb(String str, tn tnVar) {
            this(str, tnVar, -1.0f);
        }

        public String toString() {
            return super.toString();
        }

        public zb(String str, tn tnVar, float f11) {
            this.f26503zb = str;
            this.ycx = tnVar;
            this.sya = f11;
        }
    }

    static {
        hf.ycx(new hf.ycx() { // from class: com.bytedance.sdk.openadsdk.core.xkz.zb.sya.1
            @Override // com.bytedance.sdk.component.utils.hf.ycx
            public void ycx(Context context, Intent intent, boolean z11, int i5) {
                if (i5 == 0 || sya.ycx.size() <= 0) {
                    return;
                }
                sya.ul();
            }
        }, pmi.ycx());
    }

    public sya(String str, EnumC0092sya enumC0092sya, Boolean bool) {
        this.sya = str;
        this.lud = enumC0092sya;
        this.f26493dj = bool.booleanValue();
    }

    public static List<com.bytedance.sdk.openadsdk.core.xkz.zb.ycx> sya(JSONArray jSONArray) {
        ArrayList arrayList = new ArrayList();
        if (jSONArray != null) {
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
                if (jSONObjectOptJSONObject != null) {
                    arrayList.add(new ycx.C0093ycx(jSONObjectOptJSONObject.optString("content"), jSONObjectOptJSONObject.optLong("trackingMilliseconds", 0L)).ycx());
                }
            }
        }
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void ul() {
        if (f26492zb.compareAndSet(false, true)) {
            Map<String, zb> map = ycx;
            HashSet hashSet = new HashSet(map.entrySet());
            map.clear();
            Iterator it = hashSet.iterator();
            while (it.hasNext()) {
                Map.Entry entry = (Map.Entry) it.next();
                if (entry != null) {
                    ycx((String) entry.getKey(), (zb) entry.getValue(), true);
                }
            }
            f26492zb.set(false);
        }
    }

    public static void zb(tn tnVar, List<sya> list, com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx ycxVar, long j11, String str, String str2) {
        ycx(tnVar, list, ycxVar, j11, str, null, str2);
    }

    public boolean dj() {
        return this.f26494lt;
    }

    public void n_() {
        this.f26494lt = true;
    }

    public static List<String> ycx(tn tnVar, List<sya> list, com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx ycxVar, long j11, String str, String str2) {
        if (list == null) {
            return new ArrayList();
        }
        ArrayList arrayList = new ArrayList(list.size());
        for (sya syaVar : list) {
            if (syaVar != null && (!syaVar.dj() || syaVar.sya())) {
                arrayList.add(syaVar.zb());
                syaVar.n_();
            }
        }
        return arrayList.isEmpty() ? arrayList : new com.bytedance.sdk.openadsdk.core.xkz.sya.sya(arrayList, tnVar).ycx(ycxVar).ycx(j11).zb(str).ycx(str2).ycx();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void zb(final boolean z11, final String str, final String str2, final zb zbVar, final String str3, final boolean z12) {
        tn tnVar;
        if (zbVar == null || (tnVar = zbVar.ycx) == null) {
            return;
        }
        final boolean zWnd = tnVar.wnd();
        final String str4 = zWnd ? "dsp_track_link_result" : "track_link_result";
        com.bytedance.sdk.openadsdk.dj.sya.ycx(new com.bytedance.sdk.component.fby.zb.sya(str4) { // from class: com.bytedance.sdk.openadsdk.core.xkz.zb.sya.3
            @Override // java.lang.Runnable
            public void run() {
                final JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put(TTConst.TRACK_TYPE, zbVar.f26503zb);
                    jSONObject.put("success", z11);
                    jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str3);
                    if (zWnd) {
                        if (!TextUtils.isEmpty(str)) {
                            jSONObject.put(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, str);
                        }
                        if (zbVar.sya >= 0.0f) {
                            jSONObject.put("progress", Math.round(r0 * 100.0f) / 100.0d);
                        }
                    }
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGF/J91YFJ3Fie", "be8+gTeuaMSLT8UZ3w==", "Sfsj", Sdk.SDKError.Reason.AD_LOAD_FAIL_PLACEMENT_ID_MISMATCH_VALUE);
                }
                com.bytedance.sdk.openadsdk.dj.sya.ycx(System.currentTimeMillis(), zbVar.ycx, str2, str4, new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.core.xkz.zb.sya.3.1
                    @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                    public JSONObject sya() {
                        return jSONObject;
                    }

                    @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                    public JSONObject ycx() {
                        if (!z12) {
                            return null;
                        }
                        try {
                            JSONObject jSONObject2 = new JSONObject();
                            jSONObject2.put("retry", true);
                            return jSONObject2;
                        } catch (Throwable th3) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGF/J91YFJ3Fie", "be8+gTeuaMSLT8UZ31Xx", "XOs5pQK7Q9SPRPNcmBA=", 243);
                            return null;
                        }
                    }
                });
            }
        });
    }

    public static List<com.bytedance.sdk.openadsdk.core.xkz.zb.zb> zb(JSONArray jSONArray) {
        ArrayList arrayList = new ArrayList();
        if (jSONArray != null) {
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
                if (jSONObjectOptJSONObject != null) {
                    arrayList.add(new zb.ycx(jSONObjectOptJSONObject.optString("content"), (float) jSONObjectOptJSONObject.optDouble("trackingFraction", 0.0d)).ycx());
                }
            }
        }
        return arrayList;
    }

    public boolean sya() {
        return this.f26493dj;
    }

    public String zb() {
        return this.sya;
    }

    public static boolean ycx(tn tnVar, List<sya> list, com.bytedance.sdk.openadsdk.core.xkz.ycx.ycx ycxVar, long j11, String str, zb zbVar, String str2) {
        List<String> listYcx = ycx(tnVar, list, ycxVar, j11, str, str2);
        ycx(listYcx, zbVar);
        return !listYcx.isEmpty();
    }

    public static void ycx(List<String> list, zb zbVar) {
        for (int i5 = 0; i5 < list.size(); i5++) {
            String str = list.get(i5);
            if (!TextUtils.isEmpty(str)) {
                ycx(str, zbVar, false);
            }
        }
    }

    private static void ycx(final String str, final zb zbVar, final boolean z11) {
        com.bytedance.sdk.component.ul.zb.zb zbVarSya = com.bytedance.sdk.openadsdk.htf.zb.zb().sya().sya();
        if (zbVarSya == null) {
            return;
        }
        zbVarSya.ycx(true);
        zbVarSya.sya(str);
        zbVarSya.zb(new com.bytedance.sdk.component.ul.ycx.ycx() { // from class: com.bytedance.sdk.openadsdk.core.xkz.zb.sya.2
            @Override // com.bytedance.sdk.component.ul.ycx.ycx
            public void ycx(com.bytedance.sdk.component.ul.zb.sya syaVar, com.bytedance.sdk.component.ul.zb zbVar2) {
                String str2;
                boolean z12;
                zb zbVar3 = zbVar;
                if (zbVar3 == null || zbVar3.ycx == null) {
                    return;
                }
                String str3 = null;
                if (zbVar2 == null || !zbVar2.lt()) {
                    if (zbVar2 != null) {
                        str3 = zbVar2.ycx() + ":" + zbVar2.zb();
                        if (!z11 && (zbVar2.ycx() <= 300 || zbVar2.ycx() >= 400)) {
                            sya.ycx.put(str, zbVar);
                        }
                    }
                    str2 = str3;
                    z12 = false;
                } else {
                    str2 = null;
                    z12 = true;
                }
                sya.zb(z12, str2, oby.sya(zbVar.ycx.an()), zbVar, str, z11);
                if (!z12 || sya.ycx.isEmpty()) {
                    return;
                }
                sya.ul();
            }

            @Override // com.bytedance.sdk.component.ul.ycx.ycx
            public void ycx(com.bytedance.sdk.component.ul.zb.sya syaVar, IOException iOException) {
                tn tnVar;
                zb zbVar2 = zbVar;
                if (zbVar2 != null && (tnVar = zbVar2.ycx) != null) {
                    sya.zb(false, iOException != null ? iOException.getMessage() : null, oby.sya(tnVar.an()), zbVar, str, z11);
                }
                if (z11 || zbVar == null) {
                    return;
                }
                sya.ycx.put(str, zbVar);
            }
        });
    }

    public static List<sya> ycx(JSONArray jSONArray) {
        return ycx(jSONArray, false);
    }

    public static List<sya> ycx(JSONArray jSONArray, boolean z11) {
        ArrayList arrayList = new ArrayList();
        if (jSONArray != null) {
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                String strOptString = jSONArray.optString(i5);
                if (!TextUtils.isEmpty(strOptString)) {
                    arrayList.add(new ycx(strOptString).ycx(z11).ycx());
                }
            }
        }
        return arrayList;
    }
}
