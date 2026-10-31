package l1;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class i6 {

    /* renamed from: a, reason: collision with root package name */
    public static final i6 f73446a;

    /* renamed from: b, reason: collision with root package name */
    public static final i6 f73447b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ i6[] f73448c;

    static {
        i6 i6Var = new i6("THUMB", 0);
        f73446a = i6Var;
        i6 i6Var2 = new i6("TRACK", 1);
        f73447b = i6Var2;
        f73448c = new i6[]{i6Var, i6Var2};
    }

    public static i6 valueOf(String str) {
        return (i6) Enum.valueOf(i6.class, str);
    }

    public static i6[] values() {
        return (i6[]) f73448c.clone();
    }
}
