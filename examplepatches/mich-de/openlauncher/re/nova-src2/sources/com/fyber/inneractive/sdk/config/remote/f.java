package com.fyber.inneractive.sdk.config.remote;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.enums.Track;
import java.util.LinkedHashSet;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public Set f27903a = null;

    public static f a(JSONObject jSONObject) {
        Track trackFromValue;
        f fVar = null;
        if (jSONObject == null) {
            return null;
        }
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("track");
        if (jSONArrayOptJSONArray != null) {
            fVar = new f();
            LinkedHashSet linkedHashSet = new LinkedHashSet();
            for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                String strOptString = jSONArrayOptJSONArray.optString(i5);
                if (!TextUtils.isEmpty(strOptString) && (trackFromValue = Track.fromValue(strOptString)) != null) {
                    linkedHashSet.add(trackFromValue);
                }
            }
            fVar.f27903a = linkedHashSet;
        }
        return fVar;
    }
}
