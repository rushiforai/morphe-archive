package com.amplitude;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* renamed from: com.amplitude.r2, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class EnumC0507r2 {

    /* renamed from: b, reason: collision with root package name */
    public static final C0503q2 f20735b;

    /* renamed from: c, reason: collision with root package name */
    public static final EnumC0507r2 f20736c;

    /* renamed from: d, reason: collision with root package name */
    public static final EnumC0507r2 f20737d;

    /* renamed from: e, reason: collision with root package name */
    public static final EnumC0507r2 f20738e;

    /* renamed from: f, reason: collision with root package name */
    private static final /* synthetic */ EnumC0507r2[] f20739f;

    /* renamed from: g, reason: collision with root package name */
    private static final /* synthetic */ EnumEntries f20740g;

    /* renamed from: a, reason: collision with root package name */
    private final int f20741a;

    /* JADX WARN: Type inference failed for: r0v3, types: [com.amplitude.q2] */
    static {
        EnumC0507r2 enumC0507r2 = new EnumC0507r2("Mouse", 0, 0);
        f20736c = enumC0507r2;
        EnumC0507r2 enumC0507r22 = new EnumC0507r2("Pen", 1, 1);
        f20737d = enumC0507r22;
        EnumC0507r2 enumC0507r23 = new EnumC0507r2("Touch", 2, 2);
        f20738e = enumC0507r23;
        EnumC0507r2[] enumC0507r2Arr = {enumC0507r2, enumC0507r22, enumC0507r23};
        f20739f = enumC0507r2Arr;
        f20740g = EnumEntriesKt.a(enumC0507r2Arr);
        f20735b = new Object() { // from class: com.amplitude.q2
        };
    }

    public EnumC0507r2(String str, int i5, int i11) {
        this.f20741a = i11;
    }

    public static EnumC0507r2 valueOf(String str) {
        return (EnumC0507r2) Enum.valueOf(EnumC0507r2.class, str);
    }

    public static EnumC0507r2[] values() {
        return (EnumC0507r2[]) f20739f.clone();
    }

    public final int a() {
        return this.f20741a;
    }
}
