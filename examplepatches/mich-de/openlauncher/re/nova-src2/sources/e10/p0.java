package e10;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class p0 implements gy.w {

    /* renamed from: b, reason: collision with root package name */
    public static final p0 f51734b;

    /* renamed from: c, reason: collision with root package name */
    public static final p0 f51735c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ p0[] f51736d;

    /* renamed from: a, reason: collision with root package name */
    public final int f51737a;

    static {
        p0 p0Var = new p0("WINDOW", 0, 2132020430);
        f51734b = p0Var;
        p0 p0Var2 = new p0("IMMERSIVE", 1, 2132019337);
        f51735c = p0Var2;
        p0[] p0VarArr = {p0Var, p0Var2};
        f51736d = p0VarArr;
        EnumEntriesKt.a(p0VarArr);
    }

    public p0(String str, int i5, int i11) {
        this.f51737a = i11;
    }

    public static p0 valueOf(String str) {
        return (p0) Enum.valueOf(p0.class, str);
    }

    public static p0[] values() {
        return (p0[]) f51736d.clone();
    }

    @Override // gy.n0
    public final void a(p1.o oVar, int i5) {
        lb0.b.h(this, oVar);
    }

    @Override // gy.w
    public final int b() {
        return this.f51737a;
    }
}
