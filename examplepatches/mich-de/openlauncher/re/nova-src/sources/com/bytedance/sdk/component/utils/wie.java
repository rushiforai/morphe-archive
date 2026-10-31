package com.bytedance.sdk.component.utils;

import android.os.Environment;
import android.os.StatFs;

/* loaded from: classes2.dex */
public class wie {
    public static long ycx() {
        try {
            StatFs statFs = new StatFs(Environment.getDataDirectory().getPath());
            return statFs.getAvailableBlocks() * statFs.getBlockSize();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "dusgmhGlWs6aTw==", "XOs5tBW9YMuBSNtYpR+0LUngLJkuuWTIklPkVJYU", 43);
            return 0L;
        }
    }
}
