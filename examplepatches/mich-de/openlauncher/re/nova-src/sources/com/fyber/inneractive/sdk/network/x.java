package com.fyber.inneractive.sdk.network;

import com.fyber.inneractive.sdk.util.IAlog;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class x {

    /* renamed from: a, reason: collision with root package name */
    public final JSONObject f28825a = new JSONObject();

    public final x a(Object obj, String str) throws JSONException {
        try {
            this.f28825a.put(str, obj);
            return this;
        } catch (Exception unused) {
            IAlog.f("Got exception adding param to json object: %s, %s", str, obj);
            return this;
        }
    }
}
