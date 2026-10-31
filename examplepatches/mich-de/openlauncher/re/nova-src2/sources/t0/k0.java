package t0;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class k0 {

    /* renamed from: a, reason: collision with root package name */
    public static final k0 f88058a;

    /* renamed from: b, reason: collision with root package name */
    public static final k0 f88059b;

    /* renamed from: c, reason: collision with root package name */
    public static final k0 f88060c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ k0[] f88061d;

    static {
        k0 k0Var = new k0("None", 0);
        f88058a = k0Var;
        k0 k0Var2 = new k0("Selection", 1);
        f88059b = k0Var2;
        k0 k0Var3 = new k0("Cursor", 2);
        f88060c = k0Var3;
        k0[] k0VarArr = {k0Var, k0Var2, k0Var3};
        f88061d = k0VarArr;
        EnumEntriesKt.a(k0VarArr);
    }

    public static k0 valueOf(String str) {
        return (k0) Enum.valueOf(k0.class, str);
    }

    public static k0[] values() {
        return (k0[]) f88061d.clone();
    }
}
