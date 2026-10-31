package vt;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class f0 {

    /* renamed from: b, reason: collision with root package name */
    public static final f0 f93043b;

    /* renamed from: c, reason: collision with root package name */
    public static final f0 f93044c;

    /* renamed from: d, reason: collision with root package name */
    public static final f0 f93045d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ f0[] f93046e;

    /* renamed from: a, reason: collision with root package name */
    public final String f93047a;

    static {
        f0 f0Var = new f0("Client", 0, "client");
        f93043b = f0Var;
        f0 f0Var2 = new f0("Server", 1, "server");
        f93044c = f0Var2;
        f0 f0Var3 = new f0("None", 2, "none");
        f93045d = f0Var3;
        f0[] f0VarArr = {f0Var, f0Var2, f0Var3};
        f93046e = f0VarArr;
        EnumEntriesKt.a(f0VarArr);
    }

    public f0(String str, int i5, String str2) {
        this.f93047a = str2;
    }

    public static f0 valueOf(String str) {
        return (f0) Enum.valueOf(f0.class, str);
    }

    public static f0[] values() {
        return (f0[]) f93046e.clone();
    }
}
