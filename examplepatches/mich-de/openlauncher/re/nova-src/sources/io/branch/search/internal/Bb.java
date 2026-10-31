package io.branch.search.internal;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class Bb {
    @NotNull
    public static JSONObject a(@NotNull C3437wb model) throws JSONException {
        Intrinsics.g(model, "model");
        JSONObject jSONObject = new JSONObject();
        List<EnumC3285nb> list = model.f66234a;
        if (list != null) {
            JSONArray jSONArray = new JSONArray();
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                jSONArray.put((EnumC3285nb) it.next());
            }
            jSONObject.put("serving_queries_for", jSONArray);
        }
        jSONObject.put("db", model.f66236c);
        Set<Map.Entry<String, String>> setEntrySet = model.f66235b.entrySet();
        JSONObject jSONObject2 = new JSONObject();
        Iterator<T> it2 = setEntrySet.iterator();
        while (it2.hasNext()) {
            Map.Entry entry = (Map.Entry) it2.next();
            jSONObject2.put((String) entry.getKey(), entry.getValue());
        }
        jSONObject.put("versions", jSONObject2);
        return jSONObject;
    }
}
