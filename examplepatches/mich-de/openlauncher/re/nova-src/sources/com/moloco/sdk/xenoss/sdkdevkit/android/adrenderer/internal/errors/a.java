package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a implements c {

    /* renamed from: a, reason: collision with root package name */
    public static final a f38719a = new a("STATIC_AD_LOAD_INTERNAL_TIMEOUT_ERROR", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final a f38720b = new a("VAST_AD_LOAD_INTERNAL_TIMEOUT_ERROR", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final a f38721c = new a("MRAID_AD_LOAD_INTERNAL_TIMEOUT_ERROR", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final a f38722d = new a("NATIVE_AD_LOAD_INTERNAL_TIMEOUT_ERROR", 3);

    /* renamed from: e, reason: collision with root package name */
    public static final a f38723e = new a("VAST_FULLSCREEN_AD_LOAD_INTERNAL_TIMEOUT_ERROR", 4);

    /* renamed from: f, reason: collision with root package name */
    public static final a f38724f = new a("MRAID_FULLSCREEN_AD_LOAD_INTERNAL_TIMEOUT_ERROR", 5);

    /* renamed from: g, reason: collision with root package name */
    public static final a f38725g = new a("STATIC_FULLSCREEN_AD_LOAD_INTERNAL_TIMEOUT_ERROR", 6);

    /* renamed from: h, reason: collision with root package name */
    public static final a f38726h = new a("VAST_BANNER_AD_LOAD_INTERNAL_TIMEOUT_ERROR", 7);

    /* renamed from: i, reason: collision with root package name */
    public static final a f38727i = new a("MRAID_BANNER_AD_LOAD_INTERNAL_TIMEOUT_ERROR", 8);

    /* renamed from: j, reason: collision with root package name */
    public static final a f38728j = new a("STATIC_BANNER_AD_LOAD_INTERNAL_TIMEOUT_ERROR", 9);

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ a[] f38729k;

    /* renamed from: l, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f38730l;

    static {
        a[] aVarArrB = b();
        f38729k = aVarArrB;
        f38730l = EnumEntriesKt.a(aVarArrB);
    }

    public a(String str, int i5) {
    }

    public static final /* synthetic */ a[] b() {
        return new a[]{f38719a, f38720b, f38721c, f38722d, f38723e, f38724f, f38725g, f38726h, f38727i, f38728j};
    }

    @NotNull
    public static EnumEntries<a> c() {
        return f38730l;
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f38729k.clone();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c
    @NotNull
    public String a() {
        return name();
    }
}
