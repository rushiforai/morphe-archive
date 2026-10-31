package e10;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public class e2 {

    /* renamed from: d, reason: collision with root package name */
    public static final v1 f51486d;

    /* renamed from: e, reason: collision with root package name */
    public static final w1 f51487e;

    /* renamed from: f, reason: collision with root package name */
    public static final x1 f51488f;

    /* renamed from: g, reason: collision with root package name */
    public static final z1 f51489g;

    /* renamed from: h, reason: collision with root package name */
    public static final a2 f51490h;

    /* renamed from: i, reason: collision with root package name */
    public static final b2 f51491i;

    /* renamed from: j, reason: collision with root package name */
    public static final c2 f51492j;

    /* renamed from: k, reason: collision with root package name */
    public static final u1 f51493k;

    /* renamed from: l, reason: collision with root package name */
    public static final /* synthetic */ e2[] f51494l;

    /* renamed from: a, reason: collision with root package name */
    public final int f51495a;

    /* renamed from: b, reason: collision with root package name */
    public final int f51496b;

    /* renamed from: c, reason: collision with root package name */
    public final int f51497c;

    /* JADX INFO: Fake field, exist only in values array */
    e2 EF0;

    static {
        e2 e2Var = new e2("DISABLED", 0, 0, 0, 2132018734);
        v1 v1Var = new v1("LINE", 1, 3, 2131428634, 2132017904);
        f51486d = v1Var;
        w1 w1Var = new w1("STACK", 2, 3, 2131428637, 2132017906);
        f51487e = w1Var;
        x1 x1Var = new x1("GRID", 3, 4, 2131428630, 2132017903);
        f51488f = x1Var;
        y1 y1Var = new y1("GRID_PLATFORM", 4, 4, 2131428630, 2132017903);
        z1 z1Var = new z1("GRID_9", 5, 9, 2131428631, 2132017903);
        f51489g = z1Var;
        a2 a2Var = new a2("RADIAL_5", 6, 5, 2131428635, 2132017905);
        f51490h = a2Var;
        b2 b2Var = new b2("RADIAL_9", 7, 9, 2131428636, 2132017905);
        f51491i = b2Var;
        c2 c2Var = new c2("FAN", 8, 3, 2131428625, 2132017902);
        f51492j = c2Var;
        d2 d2Var = new d2("FAN_PLATFORM", 9, 3, 2131428625, 2132017902);
        u1 u1Var = new u1("FIRST_ITEM_ICON", 10, 1, -1, -1);
        f51493k = u1Var;
        f51494l = new e2[]{e2Var, v1Var, w1Var, x1Var, y1Var, z1Var, a2Var, b2Var, c2Var, d2Var, u1Var};
    }

    public e2(String str, int i5, int i11, int i12, int i13) {
        this.f51495a = i11;
        this.f51496b = i12;
        this.f51497c = i13;
    }

    public static e2 valueOf(String str) {
        return (e2) Enum.valueOf(e2.class, str);
    }

    public static e2[] values() {
        return (e2[]) f51494l.clone();
    }

    public nz.c a(boolean z11) {
        return new y9.a(4);
    }
}
