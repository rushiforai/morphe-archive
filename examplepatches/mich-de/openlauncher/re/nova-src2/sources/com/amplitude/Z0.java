package com.amplitude;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class Z0 {

    /* renamed from: a, reason: collision with root package name */
    public static final Z0 f20450a;

    /* renamed from: b, reason: collision with root package name */
    public static final Z0 f20451b;

    /* renamed from: c, reason: collision with root package name */
    public static final Z0 f20452c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ Z0[] f20453d;

    static {
        Z0 z02 = new Z0("UNKNOWN", 0);
        f20450a = z02;
        Z0 z03 = new Z0("LOW", 1);
        f20451b = z03;
        Z0 z04 = new Z0("OK", 2);
        f20452c = z04;
        Z0[] z0Arr = {z02, z03, z04};
        f20453d = z0Arr;
        EnumEntriesKt.a(z0Arr);
    }

    public Z0(String str, int i5) {
    }

    public static Z0 valueOf(String str) {
        return (Z0) Enum.valueOf(Z0.class, str);
    }

    public static Z0[] values() {
        return (Z0[]) f20453d.clone();
    }
}
