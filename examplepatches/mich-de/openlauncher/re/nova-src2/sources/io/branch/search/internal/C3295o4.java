package io.branch.search.internal;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.o4, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3295o4 {
    @NotNull
    public static JSONObject a(@NotNull C3278n4 model) {
        Intrinsics.g(model, "model");
        JSONObject jSONObject = new JSONObject();
        jSONObject.putOpt("branch_key", model.f65316a);
        jSONObject.putOpt("country", model.f65317b);
        jSONObject.putOpt("country_sim", model.f65318c);
        jSONObject.putOpt("country_network", model.f65319d);
        jSONObject.putOpt("locale", model.f65320e);
        jSONObject.putOpt("is_lat", Integer.valueOf(model.f65321f));
        jSONObject.putOpt("personalize_results", Boolean.valueOf(model.f65322g));
        jSONObject.putOpt("country_to_attribute", model.f65323h);
        jSONObject.putOpt("carrier_to_attribute", model.f65324i);
        jSONObject.putOpt("brand_to_attribute", model.f65325j);
        jSONObject.putOpt("model_to_attribute", model.f65326k);
        jSONObject.putOpt("custom_attribution", model.f65327l);
        jSONObject.putOpt("tracking_status", model.f65328m);
        jSONObject.putOpt("tracking_status_timestamp", model.n);
        jSONObject.putOpt("use_application_info_label_for_search", Boolean.valueOf(model.o));
        jSONObject.putOpt("use_app_icon_for_settings_shortcut", Boolean.valueOf(model.f65329p));
        jSONObject.putOpt("gaid", model.f65330q);
        if (model.f65331r != null && (!r1.isEmpty())) {
            Map<String, Object> extras = model.f65331r;
            Intrinsics.g(extras, "extras");
            Set<Map.Entry<String, Object>> setEntrySet = extras.entrySet();
            JSONObject jSONObject2 = new JSONObject();
            Iterator<T> it = setEntrySet.iterator();
            while (it.hasNext()) {
                Map.Entry entry = (Map.Entry) it.next();
                if (entry.getValue() != null) {
                    jSONObject2.put((String) entry.getKey(), entry.getValue());
                }
            }
            jSONObject.putOpt("extra_data", jSONObject2);
        }
        return jSONObject;
    }
}
