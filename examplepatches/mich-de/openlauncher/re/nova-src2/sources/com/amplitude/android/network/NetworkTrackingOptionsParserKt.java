package com.amplitude.android.network;

import b70.c;
import b70.d;
import com.amplitude.android.network.NetworkTrackingOptions;
import com.amplitude.core.events.Identify;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.ranges.IntRange;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u00006\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\u001a\"\u0010\u0000\u001a\u0004\u0018\u00010\u00012\u0016\u0010\u0002\u001a\u0012\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u0005\u0018\u00010\u0003H\u0002\u001a\"\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u0016\u0010\u0002\u001a\u0012\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u0005\u0018\u00010\u0003H\u0002\u001a,\u0010\b\u001a\n\u0012\u0004\u0012\u00020\n\u0018\u00010\t2\u001a\u0010\u000b\u001a\u0016\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u00030\tH\u0000\u001a\u0016\u0010\f\u001a\b\u0012\u0004\u0012\u00020\r0\t2\u0006\u0010\u000e\u001a\u00020\u0004H\u0000\u001a$\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u00100\t2\u0014\u0010\u0002\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0003H\u0002¨\u0006\u0011"}, d2 = {"parseCaptureBody", "Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureBody;", "map", b.f42142b, b.f42142b, b.f42142b, "parseCaptureHeader", "Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureHeader;", "parseCaptureRulesFromRemoteConfig", b.f42142b, "Lcom/amplitude/android/network/NetworkTrackingOptions$CaptureRule;", "configs", "parseStatusCodeRange", b.f42142b, "rangeString", "parseUrlPatterns", "Lcom/amplitude/android/network/NetworkTrackingOptions$URLPattern;", "android_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class NetworkTrackingOptionsParserKt {
    private static final NetworkTrackingOptions.CaptureBody parseCaptureBody(Map<String, ? extends Object> map) {
        List arrayList;
        List arrayList2;
        if (map == null) {
            return null;
        }
        Object obj = map.get("allowlist");
        List list = obj instanceof List ? (List) obj : null;
        if (list != null) {
            arrayList = new ArrayList();
            for (Object obj2 : list) {
                if (obj2 instanceof String) {
                    arrayList.add(obj2);
                }
            }
        } else {
            arrayList = EmptyList.f71733a;
        }
        Object obj3 = map.get("excludelist");
        List list2 = obj3 instanceof List ? (List) obj3 : null;
        if (list2 != null) {
            arrayList2 = new ArrayList();
            for (Object obj4 : list2) {
                if (obj4 instanceof String) {
                    arrayList2.add(obj4);
                }
            }
        } else {
            arrayList2 = EmptyList.f71733a;
        }
        return new NetworkTrackingOptions.CaptureBody(arrayList, arrayList2);
    }

    private static final NetworkTrackingOptions.CaptureHeader parseCaptureHeader(Map<String, ? extends Object> map) {
        List arrayList;
        if (map == null) {
            return null;
        }
        Object obj = map.get("allowlist");
        List list = obj instanceof List ? (List) obj : null;
        if (list != null) {
            arrayList = new ArrayList();
            for (Object obj2 : list) {
                if (obj2 instanceof String) {
                    arrayList.add(obj2);
                }
            }
        } else {
            arrayList = EmptyList.f71733a;
        }
        Object obj3 = map.get("captureSafeHeaders");
        Boolean bool = obj3 instanceof Boolean ? (Boolean) obj3 : null;
        return new NetworkTrackingOptions.CaptureHeader(arrayList, bool != null ? bool.booleanValue() : true);
    }

    @Nullable
    public static final List<NetworkTrackingOptions.CaptureRule> parseCaptureRulesFromRemoteConfig(@NotNull List<? extends Map<String, ? extends Object>> configs) {
        List arrayList;
        List arrayList2;
        Intrinsics.g(configs, "configs");
        if (configs.isEmpty()) {
            return null;
        }
        try {
            List<? extends Map<String, ? extends Object>> list = configs;
            ArrayList arrayList3 = new ArrayList(c.u0(list, 10));
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                Map map = (Map) it.next();
                Object obj = map.get("hosts");
                List list2 = obj instanceof List ? (List) obj : null;
                if (list2 != null) {
                    arrayList = new ArrayList();
                    for (Object obj2 : list2) {
                        if (obj2 instanceof String) {
                            arrayList.add(obj2);
                        }
                    }
                } else {
                    arrayList = EmptyList.f71733a;
                }
                List list3 = arrayList;
                List<NetworkTrackingOptions.URLPattern> urlPatterns = parseUrlPatterns(map);
                Object obj3 = map.get("methods");
                List list4 = obj3 instanceof List ? (List) obj3 : null;
                if (list4 != null) {
                    arrayList2 = new ArrayList();
                    for (Object obj4 : list4) {
                        if (obj4 instanceof String) {
                            arrayList2.add(obj4);
                        }
                    }
                } else {
                    arrayList2 = EmptyList.f71733a;
                }
                List list5 = arrayList2;
                Object obj5 = map.get("statusCodeRange");
                String str = obj5 instanceof String ? (String) obj5 : null;
                if (str == null) {
                    str = "500-599";
                }
                List<Integer> statusCodeRange = parseStatusCodeRange(str);
                Object obj6 = map.get("requestHeaders");
                NetworkTrackingOptions.CaptureHeader captureHeader = parseCaptureHeader(obj6 instanceof Map ? (Map) obj6 : null);
                Object obj7 = map.get("responseHeaders");
                NetworkTrackingOptions.CaptureHeader captureHeader2 = parseCaptureHeader(obj7 instanceof Map ? (Map) obj7 : null);
                Object obj8 = map.get("requestBody");
                NetworkTrackingOptions.CaptureBody captureBody = parseCaptureBody(obj8 instanceof Map ? (Map) obj8 : null);
                Object obj9 = map.get("responseBody");
                arrayList3.add(new NetworkTrackingOptions.CaptureRule(list3, urlPatterns, list5, statusCodeRange, captureHeader, captureHeader2, captureBody, parseCaptureBody(obj9 instanceof Map ? (Map) obj9 : null)));
            }
            return arrayList3;
        } catch (Exception unused) {
            return null;
        }
    }

    @NotNull
    public static final List<Integer> parseStatusCodeRange(@NotNull String rangeString) {
        Intrinsics.g(rangeString, "rangeString");
        ArrayList arrayList = new ArrayList();
        Iterator it = k.i1(rangeString, new String[]{","}, 6).iterator();
        while (it.hasNext()) {
            String string = k.u1((String) it.next()).toString();
            if (k.K0(string, Identify.UNSET_VALUE, false)) {
                List listI1 = k.i1(string, new String[]{Identify.UNSET_VALUE}, 2);
                ArrayList arrayList2 = new ArrayList(c.u0(listI1, 10));
                Iterator it2 = listI1.iterator();
                while (it2.hasNext()) {
                    arrayList2.add(Integer.valueOf(Integer.parseInt(k.u1((String) it2.next()).toString())));
                }
                d.z0(new IntRange(((Number) arrayList2.get(0)).intValue(), ((Number) arrayList2.get(1)).intValue(), 1), arrayList);
            } else {
                arrayList.add(Integer.valueOf(Integer.parseInt(string)));
            }
        }
        return arrayList;
    }

    private static final List<NetworkTrackingOptions.URLPattern> parseUrlPatterns(Map<String, ? extends Object> map) {
        ArrayList arrayList = new ArrayList();
        Object obj = map.get("urls");
        List list = obj instanceof List ? (List) obj : null;
        if (list != null) {
            ArrayList arrayList2 = new ArrayList();
            for (Object obj2 : list) {
                if (obj2 instanceof String) {
                    arrayList2.add(obj2);
                }
            }
            Iterator it = arrayList2.iterator();
            while (it.hasNext()) {
                arrayList.add(new NetworkTrackingOptions.URLPattern.Exact((String) it.next()));
            }
        }
        Object obj3 = map.get("urlsRegex");
        List list2 = obj3 instanceof List ? (List) obj3 : null;
        if (list2 != null) {
            ArrayList arrayList3 = new ArrayList();
            for (Object obj4 : list2) {
                if (obj4 instanceof String) {
                    arrayList3.add(obj4);
                }
            }
            Iterator it2 = arrayList3.iterator();
            while (it2.hasNext()) {
                arrayList.add(new NetworkTrackingOptions.URLPattern.Regex((String) it2.next()));
            }
        }
        return arrayList;
    }
}
