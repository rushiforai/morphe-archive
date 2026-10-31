package wk;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public abstract class u {

    /* renamed from: a, reason: collision with root package name */
    public static final r f94571a;

    /* renamed from: b, reason: collision with root package name */
    public static final s f94572b;

    /* renamed from: c, reason: collision with root package name */
    public static final t f94573c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ u[] f94574d;

    static {
        r rVar = new r();
        f94571a = rVar;
        s sVar = new s();
        f94572b = sVar;
        t tVar = new t();
        f94573c = tVar;
        f94574d = new u[]{rVar, sVar, tVar};
    }

    public static u valueOf(String str) {
        return (u) Enum.valueOf(u.class, str);
    }

    public static u[] values() {
        return (u[]) f94574d.clone();
    }

    public abstract vk.b0 a();

    public abstract z b(p pVar, h0 h0Var, Object obj);
}
