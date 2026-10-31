package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.webview;

import android.util.Base64;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class e implements f {

    /* renamed from: a, reason: collision with root package name */
    public static final int f42019a = 0;

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.webview.f
    @NotNull
    public String a(@NotNull String content) {
        Intrinsics.g(content, "content");
        byte[] bytes = r70.f.o0(content).getBytes(Charsets.f72000b);
        Intrinsics.f(bytes, "getBytes(...)");
        String strEncodeToString = Base64.encodeToString(bytes, 1);
        Intrinsics.f(strEncodeToString, "encodeToString(...)");
        return strEncodeToString;
    }
}
