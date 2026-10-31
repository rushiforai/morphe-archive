package ads_mobile_sdk;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class rm0 {

    /* renamed from: b, reason: collision with root package name */
    public static final rm0 f9230b;

    /* renamed from: c, reason: collision with root package name */
    public static final rm0 f9231c;

    /* renamed from: d, reason: collision with root package name */
    public static final rm0 f9232d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ rm0[] f9233e;

    /* renamed from: a, reason: collision with root package name */
    public final String f9234a;

    static {
        rm0 rm0Var = new rm0(0, "CLICK", "_ac");
        f9230b = rm0Var;
        rm0 rm0Var2 = new rm0(1, "IMPRESSION", "_ai");
        f9231c = rm0Var2;
        rm0 rm0Var3 = new rm0(2, "REWARD", "_ar");
        f9232d = rm0Var3;
        rm0[] rm0VarArr = {rm0Var, rm0Var2, rm0Var3};
        f9233e = rm0VarArr;
        EnumEntriesKt.a(rm0VarArr);
    }

    public rm0(int i5, String str, String str2) {
        this.f9234a = str2;
    }

    public static rm0[] values() {
        return (rm0[]) f9233e.clone();
    }
}
