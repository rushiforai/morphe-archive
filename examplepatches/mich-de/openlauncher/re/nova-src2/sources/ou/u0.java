package ou;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class u0 {

    /* renamed from: a, reason: collision with root package name */
    public static final u0 f80984a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ u0[] f80985b;

    static {
        u0 u0Var = new u0("Automatic", 0);
        f80984a = u0Var;
        u0[] u0VarArr = {u0Var, new u0("Never", 1)};
        f80985b = u0VarArr;
        EnumEntriesKt.a(u0VarArr);
    }

    public static u0 valueOf(String str) {
        return (u0) Enum.valueOf(u0.class, str);
    }

    public static u0[] values() {
        return (u0[]) f80985b.clone();
    }
}
