package u40;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public static final k f90595a;

    /* renamed from: b, reason: collision with root package name */
    public static final k f90596b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ k[] f90597c;

    static {
        k kVar = new k("OFF", 0);
        f90595a = kVar;
        k kVar2 = new k("ERROR", 1);
        k kVar3 = new k("WARN", 2);
        k kVar4 = new k("DEBUG", 3);
        f90596b = kVar4;
        f90597c = new k[]{kVar, kVar2, kVar3, kVar4, new k("TRACE", 4)};
    }

    public static k valueOf(String str) {
        return (k) Enum.valueOf(k.class, str);
    }

    public static k[] values() {
        return (k[]) f90597c.clone();
    }
}
