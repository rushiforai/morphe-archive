package com.stripe.android.model;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class e5 {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ e5[] f44026b;

    /* renamed from: a, reason: collision with root package name */
    public final String f44027a;

    static {
        e5[] e5VarArr = {new e5("Sku", 0, "sku"), new e5("Tax", 1, "tax"), new e5("Shipping", 2, "shipping")};
        f44026b = e5VarArr;
        EnumEntriesKt.a(e5VarArr);
    }

    public e5(String str, int i5, String str2) {
        this.f44027a = str2;
    }

    public static e5 valueOf(String str) {
        return (e5) Enum.valueOf(e5.class, str);
    }

    public static e5[] values() {
        return (e5[]) f44026b.clone();
    }
}
