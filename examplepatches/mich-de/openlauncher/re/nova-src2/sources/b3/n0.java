package b3;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class n0 {

    /* renamed from: a, reason: collision with root package name */
    public static final n0 f17296a;

    /* renamed from: b, reason: collision with root package name */
    public static final n0 f17297b;

    /* renamed from: c, reason: collision with root package name */
    public static final n0 f17298c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ n0[] f17299d;

    static {
        n0 n0Var = new n0("InMeasureBlock", 0);
        f17296a = n0Var;
        n0 n0Var2 = new n0("InLayoutBlock", 1);
        f17297b = n0Var2;
        n0 n0Var3 = new n0("NotUsed", 2);
        f17298c = n0Var3;
        n0[] n0VarArr = {n0Var, n0Var2, n0Var3};
        f17299d = n0VarArr;
        EnumEntriesKt.a(n0VarArr);
    }

    public static n0 valueOf(String str) {
        return (n0) Enum.valueOf(n0.class, str);
    }

    public static n0[] values() {
        return (n0[]) f17299d.clone();
    }
}
