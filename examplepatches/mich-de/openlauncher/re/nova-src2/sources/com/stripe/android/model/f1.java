package com.stripe.android.model;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class f1 {

    /* renamed from: a, reason: collision with root package name */
    public static final f1 f44028a;

    /* renamed from: b, reason: collision with root package name */
    public static final f1 f44029b;

    /* renamed from: c, reason: collision with root package name */
    public static final f1 f44030c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ f1[] f44031d;

    static {
        f1 f1Var = new f1("Enabled", 0);
        f44028a = f1Var;
        f1 f1Var2 = new f1("Disabled", 1);
        f44029b = f1Var2;
        f1 f1Var3 = new f1("NotProvided", 2);
        f44030c = f1Var3;
        f1[] f1VarArr = {f1Var, f1Var2, f1Var3};
        f44031d = f1VarArr;
        EnumEntriesKt.a(f1VarArr);
    }

    public static f1 valueOf(String str) {
        return (f1) Enum.valueOf(f1.class, str);
    }

    public static f1[] values() {
        return (f1[]) f44031d.clone();
    }
}
