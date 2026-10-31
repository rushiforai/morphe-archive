package com.amplitude;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* renamed from: com.amplitude.j, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class EnumC0458j {

    /* renamed from: a, reason: collision with root package name */
    public static final EnumC0458j f20617a;

    /* renamed from: b, reason: collision with root package name */
    public static final EnumC0458j f20618b;

    /* renamed from: c, reason: collision with root package name */
    public static final EnumC0458j f20619c;

    /* renamed from: d, reason: collision with root package name */
    public static final EnumC0458j f20620d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ EnumC0458j[] f20621e;

    static {
        EnumC0458j enumC0458j = new EnumC0458j("VIEW_GROUP", 0);
        f20617a = enumC0458j;
        EnumC0458j enumC0458j2 = new EnumC0458j("TEXTURE_VIEW", 1);
        f20618b = enumC0458j2;
        EnumC0458j enumC0458j3 = new EnumC0458j("SURFACE_VIEW", 2);
        f20619c = enumC0458j3;
        EnumC0458j enumC0458j4 = new EnumC0458j("BASIC_VIEW", 3);
        f20620d = enumC0458j4;
        EnumC0458j[] enumC0458jArr = {enumC0458j, enumC0458j2, enumC0458j3, enumC0458j4};
        f20621e = enumC0458jArr;
        EnumEntriesKt.a(enumC0458jArr);
    }

    public EnumC0458j(String str, int i5) {
    }

    public static EnumC0458j valueOf(String str) {
        return (EnumC0458j) Enum.valueOf(EnumC0458j.class, str);
    }

    public static EnumC0458j[] values() {
        return (EnumC0458j[]) f20621e.clone();
    }
}
