package dx;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class x0 {

    /* renamed from: a, reason: collision with root package name */
    public static final x0 f49820a;

    /* renamed from: b, reason: collision with root package name */
    public static final x0 f49821b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ x0[] f49822c;

    static {
        x0 x0Var = new x0("Fresh", 0);
        f49820a = x0Var;
        x0 x0Var2 = new x0("Warm", 1);
        f49821b = x0Var2;
        x0[] x0VarArr = {x0Var, x0Var2};
        f49822c = x0VarArr;
        EnumEntriesKt.a(x0VarArr);
    }

    public static x0 valueOf(String str) {
        return (x0) Enum.valueOf(x0.class, str);
    }

    public static x0[] values() {
        return (x0[]) f49822c.clone();
    }
}
