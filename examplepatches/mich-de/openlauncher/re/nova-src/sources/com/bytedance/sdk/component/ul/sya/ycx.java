package com.bytedance.sdk.component.ul.sya;

import android.text.TextUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;

/* loaded from: classes2.dex */
public class ycx {
    /* JADX WARN: Removed duplicated region for block: B:10:0x0023 A[PHI: r1
      0x0023: PHI (r1v1 java.lang.String) = (r1v0 java.lang.String), (r1v3 java.lang.String) binds: [B:6:0x0010, B:8:0x001e] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean ycx(Map<String, String> map) {
        String str;
        if (map == null) {
            return false;
        }
        String str2 = "content-type";
        if (TextUtils.isEmpty(map.get("content-type"))) {
            str2 = "Content-Type";
            str = TextUtils.isEmpty(map.get("Content-Type")) ? b.f42142b : map.get(str2);
        }
        return str.contains("application/octet-stream");
    }
}
