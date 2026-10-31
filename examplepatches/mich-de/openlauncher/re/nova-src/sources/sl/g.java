package sl;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public static final g f87500a;

    /* renamed from: b, reason: collision with root package name */
    public static final g f87501b;

    /* renamed from: c, reason: collision with root package name */
    public static final g f87502c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ g[] f87503d;

    static {
        g gVar = new g("NIST_P256", 0);
        f87500a = gVar;
        g gVar2 = new g("NIST_P384", 1);
        f87501b = gVar2;
        g gVar3 = new g("NIST_P521", 2);
        f87502c = gVar3;
        f87503d = new g[]{gVar, gVar2, gVar3};
    }

    public static g valueOf(String str) {
        return (g) Enum.valueOf(g.class, str);
    }

    public static g[] values() {
        return (g[]) f87503d.clone();
    }
}
