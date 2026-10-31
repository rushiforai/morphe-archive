package com.amplitude;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class O4 {

    /* renamed from: a, reason: collision with root package name */
    public static final O4 f20351a;

    /* renamed from: b, reason: collision with root package name */
    public static final O4 f20352b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ O4[] f20353c;

    static {
        O4 o42 = new O4("WRITE", 0);
        f20351a = o42;
        O4 o43 = new O4("FLUSH", 1);
        f20352b = o43;
        O4[] o4Arr = {o42, o43};
        f20353c = o4Arr;
        EnumEntriesKt.a(o4Arr);
    }

    public O4(String str, int i5) {
    }

    public static O4 valueOf(String str) {
        return (O4) Enum.valueOf(O4.class, str);
    }

    public static O4[] values() {
        return (O4[]) f20353c.clone();
    }
}
