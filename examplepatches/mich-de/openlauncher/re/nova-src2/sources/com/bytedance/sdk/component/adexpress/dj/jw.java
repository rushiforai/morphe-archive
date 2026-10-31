package com.bytedance.sdk.component.adexpress.dj;

import android.net.Uri;
import android.text.TextUtils;

/* loaded from: classes2.dex */
public class jw {

    public enum ycx {
        HTML("text/html"),
        CSS("text/css"),
        JS("application/x-javascript"),
        IMAGE("image/*"),
        VIDEO("video/mp4");


        /* renamed from: lt, reason: collision with root package name */
        private String f23282lt;

        ycx(String str) {
            this.f23282lt = str;
        }

        public String ycx() {
            return this.f23282lt;
        }
    }

    public static ycx ycx(String str) {
        ycx ycxVar = ycx.IMAGE;
        if (!TextUtils.isEmpty(str)) {
            try {
                String path = Uri.parse(str).getPath();
                if (path != null) {
                    if (path.endsWith(".css")) {
                        return ycx.CSS;
                    }
                    if (path.endsWith(".js")) {
                        return ycx.JS;
                    }
                    if (!path.endsWith(".jpg") && !path.endsWith(".gif") && !path.endsWith(".png") && !path.endsWith(".jpeg") && !path.endsWith(".webp") && !path.endsWith(".bmp") && !path.endsWith(".ico")) {
                        if (path.endsWith(".html")) {
                            return ycx.HTML;
                        }
                        if (path.endsWith(".mp4")) {
                            return ycx.VIDEO;
                        }
                    }
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ804lGxA==", "bvwhoBe1ZdQ=", "XOs5uAqxbA==", 42);
            }
        }
        return ycxVar;
    }
}
