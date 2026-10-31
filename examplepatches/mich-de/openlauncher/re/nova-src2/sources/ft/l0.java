package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class l0 {

    /* renamed from: b, reason: collision with root package name */
    public static final b50.d f55960b;

    /* renamed from: c, reason: collision with root package name */
    public static final l0 f55961c;

    /* renamed from: d, reason: collision with root package name */
    public static final l0 f55962d;

    /* renamed from: e, reason: collision with root package name */
    public static final l0 f55963e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ l0[] f55964f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ i70.a f55965g;

    /* renamed from: a, reason: collision with root package name */
    public final String f55966a;

    static {
        l0 l0Var = new l0("Automatic", 0, "automatic");
        f55961c = l0Var;
        l0 l0Var2 = new l0("AutomaticAsync", 1, "automatic_async");
        f55962d = l0Var2;
        l0 l0Var3 = new l0("Manual", 2, "manual");
        f55963e = l0Var3;
        l0[] l0VarArr = {l0Var, l0Var2, l0Var3};
        f55964f = l0VarArr;
        f55965g = EnumEntriesKt.a(l0VarArr);
        f55960b = new b50.d();
    }

    public l0(String str, int i5, String str2) {
        this.f55966a = str2;
    }

    public static l0 valueOf(String str) {
        return (l0) Enum.valueOf(l0.class, str);
    }

    public static l0[] values() {
        return (l0[]) f55964f.clone();
    }
}
