package com.moloco.sdk.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class m {

    /* renamed from: c, reason: collision with root package name */
    public static final int f36590c = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f36591a;

    /* renamed from: b, reason: collision with root package name */
    public final int f36592b;

    public m(@NotNull String description, int i5) {
        Intrinsics.g(description, "description");
        this.f36591a = description;
        this.f36592b = i5;
    }

    @NotNull
    public final String a() {
        return this.f36591a;
    }

    public final int b() {
        return this.f36592b;
    }
}
