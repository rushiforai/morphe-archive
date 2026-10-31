package j00;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public static final b0 f68453a;

    /* renamed from: b, reason: collision with root package name */
    public static final b0 f68454b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ b0[] f68455c;

    static {
        b0 b0Var = new b0("SEARCH", 0);
        f68453a = b0Var;
        b0 b0Var2 = new b0("SHARE", 1);
        f68454b = b0Var2;
        b0[] b0VarArr = {b0Var, b0Var2};
        f68455c = b0VarArr;
        EnumEntriesKt.a(b0VarArr);
    }

    public static b0 valueOf(String str) {
        return (b0) Enum.valueOf(b0.class, str);
    }

    public static b0[] values() {
        return (b0[]) f68455c.clone();
    }
}
