package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class w {

    /* renamed from: d, reason: collision with root package name */
    public static final int f40838d = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final List<C3022a> f40839a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final String f40840b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final String f40841c;

    public w(@NotNull List<C3022a> ads, @Nullable String str, @Nullable String str2) {
        Intrinsics.g(ads, "ads");
        this.f40839a = ads;
        this.f40840b = str;
        this.f40841c = str2;
    }

    @NotNull
    public final List<C3022a> a() {
        return this.f40839a;
    }

    @Nullable
    public final String b() {
        return this.f40840b;
    }

    @Nullable
    public final String c() {
        return this.f40841c;
    }
}
