package com.bytedance.sdk.component.utils;

import java.io.Closeable;
import java.io.IOException;

/* loaded from: classes2.dex */
public class jc {
    public static void ycx(Closeable closeable) throws IOException {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (RuntimeException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "csEYgQqweg==", "WOIihgaNfM6FXttE", 15);
                throw e3;
            } catch (Exception e11) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "csEYgQqweg==", "WOIihgaNfM6FXttE", 17);
            }
        }
    }
}
