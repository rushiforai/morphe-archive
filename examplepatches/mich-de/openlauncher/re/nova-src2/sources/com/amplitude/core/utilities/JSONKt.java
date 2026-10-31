package com.amplitude.core.utilities;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.ArrayIteratorKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@Metadata(d1 = {"\u00004\n\u0000\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0010\u0000\n\u0002\u0010$\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0010\u0011\n\u0000\n\u0002\u0010\u001e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\b\u0002\u001a(\u0010\u0000\u001a\u0010\u0012\u0004\u0012\u00020\u0002\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0001*\u0010\u0012\u0004\u0012\u00020\u0002\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0004H\u0000\u001a\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0003*\u0004\u0018\u00010\u0003H\u0002\u001a\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0003*\u0004\u0018\u00010\u0003H\u0002\u001a\u0010\u0010\u0007\u001a\u0004\u0018\u00010\u0003*\u0004\u0018\u00010\u0003H\u0002\u001a\u0019\u0010\b\u001a\u0004\u0018\u00010\t*\b\u0012\u0002\b\u0003\u0018\u00010\nH\u0000¢\u0006\u0002\u0010\u000b\u001a\u0014\u0010\b\u001a\u0004\u0018\u00010\t*\b\u0012\u0002\b\u0003\u0018\u00010\fH\u0000\u001a\u0018\u0010\r\u001a\u0004\u0018\u00010\u000e*\f\u0012\u0002\b\u0003\u0012\u0002\b\u0003\u0018\u00010\u0004H\u0000\u001a\u0014\u0010\u000f\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0010*\u00020\tH\u0000\u001a\u001a\u0010\u0011\u001a\u0010\u0012\u0004\u0012\u00020\u0002\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0004*\u00020\u000eH\u0000¨\u0006\u0012"}, d2 = {"deepCopy", b.f42142b, b.f42142b, b.f42142b, b.f42142b, "deepCopyValue", "fromJSON", "toJSON", "toJSONArray", "Lorg/json/JSONArray;", b.f42142b, "([Ljava/lang/Object;)Lorg/json/JSONArray;", b.f42142b, "toJSONObject", "Lorg/json/JSONObject;", "toListObj", b.f42142b, "toMapObj", "core"}, k = 2, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class JSONKt {
    @NotNull
    public static final Map<String, Object> deepCopy(@NotNull Map<String, ? extends Object> map) {
        Intrinsics.g(map, "<this>");
        LinkedHashMap linkedHashMap = new LinkedHashMap(map.size());
        for (Map.Entry<String, ? extends Object> entry : map.entrySet()) {
            linkedHashMap.put(entry.getKey(), deepCopyValue(entry.getValue()));
        }
        return linkedHashMap;
    }

    private static final Object deepCopyValue(Object obj) {
        if (obj instanceof Map) {
            Map map = (Map) obj;
            LinkedHashMap linkedHashMap = new LinkedHashMap(map.size());
            for (Map.Entry entry : map.entrySet()) {
                linkedHashMap.put(entry.getKey(), deepCopyValue(entry.getValue()));
            }
            return linkedHashMap;
        }
        if (!(obj instanceof Collection)) {
            return obj;
        }
        ArrayList arrayList = new ArrayList(((Collection) obj).size());
        Iterator it = ((Iterable) obj).iterator();
        while (it.hasNext()) {
            arrayList.add(deepCopyValue(it.next()));
        }
        return arrayList;
    }

    private static final Object fromJSON(Object obj) {
        if (obj instanceof JSONObject) {
            return toMapObj((JSONObject) obj);
        }
        if (obj instanceof JSONArray) {
            return toListObj((JSONArray) obj);
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
        return obj instanceof Map ? toJSONObject((Map) obj) : obj instanceof Collection ? toJSONArray((Collection<?>) obj) : obj instanceof Object[] ? toJSONArray((Object[]) obj) : obj;
    }

    @Nullable
    public static final JSONArray toJSONArray(@Nullable Collection<?> collection) {
        if (collection == null) {
            return null;
        }
        JSONArray jSONArray = new JSONArray();
        Iterator<?> it = collection.iterator();
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
    public static final List<Object> toListObj(@NotNull JSONArray jSONArray) {
        Intrinsics.g(jSONArray, "<this>");
        ArrayList arrayList = new ArrayList();
        int length = jSONArray.length();
        for (int i5 = 0; i5 < length; i5++) {
            arrayList.add(fromJSON(jSONArray.get(i5)));
        }
        return arrayList;
    }

    @NotNull
    public static final Map<String, Object> toMapObj(@NotNull JSONObject jSONObject) {
        Intrinsics.g(jSONObject, "<this>");
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        Iterator<String> itKeys = jSONObject.keys();
        Intrinsics.f(itKeys, "keys(...)");
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            Intrinsics.d(next);
            linkedHashMap.put(next, fromJSON(jSONObject.get(next)));
        }
        return linkedHashMap;
    }

    @Nullable
    public static final JSONArray toJSONArray(@Nullable Object[] objArr) {
        if (objArr == null) {
            return null;
        }
        JSONArray jSONArray = new JSONArray();
        b70.a aVarA = ArrayIteratorKt.a(objArr);
        while (aVarA.hasNext()) {
            jSONArray.put(toJSON(aVarA.next()));
        }
        return jSONArray;
    }
}
