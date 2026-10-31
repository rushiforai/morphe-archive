package io.branch.search.internal;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.f5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3144f5 {
    @NotNull
    public static JSONObject a(@NotNull C3127e5 model) throws JSONException {
        Intrinsics.g(model, "model");
        JSONObject jSONObject = new JSONObject();
        List<C3110d5> list = model.f64363a;
        JSONArray jSONArray = new JSONArray();
        for (C3110d5 model2 : list) {
            Intrinsics.g(model2, "model");
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put(PendingUpgradeStore.KEY_NAME, model2.f64242a);
            jSONObject2.put("full_name", model2.f64243b);
            jSONObject2.put("bytes", model2.f64244c);
            jSONArray.put(jSONObject2);
        }
        jSONObject.put("databases", jSONArray);
        return jSONObject;
    }
}
