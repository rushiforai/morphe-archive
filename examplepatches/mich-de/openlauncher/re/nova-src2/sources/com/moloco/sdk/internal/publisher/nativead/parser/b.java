package com.moloco.sdk.internal.publisher.nativead.parser;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class b extends Exception {

    /* renamed from: c, reason: collision with root package name */
    public static final int f37361c = 8;

    /* renamed from: a, reason: collision with root package name */
    public final int f37362a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c f37363b;

    public b(int i5, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c errorSubType) {
        Intrinsics.g(errorSubType, "errorSubType");
        this.f37362a = i5;
        this.f37363b = errorSubType;
    }

    public final int a() {
        return this.f37362a;
    }

    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c b() {
        return this.f37363b;
    }
}
