package com.amplitude.analytics.connector.util;

import b70.h;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.JvmName;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@Metadata(d1 = {"\u0000(\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\u001a\u0010\u0010\u0000\u001a\u0004\u0018\u00010\u0001*\u0004\u0018\u00010\u0001H\u0002\u001a\u0010\u0010\u0002\u001a\u0004\u0018\u00010\u0001*\u0004\u0018\u00010\u0001H\u0002\u001a\u0014\u0010\u0003\u001a\u0004\u0018\u00010\u0004*\b\u0012\u0002\b\u0003\u0018\u00010\u0005H\u0000\u001a\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u0007*\f\u0012\u0002\b\u0003\u0012\u0002\b\u0003\u0018\u00010\b\u001a\u0014\u0010\t\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0005*\u00020\u0004H\u0000\u001a\u001a\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0006\u0012\u0004\u0018\u00010\u00010\b*\u00020\u0007H\u0000\u001a$\u0010\f\u001a\u001c\u0012\u0004\u0012\u00020\u000b\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0006\u0012\u0004\u0018\u00010\u00010\b0\b*\u00020\u0007¨\u0006\r"}, d2 = {"fromJSON", b.f42142b, "toJSON", "toJSONArray", "Lorg/json/JSONArray;", b.f42142b, "toJSONObject", "Lorg/json/JSONObject;", b.f42142b, "toList", "toMap", b.f42142b, "toUpdateUserPropertiesMap", "analytics-connector_release"}, k = 2, mv = {1, 5, 1}, xi = 48)
@JvmName
/* loaded from: classes2.dex */
public final class JSONUtil {
    private static final Object fromJSON(Object obj) {
        if (obj instanceof JSONObject) {
            return toMap((JSONObject) obj);
        }
        if (obj instanceof JSONArray) {
            return toList((JSONArray) obj);
        }
        if (obj instanceof BigDecimal) {
            return Double.valueOf(((BigDecimal) obj).doubleValue());
        }
        if (Intrinsics.b(obj, JSONObject.NULL)) {
            return null;
        }
        return obj;
    }

    private static final Object toJSON(Object obj) {
        return obj instanceof Map ? toJSONObject((Map) obj) : obj instanceof List ? toJSONArray((List) obj) : obj;
    }

    @Nullable
    public static final JSONArray toJSONArray(@Nullable List<?> list) {
        if (list == null) {
            return null;
        }
        JSONArray jSONArray = new JSONArray();
        Iterator<?> it = list.iterator();
        while (it.hasNext()) {
            jSONArray.put(toJSON(it.next()));
        }
        return jSONArray;
    }

    @Nullable
    public static final JSONObject toJSONObject(@Nullable Map<?, ?> map) throws JSONException {
        if (map == null) {
            return null;
        }
        JSONObject jSONObject = new JSONObject();
        for (Map.Entry<?, ?> entry : map.entrySet()) {
            Object key = entry.getKey();
            String str = key instanceof String ? (String) key : null;
            if (str != null) {
                jSONObject.put(str, toJSON(entry.getValue()));
            }
        }
        return jSONObject;
    }

    @NotNull
    public static final List<Object> toList(@NotNull JSONArray jSONArray) {
        Intrinsics.g(jSONArray, "<this>");
        ArrayList arrayList = new ArrayList();
        int length = jSONArray.length();
        if (length > 0) {
            int i5 = 0;
            while (true) {
                int i11 = i5 + 1;
                arrayList.add(fromJSON(jSONArray.get(i5)));
                if (i11 >= length) {
                    break;
                }
                i5 = i11;
            }
        }
        return arrayList;
    }

    @NotNull
    public static final Map<String, Object> toMap(@NotNull JSONObject jSONObject) {
        Intrinsics.g(jSONObject, "<this>");
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Iterator<String> itKeys = jSONObject.keys();
        Intrinsics.f(itKeys, "this.keys()");
        while (itKeys.hasNext()) {
            String key = itKeys.next();
            Intrinsics.f(key, "key");
            linkedHashMap.put(key, fromJSON(jSONObject.get(key)));
        }
        return linkedHashMap;
    }

    @NotNull
    public static final Map<String, Map<String, Object>> toUpdateUserPropertiesMap(@NotNull JSONObject jSONObject) throws JSONException {
        Map<String, Object> map;
        Intrinsics.g(jSONObject, "<this>");
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Iterator<String> itKeys = jSONObject.keys();
        Intrinsics.f(itKeys, "this.keys()");
        while (itKeys.hasNext()) {
            String key = itKeys.next();
            Intrinsics.f(key, "key");
            Object obj = jSONObject.get(key);
            if (obj instanceof JSONObject) {
                map = toMap((JSONObject) obj);
            } else {
                boolean z11 = obj instanceof JSONArray;
                h hVar = h.f17594a;
                if (!z11) {
                    Intrinsics.b(obj, JSONObject.NULL);
                }
                map = hVar;
            }
            linkedHashMap.put(key, map);
        }
        return linkedHashMap;
    }
}
