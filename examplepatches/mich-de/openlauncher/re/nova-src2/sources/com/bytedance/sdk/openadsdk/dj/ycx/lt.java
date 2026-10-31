package com.bytedance.sdk.openadsdk.dj.ycx;

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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt implements com.bytedance.sdk.component.lt.ycx.zb.sya {
    public tn<com.bytedance.sdk.openadsdk.dj.ycx> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final ycx f26721zb = ycx.ycx();

    /* JADX INFO: Access modifiers changed from: private */
    public HashMap<String, List<com.bytedance.sdk.component.lt.ycx.dj.ycx>> dj(List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list) {
        HashMap<String, List<com.bytedance.sdk.component.lt.ycx.dj.ycx>> map = new HashMap<>();
        new ArrayList();
        for (int i5 = 0; i5 < list.size(); i5++) {
            com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar = list.get(i5);
            JSONObject jSONObjectLt = ycxVar.lt();
            if (jSONObjectLt != null) {
                String strOptString = jSONObjectLt.optString("app_log_url");
                List<com.bytedance.sdk.component.lt.ycx.dj.ycx> arrayList = map.get(strOptString);
                if (arrayList == null) {
                    arrayList = new ArrayList<>();
                    map.put(strOptString, arrayList);
                }
                arrayList.add(ycxVar);
            }
        }
        return map;
    }

    private boolean sya(List<com.bytedance.sdk.openadsdk.dj.ycx> list) {
        JSONObject jSONObjectDj;
        if (list == null || list.size() == 0 || (jSONObjectDj = list.get(0).dj()) == null) {
            return true;
        }
        return TextUtils.isEmpty(jSONObjectDj.optString("app_log_url"));
    }

    public com.bytedance.sdk.openadsdk.dj.lud zb(List<dj.ycx> list) {
        if (this.ycx == null) {
            this.ycx = pmi.sya();
        }
        if (list != null && list.size() != 0 && com.bytedance.sdk.openadsdk.core.settings.ul.ycx()) {
            try {
                JSONObject jSONObject = new JSONObject();
                JSONArray jSONArray = new JSONArray();
                Iterator<dj.ycx> it = list.iterator();
                while (it.hasNext()) {
                    jSONArray.put(it.next().f26828zb);
                }
                jSONObject.put("stats_list", jSONArray);
                long jCurrentTimeMillis = System.currentTimeMillis();
                long j11 = jCurrentTimeMillis / 1000;
                jSONObject.put("ts", j11);
                jSONObject.put("ts_ms", jCurrentTimeMillis);
                String strDj = com.bytedance.sdk.openadsdk.core.jc.zb().dj();
                if (strDj == null) {
                    strDj = b.f42142b;
                }
                StringBuilder sb2 = new StringBuilder(tru.ycx());
                sb2.append(Identify.UNSET_VALUE);
                sb2.append(jCurrentTimeMillis);
                jSONObject.put("req_sign", com.bytedance.sdk.component.utils.lud.ycx(strDj + j11 + BuildConfig.VERSION_NAME));
                jSONObject.put("req_uniq", com.bytedance.sdk.component.utils.lud.ycx(sb2.toString()));
                return this.ycx.zb(jSONObject);
            } catch (Throwable unused) {
            }
        }
        return null;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.zb.sya
    public void ycx(final List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list, final com.bytedance.sdk.component.lt.ycx.zb.zb zbVar) {
        com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar;
        if (list == null || list.isEmpty() || com.bytedance.sdk.openadsdk.core.ea.zb.ycx().lud() || (ycxVar = list.get(0)) == null) {
            return;
        }
        byte bDj = ycxVar.dj();
        final ArrayList arrayList = new ArrayList();
        if (bDj == 0) {
            yzp.lud(new com.bytedance.sdk.component.fby.zb.sya("upload_ad_event", 7) { // from class: com.bytedance.sdk.openadsdk.dj.ycx.lt.1
                @Override // java.lang.Runnable
                public void run() {
                    Iterator it;
                    try {
                        it = lt.this.dj(list).entrySet().iterator();
                    } catch (Throwable th2) {
                        htf.sya("OverSeaEventUploadImp", th2.getMessage());
                        it = null;
                    }
                    Iterator it2 = it;
                    if (it2 == null) {
                        com.bytedance.sdk.component.lt.ycx.zb.zb zbVar2 = zbVar;
                        if (zbVar2 != null) {
                            zbVar2.ycx(arrayList);
                            return;
                        }
                        return;
                    }
                    while (it2.hasNext()) {
                        try {
                            com.bytedance.sdk.openadsdk.pmi.sya.ycx(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.lt.1.1
                                @Override // com.bytedance.sdk.openadsdk.pmi.dj
                                public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                    return c9.h("applog");
                                }
                            });
                            List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list2 = (List) ((Map.Entry) it2.next()).getValue();
                            ArrayList arrayList2 = new ArrayList();
                            for (com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar2 : list2) {
                                arrayList2.add(new com.bytedance.sdk.openadsdk.dj.ycx(ycxVar2.sya(), ycxVar2.lt()));
                            }
                            com.bytedance.sdk.openadsdk.dj.lud ludVarYcx = lt.this.ycx(arrayList2);
                            if (zbVar != null && ludVarYcx != null) {
                                boolean z11 = ludVarYcx.f26525dj;
                                if (lt.this.ycx(arrayList2, ludVarYcx)) {
                                    z11 = true;
                                }
                                boolean z12 = z11;
                                arrayList.add(new com.bytedance.sdk.component.lt.ycx.zb.zb.ycx(new com.bytedance.sdk.component.lt.ycx.zb.zb.zb(ludVarYcx.ycx, ludVarYcx.f26526zb, ludVarYcx.sya, z12, b.f42142b), list2));
                                if (ludVarYcx.f26526zb == 200) {
                                    com.bytedance.sdk.openadsdk.pmi.sya.zb(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.lt.1.2
                                        @Override // com.bytedance.sdk.openadsdk.pmi.dj
                                        public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                            return c9.h("applog");
                                        }
                                    });
                                } else if (z12) {
                                    com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.lt.1.3
                                        @Override // com.bytedance.sdk.openadsdk.pmi.dj
                                        public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                            return c9.h("applog");
                                        }
                                    });
                                } else {
                                    com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.lt.1.4
                                        @Override // com.bytedance.sdk.openadsdk.pmi.dj
                                        public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                            return c9.h("applog");
                                        }
                                    });
                                }
                            }
                            if (zbVar != null && ludVarYcx == null) {
                                com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.lt.1.5
                                    @Override // com.bytedance.sdk.openadsdk.pmi.dj
                                    public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                        return c9.h("applog");
                                    }
                                });
                            }
                        } catch (Throwable th3) {
                            htf.sya("OverSeaEventUploadImp", th3.getMessage());
                        }
                    }
                    com.bytedance.sdk.component.lt.ycx.zb.zb zbVar3 = zbVar;
                    if (zbVar3 != null) {
                        zbVar3.ycx(arrayList);
                    }
                }
            });
            return;
        }
        if (bDj == 1) {
            if (com.bytedance.sdk.openadsdk.dy.sya.zb()) {
                if (zbVar != null) {
                    arrayList.add(new com.bytedance.sdk.component.lt.ycx.zb.zb.ycx(new com.bytedance.sdk.component.lt.ycx.zb.zb.zb(true, 200, b.f42142b, false, b.f42142b), list));
                    zbVar.ycx(arrayList);
                    return;
                }
                return;
            }
            final ArrayList arrayList2 = new ArrayList();
            for (com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar2 : list) {
                arrayList2.add(new dj.ycx(ycxVar2.sya(), ycxVar2.lt()));
            }
            if (arrayList2.size() > 0) {
                com.bytedance.sdk.openadsdk.pmi.sya.ycx(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.lt.2
                    @Override // com.bytedance.sdk.openadsdk.pmi.dj
                    public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                        return c9.h("stats");
                    }
                });
                yzp.lud(new com.bytedance.sdk.component.fby.zb.sya("upload_stats_event", 6) { // from class: com.bytedance.sdk.openadsdk.dj.ycx.lt.3
                    @Override // java.lang.Runnable
                    public void run() {
                        com.bytedance.sdk.openadsdk.dj.lud ludVarZb = lt.this.zb(arrayList2);
                        if (zbVar != null && ludVarZb != null) {
                            arrayList.add(new com.bytedance.sdk.component.lt.ycx.zb.zb.ycx(new com.bytedance.sdk.component.lt.ycx.zb.zb.zb(ludVarZb.ycx, ludVarZb.f26526zb, ludVarZb.sya, ludVarZb.f26525dj, b.f42142b), list));
                            zbVar.ycx(arrayList);
                            if (ludVarZb.f26526zb == 200) {
                                com.bytedance.sdk.openadsdk.pmi.sya.zb(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.lt.3.1
                                    @Override // com.bytedance.sdk.openadsdk.pmi.dj
                                    public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                        return c9.h("stats");
                                    }
                                });
                            } else if (ludVarZb.f26525dj) {
                                com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.lt.3.2
                                    @Override // com.bytedance.sdk.openadsdk.pmi.dj
                                    public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                        return c9.h("stats");
                                    }
                                });
                            } else {
                                com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.lt.3.3
                                    @Override // com.bytedance.sdk.openadsdk.pmi.dj
                                    public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                        return c9.h("stats");
                                    }
                                });
                            }
                        }
                        if (zbVar == null || ludVarZb != null) {
                            return;
                        }
                        com.bytedance.sdk.openadsdk.pmi.sya.sya(new com.bytedance.sdk.openadsdk.pmi.dj() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.lt.3.4
                            @Override // com.bytedance.sdk.openadsdk.pmi.dj
                            public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                                return c9.h("stats");
                            }
                        });
                    }
                });
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean ycx(List<com.bytedance.sdk.openadsdk.dj.ycx> list, com.bytedance.sdk.openadsdk.dj.lud ludVar) {
        int i5;
        return !sya(list) && (i5 = ludVar.f26526zb) >= 400 && i5 < 500;
    }

    public com.bytedance.sdk.openadsdk.dj.lud ycx(List<com.bytedance.sdk.openadsdk.dj.ycx> list) {
        if (this.ycx == null) {
            this.ycx = pmi.sya();
        }
        if (this.ycx == null) {
            return null;
        }
        return this.ycx.ycx(this.f26721zb.ycx(this.f26721zb.ycx(list, com.bytedance.sdk.openadsdk.dj.ycx.ycx.lt.ycx() == 3 ? 1 : -1), System.currentTimeMillis(), this.f26721zb.zb()), this.f26721zb.ycx(list), this.f26721zb.zb(list));
    }
}
