package com.bytedance.sdk.openadsdk;

import android.text.TextUtils;
import ar.g;
import b.c0;
import com.bytedance.sdk.component.utils.ul;
import com.bytedance.sdk.openadsdk.core.pmi;
import java.io.File;
import sb.b;

/* loaded from: classes.dex */
public class CacheDirFactory {
    public static volatile b MEDIA_CACHE_DIR = null;
    public static String ROOT_DIR = null;
    public static final int SPLASH_USE_INTERNAL_STORAGE = 1;
    private static String ycx;

    public static int getCacheType() {
        return 1;
    }

    public static String getDiskCacheDirPath(String str) {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(getRootDir());
        return c0.q(sb2, File.separator, str);
    }

    public static b getICacheDir() {
        return ycx();
    }

    public static String getImageCacheDir(String str) {
        if (ycx == null) {
            ycx = getDiskCacheDirPath(str);
        }
        return ycx;
    }

    public static String getRootDir() {
        if (!TextUtils.isEmpty(ROOT_DIR)) {
            return ROOT_DIR;
        }
        File fileYcx = ul.ycx(pmi.ycx(), "tt_ad");
        if (fileYcx.isFile()) {
            fileYcx.delete();
        }
        if (!fileYcx.exists()) {
            fileYcx.mkdirs();
        }
        String absolutePath = fileYcx.getAbsolutePath();
        ROOT_DIR = absolutePath;
        return absolutePath;
    }

    private static b ycx() {
        if (MEDIA_CACHE_DIR == null) {
            synchronized (CacheDirFactory.class) {
                try {
                    if (MEDIA_CACHE_DIR == null) {
                        g gVar = new g();
                        MEDIA_CACHE_DIR = gVar;
                        gVar.f(getRootDir());
                        ((g) MEDIA_CACHE_DIR).a();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return MEDIA_CACHE_DIR;
    }
}
