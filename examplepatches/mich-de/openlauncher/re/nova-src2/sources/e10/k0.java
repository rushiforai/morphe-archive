package e10;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class k0 implements gy.w {

    /* renamed from: b, reason: collision with root package name */
    public static final k0 f51620b;

    /* renamed from: c, reason: collision with root package name */
    public static final k0 f51621c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ k0[] f51622d;

    /* renamed from: a, reason: collision with root package name */
    public final int f51623a;

    static {
        k0 k0Var = new k0("HORIZONTAL", 0, 2132017999);
        f51620b = k0Var;
        k0 k0Var2 = new k0("VERTICAL", 1, 2132020322);
        f51621c = k0Var2;
        k0[] k0VarArr = {k0Var, k0Var2};
        f51622d = k0VarArr;
        EnumEntriesKt.a(k0VarArr);
    }

    public k0(String str, int i5, int i11) {
        this.f51623a = i11;
    }

    public static k0 valueOf(String str) {
        return (k0) Enum.valueOf(k0.class, str);
    }

    public static k0[] values() {
        return (k0[]) f51622d.clone();
    }

    @Override // gy.n0
    public final void a(p1.o oVar, int i5) {
        lb0.b.h(this, oVar);
    }

    @Override // gy.w
    public final int b() {
        return this.f51623a;
    }
}
