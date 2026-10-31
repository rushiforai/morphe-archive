package io.branch.search.internal;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.t6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3381t6 {
    @NotNull
    public static final JSONObject a(@NotNull C3364s6 c3364s6) throws JSONException {
        Intrinsics.g(c3364s6, "<this>");
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("package_name", c3364s6.f65742a);
        jSONObject.put("result_id", c3364s6.f65743b);
        jSONObject.put("container_type", c3364s6.f65744c);
        jSONObject.put("entity_type", c3364s6.f65745d);
        jSONObject.put("bundle_source_id", c3364s6.f65746e);
        jSONObject.put("entity_id", c3364s6.f65747f);
        jSONObject.put("request_id", c3364s6.f65748g);
        jSONObject.put("shortcut_type", c3364s6.f65749h);
        List<C3314p6> list = c3364s6.f65750i;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        for (C3314p6 c3314p6 : list) {
            Intrinsics.g(c3314p6, "<this>");
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("id", c3314p6.f65474a);
            jSONObject2.put("targetPackageName", c3314p6.f65475b);
            arrayList.add(jSONObject2);
        }
        jSONObject.put("actions", new JSONArray((Collection) arrayList));
        jSONObject.put("label", c3364s6.f65751j);
        jSONObject.put("ad_state", c3364s6.f65752k);
        jSONObject.put("user_handle", c3364s6.f65753l);
        Integer num = c3364s6.f65754m;
        if (num != null) {
            jSONObject.put("rank", num.intValue());
        }
        String str = c3364s6.n;
        if (str != null) {
            jSONObject.put("reason", str);
        }
        return jSONObject;
    }
}
