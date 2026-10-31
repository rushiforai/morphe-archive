package com.amplitude;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class Y1 {

    /* renamed from: b, reason: collision with root package name */
    public static final X1 f20436b;

    /* renamed from: c, reason: collision with root package name */
    public static final Y1 f20437c;

    /* renamed from: d, reason: collision with root package name */
    public static final Y1 f20438d;

    /* renamed from: e, reason: collision with root package name */
    public static final Y1 f20439e;

    /* renamed from: f, reason: collision with root package name */
    public static final Y1 f20440f;

    /* renamed from: g, reason: collision with root package name */
    public static final Y1 f20441g;

    /* renamed from: h, reason: collision with root package name */
    public static final Y1 f20442h;

    /* renamed from: i, reason: collision with root package name */
    public static final Y1 f20443i;

    /* renamed from: j, reason: collision with root package name */
    private static final /* synthetic */ Y1[] f20444j;

    /* renamed from: k, reason: collision with root package name */
    private static final /* synthetic */ EnumEntries f20445k;

    /* renamed from: a, reason: collision with root package name */
    private final int f20446a;

    /* JADX WARN: Type inference failed for: r0v3, types: [com.amplitude.X1] */
    static {
        Y1 y12 = new Y1("DomContentLoaded", 0, 0);
        f20437c = y12;
        Y1 y13 = new Y1("Load", 1, 1);
        f20438d = y13;
        Y1 y14 = new Y1("FullSnapshot", 2, 2);
        f20439e = y14;
        Y1 y15 = new Y1("IncrementalSnapshot", 3, 3);
        f20440f = y15;
        Y1 y16 = new Y1("Meta", 4, 4);
        f20441g = y16;
        Y1 y17 = new Y1("Custom", 5, 5);
        f20442h = y17;
        Y1 y18 = new Y1("Plugin", 6, 6);
        f20443i = y18;
        Y1[] y1Arr = {y12, y13, y14, y15, y16, y17, y18};
        f20444j = y1Arr;
        f20445k = EnumEntriesKt.a(y1Arr);
        f20436b = new Object() { // from class: com.amplitude.X1
        };
    }

    public Y1(String str, int i5, int i11) {
        this.f20446a = i11;
    }

    public static Y1 valueOf(String str) {
        return (Y1) Enum.valueOf(Y1.class, str);
    }

    public static Y1[] values() {
        return (Y1[]) f20444j.clone();
    }

    public final int a() {
        return this.f20446a;
    }
}
