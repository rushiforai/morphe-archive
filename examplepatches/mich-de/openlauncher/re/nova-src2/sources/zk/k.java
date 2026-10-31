package zk;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public static final k f98560a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ k[] f98561b;

    static {
        k kVar = new k("APPEND", 0);
        f98560a = kVar;
        f98561b = new k[]{kVar};
    }

    public static k valueOf(String str) {
        return (k) Enum.valueOf(k.class, str);
    }

    public static k[] values() {
        return (k[]) f98561b.clone();
    }
}
