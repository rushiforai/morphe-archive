package e10;

import kotlin.enums.EnumEntriesKt;
import l1.g9;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class b0 implements gy.n0 {

    /* renamed from: b, reason: collision with root package name */
    public static final b0 f51438b;

    /* renamed from: c, reason: collision with root package name */
    public static final b0 f51439c;

    /* renamed from: d, reason: collision with root package name */
    public static final b0 f51440d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ b0[] f51441e;

    /* renamed from: a, reason: collision with root package name */
    public final int f51442a;

    static {
        b0 b0Var = new b0("ZOOM", 0, 2132017470);
        f51438b = b0Var;
        b0 b0Var2 = new b0("SLIDE", 1, 2132017469);
        f51439c = b0Var2;
        b0 b0Var3 = new b0("FADE", 2, 2132017467);
        f51440d = b0Var3;
        b0[] b0VarArr = {b0Var, b0Var2, b0Var3};
        f51441e = b0VarArr;
        EnumEntriesKt.a(b0VarArr);
    }

    public b0(String str, int i5, int i11) {
        this.f51442a = i11;
    }

    public static b0 valueOf(String str) {
        return (b0) Enum.valueOf(b0.class, str);
    }

    public static b0[] values() {
        return (b0[]) f51441e.clone();
    }

    @Override // gy.n0
    public final void a(p1.o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        tVar.b0(1656171707);
        g9.b(x7.f.Y(tVar, this.f51442a), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, tVar, 0, 0, 131070);
        tVar.p(false);
    }

    public final boolean d() {
        return this != f51439c;
    }
}
