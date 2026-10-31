package ou;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class q0 {

    /* renamed from: a, reason: collision with root package name */
    public static final q0 f80962a;

    /* renamed from: b, reason: collision with root package name */
    public static final q0 f80963b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ q0[] f80964c;

    static {
        q0 q0Var = new q0("Production", 0);
        f80962a = q0Var;
        q0 q0Var2 = new q0("Test", 1);
        f80963b = q0Var2;
        q0[] q0VarArr = {q0Var, q0Var2};
        f80964c = q0VarArr;
        EnumEntriesKt.a(q0VarArr);
    }

    public static q0 valueOf(String str) {
        return (q0) Enum.valueOf(q0.class, str);
    }

    public static q0[] values() {
        return (q0[]) f80964c.clone();
    }
}
