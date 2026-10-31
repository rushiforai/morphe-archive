package xl;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static final b f96083a;

    /* renamed from: b, reason: collision with root package name */
    public static final b f96084b;

    /* renamed from: c, reason: collision with root package name */
    public static final b f96085c;

    /* renamed from: d, reason: collision with root package name */
    public static final b f96086d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ b[] f96087e;

    static {
        b bVar = new b("AD_STORAGE", 0);
        f96083a = bVar;
        b bVar2 = new b("ANALYTICS_STORAGE", 1);
        f96084b = bVar2;
        b bVar3 = new b("AD_USER_DATA", 2);
        f96085c = bVar3;
        b bVar4 = new b("AD_PERSONALIZATION", 3);
        f96086d = bVar4;
        f96087e = new b[]{bVar, bVar2, bVar3, bVar4};
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f96087e.clone();
    }
}
