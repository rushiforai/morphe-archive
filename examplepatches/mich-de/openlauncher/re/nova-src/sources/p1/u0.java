package p1;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class u0 {

    /* renamed from: a, reason: collision with root package name */
    public static final u0 f81593a;

    /* renamed from: b, reason: collision with root package name */
    public static final u0 f81594b;

    /* renamed from: c, reason: collision with root package name */
    public static final u0 f81595c;

    /* renamed from: d, reason: collision with root package name */
    public static final u0 f81596d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ u0[] f81597e;

    static {
        u0 u0Var = new u0("IGNORED", 0);
        f81593a = u0Var;
        u0 u0Var2 = new u0("SCHEDULED", 1);
        f81594b = u0Var2;
        u0 u0Var3 = new u0("DEFERRED", 2);
        f81595c = u0Var3;
        u0 u0Var4 = new u0("IMMINENT", 3);
        f81596d = u0Var4;
        u0[] u0VarArr = {u0Var, u0Var2, u0Var3, u0Var4};
        f81597e = u0VarArr;
        EnumEntriesKt.a(u0VarArr);
    }

    public static u0 valueOf(String str) {
        return (u0) Enum.valueOf(u0.class, str);
    }

    public static u0[] values() {
        return (u0[]) f81597e.clone();
    }
}
