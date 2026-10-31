package com.google.android.libraries.ads.mobile.sdk.internal.util;

import android.os.Bundle;
import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.google.gson.h0;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lcom/google/android/libraries/ads/mobile/sdk/internal/util/BundleTypeAdapter;", "Lcom/google/gson/h0;", "Landroid/os/Bundle;", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final class BundleTypeAdapter extends h0 {

    /* renamed from: a, reason: collision with root package name */
    public final Gson f33993a;

    public BundleTypeAdapter(Gson gson) {
        this.f33993a = gson;
    }

    @Override // com.google.gson.h0
    public final Object b(JsonReader jsonReader) {
        return new Bundle();
    }

    @Override // com.google.gson.h0
    public final void c(JsonWriter jsonWriter, Object obj) throws JsonIOException, IOException {
        Bundle bundle = (Bundle) obj;
        if (jsonWriter == null) {
            return;
        }
        if (bundle == null) {
            jsonWriter.nullValue();
            return;
        }
        jsonWriter.beginObject();
        for (String str : bundle.keySet()) {
            if (str != null) {
                jsonWriter.name(str);
                Object obj2 = bundle.get(str);
                if (obj2 == null) {
                    jsonWriter.nullValue();
                } else {
                    this.f33993a.toJson(obj2, obj2.getClass(), jsonWriter);
                }
            }
        }
        jsonWriter.endObject();
    }
}
