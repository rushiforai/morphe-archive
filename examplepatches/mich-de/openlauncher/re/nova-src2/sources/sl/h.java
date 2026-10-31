package sl;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public static final h f87504a;

    /* renamed from: b, reason: collision with root package name */
    public static final h f87505b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ h[] f87506c;

    static {
        h hVar = new h("IEEE_P1363", 0);
        f87504a = hVar;
        h hVar2 = new h("DER", 1);
        f87505b = hVar2;
        f87506c = new h[]{hVar, hVar2};
    }

    public static h valueOf(String str) {
        return (h) Enum.valueOf(h.class, str);
    }

    public static h[] values() {
        return (h[]) f87506c.clone();
    }
}
