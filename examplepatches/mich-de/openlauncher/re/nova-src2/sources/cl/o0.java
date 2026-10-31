package cl;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class o0 {

    /* renamed from: a, reason: collision with root package name */
    public static final o0 f20048a;

    /* renamed from: b, reason: collision with root package name */
    public static final o0 f20049b;

    /* renamed from: c, reason: collision with root package name */
    public static final o0 f20050c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ o0[] f20051d;

    static {
        o0 o0Var = new o0("NOT_RUN", 0);
        f20048a = o0Var;
        o0 o0Var2 = new o0("CANCELLED", 1);
        f20049b = o0Var2;
        o0 o0Var3 = new o0("STARTED", 2);
        f20050c = o0Var3;
        f20051d = new o0[]{o0Var, o0Var2, o0Var3};
    }

    public static o0 valueOf(String str) {
        return (o0) Enum.valueOf(o0.class, str);
    }

    public static o0[] values() {
        return (o0[]) f20051d.clone();
    }
}
