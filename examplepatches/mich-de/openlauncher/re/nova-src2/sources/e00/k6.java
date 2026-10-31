package e00;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class k6 {

    /* renamed from: a, reason: collision with root package name */
    public static final k6 f50627a;

    /* renamed from: b, reason: collision with root package name */
    public static final k6 f50628b;

    /* renamed from: c, reason: collision with root package name */
    public static final k6 f50629c;

    /* renamed from: d, reason: collision with root package name */
    public static final k6 f50630d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ k6[] f50631e;

    static {
        k6 k6Var = new k6("PENDING", 0);
        f50627a = k6Var;
        k6 k6Var2 = new k6("RUNNING", 1);
        f50628b = k6Var2;
        k6 k6Var3 = new k6("PASSED", 2);
        f50629c = k6Var3;
        k6 k6Var4 = new k6("FAILED", 3);
        f50630d = k6Var4;
        k6[] k6VarArr = {k6Var, k6Var2, k6Var3, k6Var4};
        f50631e = k6VarArr;
        EnumEntriesKt.a(k6VarArr);
    }

    public static k6 valueOf(String str) {
        return (k6) Enum.valueOf(k6.class, str);
    }

    public static k6[] values() {
        return (k6[]) f50631e.clone();
    }
}
