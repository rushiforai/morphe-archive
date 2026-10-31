package com.fyber.inneractive.sdk.metrics;

import android.app.Application;
import android.content.SharedPreferences;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.config.r;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.network.u;
import com.fyber.inneractive.sdk.network.w;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.o;
import com.fyber.inneractive.sdk.util.v;
import java.util.Collection;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class b implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ g f28533a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Map f28534b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ c f28535c;

    public b(c cVar, g gVar, Map map) {
        this.f28535c = cVar;
        this.f28533a = gVar;
        this.f28534b = map;
    }

    @Override // java.lang.Runnable
    public final void run() throws JSONException {
        UnitDisplayType unitDisplayType;
        int iA;
        int iA2;
        String str;
        IAlog.a("MetricCreativeReporter: sendMetricEvent()", new Object[0]);
        c cVar = this.f28535c;
        UnitDisplayType unitDisplayType2 = cVar.f28541c;
        if (unitDisplayType2 == null || !(unitDisplayType2 == (unitDisplayType = UnitDisplayType.BANNER) || unitDisplayType2 == UnitDisplayType.MRECT || unitDisplayType2.isFullscreenUnit())) {
            UnitDisplayType unitDisplayType3 = cVar.f28541c;
            IAlog.a("Unit display type %s is not supported for metric event", unitDisplayType3 != null ? unitDisplayType3.value() : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            return;
        }
        IAlog.a("MetricCreativeReporter: sendMetricEvent(), collectorData: data: %s", this.f28533a.toString());
        r rVar = IAConfigManager.Q.f27761u.f27936b;
        UnitDisplayType unitDisplayType4 = this.f28535c.f28541c;
        if (unitDisplayType4 == unitDisplayType || unitDisplayType4 == UnitDisplayType.MRECT) {
            String strA = rVar.a("ad_metrics_interval_banner", c.f28536g);
            String strA2 = rVar.a("ad_metrics_limit_banner", c.f28537h);
            iA = v.a(strA, 24);
            iA2 = v.a(strA2, 3);
            str = "LastSentMetricsBanner";
        } else {
            String strA3 = rVar.a("ad_metrics_interval_interstitial", c.f28538i);
            String strA4 = rVar.a("ad_metrics_limit_interstitial", c.f28539j);
            iA = v.a(strA3, 24);
            iA2 = v.a(strA4, 3);
            str = "LastSentMetricsInterstitial";
        }
        Application application = o.f31210a;
        if (application != null) {
            SharedPreferences sharedPreferences = application.getSharedPreferences("IAConfigPrefs", 0);
            JSONArray jSONArray = new JSONArray();
            try {
                jSONArray = new JSONArray(sharedPreferences.getString(str, "[]"));
            } catch (JSONException unused) {
            }
            CopyOnWriteArrayList copyOnWriteArrayList = new CopyOnWriteArrayList();
            if (rVar.a(false, this.f28535c.f28532a) && !a.a(iA, iA2, jSONArray, copyOnWriteArrayList)) {
                copyOnWriteArrayList.add(Long.valueOf(System.currentTimeMillis()));
                c cVar2 = this.f28535c;
                InneractiveAdRequest inneractiveAdRequest = cVar2.f28543e;
                com.fyber.inneractive.sdk.response.e eVar = cVar2.f28542d;
                Map map = this.f28534b;
                try {
                    u uVar = u.METRIC_MEASUREMENTS_EVENT;
                    JSONArray jSONArray2 = cVar2.f28544f;
                    w wVar = new w(eVar);
                    wVar.f28820c = uVar;
                    wVar.f28818a = inneractiveAdRequest;
                    wVar.f28821d = jSONArray2;
                    JSONObject jSONObject = new JSONObject();
                    for (String str2 : map.keySet()) {
                        Object obj = map.get(str2);
                        try {
                            jSONObject.put(str2, obj);
                        } catch (Exception unused2) {
                            IAlog.f("Got exception adding param to json object: %s, %s", str2, obj);
                        }
                    }
                    wVar.f28823f.put(jSONObject);
                    wVar.a((String) null);
                } catch (Exception unused3) {
                }
            }
            sharedPreferences.edit().putString(str, new JSONArray((Collection) copyOnWriteArrayList).toString()).apply();
        }
    }
}
