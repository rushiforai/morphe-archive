package r10;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class z0 {

    /* renamed from: a, reason: collision with root package name */
    public static final z0 f85323a;

    /* renamed from: b, reason: collision with root package name */
    public static final z0 f85324b;

    /* renamed from: c, reason: collision with root package name */
    public static final z0 f85325c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ z0[] f85326d;

    static {
        z0 z0Var = new z0("IPv4", 0);
        f85323a = z0Var;
        z0 z0Var2 = new z0("IPv6", 1);
        f85324b = z0Var2;
        z0 z0Var3 = new z0("NONE", 2);
        f85325c = z0Var3;
        z0[] z0VarArr = {z0Var, z0Var2, z0Var3};
        f85326d = z0VarArr;
        EnumEntriesKt.a(z0VarArr);
    }

    public static z0 valueOf(String str) {
        return (z0) Enum.valueOf(z0.class, str);
    }

    public static z0[] values() {
        return (z0[]) f85326d.clone();
    }
}
