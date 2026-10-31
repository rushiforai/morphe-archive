package com.fyber.inneractive.sdk.model.vast;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

/* loaded from: classes3.dex */
public enum k {
    Jpeg("image/jpeg", "jpeg"),
    Jpg("image/jpg", "jpg"),
    Gif("image/gif", "gif"),
    Png("image/png", "png");

    private static final Map<String, k> sCreativeTypeMap = new HashMap();
    public final String extension;
    public final String mimeType;

    static {
        for (k kVar : values()) {
            sCreativeTypeMap.put(kVar.mimeType, kVar);
        }
    }

    k(String str, String str2) {
        this.mimeType = str;
        this.extension = str2;
    }

    public static k a(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return sCreativeTypeMap.get(str.toLowerCase(Locale.US));
    }
}
