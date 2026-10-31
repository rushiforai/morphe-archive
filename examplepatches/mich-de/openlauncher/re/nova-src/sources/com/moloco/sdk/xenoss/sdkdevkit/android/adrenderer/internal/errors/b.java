package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class b implements c {

    /* renamed from: a, reason: collision with root package name */
    public static final b f38731a = new b("FULLSCREEN_AD_SHOW_FAILED_NO_SUPPORTED_TYPE", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final b f38732b = new b("FULLSCREEN_AD_COMPOSE_VIEW_NOT_AVAILABLE", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ b[] f38733c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f38734d;

    static {
        b[] bVarArrB = b();
        f38733c = bVarArrB;
        f38734d = EnumEntriesKt.a(bVarArrB);
    }

    public b(String str, int i5) {
    }

    public static final /* synthetic */ b[] b() {
        return new b[]{f38731a, f38732b};
    }

    @NotNull
    public static EnumEntries<b> c() {
        return f38734d;
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f38733c.clone();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c
    @NotNull
    public String a() {
        return name();
    }
}
