package g0;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class d1 {

    /* renamed from: a, reason: collision with root package name */
    public static final d1 f56493a;

    /* renamed from: b, reason: collision with root package name */
    public static final d1 f56494b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ d1[] f56495c;

    static {
        d1 d1Var = new d1("Vertical", 0);
        f56493a = d1Var;
        d1 d1Var2 = new d1("Horizontal", 1);
        f56494b = d1Var2;
        d1[] d1VarArr = {d1Var, d1Var2};
        f56495c = d1VarArr;
        EnumEntriesKt.a(d1VarArr);
    }

    public static d1 valueOf(String str) {
        return (d1) Enum.valueOf(d1.class, str);
    }

    public static d1[] values() {
        return (d1[]) f56495c.clone();
    }
}
