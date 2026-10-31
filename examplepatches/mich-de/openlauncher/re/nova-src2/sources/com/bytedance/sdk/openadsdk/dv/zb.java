package com.bytedance.sdk.openadsdk.dv;

import org.json.JSONObject;

/* loaded from: classes2.dex */
public interface zb {
    public static final ycx<JSONObject> ycx = new ycx<JSONObject>() { // from class: com.bytedance.sdk.openadsdk.dv.zb.1
        @Override // com.bytedance.sdk.openadsdk.dv.zb.ycx
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public JSONObject zb(String str) {
            try {
                return new JSONObject(str);
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE58FsilP6yqM", "ct05hwKobMCZeNJNgwKpPFT8NNFS", "WPwolBe5", 18);
                return null;
            }
        }
    };

    public interface ycx<T> {
        T zb(String str);
    }
}
