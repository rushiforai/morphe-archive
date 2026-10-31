package e1;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class c0 {

    /* renamed from: a, reason: collision with root package name */
    public static final c0 f51265a;

    /* renamed from: b, reason: collision with root package name */
    public static final c0 f51266b;

    /* renamed from: c, reason: collision with root package name */
    public static final c0 f51267c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ c0[] f51268d;

    static {
        c0 c0Var = new c0("Left", 0);
        f51265a = c0Var;
        c0 c0Var2 = new c0("Middle", 1);
        f51266b = c0Var2;
        c0 c0Var3 = new c0("Right", 2);
        f51267c = c0Var3;
        c0[] c0VarArr = {c0Var, c0Var2, c0Var3};
        f51268d = c0VarArr;
        EnumEntriesKt.a(c0VarArr);
    }

    public static c0 valueOf(String str) {
        return (c0) Enum.valueOf(c0.class, str);
    }

    public static c0[] values() {
        return (c0[]) f51268d.clone();
    }
}
