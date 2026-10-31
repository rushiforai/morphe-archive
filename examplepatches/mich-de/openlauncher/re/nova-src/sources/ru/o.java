package ru;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class o {

    /* renamed from: b, reason: collision with root package name */
    public static final o f86374b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ o[] f86375c;

    /* renamed from: a, reason: collision with root package name */
    public final String f86376a;

    static {
        o oVar = new o("Edit", 0, "edit");
        f86374b = oVar;
        o[] oVarArr = {oVar, new o("Add", 1, "add")};
        f86375c = oVarArr;
        EnumEntriesKt.a(oVarArr);
    }

    public o(String str, int i5, String str2) {
        this.f86376a = str2;
    }

    public static o valueOf(String str) {
        return (o) Enum.valueOf(o.class, str);
    }

    public static o[] values() {
        return (o[]) f86375c.clone();
    }
}
