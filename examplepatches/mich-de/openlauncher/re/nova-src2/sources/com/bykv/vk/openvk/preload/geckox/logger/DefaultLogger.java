package com.bykv.vk.openvk.preload.geckox.logger;

import android.util.Log;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: classes2.dex */
class DefaultLogger implements Logger {
    private static String formatMsgs(Object... objArr) {
        if (objArr == null || objArr.length == 0) {
            return b.f42142b;
        }
        StringBuilder sb2 = new StringBuilder();
        for (Object obj : objArr) {
            if (obj != null) {
                sb2.append(obj.toString());
            } else {
                sb2.append(" null ");
            }
            sb2.append(" ");
        }
        return sb2.toString();
    }

    @Override // com.bykv.vk.openvk.preload.geckox.logger.Logger
    public void d(String str, Object... objArr) {
        if (objArr == null) {
            return;
        }
        try {
            formatMsgs(objArr);
        } catch (Throwable unused) {
        }
    }

    @Override // com.bykv.vk.openvk.preload.geckox.logger.Logger
    public void e(String str, String str2, Throwable th2) {
        Log.e(str, str2, th2);
    }

    @Override // com.bykv.vk.openvk.preload.geckox.logger.Logger
    public void w(String str, String str2, Throwable th2) {
        Log.w(str, str2, th2);
    }

    @Override // com.bykv.vk.openvk.preload.geckox.logger.Logger
    public void w(String str, String str2) {
        if (str2 == null) {
            str2 = b.f42142b;
        }
        Log.w(str, str2);
    }
}
