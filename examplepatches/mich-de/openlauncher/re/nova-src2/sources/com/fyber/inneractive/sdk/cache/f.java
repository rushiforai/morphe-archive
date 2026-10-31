package com.fyber.inneractive.sdk.cache;

import com.fyber.inneractive.sdk.config.r;
import com.fyber.inneractive.sdk.util.IAlog;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class f implements a {
    @Override // com.fyber.inneractive.sdk.cache.a
    public final /* bridge */ /* synthetic */ void a(Object obj) {
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String b() {
        return "IALastModifiedFromHeader.global";
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String c() {
        return "ia-global.config";
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final boolean d() {
        return true;
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final Object a(String str) throws JSONException {
        try {
            return r.a(new JSONObject(str));
        } catch (JSONException e3) {
            IAlog.b("internal error while parsing global config file", new Object[0]);
            throw e3;
        }
    }

    @Override // com.fyber.inneractive.sdk.cache.a
    public final String a() {
        int i5 = com.fyber.inneractive.sdk.config.n.f27870a;
        if (System.getProperty("ia.testEnvironmentConfiguration.globalConfigUrl") == null) {
            return "https://cdn2.inner-active.mobi/ia-sdk-config/config_android.json";
        }
        return System.getProperty("ia.testEnvironmentConfiguration.globalConfigUrl");
    }
}
