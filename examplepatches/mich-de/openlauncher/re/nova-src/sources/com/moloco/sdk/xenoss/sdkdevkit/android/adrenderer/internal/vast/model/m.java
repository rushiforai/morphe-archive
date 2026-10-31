package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class m {

    /* renamed from: c, reason: collision with root package name */
    public static final int f40773c = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f40774a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final List<String> f40775b;

    public m(@NotNull String clickThroughUrl, @NotNull List<String> clickTrackingUrlList) {
        Intrinsics.g(clickThroughUrl, "clickThroughUrl");
        Intrinsics.g(clickTrackingUrlList, "clickTrackingUrlList");
        this.f40774a = clickThroughUrl;
        this.f40775b = clickTrackingUrlList;
    }

    @NotNull
    public final String a() {
        return this.f40774a;
    }

    @NotNull
    public final List<String> b() {
        return this.f40775b;
    }
}
