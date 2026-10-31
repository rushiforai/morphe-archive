package ou;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class o0 {

    /* renamed from: a, reason: collision with root package name */
    public static final o0 f80946a;

    /* renamed from: b, reason: collision with root package name */
    public static final o0 f80947b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ o0[] f80948c;

    static {
        o0 o0Var = new o0("DEFAULT", 0);
        f80946a = o0Var;
        o0 o0Var2 = new o0("WHITE", 1);
        f80947b = o0Var2;
        o0[] o0VarArr = {o0Var, o0Var2};
        f80948c = o0VarArr;
        EnumEntriesKt.a(o0VarArr);
    }

    public static o0 valueOf(String str) {
        return (o0) Enum.valueOf(o0.class, str);
    }

    public static o0[] values() {
        return (o0[]) f80948c.clone();
    }
}
