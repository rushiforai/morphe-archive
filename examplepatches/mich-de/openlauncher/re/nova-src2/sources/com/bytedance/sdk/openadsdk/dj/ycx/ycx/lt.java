package com.bytedance.sdk.openadsdk.dj.ycx.ycx;

import com.bytedance.sdk.openadsdk.dv.zb;
import java.util.HashSet;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt {
    private static int ycx = -1;

    public static int ycx() {
        if (ycx == -1) {
            ycx = com.bytedance.sdk.openadsdk.dv.lud.ycx("send_log_type", 1);
        }
        return ycx;
    }

    public static boolean zb() {
        return ycx() == 3;
    }

    public static class ycx {
        public static ycx ycx = new ycx();
        private int sya;

        /* renamed from: zb, reason: collision with root package name */
        private final HashSet<String> f26748zb;

        public ycx() {
            this.f26748zb = new HashSet<>();
            this.sya = 0;
        }

        public boolean ycx(String str) {
            boolean zContains = this.f26748zb.contains(str);
            int i5 = this.sya;
            if (i5 == 0 && zContains) {
                return true;
            }
            return 1 == i5 && !zContains;
        }

        public ycx(String str) {
            this.f26748zb = new HashSet<>();
            this.sya = 0;
            try {
                JSONObject jSONObject = new JSONObject(str);
                this.sya = jSONObject.optInt("mode", this.sya);
                JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("types");
                if (jSONArrayOptJSONArray != null) {
                    for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                        this.f26748zb.add(jSONArrayOptJSONArray.optString(i5));
                    }
                }
            } catch (Exception unused) {
            }
        }
    }

    public static boolean ycx(String str) {
        ycx ycxVar;
        if (str == null || (ycxVar = (ycx) com.bytedance.sdk.openadsdk.dv.lud.ycx("stats_new_log", ycx.ycx, new zb.ycx<ycx>() { // from class: com.bytedance.sdk.openadsdk.dj.ycx.ycx.lt.1
            @Override // com.bytedance.sdk.openadsdk.dv.zb.ycx
            /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
            public ycx zb(String str2) {
                return new ycx(str2);
            }
        })) == null) {
            return false;
        }
        return ycxVar.ycx(str);
    }
}
