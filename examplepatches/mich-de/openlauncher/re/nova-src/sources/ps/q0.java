package ps;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class q0 {

    /* renamed from: b, reason: collision with root package name */
    public static final q0 f82953b;

    /* renamed from: c, reason: collision with root package name */
    public static final q0 f82954c;

    /* renamed from: d, reason: collision with root package name */
    public static final q0 f82955d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ q0[] f82956e;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f82957a;

    static {
        q0 q0Var = new q0("Enabled", 0, false);
        f82953b = q0Var;
        q0 q0Var2 = new q0("Disabled", 1, false);
        f82954c = q0Var2;
        q0 q0Var3 = new q0("Processing", 2, true);
        f82955d = q0Var3;
        q0[] q0VarArr = {q0Var, q0Var2, q0Var3, new q0("Completed", 3, true)};
        f82956e = q0VarArr;
        EnumEntriesKt.a(q0VarArr);
    }

    public q0(String str, int i5, boolean z11) {
        this.f82957a = z11;
    }

    public static q0 valueOf(String str) {
        return (q0) Enum.valueOf(q0.class, str);
    }

    public static q0[] values() {
        return (q0[]) f82956e.clone();
    }
}
