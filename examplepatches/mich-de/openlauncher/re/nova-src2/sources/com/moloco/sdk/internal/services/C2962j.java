package com.moloco.sdk.internal.services;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: com.moloco.sdk.internal.services.j, reason: case insensitive filesystem */
/* loaded from: classes.dex */
public final class C2962j {

    /* renamed from: d, reason: collision with root package name */
    public static final int f38113d = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f38114a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f38115b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f38116c;

    public C2962j(@NotNull String applicationName, @NotNull String packageName, @NotNull String version) {
        Intrinsics.g(applicationName, "applicationName");
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(version, "version");
        this.f38114a = applicationName;
        this.f38115b = packageName;
        this.f38116c = version;
    }

    @NotNull
    public final String a() {
        return this.f38114a;
    }

    @NotNull
    public final String b() {
        return this.f38115b;
    }

    @NotNull
    public final String c() {
        return this.f38116c;
    }
}
