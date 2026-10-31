package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.webview;

import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.w;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class i implements h {

    /* renamed from: d, reason: collision with root package name */
    public static final int f42022d = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final j f42023a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final f f42024b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final g f42025c;

    public i(@NotNull j localAssetLoader, @NotNull f contentEncoder, @NotNull g cssMarginHandler) {
        Intrinsics.g(localAssetLoader, "localAssetLoader");
        Intrinsics.g(contentEncoder, "contentEncoder");
        Intrinsics.g(cssMarginHandler, "cssMarginHandler");
        this.f42023a = localAssetLoader;
        this.f42024b = contentEncoder;
        this.f42025c = cssMarginHandler;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.webview.h
    @NotNull
    public String a(@NotNull String html) {
        Intrinsics.g(html, "html");
        String strA = this.f42023a.a(w.f39244k);
        return r70.f.o0("\n            <script>" + this.f42023a.a("mraid-bridge.js") + "</script>\n            <iframe id=\"adFrame\"\n                style=\"width:100vw; height:100vh; border:none;\"\n                src=\"data:text/html;base64," + this.f42024b.a(r70.j.F0(this.f42025c.a(html), "<script src=\"mraid.js\"></script>", c0.l("<script>", strA, "</script>"), false)) + "\"\n                sandbox=\"allow-scripts allow-same-origin\"\n            >\n            </iframe>\n        ");
    }

    public /* synthetic */ i(j jVar, f fVar, g gVar, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(jVar, fVar, (i5 & 4) != 0 ? new g() : gVar);
    }
}
