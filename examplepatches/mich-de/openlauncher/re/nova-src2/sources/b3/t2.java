package b3;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class t2 {

    /* renamed from: a, reason: collision with root package name */
    public static final t2 f17370a;

    /* renamed from: b, reason: collision with root package name */
    public static final t2 f17371b;

    /* renamed from: c, reason: collision with root package name */
    public static final t2 f17372c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ t2[] f17373d;

    static {
        t2 t2Var = new t2("ContinueTraversal", 0);
        f17370a = t2Var;
        t2 t2Var2 = new t2("SkipSubtreeAndContinueTraversal", 1);
        f17371b = t2Var2;
        t2 t2Var3 = new t2("CancelTraversal", 2);
        f17372c = t2Var3;
        t2[] t2VarArr = {t2Var, t2Var2, t2Var3};
        f17373d = t2VarArr;
        EnumEntriesKt.a(t2VarArr);
    }

    public static t2 valueOf(String str) {
        return (t2) Enum.valueOf(t2.class, str);
    }

    public static t2[] values() {
        return (t2[]) f17373d.clone();
    }
}
