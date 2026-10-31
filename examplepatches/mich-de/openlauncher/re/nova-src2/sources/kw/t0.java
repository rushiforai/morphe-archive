package kw;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class t0 {

    /* renamed from: a, reason: collision with root package name */
    public static final t0 f72627a;

    /* renamed from: b, reason: collision with root package name */
    public static final t0 f72628b;

    /* renamed from: c, reason: collision with root package name */
    public static final t0 f72629c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ t0[] f72630d;

    static {
        t0 t0Var = new t0("NORMAL", 0);
        f72627a = t0Var;
        t0 t0Var2 = new t0("ERROR", 1);
        f72628b = t0Var2;
        t0 t0Var3 = new t0("WARNING", 2);
        f72629c = t0Var3;
        t0[] t0VarArr = {t0Var, t0Var2, t0Var3};
        f72630d = t0VarArr;
        EnumEntriesKt.a(t0VarArr);
    }

    public static t0 valueOf(String str) {
        return (t0) Enum.valueOf(t0.class, str);
    }

    public static t0[] values() {
        return (t0[]) f72630d.clone();
    }
}
