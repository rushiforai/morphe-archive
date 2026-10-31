package com.bytedance.sdk.openadsdk.dj.ycx.ycx;

import android.text.TextUtils;
import b.c9;
import com.amplitude.core.events.Identify;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.BuildConfig;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.tn;
import com.bytedance.sdk.openadsdk.dy.zb.dj;
import com.bytedance.sdk.openadsdk.utils.tru;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import fc.f;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj {
    public static tn<com.bytedance.sdk.openadsdk.dj.ycx> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static final com.bytedance.sdk.openadsdk.dj.ycx.ycx f26740zb = com.bytedance.sdk.openadsdk.dj.ycx.ycx.ycx();

    /* JADX INFO: Access modifiers changed from: private */
    public static HashMap<String, ArrayList<jw>> dj(List<jw> list) {
        HashMap<String, ArrayList<jw>> map = new HashMap<>();
        for (int i5 = 0; i5 < list.size(); i5++) {
            jw jwVar = list.get(i5);
            String strOptString = ((JSONObject) jwVar.sya()).optString("app_log_url");
            ArrayList<jw> arrayList = map.get(strOptString);
            if (arrayList == null) {
                arrayList = new ArrayList<>();
                map.put(strOptString, arrayList);
            }
            arrayList.add(jwVar);
        }
        return map;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static com.bytedance.sdk.openadsdk.dj.lud lt(List<com.bytedance.sdk.openadsdk.dj.ycx> list) {
        if (ycx == null) {
            ycx = pmi.sya();
        }
        if (ycx == null) {
            return null;
        }
        int i5 = lt.ycx() != 3 ? -1 : 3;
        com.bytedance.sdk.openadsdk.dj.ycx.ycx ycxVar = f26740zb;
        return ycx.ycx(ycxVar.ycx(ycxVar.ycx(list, i5), System.currentTimeMillis(), ycxVar.zb()), ycxVar.ycx(list), ycxVar.zb(list));
    }

    private static boolean lud(List<com.bytedance.sdk.openadsdk.dj.ycx> list) {
        JSONObject jSONObjectDj;
        if (list == null || list.isEmpty() || (jSONObjectDj = list.get(0).dj()) == null) {
            return true;
        }
        return TextUtils.isEmpty(jSONObjectDj.optString("app_log_url"));
    }

    public static void ycx(final ArrayList<jw> arrayList, final f fVar) {
        if (arrayList == null || arrayList.isEmpty()) {
            return;
        }
        if (com.bytedance.sdk.openadsdk.core.ea.zb.ycx().lud()) {
            if (fVar != null) {
                fVar.o(arrayList, false);
            }
        } else {
            if (arrayList.get(0) == null) {
                return;
            }
            com.bytedance.sdk.openadsdk.pmi.sya.ycx(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.dj.1
                @Override // com.bytedance.sdk.openadsdk.pmi.dj
                public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                    return c9.h("applog_2");
                }
            });
            yzp.lud(new com.bytedance.sdk.component.fby.zb.sya("upload_ad_event", 7) { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.dj.2
                @Override // java.lang.Runnable
                public void run() {
                    Iterator it;
                    try {
                        it = dj.dj(arrayList).entrySet().iterator();
                    } catch (Throwable th2) {
                        htf.sya("OverSeaEventUploadImp", th2.getMessage());
                        it = null;
                    }
                    Iterator it2 = it;
                    if (it2 == null) {
                        f fVar2 = fVar;
                        if (fVar2 != null) {
                            fVar2.o(arrayList, false);
                            return;
                        }
                        return;
                    }
                    while (it2.hasNext()) {
                        try {
                            ArrayList arrayList2 = (ArrayList) ((Map.Entry) it2.next()).getValue();
                            ArrayList arrayList3 = new ArrayList();
                            Iterator it3 = arrayList2.iterator();
                            while (it3.hasNext()) {
                                jw jwVar = (jw) it3.next();
                                arrayList3.add(new com.bytedance.sdk.openadsdk.dj.ycx(jwVar.lt(), (JSONObject) jwVar.sya()));
                            }
                            com.bytedance.sdk.openadsdk.dj.lud ludVarLt = dj.lt(arrayList3);
                            if (ludVarLt == null) {
                                ludVarLt = new com.bytedance.sdk.openadsdk.dj.lud(false, -2000, "result is null", false);
                            }
                            if (fVar != null) {
                                boolean z11 = ludVarLt.f26525dj;
                                if (dj.zb(arrayList3, ludVarLt)) {
                                    z11 = true;
                                }
                                boolean z12 = z11;
                                fVar.o(arrayList2, new com.bytedance.sdk.component.lt.ycx.zb.zb.zb(ludVarLt.ycx, ludVarLt.f26526zb, ludVarLt.sya, z12, b.f42142b).ycx);
                                if (ludVarLt.f26526zb == 200) {
                                    com.bytedance.sdk.openadsdk.pmi.sya.zb(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.dj.2.1
                                        @Override // com.bytedance.sdk.openadsdk.pmi.dj
                                        public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                            return c9.h("applog_2");
                                        }
                                    });
                                } else if (z12) {
                                    com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.dj.2.2
                                        @Override // com.bytedance.sdk.openadsdk.pmi.dj
                                        public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                            return c9.h("applog_2");
                                        }
                                    });
                                } else {
                                    com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.dj.2.3
                                        @Override // com.bytedance.sdk.openadsdk.pmi.dj
                                        public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                            return c9.h("applog_2");
                                        }
                                    });
                                }
                            }
                        } catch (Throwable th3) {
                            htf.sya("OverSeaEventUploadImp", th3.getMessage());
                        }
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean zb(List<com.bytedance.sdk.openadsdk.dj.ycx> list, com.bytedance.sdk.openadsdk.dj.lud ludVar) {
        int i5;
        return !lud(list) && (i5 = ludVar.f26526zb) >= 400 && i5 < 500;
    }

    public static void zb(final ArrayList<ea> arrayList, final f fVar) {
        if (arrayList == null || arrayList.isEmpty() || com.bytedance.sdk.openadsdk.core.ea.zb.ycx().lud() || arrayList.get(0) == null) {
            return;
        }
        if (com.bytedance.sdk.openadsdk.dy.sya.zb()) {
            if (fVar != null) {
                fVar.o(arrayList, true);
                return;
            }
            return;
        }
        final ArrayList arrayList2 = new ArrayList();
        Iterator<ea> it = arrayList.iterator();
        while (it.hasNext()) {
            ea next = it.next();
            arrayList2.add(new dj.ycx(next.lt(), (JSONObject) next.sya()));
        }
        if (arrayList2.isEmpty()) {
            return;
        }
        com.bytedance.sdk.openadsdk.pmi.sya.ycx(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.dj.3
            @Override // com.bytedance.sdk.openadsdk.pmi.dj
            public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                return c9.h("stats_2");
            }
        });
        yzp.lud(new com.bytedance.sdk.component.fby.zb.sya("upload_stats_event", 6) { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.dj.4
            @Override // java.lang.Runnable
            public void run() {
                com.bytedance.sdk.openadsdk.dj.lud ludVarYcx = dj.ycx(arrayList2);
                if (ludVarYcx == null) {
                    ludVarYcx = new com.bytedance.sdk.openadsdk.dj.lud(false, -2000, "result is null", false);
                }
                if (fVar != null) {
                    fVar.o(arrayList, new com.bytedance.sdk.component.lt.ycx.zb.zb.zb(ludVarYcx.ycx, ludVarYcx.f26526zb, ludVarYcx.sya, ludVarYcx.f26525dj, b.f42142b).ycx);
                    if (ludVarYcx.f26526zb == 200) {
                        com.bytedance.sdk.openadsdk.pmi.sya.zb(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.dj.4.1
                            @Override // com.bytedance.sdk.openadsdk.pmi.dj
                            public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                return c9.h("stats_2");
                            }
                        });
                    } else if (ludVarYcx.f26525dj) {
                        com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.dj.4.2
                            @Override // com.bytedance.sdk.openadsdk.pmi.dj
                            public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                return c9.h("stats_2");
                            }
                        });
                    } else {
                        com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.dj.4.3
                            @Override // com.bytedance.sdk.openadsdk.pmi.dj
                            public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                return c9.h("stats_2");
                            }
                        });
                    }
                }
            }
        });
    }

    public static com.bytedance.sdk.openadsdk.dj.lud ycx(List<dj.ycx> list) {
        if (ycx == null) {
            ycx = pmi.sya();
        }
        if (ycx != null && list != null && !list.isEmpty() && com.bytedance.sdk.openadsdk.core.settings.ul.ycx()) {
            JSONObject jSONObject = new JSONObject();
            try {
                JSONArray jSONArray = new JSONArray();
                Iterator<dj.ycx> it = list.iterator();
                while (it.hasNext()) {
                    jSONArray.put(it.next().f26828zb);
                }
                jSONObject.putOpt("stats_list", jSONArray);
                long jCurrentTimeMillis = System.currentTimeMillis();
                long j11 = jCurrentTimeMillis / 1000;
                jSONObject.putOpt("ts", Long.valueOf(j11));
                jSONObject.putOpt("ts_ms", Long.valueOf(jCurrentTimeMillis));
                String strDj = com.bytedance.sdk.openadsdk.core.jc.zb().dj();
                if (strDj == null) {
                    strDj = b.f42142b;
                }
                StringBuilder sb2 = new StringBuilder(tru.ycx());
                sb2.append(Identify.UNSET_VALUE);
                sb2.append(jCurrentTimeMillis);
                jSONObject.putOpt("req_sign", com.bytedance.sdk.component.utils.lud.ycx(strDj + j11 + BuildConfig.VERSION_NAME));
                jSONObject.putOpt("req_uniq", com.bytedance.sdk.component.utils.lud.ycx(sb2.toString()));
                return ycx.zb(jSONObject);
            } catch (Throwable unused) {
            }
        }
        return null;
    }
}
