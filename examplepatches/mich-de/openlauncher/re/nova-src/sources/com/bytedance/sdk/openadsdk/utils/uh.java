package com.bytedance.sdk.openadsdk.utils;

import android.content.Context;
import androidx.recyclerview.widget.u1;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class uh {
    public static void ycx() {
        Context contextYcx = com.bytedance.sdk.openadsdk.core.pmi.ycx();
        if (contextYcx != null && com.bytedance.sdk.component.utils.syc.sya()) {
            String packageName = contextYcx.getPackageName();
            int i5 = contextYcx.getApplicationInfo().targetSdkVersion;
            try {
                String[] strArr = contextYcx.getPackageManager().getPackageInfo(packageName, u1.FLAG_APPEARED_IN_PRE_LAYOUT).requestedPermissions;
                if (strArr == null || strArr.length <= 0) {
                    return;
                }
                List<String> listZb = zb();
                for (String str : strArr) {
                    if (str != null) {
                        listZb.remove(str);
                    }
                }
                if (listZb.isEmpty()) {
                    return;
                }
                for (String str2 : listZb) {
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "cuAkgSC0bMSLT8U=", "WOYolgg=", 60);
            }
        }
    }

    private static List<String> zb() {
        ArrayList arrayList = new ArrayList();
        arrayList.add("android.permission.INTERNET");
        arrayList.add("android.permission.ACCESS_NETWORK_STATE");
        arrayList.add("android.permission.WAKE_LOCK");
        return arrayList;
    }
}
