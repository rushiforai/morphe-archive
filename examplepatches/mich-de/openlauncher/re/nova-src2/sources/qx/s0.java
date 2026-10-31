package qx;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class s0 {

    /* renamed from: a, reason: collision with root package name */
    public static final s0 f84601a;

    /* renamed from: b, reason: collision with root package name */
    public static final s0 f84602b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ s0[] f84603c;

    static {
        s0 s0Var = new s0("SMALL", 0);
        f84601a = s0Var;
        s0 s0Var2 = new s0("MEDIUM", 1);
        f84602b = s0Var2;
        s0[] s0VarArr = {s0Var, s0Var2, new s0("LARGE", 2)};
        f84603c = s0VarArr;
        EnumEntriesKt.a(s0VarArr);
    }

    public static s0 valueOf(String str) {
        return (s0) Enum.valueOf(s0.class, str);
    }

    public static s0[] values() {
        return (s0[]) f84603c.clone();
    }
}
