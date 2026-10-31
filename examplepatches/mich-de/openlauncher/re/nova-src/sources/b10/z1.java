package b10;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class z1 {

    /* renamed from: a, reason: collision with root package name */
    public static final i1 f16985a;

    /* renamed from: b, reason: collision with root package name */
    public static final z1 f16986b;

    /* renamed from: c, reason: collision with root package name */
    public static final z1 f16987c;

    /* renamed from: d, reason: collision with root package name */
    public static final z1 f16988d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ z1[] f16989e;

    static {
        z1 z1Var = new z1("X_BUTTON", 0);
        f16986b = z1Var;
        z1 z1Var2 = new z1("TEXT_LINK", 1);
        f16987c = z1Var2;
        z1 z1Var3 = new z1("BOTH", 2);
        f16988d = z1Var3;
        z1[] z1VarArr = {z1Var, z1Var2, z1Var3};
        f16989e = z1VarArr;
        EnumEntriesKt.a(z1VarArr);
        f16985a = new i1();
    }

    public static z1 valueOf(String str) {
        return (z1) Enum.valueOf(z1.class, str);
    }

    public static z1[] values() {
        return (z1[]) f16989e.clone();
    }
}
