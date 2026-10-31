package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media;

import android.content.Context;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.internal.x;
import java.io.File;
import java.io.IOException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class g implements f {

    /* renamed from: d, reason: collision with root package name */
    public static final int f38911d = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f38912a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f38913b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f38914c;

    public g(@NotNull Context appContext, @NotNull String cacheDir) {
        Intrinsics.g(appContext, "appContext");
        Intrinsics.g(cacheDir, "cacheDir");
        this.f38912a = appContext;
        this.f38913b = cacheDir;
        this.f38914c = "MediaCacheLocationProviderImpl";
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.f
    @NotNull
    public x<File, com.moloco.sdk.internal.m> a() {
        try {
            File externalCacheDir = this.f38912a.getExternalCacheDir();
            if (externalCacheDir != null) {
                File file = new File(externalCacheDir, this.f38913b);
                file.mkdir();
                if (file.exists()) {
                    return new x.b(file);
                }
            }
            MolocoLogger.warn$default(MolocoLogger.INSTANCE, this.f38914c, "Failed to create cache directory in external storage", null, false, 12, null);
            return new x.a(new com.moloco.sdk.internal.m("Failed to create cache directory in external storage", 102));
        } catch (IOException e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, this.f38914c, "Failed to create cache directory in external storage", e3, false, 8, null);
            return new x.a(new com.moloco.sdk.internal.m("Failed to create cache directory in external storage", 101));
        } catch (SecurityException e11) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, this.f38914c, "Failed to create cache directory in external storage", e11, false, 8, null);
            return new x.a(new com.moloco.sdk.internal.m("Failed to create cache directory in external storage", 100));
        } catch (Exception e12) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, this.f38914c, "Failed to create cache directory in external storage", e12, false, 8, null);
            return new x.a(new com.moloco.sdk.internal.m("Failed to create cache directory in external storage", 200));
        }
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.f
    @NotNull
    public x<File, com.moloco.sdk.internal.m> b() {
        try {
            if (this.f38912a.getCacheDir() != null) {
                File file = new File(this.f38912a.getCacheDir(), this.f38913b);
                file.mkdir();
                if (file.exists()) {
                    MolocoLogger.debug$default(MolocoLogger.INSTANCE, this.f38914c, "Able to write to internal storage cache directory", false, 4, null);
                    return new x.b(file);
                }
            }
            MolocoLogger.error$default(MolocoLogger.INSTANCE, this.f38914c, "Failed to create cache directory in internal storage", null, false, 12, null);
            return new x.a(new com.moloco.sdk.internal.m("Failed to create cache directory in internal storage", 102));
        } catch (IOException e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, this.f38914c, "Failed to create cache directory in external storage", e3, false, 8, null);
            return new x.a(new com.moloco.sdk.internal.m("Failed to create cache directory in internal storage", 101));
        } catch (SecurityException e11) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, this.f38914c, "Failed to create cache directory in external storage", e11, false, 8, null);
            return new x.a(new com.moloco.sdk.internal.m("Failed to create cache directory in internal storage", 100));
        } catch (Exception e12) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, this.f38914c, "Failed to create cache directory in external storage", e12, false, 8, null);
            return new x.a(new com.moloco.sdk.internal.m("Failed to create cache directory in internal storage", 200));
        }
    }

    @NotNull
    public final Context c() {
        return this.f38912a;
    }

    @NotNull
    public final String d() {
        return this.f38913b;
    }
}
