package com.bykv.vk.openvk.preload.falconx.a;

import android.text.TextUtils;
import android.util.Log;
import android.webkit.WebResourceResponse;
import com.bykv.vk.openvk.preload.a.b.b;
import com.bykv.vk.openvk.preload.a.d;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    private final Map<Class<? extends d<?, ?>>, b> f21970a = new HashMap();

    public static WebResourceResponse a(InputStream inputStream, Map<String, String> map) {
        if (inputStream == null) {
            return null;
        }
        try {
            String strReplace = map.get("content-type");
            String[] strArrSplit = new String[0];
            if (TextUtils.isEmpty(strReplace)) {
                strReplace = map.get("Content-Type");
            }
            if (!TextUtils.isEmpty(strReplace) && strReplace != null) {
                strReplace = strReplace.replace(" ", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                strArrSplit = strReplace.split(";");
            }
            String str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            String strSubstring = str;
            for (String str2 : strArrSplit) {
                if (!TextUtils.isEmpty(str2)) {
                    int iIndexOf = str2.indexOf("=");
                    if (iIndexOf == -1) {
                        str = str2;
                    } else if (str2.contains("charset")) {
                        strSubstring = str2.substring(iIndexOf + 1);
                    }
                }
            }
            if (strReplace != null ? strReplace.contains("font/ttf") : false) {
                return new WebResourceResponse(str, strSubstring, 200, "OK", map, inputStream);
            }
            WebResourceResponse webResourceResponse = new WebResourceResponse(str, strSubstring, inputStream);
            webResourceResponse.setResponseHeaders(map);
            return webResourceResponse;
        } catch (Throwable th2) {
            Log.e("WebResourceUtils", "getResponseWithHeaders error", th2);
            return null;
        }
    }

    public static <T> T a(JSONObject jSONObject, String str, Class<T> cls) {
        Object objOpt;
        if (jSONObject.has(str) && (objOpt = jSONObject.opt(str)) != null && objOpt != JSONObject.NULL) {
            try {
                if (cls == Double.class) {
                    if (objOpt instanceof Double) {
                        return (T) ((Double) objOpt);
                    }
                    if (objOpt instanceof Number) {
                        return (T) Double.valueOf(((Number) objOpt).doubleValue());
                    }
                    return null;
                }
                if (cls == Integer.class) {
                    if (objOpt instanceof Integer) {
                        return (T) ((Integer) objOpt);
                    }
                    if (objOpt instanceof Number) {
                        return (T) Integer.valueOf(((Number) objOpt).intValue());
                    }
                    return null;
                }
                if (cls == Long.class) {
                    if (objOpt instanceof Long) {
                        return (T) ((Long) objOpt);
                    }
                    if (objOpt instanceof Number) {
                        return (T) Long.valueOf(((Number) objOpt).longValue());
                    }
                    return null;
                }
                if (cls == String.class) {
                    if (objOpt instanceof String) {
                        return (T) ((String) objOpt);
                    }
                    return null;
                }
                if (cls == Boolean.class && (objOpt instanceof Boolean)) {
                    return (T) ((Boolean) objOpt);
                }
            } catch (Throwable unused) {
            }
        }
        return null;
    }

    public final void a(Class<? extends d<?, ?>> cls, com.bykv.vk.openvk.preload.a.b.a aVar) {
        synchronized (this.f21970a) {
            try {
                b bVar = this.f21970a.get(cls);
                if (bVar == null) {
                    bVar = new b(new com.bykv.vk.openvk.preload.a.b.a[0]);
                    this.f21970a.put(cls, bVar);
                }
                bVar.a(aVar);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final com.bykv.vk.openvk.preload.a.b.a a(Class<? extends d<?, ?>> cls) {
        b bVar;
        synchronized (this.f21970a) {
            bVar = this.f21970a.get(cls);
        }
        return bVar;
    }
}
