package io.branch.search.internal;

import java.util.ArrayList;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.i9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3199i9 {
    @NotNull
    public static final JSONObject a(@NotNull JSONObject jSONObject, @NotNull JSONObject other) throws JSONException {
        Intrinsics.g(jSONObject, "<this>");
        Intrinsics.g(other, "other");
        JSONObject jSONObject2 = new JSONObject();
        Iterator<String> itKeys = jSONObject.keys();
        Intrinsics.f(itKeys, "keys()");
        ArrayList arrayList = new ArrayList();
        while (itKeys.hasNext()) {
            arrayList.add(itKeys.next());
        }
        Iterator<String> itKeys2 = other.keys();
        Intrinsics.f(itKeys2, "other.keys()");
        ArrayList arrayList2 = new ArrayList();
        while (itKeys2.hasNext()) {
            arrayList2.add(itKeys2.next());
        }
        ArrayList arrayList3 = new ArrayList();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            Object next = it.next();
            if (arrayList2.contains((String) next)) {
                arrayList3.add(next);
            }
        }
        ArrayList arrayList4 = new ArrayList();
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            Object next2 = it2.next();
            if (!arrayList3.contains((String) next2)) {
                arrayList4.add(next2);
            }
        }
        Iterator it3 = arrayList4.iterator();
        while (it3.hasNext()) {
            String str = (String) it3.next();
            jSONObject2.put(str, jSONObject.get(str));
        }
        ArrayList arrayList5 = new ArrayList();
        Iterator it4 = arrayList2.iterator();
        while (it4.hasNext()) {
            Object next3 = it4.next();
            if (!arrayList3.contains((String) next3)) {
                arrayList5.add(next3);
            }
        }
        Iterator it5 = arrayList5.iterator();
        while (it5.hasNext()) {
            String str2 = (String) it5.next();
            jSONObject2.put(str2, other.get(str2));
        }
        Iterator it6 = arrayList3.iterator();
        while (it6.hasNext()) {
            String str3 = (String) it6.next();
            Object objA = jSONObject.get(str3);
            Object obj = other.get(str3);
            if ((objA instanceof JSONObject) && (obj instanceof JSONObject)) {
                objA = a((JSONObject) objA, (JSONObject) obj);
            } else if ((objA instanceof JSONArray) && (obj instanceof JSONArray)) {
                JSONArray jSONArray = (JSONArray) objA;
                JSONArray jSONArray2 = (JSONArray) obj;
                JSONArray jSONArray3 = new JSONArray();
                int length = jSONArray.length();
                for (int i5 = 0; i5 < length; i5++) {
                    jSONArray3.put(jSONArray.get(i5));
                }
                int length2 = jSONArray2.length();
                for (int i11 = 0; i11 < length2; i11++) {
                    jSONArray3.put(jSONArray2.get(i11));
                }
                objA = jSONArray3;
            } else if (obj != null) {
                objA = obj;
            }
            jSONObject2.put(str3, objA);
        }
        return jSONObject2;
    }
}
