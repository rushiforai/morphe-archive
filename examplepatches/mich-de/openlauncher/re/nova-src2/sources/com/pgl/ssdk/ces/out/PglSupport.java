package com.pgl.ssdk.ces.out;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.pgl.ssdk.av;
import com.pgl.ssdk.ces.a;

/* loaded from: classes4.dex */
public class PglSupport {

    /* renamed from: a, reason: collision with root package name */
    private static String f42356a;

    static {
        av.b("nms");
    }

    public static String getBootid() {
        String str;
        String str2 = f42356a;
        if (str2 != null) {
            return str2;
        }
        try {
            if (!av.a("nms") || (str = (String) a.meta(172, null, null)) == null) {
                return b.f42142b;
            }
            f42356a = str;
            return str;
        } catch (Throwable unused) {
            return b.f42142b;
        }
    }
}
