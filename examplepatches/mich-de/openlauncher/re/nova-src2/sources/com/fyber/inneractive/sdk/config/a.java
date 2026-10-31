package com.fyber.inneractive.sdk.config;

import com.fyber.inneractive.sdk.util.IAlog;
import com.tiktok.util.UrlConst;
import java.util.HashMap;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public abstract class a {
    public static w0 a(String str) {
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        HashMap map = iAConfigManager.f27744b;
        if (map != null && map.containsKey(str)) {
            return (w0) iAConfigManager.f27744b.get(str);
        }
        IAlog.c("Requested unit config doesn't exists - %s", str);
        return null;
    }

    public static String a(String str, String str2) {
        if (Pattern.compile("^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.([01]?\\d\\d?|2[0-4]\\d|25[0-5])$").matcher(str).matches()) {
            return b.c0.m(UrlConst.HTTPS, str, "/simpleM2M/", str2);
        }
        return b.c0.m(UrlConst.HTTPS, str, ".inner-active.mobi/simpleM2M/", str2);
    }
}
