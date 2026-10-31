package com.stripe.android.model;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class d0 {

    /* renamed from: c, reason: collision with root package name */
    public static final c0 f44016c;

    /* renamed from: d, reason: collision with root package name */
    public static final d0 f44017d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ d0[] f44018e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ i70.a f44019f;

    /* renamed from: a, reason: collision with root package name */
    public final String f44020a;

    /* renamed from: b, reason: collision with root package name */
    public final ft.c f44021b;

    static {
        d0 d0Var = new d0("Credit", 0, "CREDIT", ft.c.f55911c);
        d0 d0Var2 = new d0("Debit", 1, "DEBIT", ft.c.f55912d);
        d0 d0Var3 = new d0("Prepaid", 2, "PREPAID", ft.c.f55913e);
        d0 d0Var4 = new d0("Unknown", 3, "UNKNOWN", ft.c.f55914f);
        f44017d = d0Var4;
        d0[] d0VarArr = {d0Var, d0Var2, d0Var3, d0Var4};
        f44018e = d0VarArr;
        f44019f = EnumEntriesKt.a(d0VarArr);
        f44016c = new c0();
    }

    public d0(String str, int i5, String str2, ft.c cVar) {
        this.f44020a = str2;
        this.f44021b = cVar;
    }

    public static d0 valueOf(String str) {
        return (d0) Enum.valueOf(d0.class, str);
    }

    public static d0[] values() {
        return (d0[]) f44018e.clone();
    }
}
