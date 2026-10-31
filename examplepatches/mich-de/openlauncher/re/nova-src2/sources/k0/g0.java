package k0;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class g0 {

    /* renamed from: a, reason: collision with root package name */
    public static final g0 f70607a;

    /* renamed from: b, reason: collision with root package name */
    public static final g0 f70608b;

    /* renamed from: c, reason: collision with root package name */
    public static final g0 f70609c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ g0[] f70610d;

    static {
        g0 g0Var = new g0("Vertical", 0);
        f70607a = g0Var;
        g0 g0Var2 = new g0("Horizontal", 1);
        f70608b = g0Var2;
        g0 g0Var3 = new g0("Both", 2);
        f70609c = g0Var3;
        g0[] g0VarArr = {g0Var, g0Var2, g0Var3};
        f70610d = g0VarArr;
        EnumEntriesKt.a(g0VarArr);
    }

    public static g0 valueOf(String str) {
        return (g0) Enum.valueOf(g0.class, str);
    }

    public static g0[] values() {
        return (g0[]) f70610d.clone();
    }
}
