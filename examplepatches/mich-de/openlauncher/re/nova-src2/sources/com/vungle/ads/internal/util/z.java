package com.vungle.ads.internal.util;

import android.content.Context;
import android.webkit.URLUtil;
import java.io.File;
import kotlin.io.FileTreeWalk;
import kotlin.io.FileWalkDirection;
import kotlin.io.FilesKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class z {
    public static boolean a() {
        return false;
    }

    public static boolean a(String str) {
        if (str == null || str.length() == 0) {
            return false;
        }
        return URLUtil.isHttpsUrl(str) || URLUtil.isHttpUrl(str);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static long a(Context context) {
        long length;
        Intrinsics.g(context, "context");
        long length2 = 0;
        try {
            File file = new File(context.getApplicationInfo().dataDir, "app_webview");
            if (file.exists() && file.exists()) {
                m70.f fVar = new m70.f(new FileTreeWalk(file, FileWalkDirection.f71828a));
                length = 0;
                while (fVar.hasNext()) {
                    File file2 = (File) fVar.next();
                    if (file2.isFile()) {
                        length += file2.length();
                    }
                }
            } else {
                length = 0;
            }
        } catch (Exception e3) {
            e = e3;
        }
        try {
            File cacheDir = context.getCacheDir();
            if (!cacheDir.exists()) {
                return length;
            }
            File fileU0 = FilesKt.u0(cacheDir, "webviewCache");
            if (fileU0.exists()) {
                m70.f fVar2 = new m70.f(new FileTreeWalk(fileU0, FileWalkDirection.f71828a));
                while (fVar2.hasNext()) {
                    File file3 = (File) fVar2.next();
                    if (file3.isFile()) {
                        length2 += file3.length();
                    }
                }
            }
            return length + length2;
        } catch (Exception e11) {
            e = e11;
            length2 = length;
            boolean z11 = u.f47714a;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Error reading WebView data size: ");
            sbA.append(e.getMessage());
            t.b("WebViewSize", sbA.toString());
            return length2;
        }
    }
}
