package com.moloco.sdk.internal.utils;

import android.content.Context;
import android.os.StatFs;
import com.bykv.vk.openvk.preload.falconx.statistic.StatisticData;
import java.io.File;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.j;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final f f38220a = new f();

    /* renamed from: b, reason: collision with root package name */
    public static final int f38221b = 50;

    /* renamed from: c, reason: collision with root package name */
    public static final int f38222c = 75;

    /* renamed from: d, reason: collision with root package name */
    public static final int f38223d = 33;

    /* renamed from: e, reason: collision with root package name */
    public static final int f38224e = 66;

    /* renamed from: f, reason: collision with root package name */
    public static final int f38225f = 0;

    @Nullable
    public final e a(@NotNull File file) {
        Intrinsics.g(file, "file");
        try {
            String parent = file.getParent();
            if (parent == null) {
                parent = file.getAbsolutePath();
            }
            StatFs statFs = new StatFs(parent);
            return new e(statFs.getAvailableBytes(), statFs.getTotalBytes());
        } catch (Exception unused) {
            return null;
        }
    }

    @NotNull
    public final String b(int i5) {
        return i5 < 50 ? "low" : i5 < 75 ? "medium" : "high";
    }

    @Nullable
    public final String a(@NotNull File file, @NotNull Context context) {
        Intrinsics.g(file, "file");
        Intrinsics.g(context, "context");
        File externalCacheDir = context.getExternalCacheDir();
        String absolutePath = file.getAbsolutePath();
        if (externalCacheDir != null) {
            Intrinsics.d(absolutePath);
            String absolutePath2 = externalCacheDir.getAbsolutePath();
            Intrinsics.f(absolutePath2, "getAbsolutePath(...)");
            if (j.I0(absolutePath, absolutePath2, false)) {
                return "external";
            }
        }
        Intrinsics.d(absolutePath);
        String absolutePath3 = context.getCacheDir().getAbsolutePath();
        Intrinsics.f(absolutePath3, "getAbsolutePath(...)");
        if (j.I0(absolutePath, absolutePath3, false)) {
            return "internal";
        }
        return null;
    }

    @NotNull
    public final String a(int i5) {
        if (i5 <= 33) {
            return "0-33";
        }
        if (i5 <= 66) {
            return "34-66";
        }
        if (i5 < 100) {
            return "67-99";
        }
        return StatisticData.ERROR_CODE_NOT_FOUND;
    }
}
