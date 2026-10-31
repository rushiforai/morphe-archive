package b3;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class x1 {

    /* renamed from: a, reason: collision with root package name */
    public static final x1 f17399a;

    /* renamed from: b, reason: collision with root package name */
    public static final x1 f17400b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ x1[] f17401c;

    static {
        x1 x1Var = new x1("Min", 0);
        f17399a = x1Var;
        x1 x1Var2 = new x1("Max", 1);
        f17400b = x1Var2;
        x1[] x1VarArr = {x1Var, x1Var2};
        f17401c = x1VarArr;
        EnumEntriesKt.a(x1VarArr);
    }

    public static x1 valueOf(String str) {
        return (x1) Enum.valueOf(x1.class, str);
    }

    public static x1[] values() {
        return (x1[]) f17401c.clone();
    }
}
