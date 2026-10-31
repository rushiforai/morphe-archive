package io.branch.search.internal;

import java.util.Arrays;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class L6 {
    @NotNull
    public static JSONObject a(@NotNull M6 model) {
        Intrinsics.g(model, "model");
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("total_bytes", model.f62914a);
        jSONObject.put("available_bytes", model.f62915b);
        jSONObject.put("busy_bytes", model.f62916c);
        jSONObject.put("branch_directories", model.f62917d);
        List<C3162g6> list = model.f62917d;
        Intrinsics.g(list, "list");
        JSONArray jSONArray = new JSONArray();
        for (C3162g6 model2 : list) {
            Intrinsics.g(model2, "model");
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("directory", model2.f64580a);
            jSONObject2.put("size", model2.f64581b);
            StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
            jSONObject2.put("percentage", String.format("%.1f", Arrays.copyOf(new Object[]{Double.valueOf(model2.f64582c)}, 1)));
            jSONArray.put(jSONObject2);
        }
        jSONObject.putOpt("branch_directories", jSONArray);
        return jSONObject;
    }
}
