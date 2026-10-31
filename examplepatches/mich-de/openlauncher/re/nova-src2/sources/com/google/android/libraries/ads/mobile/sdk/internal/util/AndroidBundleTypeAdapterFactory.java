package com.google.android.libraries.ads.mobile.sdk.internal.util;

import android.os.Bundle;
import com.google.gson.Gson;
import com.google.gson.h0;
import com.google.gson.i0;
import kotlin.Metadata;
import mn.a;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/google/android/libraries/ads/mobile/sdk/internal/util/AndroidBundleTypeAdapterFactory;", "Lcom/google/gson/i0;", "<init>", "()V", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final class AndroidBundleTypeAdapterFactory implements i0 {
    @Override // com.google.gson.i0
    public final h0 a(Gson gson, a aVar) {
        if (Bundle.class.isAssignableFrom(aVar.f76504a)) {
            return new BundleTypeAdapter(gson);
        }
        return null;
    }
}
