package ps;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class k0 {

    /* renamed from: a, reason: collision with root package name */
    public static final k0 f82920a;

    /* renamed from: b, reason: collision with root package name */
    public static final k0 f82921b;

    /* renamed from: c, reason: collision with root package name */
    public static final k0 f82922c;

    /* renamed from: d, reason: collision with root package name */
    public static final k0 f82923d;

    /* renamed from: e, reason: collision with root package name */
    public static final k0 f82924e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ k0[] f82925f;

    static {
        k0 k0Var = new k0("InlineOptionalWithPhoneFirst", 0);
        f82920a = k0Var;
        k0 k0Var2 = new k0("InlineOptional", 1);
        f82921b = k0Var2;
        k0 k0Var3 = new k0("Inline", 2);
        f82922c = k0Var3;
        k0 k0Var4 = new k0("InlineWithDefaultOptIn", 3);
        f82923d = k0Var4;
        k0 k0Var5 = new k0("Full", 4);
        f82924e = k0Var5;
        k0[] k0VarArr = {k0Var, k0Var2, k0Var3, k0Var4, k0Var5};
        f82925f = k0VarArr;
        EnumEntriesKt.a(k0VarArr);
    }

    public static k0 valueOf(String str) {
        return (k0) Enum.valueOf(k0.class, str);
    }

    public static k0[] values() {
        return (k0[]) f82925f.clone();
    }
}
