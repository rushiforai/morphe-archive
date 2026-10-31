package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.c1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3089c1 {
    @NotNull
    public static final JSONObject a(@NotNull C3072b1 c3072b1) throws JSONException {
        Intrinsics.g(c3072b1, "<this>");
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("package_name", c3072b1.f63969a);
        jSONObject.put("result_id", c3072b1.f63970b);
        jSONObject.put("container_type", c3072b1.f63971c);
        jSONObject.put("entity_id", c3072b1.f63973e);
        jSONObject.put("entity_type", c3072b1.f63972d);
        jSONObject.put("shortcut_type", c3072b1.f63974f);
        jSONObject.put("label", c3072b1.f63975g);
        jSONObject.put("ad_state", c3072b1.f63976h);
        jSONObject.put("autosuggestion", c3072b1.f63977i);
        Integer num = c3072b1.f63978j;
        if (num != null) {
            jSONObject.put("rank", num.intValue());
        }
        String str = c3072b1.f63979k;
        if (str != null) {
            jSONObject.put("reason", str);
        }
        return jSONObject;
    }
}
