package e0;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class f1 {

    /* renamed from: a, reason: collision with root package name */
    public static final f1 f49976a;

    /* renamed from: b, reason: collision with root package name */
    public static final f1 f49977b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ f1[] f49978c;

    static {
        f1 f1Var = new f1("Default", 0);
        f49976a = f1Var;
        f1 f1Var2 = new f1("UserInput", 1);
        f49977b = f1Var2;
        f1[] f1VarArr = {f1Var, f1Var2, new f1("PreventUserInput", 2)};
        f49978c = f1VarArr;
        EnumEntriesKt.a(f1VarArr);
    }

    public static f1 valueOf(String str) {
        return (f1) Enum.valueOf(f1.class, str);
    }

    public static f1[] values() {
        return (f1[]) f49978c.clone();
    }
}
