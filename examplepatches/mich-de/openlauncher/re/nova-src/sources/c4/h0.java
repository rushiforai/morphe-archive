package c4;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class h0 {

    /* renamed from: a, reason: collision with root package name */
    public static final h0 f19604a;

    /* renamed from: b, reason: collision with root package name */
    public static final h0 f19605b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ h0[] f19606c;

    static {
        h0 h0Var = new h0("Inherit", 0);
        f19604a = h0Var;
        h0 h0Var2 = new h0("SecureOn", 1);
        f19605b = h0Var2;
        h0[] h0VarArr = {h0Var, h0Var2, new h0("SecureOff", 2)};
        f19606c = h0VarArr;
        EnumEntriesKt.a(h0VarArr);
    }

    public static h0 valueOf(String str) {
        return (h0) Enum.valueOf(h0.class, str);
    }

    public static h0[] values() {
        return (h0[]) f19606c.clone();
    }
}
