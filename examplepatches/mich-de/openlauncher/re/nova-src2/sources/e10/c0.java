package e10;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class c0 implements gy.w {

    /* renamed from: b, reason: collision with root package name */
    public static final c0 f51450b;

    /* renamed from: c, reason: collision with root package name */
    public static final c0 f51451c;

    /* renamed from: d, reason: collision with root package name */
    public static final c0 f51452d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ c0[] f51453e;

    /* renamed from: a, reason: collision with root package name */
    public final int f51454a;

    static {
        c0 c0Var = new c0("NONE", 0, 2132018734);
        f51450b = c0Var;
        c0 c0Var2 = new c0("TOP", 1, 2132019116);
        f51451c = c0Var2;
        c0 c0Var3 = new c0("BOTTOM", 2, 2132019115);
        f51452d = c0Var3;
        c0[] c0VarArr = {c0Var, c0Var2, c0Var3};
        f51453e = c0VarArr;
        EnumEntriesKt.a(c0VarArr);
    }

    public c0(String str, int i5, int i11) {
        this.f51454a = i11;
    }

    public static c0 valueOf(String str) {
        return (c0) Enum.valueOf(c0.class, str);
    }

    public static c0[] values() {
        return (c0[]) f51453e.clone();
    }

    @Override // gy.n0
    public final void a(p1.o oVar, int i5) {
        lb0.b.h(this, oVar);
    }

    @Override // gy.w
    public final int b() {
        return this.f51454a;
    }
}
