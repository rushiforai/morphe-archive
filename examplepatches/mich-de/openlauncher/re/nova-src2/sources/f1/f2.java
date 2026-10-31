package f1;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class f2 {

    /* renamed from: a, reason: collision with root package name */
    public static final f2 f53527a;

    /* renamed from: b, reason: collision with root package name */
    public static final f2 f53528b;

    /* renamed from: c, reason: collision with root package name */
    public static final f2 f53529c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ f2[] f53530d;

    static {
        f2 f2Var = new f2("Focused", 0);
        f53527a = f2Var;
        f2 f2Var2 = new f2("UnfocusedEmpty", 1);
        f53528b = f2Var2;
        f2 f2Var3 = new f2("UnfocusedNotEmpty", 2);
        f53529c = f2Var3;
        f2[] f2VarArr = {f2Var, f2Var2, f2Var3};
        f53530d = f2VarArr;
        EnumEntriesKt.a(f2VarArr);
    }

    public static f2 valueOf(String str) {
        return (f2) Enum.valueOf(f2.class, str);
    }

    public static f2[] values() {
        return (f2[]) f53530d.clone();
    }
}
