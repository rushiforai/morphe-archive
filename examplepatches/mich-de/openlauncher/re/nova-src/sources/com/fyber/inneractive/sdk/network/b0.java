package com.fyber.inneractive.sdk.network;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.util.IAlog;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Calendar;
import java.util.TimeZone;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public SharedPreferences f28691a = null;

    public static void a(Context context, String str, String str2, com.fyber.inneractive.sdk.flow.x xVar) throws JSONException {
        int i5;
        if (context == null || str == null || xVar.f28438b == null) {
            IAlog.a("Invalid report request parameters!", new Object[0]);
            return;
        }
        b0 b0Var = a0.f28688a;
        if (b0Var.f28691a == null) {
            b0Var.f28691a = context.getSharedPreferences("AutoWebActionPrefs", 0);
        }
        IAlog.e("IAautoWebActionReporter: reporting action: %s", str);
        IAlog.e("IAautoWebActionReporter: url: %s", str2);
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        if (!iAConfigManager.f27752j.f27876c) {
            IAlog.a("IAautoWebActionReporter: Report of Non user web actions disabled!", new Object[0]);
            return;
        }
        t tVar = t.MRAID_AUTO_ACTION_DETECTED;
        InneractiveAdRequest inneractiveAdRequest = xVar.f28437a;
        com.fyber.inneractive.sdk.response.e eVar = xVar.f28438b;
        JSONArray jSONArrayB = xVar.f28439c.b();
        w wVar = new w(eVar);
        wVar.f28819b = tVar;
        wVar.f28818a = inneractiveAdRequest;
        wVar.f28821d = jSONArrayB;
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("action", str);
        } catch (Exception unused) {
            IAlog.f("Got exception adding param to json object: %s, %s", "action", str);
        }
        if (!TextUtils.isEmpty(str2)) {
            try {
                jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str2);
            } catch (Exception unused2) {
                IAlog.f("Got exception adding param to json object: %s, %s", TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str2);
            }
        }
        long j11 = b0Var.f28691a.getLong("lastReportTS", 0L);
        TimeZone timeZone = TimeZone.getTimeZone("UTC");
        Calendar calendar = Calendar.getInstance(timeZone);
        Calendar calendar2 = Calendar.getInstance(timeZone);
        calendar2.setTimeInMillis(j11);
        if (j11 <= 0 || calendar.get(6) != calendar2.get(6)) {
            i5 = 0;
        } else {
            IAlog.e("IAautoWebActionReporter: encountered same date", new Object[0]);
            i5 = b0Var.f28691a.getInt("numReportsToday", 0);
        }
        int i11 = iAConfigManager.f27752j.f27877d;
        int i12 = i5 + 1;
        IAlog.e("IAautoWebActionReporter: day counter: %d max: %d", Integer.valueOf(i12), Integer.valueOf(i11));
        if (i5 < i11) {
            IAlog.e("IAautoWebActionReporter: adding ad data", new Object[0]);
            wVar.f28824g = true;
        } else {
            IAlog.e("IAautoWebActionReporter: not adding ad data", new Object[0]);
        }
        Integer numValueOf = Integer.valueOf(i12);
        try {
            jSONObject.put("daily_count", numValueOf);
        } catch (Exception unused3) {
            IAlog.f("Got exception adding param to json object: %s, %s", "daily_count", numValueOf);
        }
        wVar.f28823f.put(jSONObject);
        wVar.a((String) null);
        SharedPreferences.Editor editorEdit = b0Var.f28691a.edit();
        editorEdit.putLong("lastReportTS", calendar.getTimeInMillis());
        editorEdit.putInt("numReportsToday", i12);
        editorEdit.apply();
    }
}
