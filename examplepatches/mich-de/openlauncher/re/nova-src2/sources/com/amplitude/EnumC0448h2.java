package com.amplitude;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* renamed from: com.amplitude.h2, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class EnumC0448h2 {

    /* renamed from: b, reason: collision with root package name */
    public static final C0442g2 f20594b;

    /* renamed from: c, reason: collision with root package name */
    public static final EnumC0448h2 f20595c;

    /* renamed from: d, reason: collision with root package name */
    public static final EnumC0448h2 f20596d;

    /* renamed from: e, reason: collision with root package name */
    public static final EnumC0448h2 f20597e;

    /* renamed from: f, reason: collision with root package name */
    public static final EnumC0448h2 f20598f;

    /* renamed from: g, reason: collision with root package name */
    public static final EnumC0448h2 f20599g;

    /* renamed from: h, reason: collision with root package name */
    public static final EnumC0448h2 f20600h;

    /* renamed from: i, reason: collision with root package name */
    public static final EnumC0448h2 f20601i;

    /* renamed from: j, reason: collision with root package name */
    public static final EnumC0448h2 f20602j;

    /* renamed from: k, reason: collision with root package name */
    public static final EnumC0448h2 f20603k;

    /* renamed from: l, reason: collision with root package name */
    public static final EnumC0448h2 f20604l;

    /* renamed from: m, reason: collision with root package name */
    public static final EnumC0448h2 f20605m;
    private static final /* synthetic */ EnumC0448h2[] n;
    private static final /* synthetic */ EnumEntries o;

    /* renamed from: a, reason: collision with root package name */
    private final int f20606a;

    /* JADX WARN: Type inference failed for: r0v3, types: [com.amplitude.g2] */
    static {
        EnumC0448h2 enumC0448h2 = new EnumC0448h2("MouseUp", 0, 0);
        f20595c = enumC0448h2;
        EnumC0448h2 enumC0448h22 = new EnumC0448h2("MouseDown", 1, 1);
        f20596d = enumC0448h22;
        EnumC0448h2 enumC0448h23 = new EnumC0448h2("Click", 2, 2);
        f20597e = enumC0448h23;
        EnumC0448h2 enumC0448h24 = new EnumC0448h2("ContextMenu", 3, 3);
        f20598f = enumC0448h24;
        EnumC0448h2 enumC0448h25 = new EnumC0448h2("DblClick", 4, 4);
        f20599g = enumC0448h25;
        EnumC0448h2 enumC0448h26 = new EnumC0448h2("Focus", 5, 5);
        f20600h = enumC0448h26;
        EnumC0448h2 enumC0448h27 = new EnumC0448h2("Blur", 6, 6);
        f20601i = enumC0448h27;
        EnumC0448h2 enumC0448h28 = new EnumC0448h2("TouchStart", 7, 7);
        f20602j = enumC0448h28;
        EnumC0448h2 enumC0448h29 = new EnumC0448h2("TouchMoveDeparted", 8, 8);
        f20603k = enumC0448h29;
        EnumC0448h2 enumC0448h210 = new EnumC0448h2("TouchEnd", 9, 9);
        f20604l = enumC0448h210;
        EnumC0448h2 enumC0448h211 = new EnumC0448h2("TouchCancel", 10, 10);
        f20605m = enumC0448h211;
        EnumC0448h2[] enumC0448h2Arr = {enumC0448h2, enumC0448h22, enumC0448h23, enumC0448h24, enumC0448h25, enumC0448h26, enumC0448h27, enumC0448h28, enumC0448h29, enumC0448h210, enumC0448h211};
        n = enumC0448h2Arr;
        o = EnumEntriesKt.a(enumC0448h2Arr);
        f20594b = new Object() { // from class: com.amplitude.g2
        };
    }

    public EnumC0448h2(String str, int i5, int i11) {
        this.f20606a = i11;
    }

    public static EnumC0448h2 valueOf(String str) {
        return (EnumC0448h2) Enum.valueOf(EnumC0448h2.class, str);
    }

    public static EnumC0448h2[] values() {
        return (EnumC0448h2[]) n.clone();
    }

    public final int a() {
        return this.f20606a;
    }
}
