package com.stripe.android.model;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a5 {

    /* renamed from: b, reason: collision with root package name */
    public static final z4 f44012b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ a5[] f44013c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ i70.a f44014d;

    /* renamed from: a, reason: collision with root package name */
    public final String f44015a;

    static {
        a5[] a5VarArr = {new a5("Sku", 0, "sku"), new a5("Tax", 1, "tax"), new a5("Shipping", 2, "shipping")};
        f44013c = a5VarArr;
        f44014d = EnumEntriesKt.a(a5VarArr);
        f44012b = new z4();
    }

    public a5(String str, int i5, String str2) {
        this.f44015a = str2;
    }

    public static a5 valueOf(String str) {
        return (a5) Enum.valueOf(a5.class, str);
    }

    public static a5[] values() {
        return (a5[]) f44013c.clone();
    }
}
