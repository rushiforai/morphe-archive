package com.vungle.ads.internal.util;

import android.content.Context;
import android.os.StatFs;
import java.io.File;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(bv = {}, d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u0001J\u0006\u0010\u0003\u001a\u00020\u0002J\u0006\u0010\u0004\u001a\u00020\u0002¨\u0006\u0005"}, d2 = {"Lcom/vungle/ads/internal/util/PathProvider;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Ljava/io/File;", "getCleverCacheDir", "getVmDir", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes.dex */
public final class PathProvider {

    /* renamed from: a, reason: collision with root package name */
    public final Context f47669a;

    /* renamed from: b, reason: collision with root package name */
    public final File f47670b;

    /* renamed from: c, reason: collision with root package name */
    public final File f47671c;

    /* renamed from: d, reason: collision with root package name */
    public final File f47672d;

    public PathProvider(Context context) {
        Intrinsics.g(context, "context");
        this.f47669a = context;
        File file = new File(context.getNoBackupFilesDir(), "vungle_cache");
        this.f47670b = file;
        File file2 = new File(file, "adAssets");
        this.f47671c = file2;
        File file3 = new File(file, "clever_cache");
        this.f47672d = file3;
        for (File file4 : ul.b.Q(file, file2, file3)) {
            if (!file4.exists()) {
                file4.mkdirs();
            }
        }
    }

    public final File a() {
        File noBackupFilesDir = this.f47669a.getNoBackupFilesDir();
        Intrinsics.f(noBackupFilesDir, "context.noBackupFilesDir");
        return noBackupFilesDir;
    }

    public final File b(String str) {
        if (str == null || str.length() == 0) {
            return null;
        }
        File file = new File(getVmDir(), str);
        if (!file.exists()) {
            file.mkdirs();
        }
        return file;
    }

    public final File c() {
        if (!this.f47670b.exists()) {
            this.f47670b.mkdirs();
        }
        return this.f47670b;
    }

    @NotNull
    public final File getCleverCacheDir() {
        if (!this.f47672d.exists()) {
            this.f47672d.mkdirs();
        }
        return this.f47672d;
    }

    @NotNull
    public final File getVmDir() {
        if (!this.f47671c.exists()) {
            this.f47671c.mkdirs();
        }
        return this.f47671c;
    }

    public static long a(String path) {
        Intrinsics.g(path, "path");
        try {
            return new StatFs(path).getAvailableBytes();
        } catch (IllegalArgumentException e3) {
            boolean z11 = u.f47714a;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Failed to get available bytes ");
            sbA.append(e3.getMessage());
            t.c("PathProvider", sbA.toString());
            return -1L;
        }
    }

    public final File b() {
        return new File(a(), "unclosed_ad");
    }
}
