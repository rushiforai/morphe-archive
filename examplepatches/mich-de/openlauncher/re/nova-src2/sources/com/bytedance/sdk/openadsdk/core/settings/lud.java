package com.bytedance.sdk.openadsdk.core.settings;

import com.bytedance.sdk.component.utils.htf;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.HashSet;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public interface lud {
    public static final zb<JSONObject> ycx = new zb<JSONObject>() { // from class: com.bytedance.sdk.openadsdk.core.settings.lud.1
        @Override // com.bytedance.sdk.openadsdk.core.settings.lud.zb
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public JSONObject zb(String str) {
            try {
                return new JSONObject(str);
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "ct0ogRe1Z8CTbtZJjSOlOFT9JIEMrnCD0Q==", "WPwolBe5", 18);
                htf.ycx("ISettingsDataRepository", b.f42142b, e3);
                return null;
            }
        }
    };

    /* renamed from: zb, reason: collision with root package name */
    public static final zb<Set<String>> f26122zb = new zb<Set<String>>() { // from class: com.bytedance.sdk.openadsdk.core.settings.lud.2
        @Override // com.bytedance.sdk.openadsdk.core.settings.lud.zb
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public Set<String> zb(String str) {
            HashSet hashSet = new HashSet();
            try {
                JSONArray jSONArray = new JSONArray(str);
                int length = jSONArray.length();
                for (int i5 = 0; i5 < length; i5++) {
                    hashSet.add(jSONArray.getString(i5));
                }
                return hashSet;
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V/SiBF7VnwJM=", "ct0ogRe1Z8CTbtZJjSOlOFT9JIEMrnCD0g==", "WPwolBe5", 34);
                htf.ycx("ISettingsDataRepository", b.f42142b, e3);
                return hashSet;
            }
        }
    };

    public interface ycx {
        ycx ycx(String str);

        ycx ycx(String str, float f11);

        ycx ycx(String str, int i5);

        ycx ycx(String str, long j11);

        ycx ycx(String str, String str2);

        ycx ycx(String str, boolean z11);

        void ycx();
    }

    public interface zb<T> {
        T zb(String str);
    }

    void ycx(JSONObject jSONObject);
}
