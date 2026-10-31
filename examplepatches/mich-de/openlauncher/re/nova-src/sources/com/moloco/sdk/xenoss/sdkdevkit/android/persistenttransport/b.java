package com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport;

import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.d;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class b implements a {

    /* renamed from: c, reason: collision with root package name */
    public static final int f42193c = 8;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final d f42194b;

    public b(@NotNull d delegate) {
        Intrinsics.g(delegate, "delegate");
        this.f42194b = delegate;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.d
    public void a(@NotNull String url) {
        Intrinsics.g(url, "url");
        this.f42194b.a(url);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.d
    public void a(@NotNull String url, @NotNull byte[] body, @NotNull o50.e contentType, @Nullable String str) {
        Intrinsics.g(url, "url");
        Intrinsics.g(body, "body");
        Intrinsics.g(contentType, "contentType");
        d.a.a(this.f42194b, url, body, contentType, null, 8, null);
    }
}
