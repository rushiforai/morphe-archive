package e10;

import kotlin.enums.EnumEntriesKt;
import l1.g9;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class d0 implements gy.n0 {

    /* renamed from: b, reason: collision with root package name */
    public static final d0 f51459b;

    /* renamed from: c, reason: collision with root package name */
    public static final d0 f51460c;

    /* renamed from: d, reason: collision with root package name */
    public static final d0 f51461d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ d0[] f51462e;

    /* renamed from: a, reason: collision with root package name */
    public final int f51463a;

    static {
        d0 d0Var = new d0("VERTICAL", 0, 2132020322);
        f51459b = d0Var;
        d0 d0Var2 = new d0("VERTICAL_LIST", 1, 2132018100);
        f51460c = d0Var2;
        d0 d0Var3 = new d0("HORIZONTAL_PAGINATED", 2, 2132017999);
        f51461d = d0Var3;
        d0[] d0VarArr = {d0Var, d0Var2, d0Var3};
        f51462e = d0VarArr;
        EnumEntriesKt.a(d0VarArr);
    }

    public d0(String str, int i5, int i11) {
        this.f51463a = i11;
    }

    public static d0 valueOf(String str) {
        return (d0) Enum.valueOf(d0.class, str);
    }

    public static d0[] values() {
        return (d0[]) f51462e.clone();
    }

    @Override // gy.n0
    public final void a(p1.o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        tVar.b0(-2100576402);
        g9.b(x7.f.Y(tVar, this.f51463a), null, 0L, 0L, null, null, null, 0L, null, null, 0L, 0, false, 0, 0, null, null, tVar, 0, 0, 131070);
        tVar.p(false);
    }
}
