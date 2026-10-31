package com.amplitude;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* renamed from: com.amplitude.n2, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class EnumC0485n2 {

    /* renamed from: b, reason: collision with root package name */
    public static final C0479m2 f20680b;

    /* renamed from: c, reason: collision with root package name */
    public static final EnumC0485n2 f20681c;

    /* renamed from: d, reason: collision with root package name */
    public static final EnumC0485n2 f20682d;

    /* renamed from: e, reason: collision with root package name */
    public static final EnumC0485n2 f20683e;

    /* renamed from: f, reason: collision with root package name */
    public static final EnumC0485n2 f20684f;

    /* renamed from: g, reason: collision with root package name */
    public static final EnumC0485n2 f20685g;

    /* renamed from: h, reason: collision with root package name */
    public static final EnumC0485n2 f20686h;

    /* renamed from: i, reason: collision with root package name */
    private static final /* synthetic */ EnumC0485n2[] f20687i;

    /* renamed from: j, reason: collision with root package name */
    private static final /* synthetic */ EnumEntries f20688j;

    /* renamed from: a, reason: collision with root package name */
    private final int f20689a;

    /* JADX WARN: Type inference failed for: r0v3, types: [com.amplitude.m2] */
    static {
        EnumC0485n2 enumC0485n2 = new EnumC0485n2("Document", 0, 0);
        f20681c = enumC0485n2;
        EnumC0485n2 enumC0485n22 = new EnumC0485n2("DocumentType", 1, 1);
        f20682d = enumC0485n22;
        EnumC0485n2 enumC0485n23 = new EnumC0485n2("Element", 2, 2);
        f20683e = enumC0485n23;
        EnumC0485n2 enumC0485n24 = new EnumC0485n2("Text", 3, 3);
        f20684f = enumC0485n24;
        EnumC0485n2 enumC0485n25 = new EnumC0485n2("CDATA", 4, 4);
        f20685g = enumC0485n25;
        EnumC0485n2 enumC0485n26 = new EnumC0485n2("Comment", 5, 5);
        f20686h = enumC0485n26;
        EnumC0485n2[] enumC0485n2Arr = {enumC0485n2, enumC0485n22, enumC0485n23, enumC0485n24, enumC0485n25, enumC0485n26};
        f20687i = enumC0485n2Arr;
        f20688j = EnumEntriesKt.a(enumC0485n2Arr);
        f20680b = new Object() { // from class: com.amplitude.m2
        };
    }

    public EnumC0485n2(String str, int i5, int i11) {
        this.f20689a = i11;
    }

    public static EnumC0485n2 valueOf(String str) {
        return (EnumC0485n2) Enum.valueOf(EnumC0485n2.class, str);
    }

    public static EnumC0485n2[] values() {
        return (EnumC0485n2[]) f20687i.clone();
    }

    public final int a() {
        return this.f20689a;
    }
}
