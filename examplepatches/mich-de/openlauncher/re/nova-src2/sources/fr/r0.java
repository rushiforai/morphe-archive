package fr;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class r0 {

    /* renamed from: b, reason: collision with root package name */
    public static final r0 f55694b;

    /* renamed from: c, reason: collision with root package name */
    public static final r0 f55695c;

    /* renamed from: d, reason: collision with root package name */
    public static final r0 f55696d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ r0[] f55697e;

    /* renamed from: a, reason: collision with root package name */
    public final String f55698a;

    static {
        r0 r0Var = new r0("GET", 0, "GET");
        f55694b = r0Var;
        r0 r0Var2 = new r0("POST", 1, "POST");
        f55695c = r0Var2;
        r0 r0Var3 = new r0("DELETE", 2, "DELETE");
        f55696d = r0Var3;
        r0[] r0VarArr = {r0Var, r0Var2, r0Var3};
        f55697e = r0VarArr;
        EnumEntriesKt.a(r0VarArr);
    }

    public r0(String str, int i5, String str2) {
        this.f55698a = str2;
    }

    public static r0 valueOf(String str) {
        return (r0) Enum.valueOf(r0.class, str);
    }

    public static r0[] values() {
        return (r0[]) f55697e.clone();
    }
}
