package com.bytedance.sdk.component.utils;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class tn {
    private static zb ycx;

    public static abstract class ycx {
        public abstract JSONObject ycx();

        public final String zb() {
            try {
                return ycx().toString();
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "aMoGuQy7bsKSDvZfnwWyKVj6HZQRvWTUp0/ZWJ4QtCdJ", "XOs5sBW5Z9OwS8VcgQI=", 30);
                return b.f42142b;
            }
        }
    }

    public interface zb {
        void ycx(String str, boolean z11, ycx ycxVar);
    }

    public static void ycx(zb zbVar) {
        ycx = zbVar;
    }

    public static void ycx(String str, ycx ycxVar) {
        zb zbVar = ycx;
        if (zbVar == null) {
            return;
        }
        zbVar.ycx(str, false, ycxVar);
    }
}
