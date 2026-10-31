package ou;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class n0 {

    /* renamed from: a, reason: collision with root package name */
    public static final n0 f80938a;

    /* renamed from: b, reason: collision with root package name */
    public static final n0 f80939b;

    /* renamed from: c, reason: collision with root package name */
    public static final n0 f80940c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ n0[] f80941d;

    static {
        n0 n0Var = new n0("Automatic", 0);
        f80938a = n0Var;
        n0 n0Var2 = new n0("Never", 1);
        f80939b = n0Var2;
        n0 n0Var3 = new n0("Always", 2);
        f80940c = n0Var3;
        n0[] n0VarArr = {n0Var, n0Var2, n0Var3};
        f80941d = n0VarArr;
        EnumEntriesKt.a(n0VarArr);
    }

    public static n0 valueOf(String str) {
        return (n0) Enum.valueOf(n0.class, str);
    }

    public static n0[] values() {
        return (n0[]) f80941d.clone();
    }
}
