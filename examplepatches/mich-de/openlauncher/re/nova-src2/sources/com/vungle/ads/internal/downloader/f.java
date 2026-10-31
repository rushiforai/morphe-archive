package com.vungle.ads.internal.downloader;

import com.vungle.ads.internal.ConfigManager;
import com.vungle.ads.internal.util.PathProvider;
import com.vungle.ads.internal.util.u;
import java.util.concurrent.TimeUnit;
import kotlin.jvm.internal.Intrinsics;
import x80.d0;
import x80.e0;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public static final f f46773a = new f();

    /* renamed from: b, reason: collision with root package name */
    public static volatile e0 f46774b;

    public final synchronized e0 a(PathProvider pathProvider) {
        e0 e0Var;
        try {
            Intrinsics.g(pathProvider, "pathProvider");
            e0Var = f46774b;
            if (e0Var == null) {
                d0 d0Var = new d0();
                TimeUnit timeUnit = TimeUnit.SECONDS;
                d0Var.d(60L, timeUnit);
                d0Var.c(60L, timeUnit);
                d0Var.f95442k = null;
                d0Var.f95439h = true;
                d0Var.f95440i = true;
                ConfigManager.INSTANCE.getClass();
                long jG = ConfigManager.g();
                int iF = ConfigManager.f();
                String absolutePath = pathProvider.getCleverCacheDir().getAbsolutePath();
                Intrinsics.f(absolutePath, "pathProvider.getCleverCacheDir().absolutePath");
                long jMin = Math.min(jG, (PathProvider.a(absolutePath) * iF) / 100);
                if (jMin > 0) {
                    d0Var.f95442k = new x80.f(pathProvider.getCleverCacheDir(), jMin);
                } else {
                    boolean z11 = u.f47714a;
                    com.vungle.ads.internal.util.t.c("AssetDownloader", "cache disk capacity size <=0, no clever cache active.");
                }
                e0 e0Var2 = new e0(d0Var);
                f46774b = e0Var2;
                e0Var = e0Var2;
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return e0Var;
    }
}
