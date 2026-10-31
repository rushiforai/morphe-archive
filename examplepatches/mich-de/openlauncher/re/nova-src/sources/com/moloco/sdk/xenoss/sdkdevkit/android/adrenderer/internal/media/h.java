package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media;

import android.content.Context;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public static final int f38915a = 100;

    /* renamed from: b, reason: collision with root package name */
    public static final int f38916b = 101;

    /* renamed from: c, reason: collision with root package name */
    public static final int f38917c = 102;

    /* renamed from: d, reason: collision with root package name */
    public static final int f38918d = 200;

    @NotNull
    public static final f a(@NotNull Context appContext, @NotNull String cacheDir) {
        Intrinsics.g(appContext, "appContext");
        Intrinsics.g(cacheDir, "cacheDir");
        return new g(appContext, cacheDir);
    }
}
