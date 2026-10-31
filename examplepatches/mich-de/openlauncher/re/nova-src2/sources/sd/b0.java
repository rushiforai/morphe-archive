package sd;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public static final b0 f87132a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ b0[] f87133b;

    /* JADX INFO: Fake field, exist only in values array */
    b0 EF0;

    static {
        b0 b0Var = new b0("UNKNOWN", 0);
        b0 b0Var2 = new b0("ANDROID_FIREBASE", 1);
        f87132a = b0Var2;
        f87133b = new b0[]{b0Var, b0Var2};
    }

    public static b0 valueOf(String str) {
        return (b0) Enum.valueOf(b0.class, str);
    }

    public static b0[] values() {
        return (b0[]) f87133b.clone();
    }
}
