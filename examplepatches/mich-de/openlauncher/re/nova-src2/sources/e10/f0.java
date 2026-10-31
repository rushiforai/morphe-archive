package e10;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class f0 implements gy.w {

    /* renamed from: b, reason: collision with root package name */
    public static final f0 f51516b;

    /* renamed from: c, reason: collision with root package name */
    public static final f0 f51517c;

    /* renamed from: d, reason: collision with root package name */
    public static final f0 f51518d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ f0[] f51519e;

    /* renamed from: a, reason: collision with root package name */
    public final int f51520a;

    static {
        f0 f0Var = new f0("NONE", 0, 2132018734);
        f51516b = f0Var;
        f0 f0Var2 = new f0("GOOGLE_FEED", 1, 2132017965);
        f51517c = f0Var2;
        f0 f0Var3 = new f0("SMARTSPACER", 2, 2132019540);
        f51518d = f0Var3;
        f0[] f0VarArr = {f0Var, f0Var2, f0Var3};
        f51519e = f0VarArr;
        EnumEntriesKt.a(f0VarArr);
    }

    public f0(String str, int i5, int i11) {
        this.f51520a = i11;
    }

    public static f0 valueOf(String str) {
        return (f0) Enum.valueOf(f0.class, str);
    }

    public static f0[] values() {
        return (f0[]) f51519e.clone();
    }

    @Override // gy.n0
    public final void a(p1.o oVar, int i5) {
        lb0.b.h(this, oVar);
    }

    @Override // gy.w
    public final int b() {
        return this.f51520a;
    }
}
