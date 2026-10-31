package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.webview;

import b.c0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: b, reason: collision with root package name */
    public static final int f42020b = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f42021a = "\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no\"> \n        <style> body { margin:0; padding:0; overflow:hidden; } </style>\n        ";

    @NotNull
    public final String a(@NotNull String toHtml) {
        Intrinsics.g(toHtml, "toHtml");
        return c0.q(new StringBuilder(), this.f42021a, toHtml);
    }
}
