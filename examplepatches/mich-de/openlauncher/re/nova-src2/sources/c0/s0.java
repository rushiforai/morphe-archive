package c0;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class s0 {

    /* renamed from: a, reason: collision with root package name */
    public static final s0 f18946a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ s0[] f18947b;

    static {
        s0 s0Var = new s0("Default", 0);
        f18946a = s0Var;
        s0[] s0VarArr = {s0Var, new s0("UserInput", 1), new s0("PreventUserInput", 2)};
        f18947b = s0VarArr;
        EnumEntriesKt.a(s0VarArr);
    }

    public static s0 valueOf(String str) {
        return (s0) Enum.valueOf(s0.class, str);
    }

    public static s0[] values() {
        return (s0[]) f18947b.clone();
    }
}
