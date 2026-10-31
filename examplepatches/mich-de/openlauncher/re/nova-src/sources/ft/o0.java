package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class o0 {

    /* renamed from: b, reason: collision with root package name */
    public static final o0 f55995b;

    /* renamed from: c, reason: collision with root package name */
    public static final o0 f55996c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ o0[] f55997d;

    /* renamed from: a, reason: collision with root package name */
    public final String f55998a;

    static {
        o0 o0Var = new o0("Standard", 0, "standard");
        f55995b = o0Var;
        o0 o0Var2 = new o0("Deferred", 1, "deferred");
        f55996c = o0Var2;
        o0[] o0VarArr = {o0Var, o0Var2};
        f55997d = o0VarArr;
        EnumEntriesKt.a(o0VarArr);
    }

    public o0(String str, int i5, String str2) {
        this.f55998a = str2;
    }

    public static o0 valueOf(String str) {
        return (o0) Enum.valueOf(o0.class, str);
    }

    public static o0[] values() {
        return (o0[]) f55997d.clone();
    }
}
