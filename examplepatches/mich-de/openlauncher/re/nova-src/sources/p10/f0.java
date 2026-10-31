package p10;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class f0 {

    /* renamed from: b, reason: collision with root package name */
    public static final f0 f81755b;

    /* renamed from: c, reason: collision with root package name */
    public static final f0 f81756c;

    /* renamed from: d, reason: collision with root package name */
    public static final f0 f81757d;

    /* renamed from: e, reason: collision with root package name */
    public static final f0 f81758e;

    /* renamed from: f, reason: collision with root package name */
    public static final f0 f81759f;

    /* renamed from: g, reason: collision with root package name */
    public static final f0 f81760g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ f0[] f81761h;

    /* renamed from: a, reason: collision with root package name */
    public final String f81762a;

    static {
        f0 f0Var = new f0("Intro", 0, "intro");
        f81755b = f0Var;
        f0 f0Var2 = new f0("Working", 1, "working");
        f81756c = f0Var2;
        f0 f0Var3 = new f0("Earned", 2, "earned");
        f81757d = f0Var3;
        f0 f0Var4 = new f0("Dismissed", 3, "dismissed");
        f81758e = f0Var4;
        f0 f0Var5 = new f0("Unavailable", 4, "unavailable");
        f81759f = f0Var5;
        f0 f0Var6 = new f0("CapReached", 5, "cap_reached");
        f81760g = f0Var6;
        f0[] f0VarArr = {f0Var, f0Var2, f0Var3, f0Var4, f0Var5, f0Var6};
        f81761h = f0VarArr;
        EnumEntriesKt.a(f0VarArr);
    }

    public f0(String str, int i5, String str2) {
        this.f81762a = str2;
    }

    public static f0 valueOf(String str) {
        return (f0) Enum.valueOf(f0.class, str);
    }

    public static f0[] values() {
        return (f0[]) f81761h.clone();
    }
}
