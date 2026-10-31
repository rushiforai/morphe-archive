package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import android.content.Context;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.s, reason: case insensitive filesystem */
/* loaded from: classes.dex */
public final class C2991s implements r {

    /* renamed from: b, reason: collision with root package name */
    public static final int f39275b = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f39276a;

    public C2991s(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f39276a = context;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r
    public boolean a(@NotNull String uri) {
        Intrinsics.g(uri, "uri");
        return C2992t.b(this.f39276a, uri);
    }
}
