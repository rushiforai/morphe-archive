package s90;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class a0 {

    /* renamed from: a, reason: collision with root package name */
    public static final a0 f86846a;

    /* renamed from: b, reason: collision with root package name */
    public static final a0 f86847b;

    /* renamed from: c, reason: collision with root package name */
    public static final a0 f86848c;

    /* renamed from: d, reason: collision with root package name */
    public static final a0 f86849d;

    /* renamed from: e, reason: collision with root package name */
    public static final a0 f86850e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ a0[] f86851f;

    static {
        a0 a0Var = new a0("CRONET_SOURCE_UNSPECIFIED", 0);
        f86846a = a0Var;
        a0 a0Var2 = new a0("CRONET_SOURCE_STATICALLY_LINKED", 1);
        f86847b = a0Var2;
        a0 a0Var3 = new a0("CRONET_SOURCE_PLAY_SERVICES", 2);
        f86848c = a0Var3;
        a0 a0Var4 = new a0("CRONET_SOURCE_FALLBACK", 3);
        f86849d = a0Var4;
        a0 a0Var5 = new a0("CRONET_SOURCE_PLATFORM", 4);
        f86850e = a0Var5;
        f86851f = new a0[]{a0Var, a0Var2, a0Var3, a0Var4, a0Var5, new a0("CRONET_SOURCE_FAKE", 5)};
    }

    public static a0 valueOf(String str) {
        return (a0) Enum.valueOf(a0.class, str);
    }

    public static a0[] values() {
        return (a0[]) f86851f.clone();
    }
}
