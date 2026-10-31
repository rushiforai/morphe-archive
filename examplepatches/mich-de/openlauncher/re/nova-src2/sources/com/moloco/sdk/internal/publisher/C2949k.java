package com.moloco.sdk.internal.publisher;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: com.moloco.sdk.internal.publisher.k, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2949k {

    /* renamed from: c, reason: collision with root package name */
    public static final int f37106c = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f37107a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Float f37108b;

    public C2949k(@NotNull String burl, @Nullable Float f11) {
        Intrinsics.g(burl, "burl");
        this.f37107a = burl;
        this.f37108b = f11;
    }

    @NotNull
    public final String a() {
        return this.f37107a;
    }

    @Nullable
    public final Float b() {
        return this.f37108b;
    }
}
