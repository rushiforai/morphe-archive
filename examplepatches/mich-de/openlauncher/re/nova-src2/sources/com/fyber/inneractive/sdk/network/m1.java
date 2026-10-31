package com.fyber.inneractive.sdk.network;

import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.util.IAlog;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.io.PrintWriter;
import java.io.StringWriter;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class m1 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ n1 f28752a;

    public m1(n1 n1Var) {
        this.f28752a = n1Var;
    }

    @Override // java.lang.Runnable
    public final void run() throws JSONException {
        String string;
        n1 n1Var = this.f28752a;
        t0 t0Var = (t0) com.fyber.inneractive.sdk.util.v.a(n1Var.f28754b);
        Thread thread = (Thread) com.fyber.inneractive.sdk.util.v.a(this.f28752a.f28753a);
        if (t0Var == null || t0Var.f28782f == i1.DONE || t0Var.f28782f == i1.RESOLVED) {
            return;
        }
        boolean zV = t0Var.v();
        IAlog.a("%s : NetworkWatchdogHolder : should report: %s", IAlog.a(n1.class), Boolean.valueOf(zV));
        if (zV) {
            if (thread != null) {
                StackTraceElement[] stackTrace = thread.getStackTrace();
                Exception exc = new Exception();
                exc.setStackTrace(stackTrace);
                StringWriter stringWriter = new StringWriter();
                exc.printStackTrace(new PrintWriter(stringWriter));
                string = stringWriter.getBuffer().toString();
            } else {
                string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            String strR = t0Var.r();
            InneractiveAdRequest inneractiveAdRequest = t0Var instanceof q0 ? ((q0) t0Var).f28763q : null;
            com.fyber.inneractive.sdk.response.e eVar = t0Var instanceof f1 ? ((f1) t0Var).f28719t : null;
            u uVar = u.NETWORK_REQUEST_PASSED_ALLOWED_TIME;
            JSONArray jSONArrayB = t0Var.k() != null ? t0Var.k().b() : null;
            w wVar = new w(eVar);
            wVar.f28820c = uVar;
            wVar.f28818a = inneractiveAdRequest;
            wVar.f28821d = jSONArrayB;
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, strR);
            } catch (Exception unused) {
                IAlog.f("Got exception adding param to json object: %s, %s", TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, strR);
            }
            try {
                jSONObject.put("stack_trace", string);
            } catch (Exception unused2) {
                IAlog.f("Got exception adding param to json object: %s, %s", "stack_trace", string);
            }
            Integer numValueOf = Integer.valueOf(n1Var.f28755c);
            try {
                jSONObject.put("total_time", numValueOf);
            } catch (Exception unused3) {
                IAlog.f("Got exception adding param to json object: %s, %s", "total_time", numValueOf);
            }
            wVar.f28823f.put(jSONObject);
            wVar.a((String) null);
        }
        IAlog.a("%s : NetworkWatchdogHolder should cancel by timeout: %d", IAlog.a(n1Var), Integer.valueOf(n1Var.f28755c));
        t0Var.d();
    }
}
