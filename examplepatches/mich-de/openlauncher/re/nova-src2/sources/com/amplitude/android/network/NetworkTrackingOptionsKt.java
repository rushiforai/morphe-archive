package com.amplitude.android.network;

import com.amplitude.android.network.NetworkTrackingOptions;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.c;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONObject;
import r70.j;

@Metadata(d1 = {"\u0000B\n\u0000\n\u0002\u0010\"\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0000\u001a\u0014\u0010\b\u001a\u0004\u0018\u00010\t2\b\u0010\n\u001a\u0004\u0018\u00010\tH\u0002\u001a\u0018\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\f2\u0006\u0010\r\u001a\u00020\u000eH\u0002\u001a\u001e\u0010\u000f\u001a\u0010\u0012\u0004\u0012\u00020\u0002\u0012\u0006\u0012\u0004\u0018\u00010\t0\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0002\u001a6\u0010\u0013\u001a\u0004\u0018\u00010\u0014*\b\u0012\u0004\u0012\u00020\u00140\f2\u0006\u0010\u0015\u001a\u00020\u00022\u0006\u0010\u0016\u001a\u00020\u00022\b\u0010\u0017\u001a\u0004\u0018\u00010\u00022\u0006\u0010\u0018\u001a\u00020\u0019H\u0000\u001a\f\u0010\u001a\u001a\u00020\u001b*\u00020\u0002H\u0000\"\u001a\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0003\u0010\u0004\"\u001a\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0004\"\u000e\u0010\u0007\u001a\u00020\u0002X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u001c"}, d2 = {"BLOCK_HEADERS", b.f42142b, b.f42142b, "getBLOCK_HEADERS", "()Ljava/util/Set;", "SAFE_HEADERS", "getSAFE_HEADERS", "STAR_WILDCARD", "convertJsonValue", b.f42142b, "value", "jsonArrayToList", b.f42142b, "arr", "Lorg/json/JSONArray;", "jsonObjectToMap", b.f42142b, "obj", "Lorg/json/JSONObject;", "findMatchingRule", "Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureRule;", "host", TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, "method", "responseCode", b.f42142b, "isAmplitudeHost", b.f42142b, "android_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class NetworkTrackingOptionsKt {

    @NotNull
    private static final String STAR_WILDCARD = "*";

    @NotNull
    private static final Set<String> SAFE_HEADERS = c.f1(new String[]{"access-control-allow-origin", "access-control-allow-credentials", "access-control-expose-headers", "access-control-max-age", "access-control-allow-methods", "access-control-allow-headers", "accept-patch", "accept-ranges", InneractiveMediationDefs.KEY_AGE, "allow", "alt-svc", "cache-control", "connection", "content-disposition", "content-encoding", "content-language", "content-length", "content-location", "content-md5", "content-range", "content-type", "date", "delta-base", "etag", "expires", "im", "last-modified", "link", "location", "permanent", "p3p", "pragma", "proxy-authenticate", "public-key-pins", "retry-after", "server", "status", "strict-transport-security", "trailer", "transfer-encoding", "tk", "upgrade", "vary", "via", "warning", "www-authenticate", "x-b3-traceid", "x-frame-options"});

    @NotNull
    private static final Set<String> BLOCK_HEADERS = c.f1(new String[]{"authorization", "cookie", "proxy-authorization"});

    private static final Object convertJsonValue(Object obj) {
        if (obj instanceof JSONObject) {
            return jsonObjectToMap((JSONObject) obj);
        }
        if (obj instanceof JSONArray) {
            return jsonArrayToList((JSONArray) obj);
        }
        if (Intrinsics.b(obj, JSONObject.NULL)) {
            return null;
        }
        return obj;
    }

    @Nullable
    public static final NetworkTrackingOptions.CaptureRule findMatchingRule(@NotNull List<NetworkTrackingOptions.CaptureRule> list, @NotNull String host, @NotNull String url, @Nullable String str, int i5) {
        NetworkTrackingOptions.CaptureRule captureRulePrevious;
        Intrinsics.g(list, "<this>");
        Intrinsics.g(host, "host");
        Intrinsics.g(url, "url");
        ListIterator<NetworkTrackingOptions.CaptureRule> listIterator = list.listIterator(list.size());
        while (true) {
            if (!listIterator.hasPrevious()) {
                captureRulePrevious = null;
                break;
            }
            captureRulePrevious = listIterator.previous();
            if (captureRulePrevious.matchesRequest$android_release(host, url, str)) {
                break;
            }
        }
        NetworkTrackingOptions.CaptureRule captureRule = captureRulePrevious;
        if (captureRule != null && captureRule.getStatusCodeRange().contains(Integer.valueOf(i5))) {
            return captureRule;
        }
        return null;
    }

    @NotNull
    public static final Set<String> getBLOCK_HEADERS() {
        return BLOCK_HEADERS;
    }

    @NotNull
    public static final Set<String> getSAFE_HEADERS() {
        return SAFE_HEADERS;
    }

    public static final boolean isAmplitudeHost(@NotNull String str) {
        Intrinsics.g(str, "<this>");
        String lowerCase = str.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        return lowerCase.equals("amplitude.com") || j.A0(lowerCase, ".amplitude.com", false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final List<Object> jsonArrayToList(JSONArray jSONArray) {
        ArrayList arrayList = new ArrayList();
        int length = jSONArray.length();
        for (int i5 = 0; i5 < length; i5++) {
            arrayList.add(convertJsonValue(jSONArray.get(i5)));
        }
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Map<String, Object> jsonObjectToMap(JSONObject jSONObject) {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Iterator<String> itKeys = jSONObject.keys();
        Intrinsics.f(itKeys, "keys(...)");
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            Intrinsics.d(next);
            linkedHashMap.put(next, convertJsonValue(jSONObject.get(next)));
        }
        return linkedHashMap;
    }
}
