package t70;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class l0 {

    /* renamed from: a, reason: collision with root package name */
    public static final l0 f88813a;

    /* renamed from: b, reason: collision with root package name */
    public static final l0 f88814b;

    /* renamed from: c, reason: collision with root package name */
    public static final l0 f88815c;

    /* renamed from: d, reason: collision with root package name */
    public static final l0 f88816d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ l0[] f88817e;

    static {
        l0 l0Var = new l0("DEFAULT", 0);
        f88813a = l0Var;
        l0 l0Var2 = new l0("LAZY", 1);
        f88814b = l0Var2;
        l0 l0Var3 = new l0("ATOMIC", 2);
        f88815c = l0Var3;
        l0 l0Var4 = new l0("UNDISPATCHED", 3);
        f88816d = l0Var4;
        l0[] l0VarArr = {l0Var, l0Var2, l0Var3, l0Var4};
        f88817e = l0VarArr;
        EnumEntriesKt.a(l0VarArr);
    }

    public static l0 valueOf(String str) {
        return (l0) Enum.valueOf(l0.class, str);
    }

    public static l0[] values() {
        return (l0[]) f88817e.clone();
    }
}
