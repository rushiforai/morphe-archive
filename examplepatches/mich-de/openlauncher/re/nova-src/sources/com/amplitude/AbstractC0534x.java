package com.amplitude;

import com.amplitude.android.sessionreplay.config.MaskLevel;
import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.amplitude.x, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public abstract class AbstractC0534x {
    public static String a(String command, MaskLevel maskLevel, K1 k12) throws JSONException {
        Intrinsics.g(command, "command");
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("command", command);
        if (maskLevel != null || k12 != null) {
            JSONObject jSONObject2 = new JSONObject();
            if (maskLevel != null) {
                String lowerCase = maskLevel.name().toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase, "toLowerCase(...)");
                jSONObject2.put("maskLevel", lowerCase);
            }
            if (k12 != null) {
                String lowerCase2 = k12.name().toLowerCase(Locale.ROOT);
                Intrinsics.f(lowerCase2, "toLowerCase(...)");
                jSONObject2.put("qualityProfile", lowerCase2);
            }
            jSONObject.put("config", jSONObject2);
        }
        String string = jSONObject.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }
}
