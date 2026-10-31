package com.moloco.sdk.internal.services;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class H {

    /* renamed from: a, reason: collision with root package name */
    public static final H f37631a = new H("UNKNOWN", 0);

    /* renamed from: b, reason: collision with root package name */
    public static final H f37632b = new H("PORTRAIT", 1);

    /* renamed from: c, reason: collision with root package name */
    public static final H f37633c = new H("LANDSCAPE", 2);

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ H[] f37634d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ EnumEntries f37635e;

    static {
        H[] hArrA = a();
        f37634d = hArrA;
        f37635e = EnumEntriesKt.a(hArrA);
    }

    public H(String str, int i5) {
    }

    public static final /* synthetic */ H[] a() {
        return new H[]{f37631a, f37632b, f37633c};
    }

    @NotNull
    public static EnumEntries<H> b() {
        return f37635e;
    }

    public static H valueOf(String str) {
        return (H) Enum.valueOf(H.class, str);
    }

    public static H[] values() {
        return (H[]) f37634d.clone();
    }
}
