package ads_mobile_sdk;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class xc2 {

    /* renamed from: a, reason: collision with root package name */
    public static final xc2 f11668a;

    /* renamed from: b, reason: collision with root package name */
    public static final xc2 f11669b;

    /* renamed from: c, reason: collision with root package name */
    public static final xc2 f11670c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ xc2[] f11671d;

    static {
        xc2 xc2Var = new xc2("SUCCESS", 0);
        f11668a = xc2Var;
        xc2 xc2Var2 = new xc2("FAILED", 1);
        f11669b = xc2Var2;
        xc2 xc2Var3 = new xc2("DISABLED", 2);
        f11670c = xc2Var3;
        xc2[] xc2VarArr = {xc2Var, xc2Var2, xc2Var3};
        f11671d = xc2VarArr;
        EnumEntriesKt.a(xc2VarArr);
    }

    public static xc2[] values() {
        return (xc2[]) f11671d.clone();
    }
}
