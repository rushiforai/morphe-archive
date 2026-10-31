package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class f {

    /* renamed from: c, reason: collision with root package name */
    public static final int f40741c = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f40742a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final List<String> f40743b;

    public f(@NotNull String clickThroughUrl, @NotNull List<String> clickTrackingUrls) {
        Intrinsics.g(clickThroughUrl, "clickThroughUrl");
        Intrinsics.g(clickTrackingUrls, "clickTrackingUrls");
        this.f40742a = clickThroughUrl;
        this.f40743b = clickTrackingUrls;
    }

    @NotNull
    public final String a() {
        return this.f40742a;
    }

    @NotNull
    public final List<String> b() {
        return this.f40743b;
    }
}
