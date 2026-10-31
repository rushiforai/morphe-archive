package com.fyber.inneractive.sdk.util;

import android.net.Uri;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes.dex */
public abstract class f1 {
    public static String a(String str, HashMap map) {
        StringBuilder sb2 = new StringBuilder(str);
        boolean z11 = true;
        for (Map.Entry entry : map.entrySet()) {
            sb2.append(z11 ? "?" : "&");
            sb2.append((String) entry.getKey());
            sb2.append("=");
            sb2.append(Uri.encode((String) entry.getValue()));
            z11 = false;
        }
        return sb2.toString();
    }
}
