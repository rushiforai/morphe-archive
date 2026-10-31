package com.fyber.inneractive.sdk.network;

import android.os.Build;
import android.text.TextUtils;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.tiktok.util.UrlConst;
import java.security.InvalidParameterException;
import java.util.HashMap;

/* loaded from: classes3.dex */
public final class y {

    /* renamed from: a, reason: collision with root package name */
    public final String f28829a;

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f28830b;

    /* renamed from: c, reason: collision with root package name */
    public String f28831c;

    public y(String str, String str2, String str3, Long l9, String str4, String str5, String str6, String str7) {
        String strA;
        int i5 = com.fyber.inneractive.sdk.config.n.f27870a;
        String property = System.getProperty("ia.testEnvironmentConfiguration.name");
        if (TextUtils.isEmpty(property)) {
            strA = UrlConst.HTTPS + IAConfigManager.Q.f27752j.f27879f;
        } else {
            strA = com.fyber.inneractive.sdk.config.a.a(property, "Event");
        }
        this.f28831c = null;
        if (TextUtils.isEmpty(strA)) {
            throw new InvalidParameterException();
        }
        this.f28830b = new HashMap();
        this.f28829a = strA;
        a(str7 == null ? "8.4.7" : str7, "sdkv");
        a(com.fyber.inneractive.sdk.util.o.f31210a.getPackageName(), "pkgn");
        if (IAConfigManager.c()) {
            return;
        }
        a(AndroidContextPlugin.PLATFORM, "osn");
        a(Build.VERSION.RELEASE, com.moloco.sdk.acm.b.f36015c);
        a(com.fyber.inneractive.sdk.util.k.g(), "model");
        a(com.fyber.inneractive.sdk.util.k.i(), "pkgv");
        a(str, "appid");
        a(str2, "session");
        a(str3, "adnt");
        a(l9, "adnt_id");
        a(str4, "creative_id");
        a(str5, "adomain");
        a(str6, "campaign_id");
    }

    public final void a(Object obj, String str) {
        if (TextUtils.isEmpty(str) || obj == null) {
            return;
        }
        this.f28830b.put(str, obj);
    }
}
