package com.fyber.inneractive.sdk.serverapi.extradata;

import com.amplitude.android.migration.DatabaseConstants;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class b implements c {
    @Override // com.fyber.inneractive.sdk.serverapi.extradata.c
    public final boolean a(Object obj) {
        return ((JSONArray) obj).length() == 0;
    }

    @Override // com.fyber.inneractive.sdk.serverapi.extradata.c
    public final void a(String str, String str2, Object obj) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put(DatabaseConstants.KEY_FIELD, str);
        jSONObject.put("value", str2);
        ((JSONArray) obj).put(jSONObject);
    }
}
