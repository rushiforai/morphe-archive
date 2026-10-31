package com.amplitude;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class P0 {

    /* renamed from: a, reason: collision with root package name */
    public static final P0 f20355a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ P0[] f20356b;

    static {
        P0 p02 = new P0("PNG", 0);
        P0 p03 = new P0("JPEG", 1);
        P0 p04 = new P0("WEBP", 2);
        f20355a = p04;
        P0[] p0Arr = {p02, p03, p04};
        f20356b = p0Arr;
        EnumEntriesKt.a(p0Arr);
    }

    public P0(String str, int i5) {
    }

    public static P0 valueOf(String str) {
        return (P0) Enum.valueOf(P0.class, str);
    }

    public static P0[] values() {
        return (P0[]) f20356b.clone();
    }
}
