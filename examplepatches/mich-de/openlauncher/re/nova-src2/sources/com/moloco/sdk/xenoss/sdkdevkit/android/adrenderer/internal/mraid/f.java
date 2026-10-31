package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid;

import android.webkit.WebView;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import w70.g2;
import w70.q1;

/* loaded from: classes4.dex */
public interface f extends com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.l {
    @NotNull
    g2 L();

    @Nullable
    Object a(@NotNull String str, @NotNull Continuation<? super com.moloco.sdk.internal.x<c, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.d>> continuation);

    void a(@NotNull n nVar, @NotNull String str);

    void a(@NotNull r rVar);

    void a(@NotNull s sVar);

    void a(@NotNull t tVar);

    void a(boolean z11);

    void a(boolean z11, boolean z12, boolean z13, boolean z14, boolean z15);

    @NotNull
    WebView c();

    void j();

    @NotNull
    q1 y();

    @NotNull
    g2 z();
}
