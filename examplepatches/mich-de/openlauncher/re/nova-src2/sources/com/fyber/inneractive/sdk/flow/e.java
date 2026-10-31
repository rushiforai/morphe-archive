package com.fyber.inneractive.sdk.flow;

import android.app.Application;
import android.content.SharedPreferences;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Collection;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class e implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ InneractiveInfrastructureError f28050a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f f28051b;

    public e(f fVar, InneractiveInfrastructureError inneractiveInfrastructureError) {
        this.f28051b = fVar;
        this.f28050a = inneractiveInfrastructureError;
    }

    @Override // java.lang.Runnable
    public final void run() throws JSONException {
        String str;
        String string;
        com.fyber.inneractive.sdk.response.e eVar = this.f28051b.f28142b;
        if (eVar == null || (str = eVar.f31049h) == null) {
            return;
        }
        Map map = eVar.f31055p;
        if (map == null && eVar.f31056q == null) {
            return;
        }
        com.fyber.inneractive.sdk.config.r rVar = IAConfigManager.Q.f27761u.f27936b;
        String strA = rVar.a("max_failed_creatives_interval_hours", f.f28140e);
        String strA2 = rVar.a("max_failed_creatives_per_interval", f.f28141f);
        int iA = com.fyber.inneractive.sdk.util.v.a(strA, 24);
        int iA2 = com.fyber.inneractive.sdk.util.v.a(strA2, 1);
        Application application = com.fyber.inneractive.sdk.util.o.f31210a;
        if (application != null) {
            SharedPreferences sharedPreferences = application.getSharedPreferences("IAConfigPrefs", 0);
            JSONArray jSONArray = new JSONArray();
            try {
                jSONArray = new JSONArray(sharedPreferences.getString("lt", "[]"));
            } catch (JSONException unused) {
            }
            CopyOnWriteArrayList copyOnWriteArrayList = new CopyOnWriteArrayList();
            if (rVar.a(false, this.f28051b.f28532a) && !com.fyber.inneractive.sdk.metrics.a.a(iA, iA2, jSONArray, copyOnWriteArrayList)) {
                copyOnWriteArrayList.add(Long.valueOf(System.currentTimeMillis()));
                if (map != null) {
                    try {
                        string = new JSONObject(map).toString();
                    } catch (Throwable unused2) {
                        string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    }
                } else {
                    string = this.f28051b.f28142b.f31056q;
                }
                f fVar = this.f28051b;
                InneractiveAdRequest inneractiveAdRequest = fVar.f28143c;
                com.fyber.inneractive.sdk.response.e eVar2 = fVar.f28142b;
                InneractiveInfrastructureError inneractiveInfrastructureError = this.f28050a;
                JSONArray jSONArray2 = fVar.f28144d;
                com.fyber.inneractive.sdk.network.t tVar = com.fyber.inneractive.sdk.network.t.IA_AD_FAILURE_DATA;
                com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(eVar2);
                wVar.f28819b = tVar;
                wVar.f28818a = inneractiveAdRequest;
                wVar.f28821d = jSONArray2;
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("raw_response", str);
                } catch (Exception unused3) {
                    IAlog.f("Got exception adding param to json object: %s, %s", "raw_response", str);
                }
                try {
                    jSONObject.put("headers", string);
                } catch (Exception unused4) {
                    IAlog.f("Got exception adding param to json object: %s, %s", "headers", string);
                }
                String strDescription = inneractiveInfrastructureError.description();
                try {
                    jSONObject.put("error_code", strDescription);
                } catch (Exception unused5) {
                    IAlog.f("Got exception adding param to json object: %s, %s", "error_code", strDescription);
                }
                wVar.f28823f.put(jSONObject);
                wVar.a((String) null);
            }
            sharedPreferences.edit().putString("lt", new JSONArray((Collection) copyOnWriteArrayList).toString()).apply();
        }
    }
}
