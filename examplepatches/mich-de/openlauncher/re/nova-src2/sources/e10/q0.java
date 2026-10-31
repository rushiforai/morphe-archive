package e10;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class q0 implements gy.w {

    /* renamed from: b, reason: collision with root package name */
    public static final q0 f51754b;

    /* renamed from: c, reason: collision with root package name */
    public static final q0 f51755c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ q0[] f51756d;

    /* renamed from: a, reason: collision with root package name */
    public final int f51757a;

    static {
        q0 q0Var = new q0("LIGHT", 0, 2132019339);
        q0 q0Var2 = new q0("DARK", 1, 2132019333);
        f51754b = q0Var2;
        q0 q0Var3 = new q0("FOLLOW_NIGHT_MODE", 2, 2132017914);
        f51755c = q0Var3;
        q0[] q0VarArr = {q0Var, q0Var2, q0Var3};
        f51756d = q0VarArr;
        EnumEntriesKt.a(q0VarArr);
    }

    public q0(String str, int i5, int i11) {
        this.f51757a = i11;
    }

    public static q0 valueOf(String str) {
        return (q0) Enum.valueOf(q0.class, str);
    }

    public static q0[] values() {
        return (q0[]) f51756d.clone();
    }

    @Override // gy.n0
    public final void a(p1.o oVar, int i5) {
        lb0.b.h(this, oVar);
    }

    @Override // gy.w
    public final int b() {
        return this.f51757a;
    }
}
