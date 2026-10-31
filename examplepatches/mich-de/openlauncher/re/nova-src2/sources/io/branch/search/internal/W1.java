package io.branch.search.internal;

import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class W1 {
    @NotNull
    public static final JSONObject a(@NotNull y40.u uVar) throws JSONException {
        Intrinsics.g(uVar, "<this>");
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("branchKey", uVar.f96701b);
        C3095c7 c3095c7 = uVar.f96702c;
        JSONObject jSONObject2 = new JSONObject();
        jSONObject2.put("status", c3095c7.f64098a);
        jSONObject.put("trackingStatus", jSONObject2);
        jSONObject.put("jobPolicy", uVar.f96703d);
        jSONObject.put("shouldUseApplicationInfoLabelForSearch", uVar.f96704e);
        jSONObject.put("useAppIconForSettingsShortcut", uVar.f96705f);
        jSONObject.put("countryToAttribute", uVar.f96706g);
        jSONObject.put("carrierToAttribute", uVar.f96707h);
        jSONObject.put("brandToAttribute", uVar.f96708i);
        jSONObject.put("modelToAttribute", uVar.f96709j);
        Map map = uVar.f96710k;
        if (map == null) {
            map = b70.h.f17594a;
        }
        jSONObject.put("customAttribution", C3198i8.a((Map<String, ? extends Object>) map));
        jSONObject.put("imageLoadingWhitelist", b70.g.f1(b70.g.N1(uVar.n), ",", null, null, 0, null, 62));
        jSONObject.putOpt("userAgent", uVar.f96715r);
        jSONObject.put("preloadImages", uVar.f96714q);
        return jSONObject;
    }
}
