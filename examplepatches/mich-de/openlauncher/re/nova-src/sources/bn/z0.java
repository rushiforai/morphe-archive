package bn;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class z0 {

    /* renamed from: a, reason: collision with root package name */
    public static final z0 f18318a;

    /* renamed from: b, reason: collision with root package name */
    public static final z0 f18319b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ z0[] f18320c;

    static {
        z0 z0Var = new z0("GENERAL", 0);
        f18318a = z0Var;
        z0 z0Var2 = new z0("FALLBACK", 1);
        f18319b = z0Var2;
        z0[] z0VarArr = {z0Var, z0Var2};
        f18320c = z0VarArr;
        EnumEntriesKt.a(z0VarArr);
    }

    public static z0 valueOf(String str) {
        return (z0) Enum.valueOf(z0.class, str);
    }

    public static z0[] values() {
        return (z0[]) f18320c.clone();
    }
}
