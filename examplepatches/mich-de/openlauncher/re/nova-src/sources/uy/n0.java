package uy;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public abstract class n0 {

    /* renamed from: a, reason: collision with root package name */
    public static final j0 f91729a;

    /* renamed from: b, reason: collision with root package name */
    public static final k0 f91730b;

    /* renamed from: c, reason: collision with root package name */
    public static final l0 f91731c;

    /* renamed from: d, reason: collision with root package name */
    public static final m0 f91732d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ n0[] f91733e;

    static {
        j0 j0Var = new j0();
        f91729a = j0Var;
        k0 k0Var = new k0();
        f91730b = k0Var;
        l0 l0Var = new l0();
        f91731c = l0Var;
        m0 m0Var = new m0();
        f91732d = m0Var;
        f91733e = new n0[]{j0Var, k0Var, l0Var, m0Var};
    }

    public static n0 valueOf(String str) {
        return (n0) Enum.valueOf(n0.class, str);
    }

    public static n0[] values() {
        return (n0[]) f91733e.clone();
    }

    public boolean a() {
        return this instanceof l0;
    }

    public abstract s b(String str, d0 d0Var);
}
