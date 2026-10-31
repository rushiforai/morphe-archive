package com.fyber.inneractive.sdk.config.remote;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.enums.Vendor;
import java.util.LinkedHashSet;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public Integer f27929a;

    /* renamed from: b, reason: collision with root package name */
    public Integer f27930b;

    /* renamed from: c, reason: collision with root package name */
    public Set f27931c = null;

    public static k a(JSONObject jSONObject) {
        Vendor vendorFromValue;
        if (jSONObject == null) {
            return null;
        }
        int iOptInt = jSONObject.optInt("pausePct", Integer.MIN_VALUE);
        Integer numValueOf = Integer.valueOf(iOptInt);
        int iOptInt2 = jSONObject.optInt("playPct", Integer.MIN_VALUE);
        Integer numValueOf2 = Integer.valueOf(iOptInt2);
        k kVar = new k();
        if (iOptInt == Integer.MIN_VALUE) {
            numValueOf = null;
        }
        kVar.f27929a = numValueOf;
        if (iOptInt2 == Integer.MIN_VALUE) {
            numValueOf2 = null;
        }
        kVar.f27930b = numValueOf2;
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("vendor");
        if (jSONArrayOptJSONArray != null) {
            LinkedHashSet linkedHashSet = new LinkedHashSet();
            for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                String strOptString = jSONArrayOptJSONArray.optString(i5, null);
                if (!TextUtils.isEmpty(strOptString) && (vendorFromValue = Vendor.fromValue(strOptString)) != null) {
                    linkedHashSet.add(vendorFromValue);
                }
            }
            kVar.f27931c = linkedHashSet;
        }
        return kVar;
    }
}
