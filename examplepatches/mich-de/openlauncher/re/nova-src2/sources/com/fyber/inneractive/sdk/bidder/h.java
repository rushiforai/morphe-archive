package com.fyber.inneractive.sdk.bidder;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.bidder.TokenParametersOuterClass$TokenParameters;

/* loaded from: classes.dex */
public abstract class h {
    public static TokenParametersOuterClass$TokenParameters.NullableString a(String str) {
        z zVarNewBuilder = TokenParametersOuterClass$TokenParameters.NullableString.newBuilder();
        if (!TextUtils.isEmpty(str)) {
            zVarNewBuilder.c();
            ((TokenParametersOuterClass$TokenParameters.NullableString) zVarNewBuilder.f30901b).setData(str);
        }
        return (TokenParametersOuterClass$TokenParameters.NullableString) zVarNewBuilder.a();
    }

    public static TokenParametersOuterClass$TokenParameters.NullableBool a(Boolean bool) {
        w wVarNewBuilder = TokenParametersOuterClass$TokenParameters.NullableBool.newBuilder();
        if (bool != null) {
            boolean zBooleanValue = bool.booleanValue();
            wVarNewBuilder.c();
            ((TokenParametersOuterClass$TokenParameters.NullableBool) wVarNewBuilder.f30901b).setData(zBooleanValue);
        }
        return (TokenParametersOuterClass$TokenParameters.NullableBool) wVarNewBuilder.a();
    }
}
