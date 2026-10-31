package com.fyber.inneractive.sdk.network;

import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.util.IAlog;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.io.PrintWriter;
import java.io.StringWriter;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public abstract class z {
    public static boolean a(String str, String str2, InneractiveAdRequest inneractiveAdRequest, com.fyber.inneractive.sdk.response.e eVar) {
        w wVar = new w(u.CAUGHT_EXCEPTION, inneractiveAdRequest, eVar);
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("exception_name", str);
        } catch (Exception unused) {
            IAlog.f("Got exception adding param to json object: %s, %s", "exception_name", str);
        }
        try {
            jSONObject.put(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, str2);
        } catch (Exception unused2) {
            IAlog.f("Got exception adding param to json object: %s, %s", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, str2);
        }
        wVar.f28823f.put(jSONObject);
        return wVar.a((String) null);
    }

    public static void a(Throwable th2, InneractiveAdRequest inneractiveAdRequest, com.fyber.inneractive.sdk.response.e eVar) {
        StringWriter stringWriter = new StringWriter();
        th2.printStackTrace(new PrintWriter(stringWriter));
        String string = stringWriter.getBuffer().toString();
        w wVar = new w(u.CAUGHT_EXCEPTION, inneractiveAdRequest, eVar);
        JSONObject jSONObject = new JSONObject();
        String string2 = th2.getClass().toString();
        try {
            jSONObject.put("exception_name", string2);
        } catch (Exception unused) {
            IAlog.f("Got exception adding param to json object: %s, %s", "exception_name", string2);
        }
        String message = th2.getMessage();
        try {
            jSONObject.put(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, message);
        } catch (Exception unused2) {
            IAlog.f("Got exception adding param to json object: %s, %s", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, message);
        }
        try {
            jSONObject.put("stack_trace", string);
        } catch (Exception unused3) {
            IAlog.f("Got exception adding param to json object: %s, %s", "stack_trace", string);
        }
        wVar.f28823f.put(jSONObject);
        wVar.a((String) null);
    }
}
