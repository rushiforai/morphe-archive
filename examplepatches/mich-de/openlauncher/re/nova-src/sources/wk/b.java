package wk;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public static final b f94494a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ b[] f94495b;

    static {
        b bVar = new b("INSTANCE", 0);
        f94494a = bVar;
        f94495b = new b[]{bVar};
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f94495b.clone();
    }
}
