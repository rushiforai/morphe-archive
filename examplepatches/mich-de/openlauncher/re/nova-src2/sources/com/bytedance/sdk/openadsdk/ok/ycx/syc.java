package com.bytedance.sdk.openadsdk.ok.ycx;

import java.lang.ref.WeakReference;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class syc extends com.bytedance.sdk.component.ycx.dj<JSONObject, JSONObject> {
    private WeakReference<com.bytedance.sdk.component.jw.fby> ycx;

    public syc(com.bytedance.sdk.component.jw.fby fbyVar) {
        this.ycx = new WeakReference<>(fbyVar);
    }

    public static void ycx(com.bytedance.sdk.component.ycx.syc sycVar, com.bytedance.sdk.component.jw.fby fbyVar) {
        sycVar.ycx("preventTouchEvent", new syc(fbyVar));
    }

    @Override // com.bytedance.sdk.component.ycx.dj
    public JSONObject ycx(String str, JSONObject jSONObject, com.bytedance.sdk.component.ycx.lud ludVar) throws Exception {
        JSONObject jSONObject2 = new JSONObject();
        try {
            boolean zOptBoolean = jSONObject.optBoolean("isPrevent", false);
            com.bytedance.sdk.component.jw.fby fbyVar = this.ycx.get();
            if (fbyVar != null) {
                fbyVar.setIsPreventTouchEvent(zOptBoolean);
                jSONObject2.put("success", true);
                return jSONObject2;
            }
            jSONObject2.put("success", false);
            return jSONObject2;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4YCojpS6iqQUfJkwpRC2Fk=", "a/wogwayffOPX9RVqQelJk/DKIELs20=", "UuA7mgi5", 40);
            jSONObject2.put("success", false);
            return jSONObject2;
        }
    }
}
