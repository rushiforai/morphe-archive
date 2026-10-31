package xl;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f96080a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f96081b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ a[] f96082c;

    static {
        a aVar = new a("GRANTED", 0);
        f96080a = aVar;
        a aVar2 = new a("DENIED", 1);
        f96081b = aVar2;
        f96082c = new a[]{aVar, aVar2};
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f96082c.clone();
    }
}
