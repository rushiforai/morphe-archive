package com.amplitude;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class K1 {

    /* renamed from: a, reason: collision with root package name */
    public static final J1 f20299a;

    /* renamed from: b, reason: collision with root package name */
    public static final K1 f20300b;

    /* renamed from: c, reason: collision with root package name */
    public static final K1 f20301c;

    /* renamed from: d, reason: collision with root package name */
    public static final K1 f20302d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ K1[] f20303e;

    static {
        K1 k12 = new K1("LOW", 0);
        f20300b = k12;
        K1 k13 = new K1("MEDIUM", 1);
        f20301c = k13;
        K1 k14 = new K1("HIGH", 2);
        f20302d = k14;
        K1[] k1Arr = {k12, k13, k14};
        f20303e = k1Arr;
        EnumEntriesKt.a(k1Arr);
        f20299a = new J1();
    }

    public K1(String str, int i5) {
    }

    public static K1 valueOf(String str) {
        return (K1) Enum.valueOf(K1.class, str);
    }

    public static K1[] values() {
        return (K1[]) f20303e.clone();
    }
}
