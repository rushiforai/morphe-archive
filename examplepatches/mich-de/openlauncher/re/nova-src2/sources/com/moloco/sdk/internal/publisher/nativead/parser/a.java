package com.moloco.sdk.internal.publisher.nativead.parser;

import com.amplitude.android.migration.DatabaseConstants;
import com.moloco.sdk.internal.publisher.nativead.model.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.List;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final int f37360a = 0;

    @NotNull
    public final Object a(@NotNull String nativeOrtbString) {
        Intrinsics.g(nativeOrtbString, "nativeOrtbString");
        try {
            JSONObject jSONObject = new JSONObject(nativeOrtbString);
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("native");
            if (jSONObjectOptJSONObject != null) {
                jSONObject = jSONObjectOptJSONObject;
            }
            int i5 = Result.f71687b;
            return new com.moloco.sdk.internal.publisher.nativead.model.b(jSONObject.has("ver") ? jSONObject.getString("ver") : null, a(jSONObject.optJSONArray("assets")), a(jSONObject.optJSONObject("link")), c(jSONObject.optJSONArray("imptrackers")), b(jSONObject.optJSONArray("eventtrackers")), jSONObject.has("privacy") ? jSONObject.getString("privacy") : null);
        } catch (Exception e3) {
            int i11 = Result.f71687b;
            return ResultKt.a(e3);
        }
    }

    public final b.a.C0167b b(JSONObject jSONObject, int i5, boolean z11) throws JSONException {
        if (jSONObject == null) {
            return null;
        }
        Integer numValueOf = jSONObject.has(TTConst.TRACK_TYPE) ? Integer.valueOf(jSONObject.getInt(TTConst.TRACK_TYPE)) : null;
        String string = jSONObject.getString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
        Intrinsics.f(string, "getString(...)");
        return new b.a.C0167b(i5, z11, numValueOf, string, jSONObject.has("w") ? Integer.valueOf(jSONObject.getInt("w")) : null, jSONObject.has("h") ? Integer.valueOf(jSONObject.getInt("h")) : null);
    }

    public final b.a.c c(JSONObject jSONObject, int i5, boolean z11) throws JSONException {
        if (jSONObject == null) {
            return null;
        }
        String string = jSONObject.getString("text");
        Intrinsics.f(string, "getString(...)");
        return new b.a.c(i5, z11, string, jSONObject.has("len") ? Integer.valueOf(jSONObject.getInt("len")) : null);
    }

    public final b.a.d d(JSONObject jSONObject, int i5, boolean z11) throws JSONException {
        if (jSONObject == null) {
            return null;
        }
        String string = jSONObject.getString("vasttag");
        Intrinsics.f(string, "getString(...)");
        return new b.a.d(i5, z11, string);
    }

    public final List<String> c(JSONArray jSONArray) {
        if (jSONArray == null) {
            return EmptyList.f71733a;
        }
        ArrayList arrayList = new ArrayList();
        int length = jSONArray.length();
        for (int i5 = 0; i5 < length; i5++) {
            arrayList.add(jSONArray.getString(i5));
        }
        return arrayList;
    }

    public final List<b.C0168b> b(JSONArray jSONArray) throws JSONException {
        if (jSONArray == null) {
            return EmptyList.f71733a;
        }
        ArrayList arrayList = new ArrayList();
        int length = jSONArray.length();
        for (int i5 = 0; i5 < length; i5++) {
            JSONObject jSONObject = jSONArray.getJSONObject(i5);
            arrayList.add(new b.C0168b(jSONObject.getInt(DatabaseConstants.EVENT_FIELD), jSONObject.getInt("method"), jSONObject.has(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL) ? jSONObject.getString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL) : null));
        }
        return arrayList;
    }

    public final b.a.C0166a a(JSONObject jSONObject, int i5, boolean z11) throws JSONException {
        if (jSONObject == null) {
            return null;
        }
        Integer numValueOf = jSONObject.has(TTConst.TRACK_TYPE) ? Integer.valueOf(jSONObject.getInt(TTConst.TRACK_TYPE)) : null;
        Integer numValueOf2 = jSONObject.has("len") ? Integer.valueOf(jSONObject.getInt("len")) : null;
        String string = jSONObject.getString("value");
        Intrinsics.f(string, "getString(...)");
        return new b.a.C0166a(i5, z11, numValueOf, numValueOf2, string);
    }

    public final b.c a(JSONObject jSONObject) throws JSONException {
        if (jSONObject == null) {
            return null;
        }
        String string = jSONObject.getString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
        String string2 = jSONObject.has("fallback") ? jSONObject.getString("fallback") : null;
        List<String> listC = c(jSONObject.optJSONArray("clicktrackers"));
        Intrinsics.d(string);
        return new b.c(string, listC, string2);
    }

    public final List<b.a> a(JSONArray jSONArray) throws JSONException {
        if (jSONArray == null) {
            return EmptyList.f71733a;
        }
        ArrayList arrayList = new ArrayList();
        int length = jSONArray.length();
        for (int i5 = 0; i5 < length; i5++) {
            JSONObject jSONObject = jSONArray.getJSONObject(i5);
            if (jSONObject.has("id")) {
                int i11 = jSONObject.getInt("id");
                boolean z11 = jSONObject.optInt("required", 0) == 1;
                Object objC = c(jSONObject.optJSONObject("title"), i11, z11);
                if (objC == null && (objC = b(jSONObject.optJSONObject("img"), i11, z11)) == null && (objC = d(jSONObject.optJSONObject("video"), i11, z11)) == null) {
                    objC = a(jSONObject.optJSONObject("data"), i11, z11);
                }
                if (objC != null) {
                    arrayList.add(objC);
                }
            }
        }
        return arrayList;
    }
}
