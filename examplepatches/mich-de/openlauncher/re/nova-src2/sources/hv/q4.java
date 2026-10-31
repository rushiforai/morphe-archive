package hv;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class q4 {

    /* renamed from: b, reason: collision with root package name */
    public static final q4 f60529b;

    /* renamed from: c, reason: collision with root package name */
    public static final q4 f60530c;

    /* renamed from: d, reason: collision with root package name */
    public static final q4 f60531d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ q4[] f60532e;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f60533a;

    static {
        q4 q4Var = new q4("Idle", 0, false);
        f60529b = q4Var;
        q4 q4Var2 = new q4("Updating", 1, true);
        f60530c = q4Var2;
        q4 q4Var3 = new q4("Removing", 2, true);
        f60531d = q4Var3;
        q4[] q4VarArr = {q4Var, q4Var2, q4Var3};
        f60532e = q4VarArr;
        EnumEntriesKt.a(q4VarArr);
    }

    public q4(String str, int i5, boolean z11) {
        this.f60533a = z11;
    }

    public static q4 valueOf(String str) {
        return (q4) Enum.valueOf(q4.class, str);
    }

    public static q4[] values() {
        return (q4[]) f60532e.clone();
    }
}
