package com.fyber.inneractive.sdk.response.nativead.parser;

import com.fyber.inneractive.sdk.response.nativead.h;
import com.fyber.inneractive.sdk.util.v;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public abstract class c {
    public static h a(JSONObject jSONObject) {
        h hVar = new h();
        if (jSONObject != null) {
            hVar.f31084a = v.a(jSONObject, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
            hVar.f31086c = v.a(jSONObject, "fallback");
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("clicktrackers");
            if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() != 0) {
                for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                    String strOptString = jSONArrayOptJSONArray.optString(i5);
                    if (strOptString != null && !strOptString.isEmpty() && !strOptString.equals(AbstractJsonLexerKt.NULL)) {
                        hVar.f31085b.add(strOptString);
                    }
                }
            }
        }
        return hVar;
    }
}
