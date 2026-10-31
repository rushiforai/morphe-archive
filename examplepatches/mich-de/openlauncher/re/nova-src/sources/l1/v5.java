package l1;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class v5 {

    /* renamed from: a, reason: collision with root package name */
    public static final v5 f74126a;

    /* renamed from: b, reason: collision with root package name */
    public static final v5 f74127b;

    /* renamed from: c, reason: collision with root package name */
    public static final v5 f74128c;

    /* renamed from: d, reason: collision with root package name */
    public static final v5 f74129d;

    /* renamed from: e, reason: collision with root package name */
    public static final v5 f74130e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ v5[] f74131f;

    static {
        v5 v5Var = new v5("TopBar", 0);
        f74126a = v5Var;
        v5 v5Var2 = new v5("MainContent", 1);
        f74127b = v5Var2;
        v5 v5Var3 = new v5("Snackbar", 2);
        f74128c = v5Var3;
        v5 v5Var4 = new v5("Fab", 3);
        f74129d = v5Var4;
        v5 v5Var5 = new v5("BottomBar", 4);
        f74130e = v5Var5;
        f74131f = new v5[]{v5Var, v5Var2, v5Var3, v5Var4, v5Var5};
    }

    public static v5 valueOf(String str) {
        return (v5) Enum.valueOf(v5.class, str);
    }

    public static v5[] values() {
        return (v5[]) f74131f.clone();
    }
}
