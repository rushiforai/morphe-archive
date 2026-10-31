package gv;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class d0 {

    /* renamed from: a, reason: collision with root package name */
    public static final d0 f57846a;

    /* renamed from: b, reason: collision with root package name */
    public static final d0 f57847b;

    /* renamed from: c, reason: collision with root package name */
    public static final d0 f57848c;

    /* renamed from: d, reason: collision with root package name */
    public static final d0 f57849d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ d0[] f57850e;

    static {
        d0 d0Var = new d0("LoggedIn", 0);
        f57846a = d0Var;
        d0 d0Var2 = new d0("NeedsVerification", 1);
        f57847b = d0Var2;
        d0 d0Var3 = new d0("NeedsWebVerification", 2);
        f57848c = d0Var3;
        d0 d0Var4 = new d0("LoggedOut", 3);
        f57849d = d0Var4;
        d0[] d0VarArr = {d0Var, d0Var2, d0Var3, d0Var4};
        f57850e = d0VarArr;
        EnumEntriesKt.a(d0VarArr);
    }

    public static d0 valueOf(String str) {
        return (d0) Enum.valueOf(d0.class, str);
    }

    public static d0[] values() {
        return (d0[]) f57850e.clone();
    }
}
