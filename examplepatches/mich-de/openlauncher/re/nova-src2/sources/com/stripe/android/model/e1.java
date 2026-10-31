package com.stripe.android.model;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class e1 {

    /* renamed from: a, reason: collision with root package name */
    public static final e1 f44022a;

    /* renamed from: b, reason: collision with root package name */
    public static final e1 f44023b;

    /* renamed from: c, reason: collision with root package name */
    public static final e1 f44024c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ e1[] f44025d;

    static {
        e1 e1Var = new e1("Enabled", 0);
        f44022a = e1Var;
        e1 e1Var2 = new e1("Partial", 1);
        f44023b = e1Var2;
        e1 e1Var3 = new e1("Disabled", 2);
        f44024c = e1Var3;
        e1[] e1VarArr = {e1Var, e1Var2, e1Var3};
        f44025d = e1VarArr;
        EnumEntriesKt.a(e1VarArr);
    }

    public static e1 valueOf(String str) {
        return (e1) Enum.valueOf(e1.class, str);
    }

    public static e1[] values() {
        return (e1[]) f44025d.clone();
    }
}
