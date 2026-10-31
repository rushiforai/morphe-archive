package io.branch.search.internal;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntProgressionIterator;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.i8, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3198i8 {
    @NotNull
    public static final JSONObject a(@NotNull Map<String, ? extends Object> map) throws JSONException {
        Intrinsics.g(map, "<this>");
        JSONObject jSONObject = new JSONObject();
        Iterator<T> it = map.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            if (value == null) {
                jSONObject.put(str, JSONObject.NULL);
            } else {
                boolean z11 = value instanceof Map;
                if (z11) {
                    Map map2 = z11 ? (Map) value : null;
                    if (map2 == null || jSONObject.put(str, a((Map<String, ? extends Object>) map2)) == null) {
                        jSONObject.put(str, value);
                    }
                } else {
                    jSONObject.put(str, value);
                }
            }
        }
        return jSONObject;
    }

    @NotNull
    public static final ArrayList a(@NotNull JSONArray jSONArray) throws JSONException {
        Intrinsics.g(jSONArray, "<this>");
        ArrayList arrayList = new ArrayList();
        IntProgressionIterator it = kotlin.ranges.a.m0(0, jSONArray.length()).iterator();
        while (it.f71911c) {
            Object objValueOf = jSONArray.get(it.nextInt());
            if (objValueOf instanceof JSONObject) {
                objValueOf = a((JSONObject) objValueOf);
            } else if (objValueOf instanceof JSONArray) {
                objValueOf = a((JSONArray) objValueOf);
            } else if (objValueOf instanceof Integer) {
                objValueOf = Long.valueOf(((Number) objValueOf).intValue());
            } else if (objValueOf instanceof Float) {
                objValueOf = Double.valueOf(((Number) objValueOf).floatValue());
            } else if (Intrinsics.b(objValueOf, JSONObject.NULL)) {
                objValueOf = null;
            }
            arrayList.add(objValueOf);
        }
        return arrayList;
    }

    @NotNull
    public static final LinkedHashMap a(@NotNull JSONObject jSONObject) throws JSONException {
        Intrinsics.g(jSONObject, "<this>");
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Iterator<String> itKeys = jSONObject.keys();
        Intrinsics.f(itKeys, "this.keys()");
        while (itKeys.hasNext()) {
            String it = itKeys.next();
            Intrinsics.f(it, "it");
            Object objValueOf = jSONObject.get(it);
            if (objValueOf instanceof JSONObject) {
                objValueOf = a((JSONObject) objValueOf);
            } else if (objValueOf instanceof JSONArray) {
                objValueOf = a((JSONArray) objValueOf);
            } else if (objValueOf instanceof Integer) {
                objValueOf = Long.valueOf(((Number) objValueOf).intValue());
            } else if (objValueOf instanceof Float) {
                objValueOf = Double.valueOf(((Number) objValueOf).floatValue());
            } else if (Intrinsics.b(objValueOf, JSONObject.NULL)) {
                objValueOf = null;
            }
            linkedHashMap.put(it, objValueOf);
        }
        return linkedHashMap;
    }
}
