package com.bykv.vk.openvk.preload.geckox;

import android.os.SystemClock;
import android.text.TextUtils;
import com.bykv.vk.openvk.preload.a.d;
import com.bykv.vk.openvk.preload.geckox.logger.GeckoLogger;
import com.bykv.vk.openvk.preload.geckox.model.CheckRequestBodyModel;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.concurrent.LinkedBlockingQueue;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    private com.bykv.vk.openvk.preload.falconx.a.a f21975a;

    /* renamed from: b, reason: collision with root package name */
    private Queue<String> f21976b;

    /* renamed from: c, reason: collision with root package name */
    private b f21977c;

    /* renamed from: d, reason: collision with root package name */
    private File f21978d;

    private a(b bVar) {
        new ArrayList();
        this.f21975a = new com.bykv.vk.openvk.preload.falconx.a.a();
        this.f21976b = new LinkedBlockingQueue();
        this.f21977c = bVar;
        File fileN = bVar.n();
        this.f21978d = fileN;
        fileN.mkdirs();
        com.bykv.vk.openvk.preload.geckox.statistic.b.a(this, this.f21977c);
    }

    public static /* synthetic */ void d(a aVar) {
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(aVar.f21977c.e());
        try {
            String strA = new com.bykv.vk.openvk.preload.geckox.a.a(arrayList).a();
            if (aVar.f21977c.p() != null && aVar.f21977c.p().a()) {
                aVar.f21977c.p();
            } else if (aVar.f21976b.size() < 10) {
                aVar.f21976b.add(strA);
            }
        } catch (Throwable unused) {
        }
    }

    public static a a(b bVar) {
        List<String> listE = bVar.e();
        if (listE == null || listE.isEmpty()) {
            throw new IllegalArgumentException("access key empty");
        }
        bVar.a();
        return new a(bVar);
    }

    private boolean b(Map<String, List<CheckRequestBodyModel.TargetChannel>> map) {
        if (map != null && !map.isEmpty()) {
            List<String> listE = this.f21977c.e();
            for (Map.Entry<String, List<CheckRequestBodyModel.TargetChannel>> entry : map.entrySet()) {
                Iterator<String> it = listE.iterator();
                boolean z11 = false;
                while (it.hasNext()) {
                    if (TextUtils.equals(it.next(), entry.getKey())) {
                        z11 = true;
                    }
                }
                if (!z11) {
                    return false;
                }
            }
        }
        return true;
    }

    private boolean a() {
        List<String> listD = this.f21977c.d();
        List<String> listE = this.f21977c.e();
        if (listD == null || listD.isEmpty() || listE == null || listE.isEmpty()) {
            return false;
        }
        for (String str : listE) {
            Iterator<String> it = listD.iterator();
            boolean z11 = false;
            while (it.hasNext()) {
                if (TextUtils.equals(str, it.next())) {
                    z11 = true;
                }
            }
            if (!z11) {
                return false;
            }
        }
        return true;
    }

    public final void a(Class<? extends d<?, ?>> cls, com.bykv.vk.openvk.preload.a.b.a aVar) {
        this.f21975a.a(cls, aVar);
    }

    public final void a(final Map<String, List<CheckRequestBodyModel.TargetChannel>> map) {
        final String str = CarrierConfigurator.APN_TYPE;
        if (!TextUtils.isEmpty(CarrierConfigurator.APN_TYPE)) {
            if (a()) {
                if (b(map)) {
                    final com.bykv.vk.openvk.preload.geckox.d.a aVar = null;
                    final Map map2 = null;
                    b.h().execute(new Runnable() { // from class: com.bykv.vk.openvk.preload.geckox.a.1
                        @Override // java.lang.Runnable
                        public final void run() {
                            com.bykv.vk.openvk.preload.geckox.a.a.b bVarA;
                            GeckoLogger.d("gecko-debug-tag", "start check update...", str);
                            if (a.this.f21977c.b() != null) {
                                bVarA = a.this.f21977c.b().a();
                                bVarA.a(a.this.f21977c.b(), a.this.f21977c.n(), a.this.f21977c.e());
                            } else {
                                bVarA = null;
                            }
                            com.bykv.vk.openvk.preload.geckox.a.a.b bVar = bVarA;
                            try {
                                try {
                                    a.this.f21977c.a(new JSONObject());
                                    GeckoLogger.d("gecko-debug-tag", "update finished", com.bykv.vk.openvk.preload.geckox.g.a.a(aVar, a.this.f21978d, a.this.f21977c, a.this.f21975a, map2, map, str).a((com.bykv.vk.openvk.preload.a.b<Object>) str));
                                    if (bVar != null) {
                                        bVar.a();
                                    }
                                    JSONObject jSONObjectF = a.this.f21977c.f();
                                    if (jSONObjectF == null) {
                                        jSONObjectF = new JSONObject();
                                    }
                                    try {
                                        jSONObjectF.put("download_duration", SystemClock.elapsedRealtime() - a.this.f21977c.s());
                                    } catch (Throwable unused) {
                                    }
                                    a.this.f21977c.q().upload("download_gecko_end", jSONObjectF);
                                    GeckoLogger.d("gecko-debug-tag", "all channel update finished");
                                } catch (Exception e3) {
                                    try {
                                        JSONObject jSONObject = new JSONObject();
                                        jSONObject.put("success", false);
                                        jSONObject.put("msg", e3.toString());
                                        jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, 2);
                                        a.this.f21977c.a(jSONObject);
                                    } catch (Throwable unused2) {
                                    }
                                    GeckoLogger.w("gecko-debug-tag", "Gecko update failed:", e3);
                                    if (bVar != null) {
                                        bVar.a();
                                    }
                                    JSONObject jSONObjectF2 = a.this.f21977c.f();
                                    if (jSONObjectF2 == null) {
                                        jSONObjectF2 = new JSONObject();
                                    }
                                    try {
                                        jSONObjectF2.put("download_duration", SystemClock.elapsedRealtime() - a.this.f21977c.s());
                                    } catch (Throwable unused3) {
                                    }
                                    a.this.f21977c.q().upload("download_gecko_end", jSONObjectF2);
                                    GeckoLogger.d("gecko-debug-tag", "all channel update finished");
                                }
                                a.d(a.this);
                            } catch (Throwable th2) {
                                if (bVar != null) {
                                    bVar.a();
                                }
                                JSONObject jSONObjectF3 = a.this.f21977c.f();
                                if (jSONObjectF3 == null) {
                                    jSONObjectF3 = new JSONObject();
                                }
                                try {
                                    jSONObjectF3.put("download_duration", SystemClock.elapsedRealtime() - a.this.f21977c.s());
                                } catch (Throwable unused4) {
                                }
                                a.this.f21977c.q().upload("download_gecko_end", jSONObjectF3);
                                GeckoLogger.d("gecko-debug-tag", "all channel update finished");
                                throw th2;
                            }
                        }
                    });
                    return;
                }
                throw new IllegalArgumentException("target keys not in deployments keys");
            }
            throw new IllegalArgumentException("deployments keys not in local keys");
        }
        throw new IllegalArgumentException("groupType == null");
    }
}
