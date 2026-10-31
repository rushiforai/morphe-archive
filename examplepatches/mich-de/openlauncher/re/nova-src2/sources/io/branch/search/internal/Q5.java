package io.branch.search.internal;

import com.amplitude.android.TrackingOptions;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class Q5 {
    @NotNull
    public static JSONObject a(@NotNull P5 model) {
        JSONObject jSONObject;
        JSONObject jSONObject2;
        Intrinsics.g(model, "model");
        C3342r1 c3342r1 = model.f63067a;
        if (c3342r1 != null) {
            jSONObject = new JSONObject();
            jSONObject.put("brand", c3342r1.f65584a);
            jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_CARRIER, c3342r1.f65585b);
            jSONObject.put("carrier_sim", c3342r1.f65586c);
            jSONObject.put("locale", c3342r1.f65587d);
            jSONObject.put("initial_locale", c3342r1.f65588e);
            jSONObject.put("current_locale", c3342r1.f65589f);
            jSONObject.put("model", c3342r1.f65590g);
            jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_OS_VERSION, c3342r1.f65591h);
            jSONObject.put("os", c3342r1.f65592i);
            jSONObject.put("sdk", c3342r1.f65593j);
            jSONObject.put("sdk_version", c3342r1.f65594k);
            jSONObject.put("app_usage_allowed", c3342r1.f65595l);
            jSONObject.put("app_usage_allowed_status", c3342r1.f65596m);
            jSONObject.put("default_launcher", c3342r1.n);
            jSONObject.put("is_on_vpn", c3342r1.o);
            jSONObject.put("user_agent", c3342r1.f65597p);
            Integer num = c3342r1.f65598q;
            if (num != null) {
                jSONObject.put("screen_dpi", num.intValue());
            }
            Integer num2 = c3342r1.f65599r;
            if (num2 != null) {
                jSONObject.put("screen_width", num2.intValue());
            }
            Integer num3 = c3342r1.f65600s;
            if (num3 != null) {
                jSONObject.put("screen_height", num3.intValue());
            }
            Double d5 = c3342r1.f65601t;
            if (d5 != null) {
                jSONObject.put("user_latitude", d5.doubleValue());
            }
            Double d11 = c3342r1.f65602u;
            if (d11 != null) {
                jSONObject.put("user_longitude", d11.doubleValue());
            }
            jSONObject.put("is_low_ram_device", c3342r1.f65603v);
            jSONObject.put("app_package", c3342r1.f65604w);
            jSONObject.put("app_version", c3342r1.f65605x);
        } else {
            jSONObject = new JSONObject();
        }
        T5 t52 = model.f63068b;
        if (t52 != null) {
            jSONObject2 = new JSONObject();
            jSONObject2.put("pending_jobs_count", t52.f63378a);
            jSONObject2.put("pending_ping_jobs_count", t52.f63379b);
        } else {
            jSONObject2 = new JSONObject();
        }
        return C3199i9.a(jSONObject, jSONObject2);
    }
}
